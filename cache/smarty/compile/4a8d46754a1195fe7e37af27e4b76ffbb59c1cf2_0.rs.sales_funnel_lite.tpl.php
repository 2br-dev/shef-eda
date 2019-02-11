<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:42
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\statistic\view\blocks\sales_funnel_lite.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117be4418e4_00496794',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4a8d46754a1195fe7e37af27e4b76ffbb59c1cf2' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\statistic\\view\\blocks\\sales_funnel_lite.tpl',
      1 => 1549608234,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117be4418e4_00496794 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_urlmake')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.urlmake.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
?>
<div class="updatable stat-report" data-url="<?php echo smarty_function_urlmake(array(),$_smarty_tpl);?>
" data-update-block-id="<?php echo $_smarty_tpl->tpl_vars['block_id']->value;?>
" id="<?php echo $_smarty_tpl->tpl_vars['block_id']->value;?>
" data-update-replace="true">
    <?php echo $_smarty_tpl->tpl_vars['period_selector']->value->render();?>

    
    <?php if ($_smarty_tpl->tpl_vars['percents']->value) {?>
        <div class="plot stat-funnel m-b-10">
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['percents']->value, 'val', false, 'key');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['key']->value => $_smarty_tpl->tpl_vars['val']->value) {
?>
                <div class="stat-funnel__row">
                    <div class="stat-funnel__legend"><?php echo $_smarty_tpl->tpl_vars['titles']->value[$_smarty_tpl->tpl_vars['key']->value];?>
</div>
                    <div class="stat-funnel__funnel">
                        <div class="stat-funnel__bar" style="width: <?php echo $_smarty_tpl->tpl_vars['percents']->value[$_smarty_tpl->tpl_vars['key']->value];?>
%"></div>
                        <div class="stat-funnel__number"><?php echo $_smarty_tpl->tpl_vars['counts']->value[$_smarty_tpl->tpl_vars['key']->value];?>
</div>
                    </div>
                </div>
            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

        </div>
    <?php } else { ?>
        <div class="stat-nodata"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Нет ни одной записи за выбранный период<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</div>
    <?php }?>
</div><?php }
}
