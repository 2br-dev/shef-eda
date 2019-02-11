<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:42
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\users\view\widget\authlog.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117be48eaa5_64511152',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8ff82f618bcaaa13a3e4a82ab8cb23b4a3738508' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\users\\view\\widget\\authlog.tpl',
      1 => 1549608243,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%SYSTEM%/admin/widget/paginator.tpl' => 1,
  ),
),false)) {
function content_5c6117be48eaa5_64511152 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_modifier_date_format')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\plugins\\modifier.date_format.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
?>
<div class="widget-ph">
    <table class="wtable">
        <thead>
            <tr>
                <th><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Дата<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</th>
                <th><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Логин/Имя<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</th>
                <th><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
IP<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</th>
            </tr>
        </thead>
        <tbody>
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value, 'event');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['event']->value) {
?>
            <tr>
            <?php $_smarty_tpl->_assignInScope('user', $_smarty_tpl->tpl_vars['event']->value->getObject());
?>
                <td class="f-11">
                    <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['event']->value->getEventDate(),"%d.%m.%Y");?>
<br>
                    <span style="color:#ACACAC"><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['event']->value->getEventDate(),"%H:%M");?>
</span>
                </td>
                <td class="f-10">
                    <a class="link-ul m-r-10" href="<?php echo smarty_function_adminUrl(array('mod_controller'=>"users-ctrl",'do'=>"edit",'id'=>$_smarty_tpl->tpl_vars['user']->value['id']),$_smarty_tpl);?>
"><?php echo $_smarty_tpl->tpl_vars['user']->value['login'];?>
</a>
                    <span><?php echo $_smarty_tpl->tpl_vars['user']->value['name'];?>
 <?php echo $_smarty_tpl->tpl_vars['user']->value['surname'];?>
</span>
                </td>
                <td><?php echo $_smarty_tpl->tpl_vars['event']->value->getIP();?>
</td>
            </tr>
        <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

        </tbody>
    </table>
</div>

<?php $_smarty_tpl->_subTemplateRender("rs:%SYSTEM%/admin/widget/paginator.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('paginatorClass'=>"with-top-line"), 0, false);
}
}
