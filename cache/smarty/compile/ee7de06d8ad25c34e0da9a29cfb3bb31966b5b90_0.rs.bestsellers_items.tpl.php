<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:43
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\main\view\widget\bestsellers_items.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117bf863792_44674531',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ee7de06d8ad25c34e0da9a29cfb3bb31966b5b90' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\main\\view\\widget\\bestsellers_items.tpl',
      1 => 1549608218,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117bf863792_44674531 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if ($_smarty_tpl->tpl_vars['error']->value) {?>
    <div class="empty-widget">
        <?php echo $_smarty_tpl->tpl_vars['error']->value;?>

    </div>
<?php } elseif ($_smarty_tpl->tpl_vars['items']->value) {?>
    <div class="best-sellers owl-carousel owl-theme">
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['items']->value, 'item');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
?>
            <div class="best-sellers_item">
                <h2 class="best-sellers_title"><?php echo $_smarty_tpl->tpl_vars['item']->value['title'];?>
</h2>
                <div class="best-sellers_description">
                    <p><?php echo $_smarty_tpl->tpl_vars['item']->value['description'];?>
</p>
                </div>
                <div class="best-sellers_actions">
                    <a href="<?php echo $_smarty_tpl->tpl_vars['this_controller']->value->api->prepareLink($_smarty_tpl->tpl_vars['item']->value['link']);?>
" target="_blank" class="btn btn-default btn-alt best-sellers_action"><?php ob_start();
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
echo "Узнать больше";
$_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
$_prefixVariable1=ob_get_clean();
echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value['link_title'])===null||$tmp==='' ? $_prefixVariable1 : $tmp);?>
</a>
                </div>
            </div>
        <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

    </div>
<?php } else { ?>
    <div class="empty-widget">
        <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Нет предложений<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

    </div>
<?php }
}
}
