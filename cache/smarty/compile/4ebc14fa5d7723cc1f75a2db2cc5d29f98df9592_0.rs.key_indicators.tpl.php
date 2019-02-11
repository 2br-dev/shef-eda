<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:42
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\statistic\view\blocks\key_indicators.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117be3f5218_90982481',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4ebc14fa5d7723cc1f75a2db2cc5d29f98df9592' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\statistic\\view\\blocks\\key_indicators.tpl',
      1 => 1549608234,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117be3f5218_90982481 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_function_urlmake')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.urlmake.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_modifier_dateformat')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\modifier.dateformat.php';
if (!is_callable('smarty_modifier_format_price')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\modifier.format_price.php';
echo smarty_function_addjs(array('file'=>"flot/excanvas.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"flot/jquery.flot.min.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"flot/jquery.flot.resize.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"flot/jquery.flot.pie.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"%statistic%/jquery.flot.orderbars.js"),$_smarty_tpl);?>


<div class="updatable stat-report" data-url="<?php echo smarty_function_urlmake(array(),$_smarty_tpl);?>
" data-update-block-id="<?php echo $_smarty_tpl->tpl_vars['block_id']->value;?>
" id="<?php echo $_smarty_tpl->tpl_vars['block_id']->value;?>
" data-update-replace="true">

    <?php if (!$_smarty_tpl->tpl_vars['param']->value['widget']) {?>
        <div class="viewport">
            <h2 class="stat-h2"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Ключевые показатели<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</h2>

            <?php echo $_smarty_tpl->tpl_vars['period_selector']->value->render();?>


            <?php echo smarty_function_addjs(array('file'=>"%statistic%/diagram.js"),$_smarty_tpl);?>

            <div class="plot">
                <div class="graph"></div>
            </div>
            <?php echo '<script'; ?>
>
                $.allReady(function() {
                    statisticShowKeyIndicator("#<?php echo $_smarty_tpl->tpl_vars['block_id']->value;?>
 .graph", <?php echo $_smarty_tpl->tpl_vars['json_bars']->value;?>
, <?php echo $_smarty_tpl->tpl_vars['json_values']->value;?>
, <?php echo $_smarty_tpl->tpl_vars['json_ticks']->value;?>
);
                });
            <?php echo '</script'; ?>
>
            <div class="stat-last-period">
                <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Предыдущий период - с<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
 <?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['period_selector']->value->getPrevDateFrom());?>
 <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
по<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
 <?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['period_selector']->value->getPrevDateTo());?>

            </div>
        </div>
    <?php } else { ?>
        <?php echo $_smarty_tpl->tpl_vars['period_selector']->value->render();?>

    <?php }?>

    <?php if (empty($_smarty_tpl->tpl_vars['param']->value['no_list'])) {?>
        <div class="<?php if ($_smarty_tpl->tpl_vars['param']->value['widget']) {?>m-l-20 m-r-20 no-space<?php }?> m-b-20">
            <table border="0" class="<?php if ($_smarty_tpl->tpl_vars['param']->value['widget']) {?>wtable<?php } else { ?>rs-table<?php }?> stat-key-table overable-type2">
                <thead>
                    <tr>
                        <th class="l-w-space"></th>
                        <th><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Выбранный период<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</th>
                        <th><?php if ($_smarty_tpl->tpl_vars['param']->value['widget']) {?><span title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
с<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
 <?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['period_selector']->value->getPrevDateFrom());?>
 <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
по<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
 <?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['period_selector']->value->getPrevDateTo());?>
"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Предыдущий период<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span><?php } else {
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Значение за предыдущий период<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
}?></th>
                        <th class="r-w-space"></th>
                    </tr>
                </thead>
                <tbody>
                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['raw_data']->value, 'row');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['row']->value) {
?>
                        <tr>
                            <td class="l-w-space"></td>
                            <td class="stat-nowrap">
                                <?php echo $_smarty_tpl->tpl_vars['row']->value['label'];?>
&nbsp;<?php if ($_smarty_tpl->tpl_vars['row']->value['help']) {?><span class="help-icon" title="<?php echo $_smarty_tpl->tpl_vars['row']->value['help'];?>
">?</span><?php }?><br>
                                <span class="stat-value"><?php echo smarty_modifier_format_price($_smarty_tpl->tpl_vars['row']->value['values'][1]);?>
 <small><?php echo $_smarty_tpl->tpl_vars['row']->value['unit'];?>
</small></span> <sup class="<?php if ($_smarty_tpl->tpl_vars['row']->value['percent'] < 0) {?>red<?php } else { ?>green<?php }?>"><?php if ($_smarty_tpl->tpl_vars['row']->value['percent'] < 0) {
echo $_smarty_tpl->tpl_vars['row']->value['percent'];
} else { ?>+<?php echo $_smarty_tpl->tpl_vars['row']->value['percent'];
}?>%</sup>
                            </td>
                            <td class="stat-nowrap"><?php echo smarty_modifier_format_price($_smarty_tpl->tpl_vars['row']->value['values'][0]);?>
 <small><?php echo $_smarty_tpl->tpl_vars['row']->value['unit'];?>
</small></td>
                            <td class="r-w-space"></td>
                        </tr>
                    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                </tbody>
            </table>
        </div>
    <?php }?>   
</div><?php }
}
