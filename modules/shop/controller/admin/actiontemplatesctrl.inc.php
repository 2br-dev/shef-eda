<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Shop\Controller\Admin;

use RS\Html\Table\Type as TableType;
use RS\Html\Toolbar\Button as ToolbarButton;
use RS\Html\Table;
use RS\AccessControl\Rights;
use RS\AccessControl\DefaultModuleRights;

/**
 * Контроллер Управление налогами
 */
class ActionTemplatesCtrl extends \RS\Controller\Admin\Crud
{
    function __construct()
    {
        parent::__construct(new \Shop\Model\ActionTemplatesApi());
    }

    function helperIndex()
    {
        $helper = parent::helperIndex();
        $helper->setTopHelp(t('Шаблоны действий позволяют курьеру в 1 клик выполнить действие, заданное в шаблоне. В текущий момент функциональность позволяет отправить SMS сообщение клиенту (Если в интернет-магазине настроен транспортный SMS модуль).'));

        $helper->setTopToolbar($this->buttons(array('add'), array('add' => t('Добавить новый шаблон'))));
        $helper->setTopTitle(t('Шаблоны действий курьера для заказов'));
        $helper->setTable(new Table\Element(array(
            'Columns' => array(
                new TableType\Checkbox('id'),
                new TableType\Text('title', t('Название'), array('Sortable' => SORTABLE_BOTH, 'href' => $this->router->getAdminPattern('edit', array(':id' => '@id')), 'LinkAttr' => array('class' => 'crud-edit'))),
                new TableType\Text('client_sms_message', t('Текст SMS сообщения')),
                new TableType\Yesno('public', t('Включен'), array('toggleUrl' => $this->router->getAdminPattern('ajaxTogglePublic', array(':id' => '@id')))),

                new TableType\Actions('id', array(
                    new TableType\Action\Edit($this->router->getAdminPattern('edit', array(':id' => '~field~')), null, array(
                        'attr' => array(
                            '@data-id' => '@id'
                        ))),
                ),
                    array('SettingsUrl' => $this->router->getAdminUrl('tableOptions'))
                ),
            )
        )));

        return $helper;
    }

    /**
     * Переключает видимость данного шаблона
     *
     * @return \RS\Controller\Result\Standard
     */
    function actionAjaxTogglePublic()
    {
        if ($access_error = Rights::CheckRightError($this, DefaultModuleRights::RIGHT_UPDATE)) {
            return $this->result->setSuccess(false)->addEMessage($access_error);
        }
        $id = $this->url->get('id', TYPE_STRING);

        $action_template = $this->api->getOneItem($id);
        if ($action_template) {
            $action_template['public'] = !$action_template['public'];
            $action_template->update();
        }
        return $this->result->setSuccess(true);
    }
}