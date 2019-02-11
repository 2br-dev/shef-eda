<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\support\hooks\users-blocks-authblock\cabinet-menu-items.post.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b957fff6_09896879',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f1be143207dfec171cad1e05f523081e7300b420' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\support\\hooks\\users-blocks-authblock\\cabinet-menu-items.post.tpl',
      1 => 1549608256,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b957fff6_09896879 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_modulegetvars')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.modulegetvars.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
?>

<?php $_smarty_tpl->_assignInScope('route_id', $_smarty_tpl->tpl_vars['router']->value->getCurrentRoute()->getId());
echo smarty_function_modulegetvars(array('name'=>"\Support\Controller\Block\NewMessages",'var'=>"data"),$_smarty_tpl);?>

<li><a class="<?php if ($_smarty_tpl->tpl_vars['route_id']->value == 'support-front-support') {?>active<?php }?>" href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('support-front-support');?>
"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Сообщения<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
 <span class="supportCountMessages">(<?php echo $_smarty_tpl->tpl_vars['data']->value['new_count'];?>
)</span></a></li><?php }
}
