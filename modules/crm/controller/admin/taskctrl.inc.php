<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Crm\Controller\Admin;

use Crm\Model\TaskApi;
use Crm\Model\TaskFilterApi;
use RS\Config\Loader;
use RS\Controller\Admin\Helper\CrudCollection;
use \RS\Html\Table\Type as TableType,
    \RS\Html\Toolbar\Button as ToolbarButton,
    \RS\Html\Tree,
    \RS\Html\Toolbar,
    \RS\Html\Filter,
    \RS\Html\Table;
use RS\Orm\AbstractObject;

/**
 * Контроллер управления списком задач
 */
class TaskCtrl extends \RS\Controller\Admin\Crud
{
    protected $dir;
    protected $dir_api;
    protected $task_filters;

    function __construct()
    {
        //Устанавливаем, с каким API будет работать CRUD контроллер
        parent::__construct(new TaskApi());
        $this->api->initRightsFilters();
        $this->dir_api = new TaskFilterApi();

        $this->task_filters = $this->url->get('f', TYPE_ARRAY);
        $this->dir = $this->url->get('dir', TYPE_INTEGER, 0);
    }

    /**
     * Формирует хелпер для отображения списка задач
     *
     * @return CrudCollection
     */
    function helperIndex()
    {
        $_this = $this; //Для Closure в php 5.3
        
        $helper = parent::helperIndex(); //Получим helper по-умолчанию
        $helper->viewAsTableTree();
        $helper->setTopTitle('Задачи'); //Установим заголовок раздела
        $helper->setTopToolbar($this->buttons(array('add'), array('add' => t('добавить задачу'))));
        $helper->addCsvButton('crm-task');
        $helper->getTopToolbar()->addItem(
            new ToolbarButton\Button($this->router->getAdminUrl(false, array('type' => $this->api->getElement()->getShortAlias(),'filter' => array('preset_id' => $this->dir)), 'crm-boardctrl'), t('Показать на доске'))
        );

        $helper->setTopHelp(t('В данном разделе представлены задачи, которые создали Вы, либо для Вас. Информируйте о ходе выполнения задачи с помощью статусов. Здесь отображаются все задачи в системе, независимо от выбранного мультисайта.'));

        $field_manager = Loader::byModule($this)->getTaskUserFieldsManager();
        $custom_table_columns = $this->api->getCustomTableColumns($field_manager);

        //Отобразим таблицу со списком объектов
        $helper->setTable(new Table\Element(array(
            'Columns' => array_merge(
                array(
                    new TableType\Checkbox('id', array('showSelectAll' => true)),
                    new TableType\Text('task_num', t('Номер'), array('Sortable' => SORTABLE_BOTH, 'href' => $this->router->getAdminPattern('edit', array(':id' => '@id')), 'LinkAttr' => array('class' => 'crud-edit'))),
                    new TableType\Text('title', t('Короткое описание'), array('Sortable' => SORTABLE_BOTH, 'href' => $this->router->getAdminPattern('edit', array(':id' => '@id')), 'LinkAttr' => array('class' => 'crud-edit'))),
                    new TableType\Usertpl('status_id', t('Статус'), '%crm%/admin/table/status_id.tpl', array('Sortable' => SORTABLE_BOTH)),
                    new TableType\Datetime('date_of_create', t('Создана'), array('Sortable' => SORTABLE_BOTH)),
                    new TableType\Usertpl('date_of_planned_end', t('План завершения'), '%crm%/admin/table/date_of_planned_end.tpl', array('Sortable' => SORTABLE_BOTH, )),

                    new TableType\Text('date_of_end', t('Завершено'), array('Sortable' => SORTABLE_BOTH)),
                    new TableType\User('creator_user_id', t('Создатель'), array('Sortable' => SORTABLE_BOTH)),
                    new TableType\User('implementer_user_id', t('Исполнитель'), array('Sortable' => SORTABLE_BOTH)),
                    new TableType\Usertpl('links', t('Связи'), '%crm%/admin/table/links.tpl'),
                    new TableType\StrYesno('is_archived', t('Архивная')),
                ),
                $custom_table_columns,
                array(
                    new TableType\Actions('id', array(
                        new TableType\Action\Edit($this->router->getAdminPattern('edit', array(':id' => '~field~'))),
                    ),
                        array('SettingsUrl' => $this->router->getAdminUrl('tableOptions'))
                    ),
                )
            ))));

        $this->api->addCustomFieldsData($helper['table'], $this->api->getElement()->getShortAlias());

        //Добавим фильтр значений в таблице по названию
        $helper->setFilter($this->api->getFilterControl());

        $helper->setTreeListFunction('getPlainTreeList');
        $helper->setTree(new Tree\Element( array(
            'sortIdField' => 'id',
            'activeField' => 'id',
            'activeValue' => $this->dir,
            'noExpandCollapseButton' => true,
            'rootItem' => array(
                'id' => 0,
                'title' => t('Все задачи'),
                'noOtherColumns' => true,
                'noCheckbox' => true,
                'noDraggable' => true,
                'noRedMarker' => true
            ),
            'sortable' => true,
            'sortUrl'    => $this->router->getAdminUrl('move_dir'),
            'mainColumn' => new TableType\Text('title', t('Сохраненные выборки'), array('href' =>  function($row) use($_this) {
                return $_this->router->getAdminUrl(false, array('dir' => $row['id'], 'f' => $row['filters_arr'], 'c' => $_this->url->get('c', TYPE_ARRAY)));
            })),
            'tools' => new TableType\Actions('id', array(
                new TableType\Action\Edit($this->router->getAdminPattern('edit_dir', array(':id' => '~field~')), null, array(
                    'class' => 'crud-sm-dialog crud-edit',
                    'attr' => array(
                        '@data-id' => '@id',
                    ))),
            )),
            'headButtons' => array(
                array(
                    'text' => t('Сохраненные выборки'),
                    'tag' => 'span',
                    'attr' => array(
                        'class' => 'lefttext'
                    )
                ),
                array(
                    'attr' => array(
                        'title' => t('Сохранить текущую выборку задач'),
                        'href' => $this->router->getAdminUrl('add_dir', array('f' => $this->task_filters)),
                        'class' => 'add crud-add crud-sm-dialog'
                    )
                ),
            ),
        )), $this->dir_api);

        $helper->setBottomToolbar($this->buttons(array('multiedit', 'delete')));

        $helper->setTreeBottomToolbar(new Toolbar\Element( array(
            'Items' => array(
                new ToolbarButton\Delete(null, null, array('attr' =>
                    array('data-url' => $this->router->getAdminUrl('del_dir'))
                )),
            ))));

        $helper->setTreeFilter(new Filter\Control( array(
            'Container' => new Filter\Container( array(
                'Lines' =>  array(
                    new Filter\Line( array('Items' => array(
                        new Filter\Type\Text('title', t('Название'), array('SearchType' => '%like%')),
                    )
                    ))
                ),
            )),
            'ToAllItems' => array('FieldPrefix' => $this->dir_api->defAlias()),
            'filterVar' => 'c',
            'Caption' => t('Поиск по выборкам')
        )));

        return $helper;
    }

    /**
     * Отображает список задач
     *
     * @param null $primaryKeyValue
     * @param bool $returnOnSuccess
     * @param null $helper
     * @return bool|\RS\Controller\Result\Standard
     */
    function actionAdd($primaryKeyValue = null, $returnOnSuccess = false, $helper = null)
    {
        $link_type = $this->url->get('link_type', TYPE_STRING);
        $link_id = $this->url->get('link_id', TYPE_INTEGER);

        $helper = $this->getHelper();
        $element = $this->api->getElement();

        if ($primaryKeyValue <= 0) { //Если создание сделки
            $helper->setTopTitle(t('Добавить задачу'));

            $element['task_num'] = \RS\Helper\Tools::generatePassword(8, range('0', '9'));
            $element['creator_user_id'] = $this->user->id;
            $element['date_of_create'] = date('Y-m-d H:i:s');
            $element->setTemporaryId();
            $element->initUserRights(AbstractObject::INSERT_FLAG);

            if ($link_type && $link_id) {
                $element['__links']->setVisible(false);
            }
        } else {
            $helper->setTopTitle(t('Редактировать задачу {title}'));
            $element->initUserRights(AbstractObject::UPDATE_FLAG);
        }

        if (!$element['autotask_group']) {
            $element->hideAutoTaskTab();
        }

        if ($link_type && $link_id) {
            $this->user_post_data['links'] = array(
                $link_type => array($link_id)
            );
        }

        return parent::actionAdd($primaryKeyValue, $returnOnSuccess, $helper);
    }

    /**
     * Групповое редактирование элементов
     *
     * @return \RS\Controller\Result\Standard
     * @throws \Exception
     * @throws \SmartyException
     */
    function actionMultiedit()
    {
        $element = $this->api->getElement();
        $element->initUserRights(AbstractObject::UPDATE_FLAG);

        return parent::actionMultiedit();
    }

    /**
     * Формирует хелпер для редактирования элемента
     * @return CrudCollection
     */
    function helperEdit()
    {
        $id = $this->url->get('id', TYPE_INTEGER, 0);

        $helper = parent::helperEdit();
        $helper['bottomToolbar']
            ->addItem(
                new ToolbarButton\delete( $this->router->getAdminUrl('deleteOne', array('id' => $id, 'dialogMode' => $this->url->request('dialogMode', TYPE_INTEGER))), null, array(
                    'noajax' => true,
                    'attr' => array(
                        'class' => 'btn-alt btn-danger delete crud-get crud-close-dialog',
                        'data-confirm-text' => t('Вы действтельно хотите удалить данную задачу?')
                    )
                )), 'delete'
            );

        return $helper;
    }

    /**
     * Удаляет одну задачу
     *
     * @return \RS\Controller\Result\Standard
     */
    function actionDeleteOne()
    {
        $id = $this->url->request('id', TYPE_INTEGER);
        $this->api->setFilter('id', $id);
        $reason = '';
        if ($task = $this->api->getFirst()) {
            if ($task->delete()) {
                if (!$this->url->request('dialogMode', TYPE_INTEGER)) {
                    $this->result->setAjaxWindowRedirect($this->url->getSavedUrl($this->controller_name.'index'));
                }

                return $this->result
                    ->setSuccess(true)
                    ->setNoAjaxRedirect($this->url->getSavedUrl($this->controller_name.'index'));
            } else {
                $reason = t(' Причина: %0', array($task->getErrorsStr()));
            }
        }

        return $this->result->setSuccess(false)->addEMessage(t('Не удалось удалить задачу.').$reason);
    }

    /**
     * Формирует хелпер для создания выборки
     *
     * @return CrudCollection
     */
    function helperAdd_dir()
    {
        $helper = new CrudCollection($this, $this->dir_api);
        $helper->viewAsForm();
        $helper->setTopTitle(t('Сохранить выборку'));
        $helper->setBottomToolbar($this->buttons(array('save', 'cancel')));

        return $helper;
    }

    /**
     * Открывает окно сохранения текущей выборки товаров
     */
    function actionAdd_Dir($primaryKey = null)
    {
        if (!$primaryKey && !$this->task_filters) {
            return $this->result->setSuccess(false)
                                ->addSection('close_dialog', true)
                                ->addEMessage(t('Установите хотя бы один фильтр для сохранения выборки'));
        }

        $helper = $this->getHelper();

        if ($this->url->isPost()) {

            $user_post = array(
                'user_id' => $this->user->id
            );

            if (!$primaryKey) {
                $user_post['filters_arr'] = $this->task_filters;
            }

            if ($this->dir_api->save($primaryKey, $user_post)) {
                return $this->result->setSuccess(true);
            } else {
                return $this->result
                    ->setSuccess(false)
                    ->setErrors($this->dir_api->getElement()->getDisplayErrors());
            }
        }

        return $this->result->setTemplate( $helper->getTemplate() );
    }

    /**
     * Формирует хелпер для формирования окна редактирования выборки
     *
     * @return CrudCollection
     */
    function helperEdit_dir()
    {
        $helper = $this->helperAdd_dir();
        $helper->setTopTitle(t('Переименовать выборку'));
        return $helper;
    }

    /**
     * Открывает окно редактирования выборки
     *
     * @return \RS\Controller\Result\Standard
     */
    function actionEdit_dir()
    {
        $id = $this->url->get('id', TYPE_STRING, 0);
        if ($id) $this->dir_api->getElement()->load($id);

        return $this->actionAdd_dir($id);
    }

    /**
     * Удаляет сохраненную выборку
     *
     * @return mixed
     */
    function actionDel_dir()
    {
        $this->api = $this->dir_api;
        return parent::actionDel();
    }

    /**
     * Изменяет порядок сохраненной выборки
     *
     * @return \RS\Controller\Result\Standard
     */
    function actionMove_dir()
    {
        $from = $this->url->request('from', TYPE_INTEGER);
        $to = $this->url->request('to', TYPE_INTEGER);
        $direction = $this->url->request('flag', TYPE_STRING);
        $result = $this->dir_api->moveElement($from, $to, $direction);

        return $this->result->setSuccess($result);
    }
}