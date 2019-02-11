<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Shop\Controller\Admin;

use Shop\Model\OrderApi;
use Shop\Model\ReservationApi;

class Tools extends \RS\Controller\Admin\Front
{
    /**
     * Пересчитывает доходность заказов
     *
     * @return \RS\Controller\Result\Standard
     */
    function actionAjaxCalcProfit()
    {
        $position = $this->url->request('pos', TYPE_INTEGER);
        
        $order_api = new \Shop\Model\OrderApi();
        $result = $order_api->calculateOrdersProfit($position);
        
        if ($result === true) {
            return $this->result->addMessage(t('Пересчет успешно завершен'));
        } 
        elseif ($result === false) {
            return $this->result->addEMessage($order_api->getErrorsStr());
        }
        else {
            return $this->result
                            ->addSection('repeat', true)
                            ->addSection('queryParams', array(
                                'data' => array(
                                    'pos' => $result
                                ))
                            );
        }
    }
    
    /**
     * Выводит содержимое лог файла обмена с кассами
     * 
     * @return string
     */
    function actionShowCashRegisterLog()
    {
        $this->wrapOutput(false);
        $log_file = \Shop\Model\CashRegisterType\AbstractType::getLogFilename();
        if (file_exists($log_file)) {
            echo '<pre>';
            readfile($log_file);
            echo '</pre>';
        } else {
            return t('Лог файл не найден');
        }
    }

    /**
     * Удаляет лог файл запросов к кассе
     *
     * @return \RS\Controller\Result\Standard
     */
    function actionDeleteCashRegisterLog()
    {
        $log_file = \Shop\Model\CashRegisterType\AbstractType::getLogFilename();
        if (file_exists($log_file)) {
            unlink($log_file);
            return $this->result->setSuccess(true)->addMessage(t('Лог-файл успешно удален'));
        } else {
            return $this->result->setSuccess(true)->addEMessage(t('Лог-файл отсутствует'));
        }
    }

    /**
     * Выполняет поиск ID заказа по строке
     *
     * @return string
     */
    function actionAjaxSearchOrder()
    {
        $api = new OrderApi();

        $term = $this->url->request('term', TYPE_STRING);
        $cross_multisite = $this->url->request('cross_multisite', TYPE_INTEGER);

        if ($cross_multisite) {
            //Устанавливаем поиск по всем мультисайтам
            $api->setMultisite(false);
        }

        $list = $api->search($term, array('id', 'order_num', 'user_fio', 'user'), 8);

        $json = array();
        foreach ($list as $order) {

            $user = $order->getUser();
            $json[] = array(
                'label' => t('Заказ №%num от %date', array(
                    'num' => $order['order_num'],
                    'date' => date('d.m.Y', strtotime($order['dateof']))
                )),
                'id' => $order['id'],
                'desc' => t('Покупатель').':'.$user->getFio().
                    ($user['id'] ? "({$user['id']})" : '').
                    ($user['is_company'] ? t(" ; {$user['company']}(ИНН:{$user['company_inn']})") : '')
            );
        }

        return json_encode($json);
    }
    /**
     * Выполняет поиск ID заказа по строке
     *
     * @return string
     */
    function actionAjaxSearchReservation()
    {
        $api = new ReservationApi();

        $term = $this->url->request('term', TYPE_STRING);
        $cross_multisite = $this->url->request('cross_multisite', TYPE_INTEGER);

        if ($cross_multisite) {
            //Устанавливаем поиск по всем мультисайтам
            $api->setMultisite(false);
        }

        $list = $api->search($term, array('id', 'phone', 'email', 'user'), 8);

        $json = array();
        foreach ($list as $reservation) {

            $user = $reservation->getUser();
            $json[] = array(
                'label' => t('Предзаказ №%num от %date', array(
                    'num' => $reservation['id'],
                    'date' => date('d.m.Y', strtotime($reservation['dateof']))
                )),
                'id' => $reservation['id'],
                'desc' => t('Покупатель').':'.$user->getFio().
                    ($user['id'] ? "({$user['id']})" : '').
                    ($user['is_company'] ? t(" ; {$user['company']}(ИНН:{$user['company_inn']})") : '')
            );
        }

        return json_encode($json);
    }
}