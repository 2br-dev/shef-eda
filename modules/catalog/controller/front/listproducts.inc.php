<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Catalog\Controller\Front;

use Catalog\Model\Api;
use Catalog\Model\CurrencyApi;
use Catalog\Model\Dirapi;
use Catalog\Model\Orm\Dir;
use Catalog\Model\PropertyApi;
use RS\Config\Loader as ConfigLoader;
use RS\Controller\Front;
use RS\Debug;
use RS\Event\Manager as EventManager;
use RS\Exception;
use RS\Helper\Paginator;
use Search\Model\SearchApi;

/**
* Контроллер - список продукции в категории
* @ingroup Catalog
*/
class ListProducts extends Front
{
    const
        DEFAULT_PAGE_SIZE = 12;
        
    public
        $config,
        $query,
        $page,
        $pageSize,
        $search_type,
        $can_rank_sort,
        $items_on_page,
        $cur_sort,
        $cur_n_sort,
        $default_n_sort,
        $view_as;

    /** @var \Catalog\Model\Api $api */
    public $api;
    /** @var \Catalog\Model\Dirapi $dirapi */
    public $dirapi;

    /**
     * Инициализация каталога товаров
     *
     * @throws \RS\Event\Exception
     * @throws \RS\Exception
     */
    function init()
    {
        $this->api    = new Api();
        $this->dirapi = new Dirapi();
        $this->config = ConfigLoader::byModule($this);
        
        $this->query = $this->url->get('query', TYPE_STRING);
        $this->search_type = ConfigLoader::byModule('search')->searchtype;
        $this->can_rank_sort = ($this->search_type == 'fulltext' && !empty($this->query));

        $items_on_page_str = empty($this->config['items_on_page']) ? $this->config['list_page_size'] : $this->config['items_on_page'];
        $this->items_on_page = preg_split('/[ ]*,[ ]*/', trim($items_on_page_str));
                
        $this->pageSize = $this->url->request('pageSize', TYPE_INTEGER, $this->config['list_page_size']);
        $this->pageSize = $this->url->convert($this->pageSize, $this->items_on_page);
        
        $this->page = $this->url->get('p', TYPE_INTEGER, 1);
        if ($this->page < 1){
            $this->page = 1;
        }
        
        $this->view_as = $this->url->request('viewAs', TYPE_STRING, $this->config['list_default_view_as']);
        
        //Сортировка 
        $allow_sort = array_keys($this->config->__list_default_order->getList());
        if ($this->can_rank_sort) {
            $allow_sort[] = 'rank';
        }
        
        $this->cur_sort = $this->url->convert($this->url->request('sort', TYPE_STRING, $this->config['list_default_order']), $allow_sort);
        $this->cur_n_sort = $this->url->convert($this->url->request('nsort', TYPE_STRING, $this->config['list_default_order_direction']), array('desc','asc'));
        
        $cookie_expire = time()+60*60*24*730;
        $cookie_path = $this->router->getUrl('catalog-front-listproducts');
        $this->app->headers
            ->addCookie('viewAs', $this->view_as, $cookie_expire, $cookie_path)
            ->addCookie('pageSize', $this->pageSize, $cookie_expire, $cookie_path)
            ->addCookie('sort', $this->cur_sort, $cookie_expire, $cookie_path)
            ->addCookie('nsort', $this->cur_n_sort, $cookie_expire, $cookie_path);
            
        //Если идет полнотекстовый поиск, то устанавливаем сортировку по-умолчанию - по релевантности
        if ($this->can_rank_sort && !$this->url->get('sort', TYPE_STRING, null) ) {
            $this->cur_sort = 'rank';
            $this->cur_n_sort = 'desc';
        }
        $this->default_n_sort = array( //Направление сортировки по умолчанию
            'sortn' => 'asc',
            'dateof' => 'desc',
            'title' => 'asc',
            'cost' => 'asc',
            'rating' => 'desc',
            'rank' => 'desc',
            'num' => 'desc',
            'barcode' => 'asc'
        );

        /**
         * @deprecated (10.18) вместо данного события следует использовать событие "controller.afterinit.КОРОТКОЕ-ИМЯ-КОНТРОЛЛЕРА"
         */
        EventManager::fire('init.api.'.$this->getUrlName(), $this);
    }


    /**
     * Открытие списка товаров
     *
     * @return \RS\Controller\Result\Standard
     * @throws \RS\Controller\ExceptionPageNotFound
     * @throws \RS\Event\Exception
     * @throws \RS\Exception
     */
    function actionIndex()
    {  
        $dir = urldecode($this->url->get('category', TYPE_STRING,0));
        $this->url->saveUrl('catalog.list.index');
        $category = $dir ? $this->dirapi->getById($dir) : false;

        if (!$category) {
            $category = new Dir();
        }

        //Если есть alias и открыта страница с id вместо alias, то редирект
        $this->checkRedirectToAliasUrl($dir, $category, $category->getUrl());
        $dir_id = $category['id'] ? $category['id'] : false;

        if (($dir_id !== false) || ($dir === "0" && $this->config['show_all_products']) || $this->url->isKey('query')) {
            if ($this->query != '' || $dir_id || ($this->config['show_all_products'] && !$this->url->isKey('query'))) { //Если есть категория или задан поисковый запрос или флаг отображать /catalog/
                if ($debug_group = $this->getDebugGroup()) {
                    $create_href = $this->router->getAdminUrl('add', array('dir' => $dir_id), 'catalog-ctrl');
                    $debug_group->addDebugAction(new Debug\Action\Create($create_href));
                    $debug_group->addTool('create', new Debug\Tool\Create($create_href));
                }

                //Разберем ЧПУ адрес с фильтрами предварительно, если включена опция и они есть
                try {
                    $decoded_filters = $this->api->decodeDirFilterParamsFromUrl();
                } catch(Exception $e) {
                    $this->e404($e->getMessage());
                }
                
                if ($dir_id) {
                    //Сохраняем текущую категорию, чтобы отобразить её в хлебных крошках товара
                    $this->dirapi->PutInBreadcrumb($dir_id); 
                    $dir_ids = $this->dirapi->getChildsId($dir_id);
                    
                    //Устанавливаем дополнительные условия фильтрации, если открыта "Виртуальная категория"
                    if ($category['is_virtual']) {
                        if ($product_ids_by_virtual_dir = $category->getVirtualDir()->getFilteredProductIds($dir_ids)) {
                            $this->api->setFilter('id', $product_ids_by_virtual_dir, 'in');
                        }
                    } 
                    //Устанавливаем обычный фильтр по категории
                    elseif ($dir_ids)  { 
                        $this->api->setFilter('dir', $dir_ids, 'in');
                    }

                }elseif ($dir === "0"){
                    $dir_id = 0;
                }
                
                if ($this->query != '') {
                    //Если идет поиск по названию
                    $q = $this->api->queryObj();
                    $q->select = 'A.*';
                    $search = SearchApi::currentEngine();
                    $search->setFilter('B.result_class', 'Catalog\Model\Orm\Product');
                    $search->setQuery($this->query);
                    $search->joinQuery($q);
                    
                    $this->app->breadcrumbs->addBreadCrumb(t('Результаты поиска'), $this->router->getUrl('catalog-front-listproducts', array('query' => $this->query)));
                }
                
                //Загружаем возможные значения характеристик товаров для текущей выборки товаров
                $cache_id = $dir_id.$this->query; //Ключ кэша
                $filter_allowed_values = $this->api->getAllowablePropertyValues($dir_id, $cache_id);
                $filter_brands_values  = $this->api->getAllowableBrandsValues($cache_id);
                
                $this->router->getCurrentRoute()->addExtra('allowable_values', $filter_allowed_values);
                $this->router->getCurrentRoute()->addExtra('allowable_brand_values', $filter_brands_values);
                $this->result->addSection('filter_allowed_values', $filter_allowed_values);
                
                $this->api->setFilter('public', 1);
                
                $config = ConfigLoader::byModule($this);
                if ($config['hide_unobtainable_goods'] == 'Y') {
                    $this->api->setFilter('num', '0', '>');
                }
                
                //Запросим данные по максимальной и минимальной цене в категории
                if ($config['price_like_slider']) {
                    $default_currency = CurrencyApi::getDefaultCurrency();
                    $money_array = $this->api->getMinMaxProductsCost();
                    $money_array += array( //Данные, необходимые для отображения JS-слайдера
                        'step'  => 1,
                        'round' => 0,
                        'unit'  => $default_currency['stitle'],
                        'heterogeneity' => $this->api->getHeterogeneity($money_array['interval_from'], $money_array['interval_to'])
                    );
                
                    //Передадим сведения по фильтру
                    $this->router->getCurrentRoute()->addExtra('money_array', $money_array);
                }

                //Ограничим показ товаров, если их недостаточно на складах выбранного филиала
                $this->api->setAffiliateRestrictions(true);

                //Загружаем свойства для фильтров
                $prop_api = new PropertyApi();
                $prop_list = $prop_api->getGroupProperty($dir_id, true, true);
                
                $old_version_filters = $this->url->request('f', TYPE_ARRAY); //Для совместимости с предыдущими версиями RS
                $filters = $this->url->request('pf', TYPE_ARRAY, $prop_api->convertOldFilterValues($old_version_filters));

                if (isset($decoded_filters['pf'])){ //Если есть декодированные фильтры
                    $filters = $filters + $decoded_filters['pf'];
                }

                //Посмотрим принадлежат ли установленные фильтры категории, если нет, то покажем 404 страницу
                if (!$this->url->isAjax() && !$prop_api->checkPropertyFiltersExitsInCategoryDir($dir_id, $filter_brands_values, $filters, $this->api->getBaseFilters())){
                    $this->e404(t('Такой страницы не существует'));
                }
                
                $pids = $prop_api->getFilteredProductIds($filters);

                if ($pids !== false) $this->api->setFilter('id', $pids, 'in');
                
                //Сортировка
                if ($this->default_n_sort[$this->cur_sort] == $this->cur_n_sort) {
                    $this->default_n_sort[$this->cur_sort] = ($this->default_n_sort[$this->cur_sort] == 'asc') ? 'desc' : 'asc';
                }
                
                $basefilter = $this->api->applyBaseFilters();
                $total      = $this->api->getMultiDirCount();
                            
                $this->api->queryObj()->groupby($this->api->defAlias().'.id');
                //Устанавливаем сортировку
                $sort_field = $this->cur_sort == 'rank' ? $this->cur_sort : $this->api->defAlias().'.'.$this->cur_sort;
                $this->api->setSortOrder($sort_field, $this->cur_n_sort);
                
                if (!empty($this->query) && $dir == 0) { //Если это результат поиска, 
                    $sub_dirs = $this->api->getDirList(); //Загружаем список категорий, в которых найдены товары
                } else {
                    //Загружаем список подактегорий, у текущей категории
                    $this->dirapi->setFilter('parent', $dir_id);      
                    $this->dirapi->setFilter('public', 1);
                    $sub_dirs = $this->dirapi->getList();
                }

                //Подгружаем обязательные сведения о товарах
                EventManager::fire('listproducts.beforegetlist', array(
                    'controller' => $this,
                ))->getResult();

                //Настраиваем пагинацию
                $route_params = $this->api->getCategoryPaginatorRouteParamsForProductsList($category, $this->api->getBaseFilters(), $filters, $this->query);
                $paginator = new Paginator($this->page, $total, $this->pageSize, 'catalog-front-listproducts', $route_params);

                $getpage = urldecode($this->url->get('p', TYPE_INTEGER,0));
                if ($getpage > $paginator->total_pages && !$this->url->isAjax()) {
                    $this->e404(t('Страницы не существует'));
                }

                //Подгружаем обязательные сведения о товарах
                $list = $this->api->getList($this->page, $this->pageSize);
                $list = $this->api->addProductsPhotos($list);
                $list = $this->api->addProductsCost($list);
                $list = $this->api->addProductsProperty($list);
                
                //Заполняем meta - теги
                $path = $this->dirapi->getPathToFirst($dir_id);

                $meta_title = null;
                $meta_keywords = null;
                $meta_description = null;

                foreach($path as $one_dir) {

                    if ($one_dir['meta_title']) $meta_title = $one_dir['meta_title'];
                    if ($one_dir['meta_keywords']) $meta_keywords = $one_dir['meta_keywords'];
                    if ($one_dir['meta_description']) $meta_description = $one_dir['meta_description'];

                    if ($one_dir['public']) {
                        $this->app->breadcrumbs->addBreadCrumb($one_dir['name'], $this->url->replaceKey(array('category' => $one_dir['_alias'], 'p' => null)));
                    }
                }
                if(!$meta_title)
                    $meta_title = $category['name'];

                $seoGen = new \Catalog\Model\SeoReplace\Dir(array(
                    $category,
                ));

                // Добавляем мета-теги
                $this->app->title->addSection($seoGen->replace($meta_title));
                $this->app->meta->addKeywords($seoGen->replace($meta_keywords));
                $this->app->meta->addDescriptions($seoGen->replace($meta_description));

                // Формируем строку из массива названий и значений характеристик
                $all_filters_data = $this->api->getSelectedFiltersAsString(
                    $this->api->getBaseFilters(),
                    $filter_brands_values,
                    $prop_api->last_filtered_props);

                //Добавим к мета тегам выбранные фильтры
                $this->api->applyFiltersToMeta($all_filters_data);

                if ($this->url->isAjax()){
                    //Закодируем примененные фильтры и вернём, если это ajax
                    $seo_url = $this->api->encodeDirFilterParamsToUrl($category, $this->api->getBaseFilters(), $filters, $this->query);

                    $this->result->addSection('new_url', $seo_url);
                }

                $this->router->getCurrentRoute()->addExtra('category', $category); //Занесем текущую категорию в роутер

                $this->view->assign(array(
                    'query' => $this->query,   
                    'can_rank_sort' => $this->can_rank_sort,
                    'dirapi' => $this->dirapi,
                    'path' => $path,
                    'dir' => $dir,
                    'category' => $category,
                    'sub_dirs' => $sub_dirs,
                    'dir_id' => $dir_id,
                    'cur_sort' => $this->cur_sort,
                    'cur_n' => $this->cur_n_sort,
                    'sort' => $this->default_n_sort,
                    'total' => $total,
                    'list' => $list,
                    'view_as' => $this->view_as,
                    'paginator' => $paginator,
                    'prop_list' => $prop_list,
                    'page_size' => $this->pageSize,
                    'items_on_page' => $this->items_on_page,
                    'filter' => $prop_api->cleanNoActiveFilters($old_version_filters ?: $filters),
                    'bfilter' => $this->api->getBaseFilters(),
                    'is_filter_active' => ($prop_api->isFilterActive() || $basefilter),
                    'all_filters_data' => $all_filters_data
                ));
            } else {
                $this->view->assign(array(
                    'list' => array(),
                    'no_query_error' => true
                ));
            }
        } else {
            $this->e404(t('Такой категории не существует'));
        }
        
        return $this->result->setTemplate('list_products.tpl');
    }

}
