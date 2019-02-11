<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:42
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\shop\view\widget\reservation.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117be1b7d96_82184118',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e357562c378c358f86625e5303bfd0d1ca878e91' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\shop\\view\\widget\\reservation.tpl',
      1 => 1549608233,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%SYSTEM%/admin/widget/paginator.tpl' => 1,
  ),
),false)) {
function content_5c6117be1b7d96_82184118 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_modifier_dateformat')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\modifier.dateformat.php';
?>
<div class="widget-filters">
    <div class="dropdown">
        <a id="reservation-switcher" data-toggle="dropdown" class="widget-dropdown-handle">
            <?php if ($_smarty_tpl->tpl_vars['filter']->value == 'open') {
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
открытые<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
} else {
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
закрытые<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
}?> <i class="zmdi zmdi-chevron-down"></i>
        </a>
        <ul class="dropdown-menu" aria-labelledby="reservation-switcher">
            <li<?php if ($_smarty_tpl->tpl_vars['filter']->value == 'open') {?> class="act"<?php }?>><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"shop-widget-reservation",'filter'=>"open"),$_smarty_tpl);?>
" class="call-update"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Открытые<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
            <li<?php if ($_smarty_tpl->tpl_vars['filter']->value == 'close') {?> class="act"<?php }?>><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"shop-widget-reservation",'filter'=>"close"),$_smarty_tpl);?>
" class="call-update"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Закрытые<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
        </ul>
    </div>
</div>

<?php if (count($_smarty_tpl->tpl_vars['list']->value)) {?>
    <table class="wtable mrg overable clickable">
        <tbody>
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value, 'item');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
?>
                <tr class="crud-edit clickable" data-crud-options='{ "updateThis": true }' data-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"shop-reservationctrl",'do'=>"edit",'id'=>$_smarty_tpl->tpl_vars['item']->value['id']),$_smarty_tpl);?>
">
                    <td class="f-14">
                        <div class="title">
                            <span title="<?php echo $_smarty_tpl->tpl_vars['item']->value['__status']->textView();?>
" class="w-point<?php if ($_smarty_tpl->tpl_vars['item']->value['status'] == 'open') {?> bg-deeporange<?php } else { ?> bg-green<?php }?>"></span>
                            <b>№ <?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
</b>
                        </div>
                        <div class="sub-title"><?php echo $_smarty_tpl->tpl_vars['item']->value['product_title'];?>
<br/><?php echo $_smarty_tpl->tpl_vars['item']->value['phone'];?>
</div>
                    </td>
                    <td class="w-date">
                        <?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['item']->value['dateof'],"%e %v %!Y");?>
<br>
                        <?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['item']->value['dateof'],"@time");?>

                    </td>
                </tr>
            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

        </tbody>
    </table>
<?php } else { ?>
    <div class="empty-widget">
        <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Нет ни одной предзаказа<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

    </div>
<?php }?>

<?php $_smarty_tpl->_subTemplateRender("rs:%SYSTEM%/admin/widget/paginator.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('paginatorClass'=>"with-top-line"), 0, false);
}
}
