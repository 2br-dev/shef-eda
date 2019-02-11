<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\system\gs_maker.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9193e37_62420014',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '28cc91077b9381681f19d920b2816a1995c59db9' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\system\\gs_maker.tpl',
      1 => 1549608261,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%system%/gs/container.tpl' => 1,
  ),
),false)) {
function content_5c6117b9193e37_62420014 (Smarty_Internal_Template $_smarty_tpl) {
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['layouts']->value['containers'], 'container');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['container']->value) {
ob_start();
$_smarty_tpl->_subTemplateRender("rs:%system%/gs/container.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('container'=>$_smarty_tpl->tpl_vars['container']->value), 0, true);
$_smarty_tpl->assign('wrapped_content', ob_get_clean());
if ($_smarty_tpl->tpl_vars['container']->value['outside_template']) {
$_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['container']->value['outside_template'], $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('wrapped_content'=>$_smarty_tpl->tpl_vars['wrapped_content']->value), 0, true);
} else {
echo $_smarty_tpl->tpl_vars['wrapped_content']->value;
}
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
}
}
