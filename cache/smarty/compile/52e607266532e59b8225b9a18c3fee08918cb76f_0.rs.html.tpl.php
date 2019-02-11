<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:32
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\system\html.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b43beca4_26146817',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '52e607266532e59b8225b9a18c3fee08918cb76f' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\system\\html.tpl',
      1 => 1549608261,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b43beca4_26146817 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!DOCTYPE <?php echo $_smarty_tpl->tpl_vars['app']->value->getDoctype();?>
>
<html <?php echo $_smarty_tpl->tpl_vars['app']->value->getHtmlAttrLine();?>
 <?php if ($_smarty_tpl->tpl_vars['SITE']->value['language']) {?>lang="<?php echo $_smarty_tpl->tpl_vars['SITE']->value['language'];?>
"<?php }?>>
<head <?php echo $_smarty_tpl->tpl_vars['app']->value->getHeadAttributes(true);?>
>
<title><?php echo $_smarty_tpl->tpl_vars['app']->value->title->get();?>
</title>
<?php echo $_smarty_tpl->tpl_vars['app']->value->meta->get();?>

<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['app']->value->getCss(), 'css');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['css']->value) {
echo $_smarty_tpl->tpl_vars['css']->value['params']['before'];?>
<link <?php if ($_smarty_tpl->tpl_vars['css']->value['params']['type'] !== false) {?>type="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['css']->value['params']['type'])===null||$tmp==='' ? "text/css" : $tmp);?>
"<?php }?> href="<?php echo $_smarty_tpl->tpl_vars['css']->value['file'];?>
" <?php if ($_smarty_tpl->tpl_vars['css']->value['params']['media'] !== false) {?>media="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['css']->value['params']['media'])===null||$tmp==='' ? "all" : $tmp);?>
"<?php }?> rel="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['css']->value['params']['rel'])===null||$tmp==='' ? "stylesheet" : $tmp);?>
"><?php echo $_smarty_tpl->tpl_vars['css']->value['params']['after'];?>

<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

<?php echo '<script'; ?>
>
    var global = <?php echo $_smarty_tpl->tpl_vars['app']->value->getJsonJsVars();?>
;
<?php echo '</script'; ?>
>
<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['app']->value->getJs(), 'js');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['js']->value) {
echo $_smarty_tpl->tpl_vars['js']->value['params']['before'];
echo '<script'; ?>
 <?php if ($_smarty_tpl->tpl_vars['js']->value['params']['type']) {?>type="<?php echo $_smarty_tpl->tpl_vars['js']->value['params']['type'];?>
"<?php }?> src="<?php echo $_smarty_tpl->tpl_vars['js']->value['file'];?>
"><?php echo '</script'; ?>
><?php echo $_smarty_tpl->tpl_vars['js']->value['params']['after'];?>

<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

<?php if ($_smarty_tpl->tpl_vars['app']->value->getJsCode() != '') {
echo '<script'; ?>
 language="JavaScript"><?php echo $_smarty_tpl->tpl_vars['app']->value->getJsCode();
echo '</script'; ?>
>
<?php }
echo $_smarty_tpl->tpl_vars['app']->value->getAnyHeadData();?>

</head>
<body <?php if ($_smarty_tpl->tpl_vars['app']->value->getBodyClass() != '') {?>class="<?php echo $_smarty_tpl->tpl_vars['app']->value->getBodyClass();?>
"<?php }?> <?php echo $_smarty_tpl->tpl_vars['app']->value->getBodyAttrLine();?>
>
    <?php echo $_smarty_tpl->tpl_vars['body']->value;?>

    
    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['app']->value->getJs('footer'), 'js');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['js']->value) {
?>
    <?php echo $_smarty_tpl->tpl_vars['js']->value['params']['before'];
echo '<script'; ?>
 <?php if ($_smarty_tpl->tpl_vars['js']->value['params']['type']) {?>type="<?php echo $_smarty_tpl->tpl_vars['js']->value['params']['type'];?>
"<?php }?> src="<?php echo $_smarty_tpl->tpl_vars['js']->value['file'];?>
" defer><?php echo '</script'; ?>
><?php echo $_smarty_tpl->tpl_vars['js']->value['params']['after'];?>

    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>
    
</body>
</html><?php }
}
