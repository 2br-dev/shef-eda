<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\helpers\tpl\footer\developers.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9c0cb58_45832068',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3184842f6ce93692c0acbbc71b406c3852a98d49' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\helpers\\tpl\\footer\\developers.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b9c0cb58_45832068 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
?>

<div class="developers"><a href="https://readyscript.ru" target="_blank"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array('alias'=>"работает на Readyscript"));
$_block_repeat1=true;
echo smarty_block_t(array('alias'=>"работает на Readyscript"), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Работает на &nbsp;<b>Ready Script</b><?php $_block_repeat1=false;
echo smarty_block_t(array('alias'=>"работает на Readyscript"), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></div><?php }
}
