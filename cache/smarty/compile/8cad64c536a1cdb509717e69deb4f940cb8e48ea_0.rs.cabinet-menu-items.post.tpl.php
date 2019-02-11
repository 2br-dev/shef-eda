<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\partnership\view\hooks\users-blocks-authblock\cabinet-menu-items.post.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b955ca08_00957429',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8cad64c536a1cdb509717e69deb4f940cb8e48ea' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\partnership\\view\\hooks\\users-blocks-authblock\\cabinet-menu-items.post.tpl',
      1 => 1549608222,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b955ca08_00957429 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_static_call')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.static_call.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
echo smarty_function_static_call(array('var'=>"is_partner",'callback'=>array('Partnership\Model\Api','isUserPartner'),'params'=>$_smarty_tpl->tpl_vars['current_user']->value['id']),$_smarty_tpl);?>

<?php if ($_smarty_tpl->tpl_vars['is_partner']->value) {?>
    <li><a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('partnership-front-profile');?>
"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
профиль партнера<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
<?php }?>                    <?php }
}
