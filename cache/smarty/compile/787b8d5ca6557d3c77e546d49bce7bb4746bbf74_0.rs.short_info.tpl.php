<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\affiliate\blocks\shortinfo\short_info.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9357976_39843805',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '787b8d5ca6557d3c77e546d49bce7bb4746bbf74' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\affiliate\\blocks\\shortinfo\\short_info.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b9357976_39843805 (Smarty_Internal_Template $_smarty_tpl) {
?>


<?php if ($_smarty_tpl->tpl_vars['current_affiliate']->value['short_contacts']) {?>
    <a href="tel:<?php echo $_smarty_tpl->tpl_vars['current_affiliate']->value['short_contacts'];?>
" class="header-top-city_phone"><?php echo nl2br($_smarty_tpl->tpl_vars['current_affiliate']->value['short_contacts']);?>
</a>
<?php }
}
}
