<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:43
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\marketplace\view\widget\newmodules\newmodules_item.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117bff41067_32446514',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5e13b908c8a390750f3e85bc03d16712a2aa507e' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\marketplace\\view\\widget\\newmodules\\newmodules_item.tpl',
      1 => 1549608219,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117bff41067_32446514 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if ($_smarty_tpl->tpl_vars['error']->value) {?>
    <div class="empty-widget">
        <?php echo $_smarty_tpl->tpl_vars['error']->value;?>

    </div>
<?php } elseif ($_smarty_tpl->tpl_vars['items']->value) {?>
    <div class="mp-modules__list<?php if (count($_smarty_tpl->tpl_vars['items']->value) == 1) {?> no-columns<?php }?>">
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['items']->value, 'item');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
?>
            <div class="item">
                <a class="pic" href="<?php echo smarty_function_adminUrl(array('do'=>false,'mod_controller'=>"marketplace-ctrl"),$_smarty_tpl);?>
#<?php echo $_smarty_tpl->tpl_vars['item']->value['url'];?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['item']->value['image'];?>
"></a>
                <p class="description"><?php echo $_smarty_tpl->tpl_vars['item']->value['description'];?>
</p>
            </div>
        <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

    </div>
<?php } else { ?>
    <div class="empty-widget">
        <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Нет рекомендуемых виджетов<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

    </div>
<?php }
}
}
