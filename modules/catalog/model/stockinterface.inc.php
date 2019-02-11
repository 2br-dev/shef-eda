<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Catalog\Model;

use Shop\Model\Orm\Order;

interface StockInterface
{
    function updateRemainsFromOrder(Order $order, $flag, $old_warehouse = null);
}
