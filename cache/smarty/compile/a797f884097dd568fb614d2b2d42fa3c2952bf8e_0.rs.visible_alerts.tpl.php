<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:32
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\main\view\adminblocks\rsvisiblealerts\visible_alerts.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b4364e75_76249308',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a797f884097dd568fb614d2b2d42fa3c2952bf8e' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\main\\view\\adminblocks\\rsvisiblealerts\\visible_alerts.tpl',
      1 => 1549608217,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b4364e75_76249308 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if ($_smarty_tpl->tpl_vars['visible_alerts']->value->canShow()) {?>
<div class="alert alert-warning viewport m-b-20 c-black visible-alerts-block">
    <a class="pull-right close" style="line-height:100%" data-cookie-name="<?php echo $_smarty_tpl->tpl_vars['cookie_param_name']->value;?>
" data-cookie-value="<?php echo $_smarty_tpl->tpl_vars['messages_hash']->value;?>
_<?php echo $_smarty_tpl->tpl_vars['timestamp']->value;?>
" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
<nobr>Скрыть на 14 дней</nobr><?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
">&times;</a>

    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['visible_alerts']->value->getMessages(), 'message_data');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['message_data']->value) {
?>
        <?php echo $_smarty_tpl->tpl_vars['message_data']->value['message'];?>

        <?php if ($_smarty_tpl->tpl_vars['message_data']->value['href']) {?>
            <a class="u-link" href="<?php echo $_smarty_tpl->tpl_vars['message_data']->value['href'];?>
" <?php if ($_smarty_tpl->tpl_vars['message_data']->value['target']) {?>target="<?php echo $_smarty_tpl->tpl_vars['message_data']->value['target'];?>
"<?php }?>><?php echo $_smarty_tpl->tpl_vars['message_data']->value['link_title'];?>
</a>
        <?php }?><br>
    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

</div>
<?php }
}
}
