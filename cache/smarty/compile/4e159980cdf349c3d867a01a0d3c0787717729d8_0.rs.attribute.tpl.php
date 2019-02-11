<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\system\gs\bootstrap\attribute.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9243594_50322036',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4e159980cdf349c3d867a01a0d3c0787717729d8' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\system\\gs\\bootstrap\\attribute.tpl',
      1 => 1549608261,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b9243594_50322036 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['level']->value['section'][((string)$_smarty_tpl->tpl_vars['field']->value)."_xs"] != '') {?> col-xs-<?php echo $_smarty_tpl->tpl_vars['name']->value;
echo $_smarty_tpl->tpl_vars['level']->value['section'][((string)$_smarty_tpl->tpl_vars['field']->value)."_xs"];
}
if ($_smarty_tpl->tpl_vars['level']->value['section'][((string)$_smarty_tpl->tpl_vars['field']->value)."_sm"] != '') {?> col-sm-<?php echo $_smarty_tpl->tpl_vars['name']->value;
echo $_smarty_tpl->tpl_vars['level']->value['section'][((string)$_smarty_tpl->tpl_vars['field']->value)."_sm"];
}
if ($_smarty_tpl->tpl_vars['level']->value['section'][((string)$_smarty_tpl->tpl_vars['field']->value)] != '') {?> col-md-<?php echo $_smarty_tpl->tpl_vars['name']->value;
echo $_smarty_tpl->tpl_vars['level']->value['section'][((string)$_smarty_tpl->tpl_vars['field']->value)];
}
if ($_smarty_tpl->tpl_vars['level']->value['section'][((string)$_smarty_tpl->tpl_vars['field']->value)."_lg"] != '') {?> col-lg-<?php echo $_smarty_tpl->tpl_vars['name']->value;
echo $_smarty_tpl->tpl_vars['level']->value['section'][((string)$_smarty_tpl->tpl_vars['field']->value)."_lg"];
}
}
}
