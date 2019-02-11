<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:42
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\shop\view\widget\lastorder.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117be0fb494_66081644',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '27c662a5165d4b6ea07734b5db057c7828f081ce' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\shop\\view\\widget\\lastorder.tpl',
      1 => 1549608233,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%SYSTEM%/admin/widget/paginator.tpl' => 1,
  ),
),false)) {
function content_5c6117be0fb494_66081644 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_modifier_dateformat')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\modifier.dateformat.php';
?>

<div class="widget-filters">
    <div class="dropdown">
        <a id="last-order-switcher" data-toggle="dropdown" class="widget-dropdown-handle"><?php if ($_smarty_tpl->tpl_vars['filter']->value == 'active') {
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
незавершенные<?php $_block_repeat1=false;
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
все<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
}?> <i class="zmdi zmdi-chevron-down"></i></a>
        <ul class="dropdown-menu" aria-labelledby="last-order-switcher">
            <li<?php if ($_smarty_tpl->tpl_vars['filter']->value == 'active') {?> class="act"<?php }?>><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"shop-widget-lastorders",'filter'=>"active"),$_smarty_tpl);?>
" class="call-update"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Незавершенные<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
            <li<?php if ($_smarty_tpl->tpl_vars['filter']->value == 'all') {?> class="act"<?php }?>><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"shop-widget-lastorders",'filter'=>"all"),$_smarty_tpl);?>
" class="call-update"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Все<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
        </ul>
    </div>
</div>

<?php if (count($_smarty_tpl->tpl_vars['orders']->value)) {?>
    <table class="wtable mrg overable table-lastorder">
        <tbody>
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['orders']->value, 'order');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['order']->value) {
?>
            <?php $_smarty_tpl->_assignInScope('status', $_smarty_tpl->tpl_vars['order']->value->getStatus());
?>
            <tr onclick="window.open('<?php echo smarty_function_adminUrl(array('mod_controller'=>"shop-orderctrl",'do'=>"edit",'id'=>$_smarty_tpl->tpl_vars['order']->value['id']),$_smarty_tpl);?>
', '_blank')" class="clickable">
                <td class="number f-14">
                    <div class="title">
                        <span style="background:<?php echo $_smarty_tpl->tpl_vars['status']->value->bgcolor;?>
" title="<?php echo $_smarty_tpl->tpl_vars['status']->value->title;?>
" class="w-point"></span>
                        <b><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array('num'=>$_smarty_tpl->tpl_vars['order']->value['order_num']));
$_block_repeat1=true;
echo smarty_block_t(array('num'=>$_smarty_tpl->tpl_vars['order']->value['order_num']), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Заказ №%num<?php $_block_repeat1=false;
echo smarty_block_t(array('num'=>$_smarty_tpl->tpl_vars['order']->value['order_num']), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</b>
                    </div>
                    <div class="price"><?php echo $_smarty_tpl->tpl_vars['order']->value->getTotalPrice();?>
</div>
                </td>
                <td class="w-date">
                    <?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['order']->value['dateof'],"%e %v %!Y");?>
<br>
                    <?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['order']->value['dateof'],"@time");?>

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
Нет ни одного заказа<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

    </div>
<?php }?>

<?php $_smarty_tpl->_subTemplateRender("rs:%SYSTEM%/admin/widget/paginator.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('paginatorClass'=>"with-top-line"), 0, false);
}
}
