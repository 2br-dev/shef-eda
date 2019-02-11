<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\system\gs\blocks.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9272113_81260588',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '70d22aecae6df51f0b0c8a2b76e1838a9aaf6047' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\system\\gs\\blocks.tpl',
      1 => 1549608261,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b9272113_81260588 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_moduleinsert')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.moduleinsert.php';
?>

<?php if ($_smarty_tpl->tpl_vars['layouts']->value['blocks'][$_smarty_tpl->tpl_vars['level']->value['section']['id']]) {?>
    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['layouts']->value['blocks'][$_smarty_tpl->tpl_vars['level']->value['section']['id']], 'block');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['block']->value) {
?>
    <?php if ($_smarty_tpl->tpl_vars['level']->value['section']['inset_align'] != 'wide') {?>
    <div class="gridblock<?php if ($_smarty_tpl->tpl_vars['level']->value['section']['inset_align'] == 'left') {?> alignleft<?php }
if ($_smarty_tpl->tpl_vars['level']->value['section']['inset_align'] == 'right') {?> alignright<?php }?>">
    <?php }?>
        <?php echo smarty_function_moduleinsert(array('name'=>$_smarty_tpl->tpl_vars['block']->value['module_controller'],'_params_array'=>$_smarty_tpl->tpl_vars['block']->value->getParams()),$_smarty_tpl,'C:\OpenServer\domains\READYSCRIPTTEST\templates\system\gs\blocks.tpl');?>

    <?php if ($_smarty_tpl->tpl_vars['level']->value['section']['inset_align'] != 'wide') {?>
    </div>
    <?php }?>
    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

<?php }
}
}
