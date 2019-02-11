<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\helpers\tpl\footer\phones.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9b75213_14020939',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '89d20b0c38875d9ab91f4d4115a5b8b4e74413db' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\helpers\\tpl\\footer\\phones.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b9b75213_14020939 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_modifier_replace')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\plugins\\modifier.replace.php';
?>

<div class="column">
    <div class="column_title"><span><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
ТЕЛЕФОНЫ<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span></div>
    <div class="column_text">
        <div class="column_contact">
            <?php if ($_smarty_tpl->tpl_vars['THEME_SETTINGS']->value['phone_number1']) {?>
                <a href="tel:<?php echo smarty_modifier_replace($_smarty_tpl->tpl_vars['THEME_SETTINGS']->value['phone_number1'],array('-','(',')'),'');?>
"><?php echo $_smarty_tpl->tpl_vars['THEME_SETTINGS']->value['phone_number1'];?>
</a>
                <small><?php echo $_smarty_tpl->tpl_vars['THEME_SETTINGS']->value['phone_description1'];?>
</small>
            <?php }?>

            <?php if ($_smarty_tpl->tpl_vars['THEME_SETTINGS']->value['phone_number2']) {?>
                <a href="tel:<?php echo smarty_modifier_replace($_smarty_tpl->tpl_vars['THEME_SETTINGS']->value['phone_number2'],array('-','(',')'),'');?>
"><?php echo $_smarty_tpl->tpl_vars['THEME_SETTINGS']->value['phone_number2'];?>
</a>
                <small><?php echo $_smarty_tpl->tpl_vars['THEME_SETTINGS']->value['phone_description2'];?>
</small>
            <?php }?>
        </div>
    </div>
</div><?php }
}
