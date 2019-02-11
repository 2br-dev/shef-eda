<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\catalog\blocks\searchline\searchform.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9458459_16810365',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a002c683ec4695fa356ff249928e9cdd34346c41' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\catalog\\blocks\\searchline\\searchform.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b9458459_16810365 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
?>


<?php if (!$_smarty_tpl->tpl_vars['param']->value['hideAutoComplete']) {?>
    <?php echo smarty_function_addjs(array('file'=>"libs/jquery.autocomplete.js"),$_smarty_tpl);?>

    <?php echo smarty_function_addjs(array('file'=>"rs.searchline.js"),$_smarty_tpl);?>

<?php }?>
<form method="GET" class="query on" action="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('catalog-front-listproducts',array());?>
" <?php if (!$_smarty_tpl->tpl_vars['param']->value['hideAutoComplete']) {?>id="queryBox"<?php }?>>
    <input type="text" class="theme-form_search<?php if (!$_smarty_tpl->tpl_vars['param']->value['hideAutoComplete']) {?> rs-autocomplete<?php }?>" name="query" value="<?php echo $_smarty_tpl->tpl_vars['query']->value;?>
" autocomplete="off" data-source-url="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('catalog-block-searchline',array('sldo'=>'ajaxSearchItems','_block_id'=>$_smarty_tpl->tpl_vars['_block_id']->value));?>
" placeholder="Поиск по каталогу">
    <button type="submit" class="theme-btn_search"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Найти<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</button>
</form><?php }
}
