<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Catalog\Model;

use Catalog\Model\Orm\Offer;
use Catalog\Model\Orm\Xstock;
use RS\Orm\Request as OrmRequest;
use Shop\Model\Orm\Order;
use Shop\Model\Orm\UserStatus;
use Shop\Model\UserStatusApi;

/**
 *  Класс с функциями простого учета остатков
 *
 * Class SimpleStockManager
 * @package Catalog\Model
 */
class SimpleStockManager implements StockInterface
{
    /**
     *  Обновляет остатки товаров из заказа
     *
     * @param \Shop\Model\Orm\Order $order - объект заказа
     * @param string $flag - флаг сохранения (update или insert)
     * @param int|null $old_warehouse - id предыдущий склад заказа
     * @return void
     */
    function updateRemainsFromOrder(Order $order, $flag, $old_warehouse = null)
    {
        $cancelled_status = UserStatusApi::getStatusesIdByType( UserStatus::STATUS_CANCELLED );
        $cancelled = (in_array($order['status'], $cancelled_status) && !in_array($order->this_before_write['status'], $cancelled_status));
        $resume = (!in_array($order['status'], $cancelled_status) && in_array($order->this_before_write['status'], $cancelled_status) );

        $old_items = $order->this_before_write['old_items'] ? $order->this_before_write['old_items'] : array();
        $new_items = $order->getCart()->getProductItems();
        $diff_array = $this->getAmountDifference($old_items, $new_items, $old_warehouse, $resume);
        $warehouse = $order['warehouse'] ? $order['warehouse'] : WareHouseApi::getDefaultWareHouse()->id;

        // Заказ был отменен или сменился склад - вернуить товары на старый склад
        if($old_warehouse || $cancelled){
            $old_warehouse = !$old_warehouse ? $warehouse: $old_warehouse;

            $this->returnNums($old_items, $old_warehouse);
        }
        // Обновить остатки в объектах product, offer и xstock
        if(!in_array($order['status'], $cancelled_status)){
            foreach ($diff_array as $item){
                $this->updateXstock($item['product_id'], $item['offer'], $item['amount'], $warehouse);
            }
        }
    }

    /**
     * Обновить остатки в объектах product, offer и xstock
     *
     * @param int $product_id - id товара
     * @param int $offer - id комплектации
     * @param int $amount_delta - разница остатка
     * @param int $warehouse - id склада
     * @return void
     */
    protected function updateXstock($product_id, $offer, $amount_delta, $warehouse)
    {
        if ($offer == NULL) $offer = 0;
        $offer = Offer::loadByWhere(array(
            'sortn' => $offer,
            'product_id' => $product_id,
        ));

        $xstock = Xstock::loadByWhere(array(
            'offer_id' => $offer['id'],
            'product_id' => $product_id,
            'warehouse_id' => $warehouse,
        ));
        $xstock['warehouse_id'] = $warehouse;
        $xstock['stock'] += $amount_delta;
        $xstock['product_id'] = $product_id;
        $xstock['offer_id'] = $offer['id'];

        $xstock->replace();
        $this->updateNums($xstock['product_id'], $xstock['offer_id']);
    }

    /**
     *  Обновить остатки в объектах product, offer и xstock
     *
     * @param $items
     * @param $warehouse
     */
    protected function returnNums($items, $warehouse)
    {
        foreach ($items as $uniq => $item){
            $cartitem = $item['cartitem'];
            $this->updateXstock($cartitem['entity_id'], $cartitem['offer'], $cartitem['amount'], $warehouse);
        }
    }

    /**
     *  Обновляет количество в объектах offer и product
     *
     * @param int $product_id - id товара
     * @param int $offer_id - id комплектации
     * @return void
     */
    protected function updateNums($product_id, $offer_id)
    {
        $offer_api = new OfferApi();
        $this->updateOfferNum($product_id, $offer_id);
        $offer_api->updateProductNum($product_id);
    }

    /**
     * Пересчитывает кэш остатка у комплектации
     *
     * @param int $product_id - id товара
     * @param int $offer_id - id комплектации
     * @return void
     */
    protected function updateOfferNum($product_id, $offer_id)
    {
        $xstock = OrmRequest::make()
            ->select('sum(stock) as num')
            ->from(new Xstock())
            ->where(array('offer_id' => $offer_id))
            ->exec()
            ->fetchSelected(null, 'num');

        OrmRequest::make()
            ->update(new Offer())
            ->set(array(
                'num' => $xstock[0],
            ))
            ->where(array(
                'product_id' => $product_id,
                'id' => $offer_id,
            ))
            ->exec();
    }

    /**
     * Получить разницу количества товаров заказа до редактирования и после
     *
     * @param array $old_items - старые товарные позиции
     * @param array $new_items - новые товарные позиции
     * @param int|null $old_warehouse - id старого склада
     * @param bool $resume - заказ вернулсля из статуса "отменён"
     * @return array
     */
    protected function getAmountDifference($old_items, $new_items, $old_warehouse = null, $resume = false)
    {
        $array = array();
        // если изменился склад
        if($old_warehouse || $resume){
            foreach ($new_items as $uniq => $item){
                $new_item = array();
                $new_item['product_id'] = $item['cartitem']['entity_id'];
                $new_item['offer'] = $item['cartitem']['offer'];
                $new_item['amount'] = -$item['cartitem']['amount'];
                $array[] = $new_item;
            }
            return $array;
        }
        foreach ($old_items as $uniq => $item){
            //если товар удален
            if(!isset($new_items[$uniq])){
                $new_item = array();
                $new_item['product_id'] = $item['cartitem']['entity_id'];
                $new_item['offer'] = $item['cartitem']['offer'];
                $new_item['amount'] = $item['cartitem']['amount'];
                $array[] = $new_item;
            }
        }
        foreach ($new_items as $uniq => $item){
            $new_item = array();
            $new_item['product_id'] = $item['cartitem']['entity_id'];
            $new_item['offer'] = $item['cartitem']['offer'];

            // если товар уже был в заказе
            if(isset($old_items[$uniq])){
                if($old_items[$uniq]['cartitem']['offer'] == $item['cartitem']['offer']){
                    $new_item['amount'] = $old_items[$uniq]['cartitem']['amount'] - $item['cartitem']['amount'];
                }else{
                    // если у товара изменилась комплектация
                    $array[] = array(
                        'product_id' => $item['cartitem']['entity_id'],
                        'offer' => $item['cartitem']['offer'],
                        'amount' => -$item['cartitem']['amount'],
                    );
                    $array[] = array(
                        'product_id' => $item['cartitem']['entity_id'],
                        'offer' => $old_items[$uniq]['cartitem']['offer'],
                        'amount' => $item['cartitem']['amount'],
                    );
                }
            }else{
                $new_item['amount'] = -$item['cartitem']['amount'];
            }
            $array[] = $new_item;
        }
        return $array;
    }
}
