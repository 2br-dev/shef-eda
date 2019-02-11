<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:41
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\catalog\view\widget\oneclick.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117bdd06b06_86525911',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b984ce4c7b90e40f5127684c6794c3f4f7f6a429' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\catalog\\view\\widget\\oneclick.tpl',
      1 => 1549608202,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%SYSTEM%/admin/widget/paginator.tpl' => 1,
  ),
),false)) {
function content_5c6117bdd06b06_86525911 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_modifier_dateformat')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\modifier.dateformat.php';
?>

<div class="widget-filters">
    <div class="dropdown">
        <a id="oneclick-switcher" data-toggle="dropdown" class="widget-dropdown-handle"><?php if ($_smarty_tpl->tpl_vars['filter']->value == 'new') {
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
новые<?php $_block_repeat1=false;
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
}?> <i class="zmdi zmdi-chevron-down"></i></a>
        <ul class="dropdown-menu" aria-labelledby="oneclick-switcher">
            <li<?php if ($_smarty_tpl->tpl_vars['filter']->value == 'new') {?> class="act"<?php }?>><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"catalog-widget-oneclick",'filter'=>"new"),$_smarty_tpl);?>
" class="call-update"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Новые<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
            <li<?php if ($_smarty_tpl->tpl_vars['filter']->value == 'viewed') {?> class="act"<?php }?>><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"catalog-widget-oneclick",'filter'=>"viewed"),$_smarty_tpl);?>
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
    <table class="wtable mrg overable">
        <tbody>
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value, 'item');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
?>
                <tr class="clickable crud-edit" data-crud-options='{ "updateThis": true }' data-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"catalog-oneclickctrl",'do'=>"edit",'id'=>$_smarty_tpl->tpl_vars['item']->value['id']),$_smarty_tpl);?>
">
                    <td class="f-14 p-b-15">
                        <span title="<?php echo $_smarty_tpl->tpl_vars['item']->value['__status']->textView();?>
" class="w-point<?php if ($_smarty_tpl->tpl_vars['item']->value['status'] == 'new') {?> bg-orange<?php } else { ?> bg-lime<?php }?>"></span> <b>№ <?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
</b>
                        <?php $_smarty_tpl->_assignInScope('data', $_smarty_tpl->tpl_vars['item']->value->tableDataUnserialized());
?>

                        <ul class="w-list">
                            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['data']->value, 'item_data');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item_data']->value) {
?>
                                <li><?php echo $_smarty_tpl->tpl_vars['item_data']->value['title'];?>
</li>
                            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                        </ul>
                        <div><b><?php echo $_smarty_tpl->tpl_vars['item']->value['user_fio'];?>
, <?php echo $_smarty_tpl->tpl_vars['item']->value['user_phone'];?>
</b></div>
                    </td>
                    <td class="w-date">
                        <?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['item']->value['dateof'],"@date");?>
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
Нет ни одной покупки в 1 клик<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

    </div>
<?php }
$_smarty_tpl->_subTemplateRender("rs:%SYSTEM%/admin/widget/paginator.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('paginatorClass'=>"with-top-line"), 0, false);
}
}
