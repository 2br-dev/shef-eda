<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:42
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\shop\view\widget\orderstatuses.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117be168245_76280675',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd9dc5bca556dc04faf8ac10a58788f6a0ad76fb7' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\shop\\view\\widget\\orderstatuses.tpl',
      1 => 1549608233,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117be168245_76280675 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
echo smarty_function_addjs(array('file'=>"flot/excanvas.js",'basepath'=>"common",'before'=>"<!--[if lte IE 8]>",'after'=>"<![endif]-->"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"flot/jquery.flot.min.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"flot/jquery.flot.tooltip.min.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"flot/jquery.flot.resize.js",'basepath'=>"common",'waitbefore'=>true),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"flot/jquery.flot.pie.js",'basepath'=>"common",'waitbefore'=>true),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"%shop%/orderstatuses.js",'basepath'=>"root",'waitbefore'=>true),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"%shop%/orderstatuses.css"),$_smarty_tpl);?>


<div class="order-statuses">
    <?php if ($_smarty_tpl->tpl_vars['total']->value) {?>
        <div id="orderStatusesGraph" class="graph" style="height:300px"></div>
        <div class="flc-orderStatusesLegend"></div>
        
        <div class="orderStatusesData">
            <table width="100%">
                <tr align="center" style="font-weight:bold">
                    <td width="33%"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Всего<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</td>
                    <td width="33%"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Открыто<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</td>
                    <td width="33%"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Завершено<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</td>
                </tr>
                <tr align="center">
                    <td><?php echo $_smarty_tpl->tpl_vars['total']->value;?>
</td>
                    <td><?php echo $_smarty_tpl->tpl_vars['inwork']->value;?>
</td>
                    <td><?php echo $_smarty_tpl->tpl_vars['finished']->value;?>
</td>
                </tr>            
            </table>
        </div>
        <?php echo '<script'; ?>
>
            $.allReady(function() {
                var data = <?php echo $_smarty_tpl->tpl_vars['json_data']->value;?>
;
                initOrderStatusesWidget(data);
            });
        <?php echo '</script'; ?>
>    
    <?php } else { ?>
        <div class="empty-widget">
            <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Нет ни одного заказа<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

        </div>
    <?php }?>
</div><?php }
}
