<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Catalog\Model;

use RS\Application\Auth;
use RS\Config\Loader as ConfigLoader;
use RS\Db\Adapter as DbAdapter;
use RS\Module\AbstractModel\EntityList;
use RS\Orm\AbstractObject;
use RS\Site\Manager as SiteManager;
use RS\Orm\Request as OrmRequest;
use Site\Model\Orm\Site;
use Users\Model\Orm\User;

class CostApi extends EntityList
{
    const ROUND = 'round';
    const CEIL = 'ceil';
    const FLOOR = 'floor';

    protected static $session_old_cost_id;
    protected static $session_default_cost_id;
    protected static $instance;
    protected static $full_costlist;

    function __construct()
    {
        parent::__construct(new Orm\Typecost, array(
            'multisite' => true,
            'nameField' => 'title',
            'defaultOrder' => 'id'
        ));
    }

    public static function getInstance()
    {
        if (!isset(self::$instance)) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * Аналог getSelectList, только для статичского вызова
     *
     * @param array $first - значения, которые нужно добавить в начало списка
     * @return array
     */
    static function staticSelectList($first = array())
    {
        if ($first === true) { // для совместимости
            $first = array(0 => t('Не выбрано'));
        }
        return parent::staticSelectList($first);
    }

    /**
     * Возвращает подготовленный для отображения в таблице массив данных
     *
     * @param int $page - номер страницы
     * @param int $size - кол-во элементов на странице
     * @return Orm\Typecost[]
     */
    function getTableList($page = 0, $size = 0)
    {
        $config = ConfigLoader::byModule($this);

        /** @var Orm\Typecost[] $list */
        $list = $this->getList($page, $size);

        foreach ($list as $item) {
            if ($item['type'] == 'manual') {
                $item['_type_text'] = t('Задается вручную');
            } else {
                $val_type = ($item['val_type'] == 'sum') ? t(' руб') : '%';
                $depend_cost = $item->getDependCost();
                $item['_type_text'] = t("Вычисляется автоматически: <strong>{$item['val_znak']}{$item['val']}{$val_type}</strong> от {$depend_cost['title']}");
            }

            if ($item['id'] == $config['default_cost']) {
                $item['title'] = t("<strong>{$item['title']}</strong> (по умолчанию)");
            }
        }
        return $list;
    }

    /**
     * Возвращает список цен. Из списка исключаются автовычесляемые цены и редактируемая сейчас.
     */
    public static function getEditList()
    {
        $obj = self::getInstance();

        //Убираем самого себя из списка
        $cur_id = $obj->getElement()->offsetGet('id');
        if ($cur_id > 0) {
            $obj->setFilter('id', $cur_id, '!=');
        }
        //Отображаем только не автоматически вычесляемые типы цен
        $obj->setFilter('type', 'manual');

        return $obj->getSelectList();
    }

    /**
     * Возвращает список цен для селектора в меню пользователи
     *
     * @return array
     */
    public static function getUserSelectList()
    {
        $sites = OrmRequest::make()
            ->from(new Site())
            ->orderby('title ASC')
            ->objects();

        foreach ($sites as $k => $site) {
            $prices = OrmRequest::make()
                ->from(new Orm\Typecost())
                ->where(array(
                    'site_id' => $site['id']
                ))
                ->orderby('title ASC')
                ->objects();

            $prices = array(-1 => array(
                    'id' => 0,
                    'title' => t('По умолчанию')
                )) + $prices;
            $sites[$k]['prices'] = $prices;
        }

        return $sites;
    }

    /**
     * Заполняет массив с полями цен и сайтов, значениями цен установленными для данного пользователя
     *
     * @param AbstractObject $user
     * @param array $sites
     * @return array
     */
    public static function fillUsersPriceList(AbstractObject $user, array $sites)
    {
        if (is_numeric($user['cost_id'])) {
            //Для совместимости с предыдущей версией
            $cost_array = array(SiteManager::getSiteId() => $user['cost_id']);
        } else {
            $cost_array = @unserialize($user['cost_id']); //Массив текущими ценами пользователя
        }

        if (!empty($sites) && $cost_array) {
            foreach ($sites as $key => $site) { //Походимся по сайтам

                if (!empty($site['prices'])) {
                    foreach ($site['prices'] as $keyp => $price) { //Походимся по ценам
                        if ($cost_array[$site['id']] == $price['id']) {
                            $sites[$key]['prices'][$keyp]['selected'] = true;
                        }
                    }
                }
            }
        }

        return $sites;
    }

    /**
     * Возвращает расчитанные "автоматические" цены на основе "заданных вручную"
     *
     * @param array $cost_values
     * @return array массив цен
     */
    function getCalculatedCostList($cost_values)
    {
        if (!isset(self::$full_costlist)) $this->getAllCategory();

        //Устанавливаем вычисляемые значения.
        $cost_val = array();
        foreach (self::$full_costlist as $onecost) {
            if ($onecost['type'] == 'auto') {
                $source_val = isset($cost_values[$onecost['depend']]) ? $cost_values[$onecost['depend']] : 0;
            } else {
                $source_val = isset($cost_values[$onecost['id']]) ? $cost_values[$onecost['id']] : 0;
            }

            $cost_val[$onecost['id']] = $this->calculateAutoCost($source_val, $onecost);
        }
        return $cost_val;
    }

    /**
     * Высчитывает автоматическую цену из исходной
     *
     * @param double $source_cost исходная цена
     * @param \Catalog\Model\Orm\TypeCost $cost_arr - объект типа цены
     * @return double возвращает высчитанную цену
     */
    function calculateAutoCost($source_cost, $cost_arr)
    {
        if ($cost_arr['type'] == 'auto') {
            if ($cost_arr['val_type'] == 'sum') {
                $dst_val = (float)$cost_arr['val_znak'].$cost_arr['val'];
            } else {
                $dst_val = $source_cost * ($cost_arr['val_znak'].($cost_arr['val']/100));
            }
            $source_cost = $source_cost + $dst_val;
            
            $source_cost = $cost_arr->getRounded($source_cost); //Округление
            $source_cost = number_format($source_cost, 2, '.', '');
        }
        return $source_cost;
    }

    /**
     * Устанавливает тип цены по умолчанию (если ни одна из групп пользователя не сопоставлена с другой ценой)
     *
     * @param int $cost_id - id типа цены
     */
    function setDefaultCost($cost_id)
    {
        $config = ConfigLoader::byModule($this);
        $config['default_cost'] = $cost_id;
        $config->update();
    }
    
    /**
     * Заполняет кэш существующих типов цен
     *
     * @return void
     */
    function getAllCategory()
    {
        $this->clearFilter();
        self::$full_costlist = $this->getAssocList('id');
    }

    /**
     * Возвращает id типа цен, от которой зависит цена $type_id.
     *
     * @param int $type_id
     * @return integer
     */
    function getManualType($type_id)
    {
        if (!isset(self::$full_costlist)) $this->getAllCategory();
        return (self::$full_costlist[$type_id]['type'] == 'manual') ? $type_id : self::$full_costlist[$type_id]['depend'];
    }

    /**
     * Возвращает объект типа цены по ID
     *
     * @param integer $id
     * @return \Catalog\Model\Orm\TypeCost
     */
    function getCostById($id)
    {
        if (!isset(self::$full_costlist)) $this->getAllCategory();
        return self::$full_costlist[$id];
    }

    /**
     * Возвращает исходную цену из выщитанной автоматически для текущего Пользователя
     *
     * @param mixed $value Сумма
     * @return float
     */
    function correctCost($value)
    {
        if (!isset(self::$full_costlist)){
            $this->getAllCategory();
        }
        $cost_id = self::getUserCost();
        $cost = self::$full_costlist[$cost_id];
        
        if ($cost['type'] == 'auto') {
            if ($cost['val_type'] == 'sum') {
                //Если у цены установлено прибавить 300, значит здесь мы должы отнять 300
                $dst_val = (float)$cost['val_znak'].$cost['val'];
                $value  = $value - $dst_val;                
            } else {
                //Если у цены установлено прибавить 30%, значит здесь мы должы отнять 30%
                $value  = $value / abs(($cost['val_znak'].'1')+($cost['val']/100));
            }
           $value  = number_format( $value, 2, '.', '' );
        }
        return $value;
    }

    /**
     * Возвращает id цены пользователя, если таковая установлена, иначе id цены по-умолчанию (из настроект модуля Каталог)
     *
     * @param User $user - пользователь
     * @return int
     */
    public static function getUserCost(User $user = null)
    {
        if ($user === null) {
            $user = Auth::getCurrentUser();
        }
        $site_id = SiteManager::getSiteId();

        $cost_id = $user->getUserTypeCostId($site_id); // добавлен через behavior
        if (!$cost_id) {
            $cost_id = self::getDefaultCostId();
        }

        return $cost_id;
    }

    /**
     * Устанавливает тип цен по-умолчанию для одной сессии выполнения скрипта
     *
     * @param int $cost_id
     * @return void
     */
    public static function setSessionDefaultCost($cost_id)
    {
        self::$session_default_cost_id = $cost_id;
    }

    /**
     * Возвращает ID типа цен
     *
     * @return integer
     */
    public static function getDefaultCostId()
    {
        if (!self::$session_default_cost_id) {
            self::$session_default_cost_id = ConfigLoader::byModule('catalog')->default_cost;
        }

        return self::$session_default_cost_id;
    }

    /**
     * Возвращает id Старой цены или false, в случае, если такой цены - нет
     *
     * @return integer | bool(false)
     */
    public static function getOldCostId()
    {
        if (!self::$session_old_cost_id) {
             $old_cost_id  = ConfigLoader::byModule('catalog')->old_cost;
             if (!$old_cost_id) {
                 
                 //Для совместимости со старыми версиями
                 $old_cost_type = orm\Typecost::loadByWhere(array(
                    'site_id' => SiteManager::getSiteId(),
                    'title' => t('Зачеркнутая цена')
                 ));
                 
                 $old_cost_id = $old_cost_type['id'];
             }
             self::$session_old_cost_id = $old_cost_id;
        }
        return self::$session_old_cost_id;
    }

    /**
     * Устанавливает тип цен по-умолчанию для одной сессии выполнения скрипта
     *
     * @param integer $cost_id
     */
    public static function setSessionOldCost($cost_id)
    {
        self::$session_old_cost_id = $cost_id;
    }

    /**
     * Пересчитывает цены всех товаров сайта с учетом курсов валют
     *
     * @param integer | null $site_id - id сайта, на котором необходимо пересчитать цены. Если Null, то на текущем
     * @param \Catalog\Model\Orm\Currency $currency - объект валюты для которой ведётся пересчёт
     * @return void
     */
    public static function recalculateCosts($site_id = null, $currency = null)
    {
        if (!$site_id) {
            $site_id = SiteManager::getSiteId();
        }
        $xcost = new Orm\Xcost();
        $q = OrmRequest::make()
            ->select('X.*')
            ->from(new Orm\Product(), 'P')
            ->join($xcost, 'P.id = X.product_id', 'X')
            ->where(array(
                'P.site_id' => $site_id,
            ));
        
        if ($currency){//Если валюта задана
            $q->where('X.cost_original_currency='.$currency['id']);
        }else{
            $q->where('X.cost_original_currency>0');
        }
        
        $offset = 0;            
        $pagesize = 200;
        $res = $q->limit($offset, $pagesize)->exec();
        while( $res->rowCount() ) {
            $values = array();
            while($row = $res->fetchRow()) {
                $curr = Orm\Currency::loadSingle($row['cost_original_currency']);
                $cost_val = $curr['id'] ? CurrencyApi::convertToBase($row['cost_original_val'], $curr) : $row['cost_original_val'];
                $values[] = "({$row['product_id']},{$row['cost_id']},'{$cost_val}')";
            }
            $sql = "INSERT INTO ".$xcost->_getTable()."(product_id, cost_id, cost_val) VALUES".implode(',', $values).
                    " ON DUPLICATE KEY UPDATE cost_val = VALUES(cost_val)";
            DbAdapter::sqlExec($sql);
            
            $offset += $pagesize;
            $res = $q->limit($offset, $pagesize)->exec();
        }
        
        //Обновляем цены в комплектациях.
        $offset = 0;
        $pageSize = 200;
        $q = OrmRequest::make()
            ->select('O.*')
            ->from(new Orm\Offer(), 'O')
            ->where(array('O.site_id' => $site_id))
            ->limit($offset, $pagesize);
            
        if ($currency){//Если валюта задана
            $q->join(new Orm\Product(), 'P.id = O.product_id', 'P')
            ->join($xcost, 'P.id = X.product_id', 'X')
            ->where('X.cost_original_currency='.$currency['id']);
        }
            
        while($list = $q->objects()) {
            foreach($list as $offer) {
                $offer->update();
            }
            $offset += $pageSize;
            $q->offset($offset);
        }
    }
    
    /**
    * Возвращает округлённую цену
    * 
    * @param float $cost - цена
    * @param string $round_type - тип округления (ceil|floor|round)
    * @return float
    */
    static function roundCost($cost, $round_type = self::CEIL)
    {
        $config = \RS\Config\Loader::byModule('catalog');
        if ($config['price_round']) {
            switch ($round_type) {
                case self::CEIL:
                    return ceil($cost / $config['price_round']) * $config['price_round'];
                case self::ROUND:
                    return round($cost / $config['price_round'], 0) * $config['price_round'];
                case self::FLOOR:
                    return floor($cost / $config['price_round']) * $config['price_round'];
            }
        }
        return $cost;
    }
}