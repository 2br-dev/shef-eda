<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:41
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\comments\view\widget\newlist.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117bddea6f6_04051462',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8cef6985f45c86a887da82a262adac3726157a33' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\comments\\view\\widget\\newlist.tpl',
      1 => 1549608203,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%SYSTEM%/admin/widget/paginator.tpl' => 1,
  ),
),false)) {
function content_5c6117bddea6f6_04051462 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_modifier_dateformat')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\modifier.dateformat.php';
if (!is_callable('smarty_modifier_teaser')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\modifier.teaser.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
$_smarty_tpl->_assignInScope('config', \RS\Config\Loader::byModule('comment'));
if ($_smarty_tpl->tpl_vars['list']->value) {?>
    <table class="wtable mrg overable">
        <tbody>
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value, 'item');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
?>
                <?php $_smarty_tpl->_assignInScope('item_time', strtotime($_smarty_tpl->tpl_vars['item']->value['dateof']));
?>
                <?php $_smarty_tpl->_assignInScope('type', $_smarty_tpl->tpl_vars['item']->value->getTypeObject());
?>

                <tr class="clickable crud-edit <?php if ((!$_smarty_tpl->tpl_vars['config']->value['need_moderate'] && ($_smarty_tpl->tpl_vars['item_time']->value < $_smarty_tpl->tpl_vars['time']->value && $_smarty_tpl->tpl_vars['item_time']->value > $_smarty_tpl->tpl_vars['day_before_time_int']->value) && !$_smarty_tpl->tpl_vars['item']->value['moderated']) || ($_smarty_tpl->tpl_vars['config']->value['need_moderate'] && !$_smarty_tpl->tpl_vars['item']->value['moderated'])) {?>highlight<?php }?>" data-crud-options='{ "updateThis": true }' data-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"comments-ctrl",'do'=>"edit",'id'=>$_smarty_tpl->tpl_vars['item']->value['id']),$_smarty_tpl);?>
">
                    <td>
                        <div class="m-b-5 f-11 c-black"><?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['item']->value['dateof'],"%datetime");?>
</div>
                        <p class="m-b-5"><?php echo smarty_modifier_teaser($_smarty_tpl->tpl_vars['item']->value['message'],"250");?>
</p>
                        <?php if ($_smarty_tpl->tpl_vars['type']->value) {?>
                            <?php $_smarty_tpl->_assignInScope('admin_object_url', $_smarty_tpl->tpl_vars['type']->value->getAdminUrl());
?>
                            <p><a class="link-ul" <?php if ($_smarty_tpl->tpl_vars['admin_object_url']->value) {?>href="<?php echo $_smarty_tpl->tpl_vars['admin_object_url']->value;?>
" onclick="event.stopPropagation(); return;"<?php }?>><?php echo $_smarty_tpl->tpl_vars['type']->value->getLinkedObjectTitle();?>
</a></p>
                        <?php }?>
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
Нет комментариев<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

    </div>
<?php }?>

<?php $_smarty_tpl->_subTemplateRender("rs:%SYSTEM%/admin/widget/paginator.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('paginatorClass'=>"with-top-line"), 0, false);
}
}
