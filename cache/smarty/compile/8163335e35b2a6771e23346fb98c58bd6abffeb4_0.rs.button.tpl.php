<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:32
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\system\admin\html_elements\toolbar\button\button.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b4178511_84467205',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8163335e35b2a6771e23346fb98c58bd6abffeb4' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\system\\admin\\html_elements\\toolbar\\button\\button.tpl',
      1 => 1549608261,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b4178511_84467205 (Smarty_Internal_Template $_smarty_tpl) {
?>
<a <?php if ($_smarty_tpl->tpl_vars['button']->value->getHref() != '') {?>href="<?php echo $_smarty_tpl->tpl_vars['button']->value->getHref();?>
"<?php }?> <?php echo $_smarty_tpl->tpl_vars['button']->value->getAttrLine();?>
><?php echo $_smarty_tpl->tpl_vars['button']->value->getTitle();?>
</a><?php }
}
