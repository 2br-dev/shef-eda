<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:42
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\notes\view\widget\notes.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117be062fd9_11393146',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '49f755fb90e97cd29eb33a8fc5250edceeefbff0' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\notes\\view\\widget\\notes.tpl',
      1 => 1549608221,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%SYSTEM%/admin/widget/paginator.tpl' => 1,
  ),
),false)) {
function content_5c6117be062fd9_11393146 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_modifier_dateformat')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\modifier.dateformat.php';
?>
<div class="widget-filters">
    <div class="dropdown">
        <?php $_smarty_tpl->_assignInScope('value', $_smarty_tpl->tpl_vars['notes_filter_creator']->value);
?>
        <a id="notes-switcher" data-toggle="dropdown" class="widget-dropdown-handle">
            <?php if ($_smarty_tpl->tpl_vars['value']->value == 'my') {
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Только мои<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

            <?php } else {
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

        <ul class="dropdown-menu" aria-labelledby="notes-switcher">
            <li<?php if ($_smarty_tpl->tpl_vars['value']->value == 'my') {?> class="act"<?php }?>><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"notes-widget-notes",'notes_filter_creator'=>"my"),$_smarty_tpl);?>
" class="call-update"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Только мои<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
            <li<?php if ($_smarty_tpl->tpl_vars['value']->value == 'all') {?> class="act"<?php }?>><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"notes-widget-notes",'notes_filter_creator'=>"all"),$_smarty_tpl);?>
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

    <div class="dropdown">
        <?php $_smarty_tpl->_assignInScope('value', $_smarty_tpl->tpl_vars['notes_filter_status']->value);
?>
        <a id="notes-switcher" data-toggle="dropdown" class="widget-dropdown-handle"><?php if ($_smarty_tpl->tpl_vars['value']->value == 'closed') {
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
завершенные<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
} elseif ($_smarty_tpl->tpl_vars['value']->value == 'unclosed') {
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
любой статус<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
}?> <i class="zmdi zmdi-chevron-down"></i></a>
        <ul class="dropdown-menu" aria-labelledby="notes-switcher">
            <li<?php if ($_smarty_tpl->tpl_vars['value']->value == 'all') {?> class="act"<?php }?>><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"notes-widget-notes",'notes_filter_status'=>"all"),$_smarty_tpl);?>
" class="call-update"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
все<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
            <li<?php if ($_smarty_tpl->tpl_vars['value']->value == 'closed') {?> class="act"<?php }?>><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"notes-widget-notes",'notes_filter_status'=>"closed"),$_smarty_tpl);?>
" class="call-update"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
завершенные<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
            <li<?php if ($_smarty_tpl->tpl_vars['value']->value == 'unclosed') {?> class="act"<?php }?>><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"notes-widget-notes",'notes_filter_status'=>"unclosed"),$_smarty_tpl);?>
" class="call-update"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
незавершенные<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
        </ul>
    </div>

    <div class="dropdown">
        <?php $_smarty_tpl->_assignInScope('value', $_smarty_tpl->tpl_vars['notes_sort']->value);
?>
        <a id="notes-switcher" data-toggle="dropdown" class="widget-dropdown-handle"><?php if ($_smarty_tpl->tpl_vars['notes_sort']->value == 'update') {
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
по дате обновления<?php $_block_repeat1=false;
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
по дате создания<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
}?> <i class="zmdi zmdi-chevron-down"></i></a>
        <ul class="dropdown-menu" aria-labelledby="notes-switcher">
            <li<?php if ($_smarty_tpl->tpl_vars['value']->value == 'update') {?> class="act"<?php }?>><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"notes-widget-notes",'notes_sort'=>"update"),$_smarty_tpl);?>
" class="call-update"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
по дате обновления<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
            <li<?php if ($_smarty_tpl->tpl_vars['value']->value == 'create') {?> class="act"<?php }?>><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"notes-widget-notes",'notes_sort'=>"create"),$_smarty_tpl);?>
" class="call-update"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
по дате создания<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
        </ul>
    </div>
</div>

<?php if (count($_smarty_tpl->tpl_vars['notes']->value)) {?>
    <table class="wtable mrg overable table-lastorder">
        <tbody>
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['notes']->value, 'note');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['note']->value) {
?>
            <tr data-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"notes-notectrl",'do'=>"edit",'id'=>$_smarty_tpl->tpl_vars['note']->value['id'],'context'=>"widget"),$_smarty_tpl);?>
" data-crud-options='{ "updateThis": true }' class="clickable crud-edit">
                <td width="20">
                    <span title="<?php echo $_smarty_tpl->tpl_vars['note']->value['__status']->textView();?>
" class="f-21 zmdi
                    <?php if ($_smarty_tpl->tpl_vars['note']->value['status'] == "open") {?>zmdi-circle-o c-red<?php } elseif ($_smarty_tpl->tpl_vars['note']->value['status'] == "inwork") {?>zmdi-time c-amber<?php } else { ?>zmdi-check-all c-green<?php }?>"></span>
                </td>
                <td class="f-14">
                    <?php if ($_smarty_tpl->tpl_vars['note']->value['is_private']) {?><i class="zmdi zmdi-shield-security m-r-5" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Видна только мне<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></i><?php }?> <b><?php echo $_smarty_tpl->tpl_vars['note']->value['title'];?>
</b>
                    <?php if ($_smarty_tpl->tpl_vars['notes_filter_creator']->value == 'all') {?>
                    <br><small><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Автор<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
: <?php echo $_smarty_tpl->tpl_vars['note']->value->getCreatorUser()->getFio();?>
</small>
                    <?php }?>
                </td>
                <td class="w-date text-nowrap">
                    <?php if ($_smarty_tpl->tpl_vars['notes_sort']->value == 'update') {?>
                        <span title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Обновлено<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"><?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['note']->value['date_of_update'],"%e %v %!Y");?>
<br>
                        <?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['note']->value['date_of_update'],"@time");?>
</span>
                    <?php } else { ?>
                        <span title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Создано<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"><?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['note']->value['date_of_create'],"%e %v %!Y");?>
<br>
                            <?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['note']->value['date_of_create'],"@time");?>
</span>
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
Нет ни одной заметки<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

    </div>
<?php }?>

<?php $_smarty_tpl->_subTemplateRender("rs:%SYSTEM%/admin/widget/paginator.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('paginatorClass'=>"with-top-line"), 0, false);
}
}
