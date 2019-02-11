<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\affiliate\blocks\selectaffiliate\select_affiliate.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b932d1e3_74963423',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '31a112df973bec879b2d6950729960a8c3a1156d' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\affiliate\\blocks\\selectaffiliate\\select_affiliate.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b932d1e3_74963423 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
?>


<?php echo smarty_function_addjs(array('file'=>"%affiliate%/searchfiiliates.js"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"%affiliate%/affiliate.js"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"%affiliate%/affiliates.css",'unshift'=>true),$_smarty_tpl);?>


<?php if ($_smarty_tpl->tpl_vars['current_affiliate']->value['id']) {?>
    <?php $_smarty_tpl->_assignInScope('referer', $_smarty_tpl->tpl_vars['url']->value->selfUri());
?>
    <span class="header-top-city_select">
        <span><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Ваш город<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
:</span><a data-url="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('affiliate-front-affiliates',array('referer'=>$_smarty_tpl->tpl_vars['referer']->value));?>
" class="header-top-city_link rs-in-dialog cityLink" data-need-recheck="<?php echo $_smarty_tpl->tpl_vars['need_recheck']->value;?>
" <?php echo $_smarty_tpl->tpl_vars['current_affiliate']->value->getDebugAttributes();?>
>
        <b><?php echo $_smarty_tpl->tpl_vars['current_affiliate']->value['title'];?>
</b>&nbsp;<i class="pe-7s-angle-down-circle pe-lg pe-va"></i></a></span>
<?php }
}
}
