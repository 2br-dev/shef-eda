<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Export\Controller\Front;
 
class Gate extends \RS\Controller\Front
{
    /**
     * @var \Export\Model\Api $api
     */
    public  $api;
    private $startTime = 0;
                               
    function init()
    {
        @set_time_limit(0);
        $this->startTime = microtime(true);
        $site_id = $this->url->get('site_id', TYPE_INTEGER, \RS\Site\Manager::getSiteId());
        \RS\Site\Manager::setCurrentSite(new \Site\Model\Orm\Site($site_id));
        
        // Перезагружаем конфиг (на случай если если был передан site_id)
        $config = \RS\Config\Loader::byModule($this);
        $config->load();
        
        $this->wrapOutput(false);
        $this->api = \Export\Model\Api::getInstance();
        
    }

    /**
     * Выдаёт данные канала для экспорта
     *
     * @return mixed
     * @throws \RS\Orm\Exception
     */
    function actionIndex()
    {
        $export_id   = $this->url->get('export_id', TYPE_STRING, "");
        $export_type = $this->url->get('export_type', TYPE_STRING, "");
        $site_id = $this->url->get('site_id', TYPE_INTEGER, 0);
        $export_profile = $this->api->getObjectByAliasAndType($export_type, $export_id, $site_id);
        if(!$export_profile || !$export_profile->id){
            throw new \RS\Orm\Exception(t('Профиль экспорта не найден'));
        } 
        
        $export_profile->getTypeObject()->sendHeaders();
        $response = $this->api->printExportedData($export_profile);
        return $response;
    }
}