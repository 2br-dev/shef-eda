<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\block_stub.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b93d7582_43826731',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '91f9e6302866f46d7ee8379091ea4f5c608d5ba5' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\block_stub.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b93d7582_43826731 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_assignInScope('can_edit', $_smarty_tpl->tpl_vars['current_user']->value->isAdmin() && $_smarty_tpl->tpl_vars['do']->value);
?>
<div class="block-wizard <?php echo $_smarty_tpl->tpl_vars['class']->value;
if ($_smarty_tpl->tpl_vars['can_edit']->value) {?> can-edit<?php }?>">
    <div class="block-wizard__wrapper">
        <div class="block-wizard__title">
            <i class="pe-7s-plugin pe-2x pe-va"></i>
            <span class="pe-va"><?php echo $_smarty_tpl->tpl_vars['this_controller']->value->getInfo('title');?>
</span>
        </div>
        <?php if ($_smarty_tpl->tpl_vars['can_edit']->value) {?>
        <ol class="block-wizard__do">
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['do']->value, 'data', false, 'url');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['url']->value => $_smarty_tpl->tpl_vars['data']->value) {
?>
            <li>
                <?php if (is_array($_smarty_tpl->tpl_vars['data']->value)) {?>
                    <a <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['data']->value, 'val', false, 'k');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['k']->value => $_smarty_tpl->tpl_vars['val']->value) {
if ($_smarty_tpl->tpl_vars['k']->value != 'title') {
echo $_smarty_tpl->tpl_vars['k']->value;?>
="<?php echo $_smarty_tpl->tpl_vars['val']->value;?>
" <?php }
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>
><?php echo $_smarty_tpl->tpl_vars['data']->value['title'];?>
</a>
                <?php } else { ?>
                    <a href="<?php echo $_smarty_tpl->tpl_vars['url']->value;?>
" class="crud-add"><?php echo $_smarty_tpl->tpl_vars['data']->value;?>
</a>
                <?php }?>
            </li>
            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

        </ol>
        <?php }?>
    </div>
</div><?php }
}
