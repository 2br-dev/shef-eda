<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:41
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\main\view\widgets.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117bda8b9e7_82418669',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7eb39b212e5638a8701de9e5833985537526f573' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\main\\view\\widgets.tpl',
      1 => 1549608218,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117bda8b9e7_82418669 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_function_moduleinsert')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.moduleinsert.php';
echo smarty_function_addjs(array('file'=>"%main%/widgetengine.js"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"%main%/widgetstyle.css?v=2"),$_smarty_tpl);?>


<div class="viewport<?php if (!$_smarty_tpl->tpl_vars['total']->value) {?> empty<?php }
if ($_smarty_tpl->tpl_vars['total']->value > 1) {?> cansort<?php }?>" id="widgets-block" data-widget-urls='{ "widgetList": "<?php echo smarty_function_adminUrl(array('do'=>"GetWidgetList"),$_smarty_tpl);?>
", "addWidget":"<?php echo smarty_function_adminUrl(array('do'=>"ajaxAddWidget"),$_smarty_tpl);?>
", "removeWidget":"<?php echo smarty_function_adminUrl(array('do'=>"ajaxRemoveWidget"),$_smarty_tpl);?>
", "moveWidget": "<?php echo smarty_function_adminUrl(array('do'=>"ajaxMoveWidget"),$_smarty_tpl);?>
" }'>
    <div id="noWidgetText">

        <p class="text"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Настройте<br><span class="small">свой рабочий стол</span><?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</p>
        <div class="welcome-disk">
            <a class="addwidget"><img src="<?php echo $_smarty_tpl->tpl_vars['mod_img']->value;?>
/nowidgets.png"></a>
        </div>

    </div>
    <div id="widget-zone">
        <div class="widget-column" data-column="1">
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['widgets']->value, 'widget');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['widget']->value) {
?>
                <?php echo smarty_function_moduleinsert(array('name'=>$_smarty_tpl->tpl_vars['widget']->value->getFullClass(),'widget'=>$_smarty_tpl->tpl_vars['widget']->value),$_smarty_tpl,'C:\OpenServer\domains\READYSCRIPTTEST\modules\main\view\widgets.tpl');?>

            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

        </div>
        <div class="widget-column" data-column="2"></div>
        <div class="widget-column" data-column="3"></div>
    </div>
    <a class="btn btn-default btn-lg btn-alt widget-change-position">
        <span class="change"><i class="zmdi zmdi-arrows"></i> <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Изменить порядок виджетов<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
        <span class="save"><i class="zmdi zmdi-save"></i> <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Сохранить порядок виджетов<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
    </a>
</div><?php }
}
