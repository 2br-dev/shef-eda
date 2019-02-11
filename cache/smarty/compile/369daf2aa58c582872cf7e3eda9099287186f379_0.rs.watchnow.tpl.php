<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:41
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\catalog\view\widget\watchnow.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117bdd84876_40359467',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '369daf2aa58c582872cf7e3eda9099287186f379' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\catalog\\view\\widget\\watchnow.tpl',
      1 => 1549608202,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117bdd84876_40359467 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
echo smarty_function_addcss(array('file'=>((string)$_smarty_tpl->tpl_vars['mod_css']->value)."watchnow.css",'basepath'=>"root"),$_smarty_tpl);?>


<div class="last-watch">
    <?php $_smarty_tpl->_assignInScope('item', $_smarty_tpl->tpl_vars['list']->value[0]);
?>
    <?php if ($_smarty_tpl->tpl_vars['total']->value) {?>
        <?php if ($_smarty_tpl->tpl_vars['offset']->value > 0) {?><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"catalog-widget-watchnow",'offset'=>$_smarty_tpl->tpl_vars['offset']->value-1),$_smarty_tpl);?>
" class="prev call-update"><i class="zmdi zmdi-chevron-left"></i></a><?php }?>
        <?php if ($_smarty_tpl->tpl_vars['offset']->value+1 < $_smarty_tpl->tpl_vars['total']->value) {?><a data-update-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"catalog-widget-watchnow",'offset'=>$_smarty_tpl->tpl_vars['offset']->value+1),$_smarty_tpl);?>
" class="next call-update"><i class="zmdi zmdi-chevron-right"></i></a><?php }?>
        <p class="text-center">
            <a class="login" <?php if ($_smarty_tpl->tpl_vars['item']->value['user']['href']) {?>href="<?php echo $_smarty_tpl->tpl_vars['item']->value['user']['href'];?>
"<?php }?>><?php echo $_smarty_tpl->tpl_vars['item']->value['user']['name'];?>
</a><br>
            <span class="time"><?php echo $_smarty_tpl->tpl_vars['item']->value['eventDate'];?>
</span>
        </p>
        <div class="picture">
            <a href="<?php echo $_smarty_tpl->tpl_vars['item']->value['editUrl'];?>
">
                <img src="<?php echo $_smarty_tpl->tpl_vars['item']->value['product']->getMainImage(160,150,'xy');?>
" class="p-photo">
            </a>
        </div>    
        <div class="description">
            <a href="<?php echo $_smarty_tpl->tpl_vars['item']->value['editUrl'];?>
" class="title"><?php echo $_smarty_tpl->tpl_vars['item']->value['product']['title'];?>
</a><br>
            <span class="path"><a href="<?php echo $_smarty_tpl->tpl_vars['item']->value['path']['href'];?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['path']['line'];?>
</a></span><br>
        </div>
    <?php } else { ?>
        <div class="empty">
            <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Ни один товар не был просмотрен<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

        </div>
    <?php }?>
</div><?php }
}
