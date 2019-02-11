<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:41
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\marketplace\view\widget\newmodules\newmodules.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117bdf211b7_90715254',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '68f0f3a0e6d5936fbede80841ec9fc7dce286cbb' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\marketplace\\view\\widget\\newmodules\\newmodules.tpl',
      1 => 1549608219,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:widget/newmodules/newmodules_item.tpl' => 1,
  ),
),false)) {
function content_5c6117bdf211b7_90715254 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
echo smarty_function_addjs(array('file'=>"%marketplace%/newmodules.js"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"%marketplace%/newmodules.css"),$_smarty_tpl);?>


<div id="mp-modules" <?php if (!$_smarty_tpl->tpl_vars['items']->value) {?>class="need-refresh"<?php }?> data-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"marketplace-widget-newmodules",'mpdo'=>"getItems"),$_smarty_tpl);?>
">
    <div class="mp-container">
        <?php if ($_smarty_tpl->tpl_vars['items']->value) {?>
            
            <?php $_smarty_tpl->_subTemplateRender("rs:widget/newmodules/newmodules_item.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
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
