<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Affiliate\Controller\Front;
use \Affiliate\Model\AffiliateApi;

/**
* Контроллер - обрабатывает запросы на изменение текущего филиала
*/
class Change extends \RS\Controller\Front
{
    function actionIndex()
    {
        $referer = $this->url->request('referer', TYPE_STRING);
        $id = $this->url->request('affiliate', TYPE_STRING);
        
        $api = new AffiliateApi();
        if ($affiliate = $api->getById($id)) {
            $api->setCurrentAffiliate($affiliate, true);
        }
        
        $this->redirect($referer);
    }
}