<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\system\gs\bootstrap\sections.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b91f3046_20659379',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5570cb06ea76b9412295bad16e1651c89a32023d' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\system\\gs\\bootstrap\\sections.tpl',
      1 => 1549608261,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%system%/gs/".((string)$_smarty_tpl->tpl_vars[\'layouts\']->value[\'grid_system\'])."/section.tpl' => 1,
  ),
),false)) {
function content_5c6117b91f3046_20659379 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['item']->value, 'level', false, NULL, 'sections', array (
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['level']->value) {
ob_start();
$_smarty_tpl->_subTemplateRender("rs:%system%/gs/".((string)$_smarty_tpl->tpl_vars['layouts']->value['grid_system'])."/section.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('level'=>$_smarty_tpl->tpl_vars['level']->value), 0, true);
$_smarty_tpl->assign('wrapped_content', ob_get_clean());
if ($_smarty_tpl->tpl_vars['level']->value['section']['outside_template']) {
$_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['level']->value['section']['outside_template'], $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('wrapped_content'=>$_smarty_tpl->tpl_vars['wrapped_content']->value), 0, true);
} else {
echo $_smarty_tpl->tpl_vars['wrapped_content']->value;
}
if ($_smarty_tpl->tpl_vars['level']->value['section']['is_clearfix_after']) {?><div class="clearfix <?php echo $_smarty_tpl->tpl_vars['level']->value['section']['clearfix_after_css'];?>
"></div><?php }
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
}
}
