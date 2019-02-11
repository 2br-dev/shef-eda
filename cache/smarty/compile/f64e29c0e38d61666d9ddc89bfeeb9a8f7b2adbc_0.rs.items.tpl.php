<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\catalog\view\blocks\compare\items.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9611713_01524081',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f64e29c0e38d61666d9ddc89bfeeb9a8f7b2adbc' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\catalog\\view\\blocks\\compare\\items.tpl',
      1 => 1549608200,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b9611713_01524081 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value, 'product');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['product']->value) {
?>
<li data-compare-id="<?php echo $_smarty_tpl->tpl_vars['product']->value['id'];?>
">
    <a class="remove" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Исключить из сравнения<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></a>
    <?php $_smarty_tpl->_assignInScope('main_image', $_smarty_tpl->tpl_vars['product']->value->getMainImage());
?>
    <a href="<?php echo $_smarty_tpl->tpl_vars['product']->value->getUrl();?>
" class="image"><img src="<?php echo $_smarty_tpl->tpl_vars['main_image']->value->getUrl(64,64);?>
" alt="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['main_image']->value['title'])===null||$tmp==='' ? ((string)$_smarty_tpl->tpl_vars['product']->value['title']) : $tmp);?>
"/><!-- 60x75 --> </a>
    <a href="<?php echo $_smarty_tpl->tpl_vars['product']->value->getUrl();?>
" class="title"><?php echo $_smarty_tpl->tpl_vars['product']->value['title'];?>
</a>
    <a href="<?php echo $_smarty_tpl->tpl_vars['product']->value->getMainDir()->getUrl();?>
" class="categoryName"><?php echo $_smarty_tpl->tpl_vars['product']->value->getMainDir()->name;?>
</a>
</li>
<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
}
}
