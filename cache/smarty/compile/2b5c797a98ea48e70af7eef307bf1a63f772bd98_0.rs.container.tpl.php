<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\system\gs\container.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b91ce181_23365162',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '2b5c797a98ea48e70af7eef307bf1a63f772bd98' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\system\\gs\\container.tpl',
      1 => 1549608261,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%system%/gs/".((string)$_smarty_tpl->tpl_vars[\'layouts\']->value[\'grid_system\'])."/sections.tpl' => 1,
  ),
),false)) {
function content_5c6117b91ce181_23365162 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php if ($_smarty_tpl->tpl_vars['layouts']->value['grid_system'] == 'gs960') {
$_smarty_tpl->_assignInScope('container_grid_class', "container_".((string)$_smarty_tpl->tpl_vars['container']->value['columns']));
} elseif ($_smarty_tpl->tpl_vars['layouts']->value['grid_system'] == 'bootstrap' || $_smarty_tpl->tpl_vars['layouts']->value['grid_system'] == 'bootstrap4') {
ob_start();
if ($_smarty_tpl->tpl_vars['container']->value['is_fluid']) {
echo "-fluid";
}
$_prefixVariable1=ob_get_clean();
$_smarty_tpl->_assignInScope('container_grid_class', "container".$_prefixVariable1);
}
if ($_smarty_tpl->tpl_vars['container']->value['wrap_element']) {?><<?php echo $_smarty_tpl->tpl_vars['container']->value['wrap_element'];?>
 class="<?php echo $_smarty_tpl->tpl_vars['container']->value['wrap_css_class'];?>
"><?php }?><div class="<?php echo $_smarty_tpl->tpl_vars['container_grid_class']->value;?>
 <?php echo $_smarty_tpl->tpl_vars['container']->value['css_class'];?>
"><?php if ($_smarty_tpl->tpl_vars['layouts']->value['sections'][$_smarty_tpl->tpl_vars['container']->value['id']]) {
ob_start();
$_smarty_tpl->_subTemplateRender("rs:%system%/gs/".((string)$_smarty_tpl->tpl_vars['layouts']->value['grid_system'])."/sections.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('item'=>$_smarty_tpl->tpl_vars['layouts']->value['sections'][$_smarty_tpl->tpl_vars['container']->value['id']]), 0, true);
$_smarty_tpl->assign('wrapped_content', ob_get_clean());
} else {
$_smarty_tpl->_assignInScope('wrapped_content', '');
}
if ($_smarty_tpl->tpl_vars['container']->value['inside_template']) {
$_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['container']->value['inside_template'], $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('wrapped_content'=>$_smarty_tpl->tpl_vars['wrapped_content']->value), 0, true);
} else {
echo $_smarty_tpl->tpl_vars['wrapped_content']->value;
}?></div><?php if ($_smarty_tpl->tpl_vars['container']->value['wrap_element']) {?></<?php echo $_smarty_tpl->tpl_vars['container']->value['wrap_element'];?>
><?php }
}
}
