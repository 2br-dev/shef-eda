<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\helpers\tpl\footer\social.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9bb20d4_42271697',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '091162796b82261a237a8f1edc153538404e7f2d' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\helpers\\tpl\\footer\\social.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b9bb20d4_42271697 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
?>

<?php if ($_smarty_tpl->tpl_vars['CONFIG']->value['facebook_group'] || $_smarty_tpl->tpl_vars['CONFIG']->value['vkontakte_group'] || $_smarty_tpl->tpl_vars['CONFIG']->value['twitter_group'] || $_smarty_tpl->tpl_vars['CONFIG']->value['instagram_group'] || $_smarty_tpl->tpl_vars['CONFIG']->value['youtube_group']) {?>
<div class="column">
    <div class="column_title">
        <span><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
МЫ В СОЦСЕТЯХ<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
        </div>
        <div class="footer-social_wrapper">
            <div class="block-social">
                <?php if ($_smarty_tpl->tpl_vars['CONFIG']->value['facebook_group']) {?>
                    <a href="<?php echo $_smarty_tpl->tpl_vars['CONFIG']->value['facebook_group'];?>
" class="facebook"></a>
                <?php }?>
                <?php if ($_smarty_tpl->tpl_vars['CONFIG']->value['vkontakte_group']) {?>
                    <a href="<?php echo $_smarty_tpl->tpl_vars['CONFIG']->value['vkontakte_group'];?>
" class="vk"></a>
                <?php }?>
                <?php if ($_smarty_tpl->tpl_vars['CONFIG']->value['twitter_group']) {?>
                    <a href="<?php echo $_smarty_tpl->tpl_vars['CONFIG']->value['twitter_group'];?>
" class="twitter"></a>
                <?php }?>
                <?php if ($_smarty_tpl->tpl_vars['CONFIG']->value['instagram_group']) {?>
                    <a href="<?php echo $_smarty_tpl->tpl_vars['CONFIG']->value['instagram_group'];?>
" class="instagram"></a>
                <?php }?>
                <?php if ($_smarty_tpl->tpl_vars['CONFIG']->value['youtube_group']) {?>
                    <a href="<?php echo $_smarty_tpl->tpl_vars['CONFIG']->value['youtube_group'];?>
" class="youtube"></a>
                <?php }?>
            </div>
        </div>
        <!-- footer-social_wrapper-->
    </div>

<?php }
}
}
