<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Catalog\Model\Orm\Inventory;
use Exchange\Model\Importers\Catalog;
use \RS\Orm\Type;

/**
 *  Таблица с документами инвентаризаций
 *
 * Class Inventorization
 * @package Catalog\Model\Orm\Inventory
 */
class Inventorization extends \RS\Orm\OrmObject
{
    const
        DOCUMENT_TYPE_INVENTORY = 'inventorization';

    protected static
        $table = 'document_inventorization'; //Имя таблицы в БД

    /**
     * Инициализирует свойства ORM объекта
     *
     * @return void
     */
    function _init()
    {
        parent::_init()->append(array(
            t('Основные'),
            'site_id' => new Type\CurrentSite(),
            'applied' => new Type\Integer(array(
                'checkboxview' => array(1, 0),
                'description' => t('Проведен'),
                'default' => 1,
            )),
            'comment' => new Type\Text(array(
                'description' => t('Комментарий'),
            )),
            'recalculate' => new Type\Integer(array(
                'hint' => t('Пересчитает остатки, если товар уже был сохранен'),
                'runtime' => true,
                'checkboxview' => array(1,0),
                'description' => t('Пересчитать расчетное количество при смене склада'),
            )),
            'warehouse' => new Type\Integer(array(
                'list' => array(array('Catalog\Model\Warehouseapi', 'staticSelectList')),
                'maxLength' => '250',
                'description' => t('Склад'),
                'checker' => array('chkEmpty', t('Укажите склад')),
            )),
            'fact_amount' => new Type\Integer(array(
                'description' => t('Фактическое кол-во'),
                'visible' => false,
            )),
            'calc_amount' => new Type\Integer(array(
                'description' => t('Расчетное кол-во'),
                'visible' => false,
            )),
            'dif_amount' => new Type\Integer(array(
                'description' => t('Разница'),
                'visible' => false,
            )),
            'date' => new Type\Datetime(array(
                'maxLength' => '250',
                'description' => t('Дата'),
                'checker' => array('chkEmpty', t('Укажите дату')),
            )),
            'linked_documents' => new Type\Varchar(array(
                'runtime' => true,
                'description' => t('Связанный документ'),
                'template' => '%catalog%/form/inventory/field_linked_document.tpl',
            )),
            'inventory_products' =>  new Type\Varchar(array(
                'runtime' => true,
                'description' => t('Товары'),
                'template' => '%catalog%/form/inventory/products.tpl',
                'test' => 'ok',
            )),
            'type' =>  new Type\Varchar(array(
                'description' => t('Тип документа'),
                'visible' => false,
            )),
            'items' => new Type\ArrayList(array(
                'runtime' => true,
                'description' => t('Товары'),
                'visible' => false,
                'checker' => array(array(__CLASS__, 'checkProductsErrors')),
            ))
        ));
    }

    /**
     * Вызывается перед сохранением объекта в storage
     * @param string $save_flag insert|update|replace
     *
     * @return null | false Если возвращено false, то сохранение не произойдет
     */
    function beforeWrite($save_flag)
    {
        $this['type'] = self::DOCUMENT_TYPE_INVENTORY;
    }

    /**
     * Проверить ошибки в товарах документа
     *
     * @param $coreobj
     * @param $products
     * @return bool|string
     */
    public static function checkProductsErrors($coreobj, $products)
    {
        $api = new \Catalog\Model\Inventory\InventorizationApi();
        if(!count($products)){
            return t('Не добавлено ни одного товара');
        }
        foreach ($products as $uniq => $product){
            if($product['offer_id'] == -1){
                return t('Не у всех товаров выбрана комплектация');
            }
        }

        $doubles = $api->getProductDoubles($products);
        if ($doubles){
            $error_string = t('Дублируются товары:')."<br>";
            foreach ($doubles as $offer_id => $double){
                $product_orm = new \Catalog\Model\Orm\Product($double['product_id']);
                $offer = new \Catalog\Model\Orm\Offer($double['offer_id']);
                if(!$offer['title'] && $offer['sortn'] == 0){
                    $offer['title'] = t('Основная');
                }
                $error_string .= $product_orm['title']." ".t('Комплектация:')." ".$offer['title']."<br>";
            }
            return $error_string;
        }
        return true;
    }

    /**
     * Вызывается после сохранения объекта в storage
     * @param string $save_flag insert|update|replace
     *
     * @return void
     */
    function afterWrite ($save_flag)
    {
        if($save_flag == \RS\Orm\AbstractObject::UPDATE_FLAG) {
            $this->deleteProductsByDocument($this['id']);
        }
        $api = new \Catalog\Model\Inventory\InventorizationApi();
        $api->saveProducts($this['items'], $this['id'], $this);
        $links = $this->getLinkedDocuments();
        $api->updateLinkedDocuments($this, $this['items'], $links);
    }

    /**
     * Удаляет объект из хранилища
     * @return boolean - true, в случае успеха
     */
    function delete()
    {
        $link_manager = new \Catalog\Model\DocumentLinkManager($this['id'], self::DOCUMENT_TYPE_INVENTORY);
        $link_manager->deleteLinkedDocuments();
        return parent::delete();
    }

    /**
     *  Удалить товары принадлежащие документу инвентаризации
     *
     * @param $document_id
     * @return void
     */
    function deleteProductsByDocument($document_id)
    {
        \RS\Orm\Request::make()
            ->delete()
            ->from(new \Catalog\Model\Orm\Inventory\InventorizationProducts())
            ->where(array('document_id' => $document_id))
            ->exec();
    }

    /**
     *  Получить объект api
     *
     * @return \Catalog\Model\inventory\DocumentApi
     */
    function getApi()
    {
        return new \Catalog\Model\inventory\DocumentApi();
    }

    /**
     *  Получить количество товаров в документе
     *
     * @return integer
     */
    function getProductsAmount()
    {
        $result = \RS\Orm\Request::make()
            ->select('count(*) as cnt')
            ->from(new \Catalog\Model\Orm\Inventory\Inventorization(), 'doc')
            ->leftjoin(new \Catalog\Model\Orm\Inventory\InventorizationProducts(), 'doc.id = item.document_id', 'item')
            ->where(array('doc.id' => $this->id))
            ->exec()
            ->getOneField('cnt');
        return $result;
    }

    /**
     *  Получить связанные документы
     *
     * @return array|bool
     */
    function getLinkedDocuments()
    {
        $manager = new \Catalog\Model\DocumentLinkManager($this['id'], self::DOCUMENT_TYPE_INVENTORY);
        return $manager->getLinks();
    }



}