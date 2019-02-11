<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Catalog\Controller\Block;

use Catalog\Model\Dirapi;
use RS\Controller\StandartBlock;
use RS\Debug\Action as DebugAction;
use RS\Debug\Tool as DebugTool;
use RS\Event\Manager as EventManager;
use RS\Orm\Type;

/**
* Блок-контроллер Список категорий
*/
class Category extends StandartBlock
{
    protected static $controller_title = 'Список категорий';
    protected static $controller_description = 'Отображает список категорий в боковой колонке';

    /** @var Dirapi */
    public $api;

    protected $path = array();
    protected $pathids = array();
    protected $default_params = array(
        'indexTemplate' => 'blocks/category/category.tpl',
        'root' => 0,
    );
        
    function getParamObject()
    {
        return parent::getParamObject()->appendProperty(array(
            'root' => new Type\Varchar(array(
                'description' => t('Корневая директория'),
                'list' => array(array('\Catalog\Model\Dirapi', 'selectList'))
            ))
        ));
    }

    function init()
    {
        $this->api = Dirapi::getInstance('public');
        $this->api->setFilter('public', 1);
        EventManager::fire('init.dirapi.'.$this->getUrlName(), $this);
    }              
    
    function actionIndex()
    {
        $root_id = $this->getParam('root', 0);
        
        //Определяем текущую категорию
        $route = $this->router->getCurrentRoute();
        $category = 0;
        if ($route && $route->getId() == 'catalog-front-listproducts') {
            //Получаем информацю о текущей категории из URL
            $category = $this->url->request('category', TYPE_STRING);
        } elseif ($route && $route->getId() == 'catalog-front-product') {
            /**
            * @var \Catalog\Model\Orm\Product
            */
            $product = $route->getExtra('product');
                        
            //Получаем информацию, из какой категории на товар был переход
            $category = $this->api->getBreadcrumbDir($product); 

            
            if (!$category) {
                //Принимаем за текущую категорию главную категорию товара
                $product = $route->getExtra('product');
                $category = $product['maindir'];
            }
        }
        
        $cache_id = $root_id. $category. $this->api->queryObj()->toSql(). serialize($this->getParam());

        //Кэшируем список категорий.
        if (!$this->view->cacheOn($cache_id)->isCached($this->getParam('indexTemplate')) ) {
            if (!is_numeric($root_id) && $dir = $this->api->getById( $root_id )) {
                $root_id = $dir['id'];
            }
            
            $item = false;
            if ($category) {
                //Определяем активные элементы категорий вплоть до корневого элемента
                $full_api = Dirapi::getInstance();
                $item = $full_api->getById($category);
                if ($item) {
                    $this->path = $full_api->getPathToFirst($item['id']);
                    foreach ($this->path as $one) {
                        $this->pathids[] = $one['id'];
                    }
                }
            }
            
            if ($debug_group = $this->getDebugGroup()) {
                $create_href = $this->router->getAdminUrl('add_dir', array(), 'catalog-ctrl');
                $debug_group->addDebugAction(new DebugAction\Create($create_href));
                $debug_group->addTool('create', new DebugTool\Create($create_href));
            }
            
            $this->view->assign(array(
                'dirlist' => $this->api->getTreeList( $root_id ),
                'current_item' => $item,
                'pathids' => $this->pathids
            ));
        }
        return $this->result->setTemplate( $this->getParam('indexTemplate') );
    }  
}
