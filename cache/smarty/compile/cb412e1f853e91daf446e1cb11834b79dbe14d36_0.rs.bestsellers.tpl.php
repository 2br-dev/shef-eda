<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:41
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\main\view\widget\bestsellers.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117bdeee283_37963735',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'cb412e1f853e91daf446e1cb11834b79dbe14d36' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\main\\view\\widget\\bestsellers.tpl',
      1 => 1549608217,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%main%/widget/bestsellers_items.tpl' => 1,
  ),
),false)) {
function content_5c6117bdeee283_37963735 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
echo smarty_function_addcss(array('file'=>"common/owlcarousel/owl.carousel.min.css",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"common/owlcarousel/owl.theme.default.min.css",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"owlcarousel/owl.carousel.min.js"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"%main%/bestsellers.css"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"%main%/bestsellers.js"),$_smarty_tpl);?>


<div id="bestsellers" class="<?php if (!$_smarty_tpl->tpl_vars['error']->value && !$_smarty_tpl->tpl_vars['items']->value) {?>need-refresh<?php }?>"
        data-need-show-dialog="<?php echo $_smarty_tpl->tpl_vars['need_show_dialog']->value;?>
"
        data-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"main-widget-bestsellers",'bsdo'=>"getItems"),$_smarty_tpl);?>
"
        data-url-dialog="<?php echo smarty_function_adminUrl(array('mod_controller'=>"main-widget-bestsellers",'bsdo'=>"getDialog"),$_smarty_tpl);?>
">
    <div class="bestsellers-container">
        <?php if ($_smarty_tpl->tpl_vars['items']->value) {?>
            
            <?php $_smarty_tpl->_subTemplateRender("rs:%main%/widget/bestsellers_items.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

        <?php }?>
    </div>

    <div class="empty-widget loading <?php if ($_smarty_tpl->tpl_vars['items']->value) {?>hidden<?php }?>">
        <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Загрузка...<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

    </div>
</div><?php }
}
