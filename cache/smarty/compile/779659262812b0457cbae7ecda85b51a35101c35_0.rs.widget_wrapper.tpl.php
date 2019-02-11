<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:41
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\main\view\widget_wrapper.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117bdca1733_40983093',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '779659262812b0457cbae7ecda85b51a35101c35' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\main\\view\\widget_wrapper.tpl',
      1 => 1549608218,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117bdca1733_40983093 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_modifier_replace')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\plugins\\modifier.replace.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
?>
<div class="widget" wid="<?php echo $_smarty_tpl->tpl_vars['widget']->value['id'];?>
" wclass="<?php echo $_smarty_tpl->tpl_vars['widget']->value['class'];?>
" data-positions='<?php echo $_smarty_tpl->tpl_vars['widget']->value['item']->getPositionsJson();?>
'>
<?php echo $_smarty_tpl->tpl_vars['app']->value->autoloadScripsAjaxBefore();?>

    <div class="widget-border">
        <div class="widget-head">
            <div class="widget-title"><?php echo $_smarty_tpl->tpl_vars['widget']->value['title'];?>
</div>
            <div class="widget-tools">
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['widget']->value['self']->getTools(), 'tool');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['tool']->value) {
?>
                    <a <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['tool']->value, 'value', false, 'key');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['key']->value => $_smarty_tpl->tpl_vars['value']->value) {
if ($_smarty_tpl->tpl_vars['key']->value[0] == '~') {?> <?php echo smarty_modifier_replace($_smarty_tpl->tpl_vars['key']->value,"~",'');?>
='<?php echo $_smarty_tpl->tpl_vars['value']->value;?>
'<?php } else { ?> <?php echo $_smarty_tpl->tpl_vars['key']->value;?>
="<?php echo $_smarty_tpl->tpl_vars['value']->value;?>
"<?php }
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>
></a>
                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                <a class="widget-close zmdi zmdi-close" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Скрыть виджет<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></a>
            </div>
        </div>  
        <div class="widget-content updatable" data-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>$_smarty_tpl->tpl_vars['widget']->value['class'],'do'=>false),$_smarty_tpl);?>
" data-update-block-id="<?php echo $_smarty_tpl->tpl_vars['widget']->value['class'];?>
">
            <?php echo $_smarty_tpl->tpl_vars['widget']->value['inside_html'];?>

        </div>
    </div>
<?php echo $_smarty_tpl->tpl_vars['app']->value->autoloadScripsAjaxAfter();?>
    
</div><?php }
}
