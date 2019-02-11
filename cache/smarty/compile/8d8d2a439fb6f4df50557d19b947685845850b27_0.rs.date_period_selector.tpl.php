<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:42
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\statistic\view\components\date_period_selector.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117be35ef68_38431275',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8d8d2a439fb6f4df50557d19b947685845850b27' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\statistic\\view\\components\\date_period_selector.tpl',
      1 => 1549608234,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117be35ef68_38431275 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_modifier_dateformat')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\modifier.dateformat.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
echo smarty_function_addjs(array('file'=>"jquery.rs.ormobject.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"%statistic%/date_period_selector.js"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"%statistic%/date_selector.css"),$_smarty_tpl);?>

<?php $_smarty_tpl->_assignInScope('controller_id', $_smarty_tpl->tpl_vars['controller']->value->getUrlName());
?>
<div class="widget-filters">
    <form action="<?php echo smarty_function_adminUrl(array('do'=>false,'mod_controller'=>$_smarty_tpl->tpl_vars['controller']->value->getUrlName()),$_smarty_tpl);?>
" class="form-call-update no-update-hash stat-date-range<?php if (!$_smarty_tpl->tpl_vars['controller']->value->getParam('widget')) {?> page<?php }?>" method="POST">

        <?php if (!empty($_smarty_tpl->tpl_vars['cmp']->value->presets)) {?>
            <div class="dropdown">
                <a id="presetSelector-<?php echo $_smarty_tpl->tpl_vars['controller_id']->value;?>
" data-toggle="dropdown" class="widget-dropdown-handle"><?php echo $_smarty_tpl->tpl_vars['cmp']->value->current_preset_title;?>
 <i class="zmdi zmdi-chevron-down"></i></a>
                <ul class="dropdown-menu date-presets" aria-labelledby="presetSelector-<?php echo $_smarty_tpl->tpl_vars['controller_id']->value;?>
">
                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['cmp']->value->presets, 'preset');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['preset']->value) {
?>
                        <li><a data-to="<?php echo $_smarty_tpl->tpl_vars['preset']->value['id'];?>
" data-from="<?php echo $_smarty_tpl->tpl_vars['preset']->value['id'];?>
" class="item <?php if ($_smarty_tpl->tpl_vars['preset']->value['active']) {?>act<?php }?>"><?php echo $_smarty_tpl->tpl_vars['preset']->value['label'];?>
</a></li>
                    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                </ul>
            </div>
        <?php }?>

        <div class="dropdown">
            <a id="dateSelector-<?php echo $_smarty_tpl->tpl_vars['controller_id']->value;?>
" data-toggle="dropdown" class="widget-dropdown-handle"><?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['cmp']->value->date_from,"@date");?>
 &ndash; <?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['cmp']->value->date_to,"@date");?>
 <i class="zmdi zmdi-chevron-down"></i></a>
            <div class="dropdown-menu p-20" aria-labelledby="dateSelector-<?php echo $_smarty_tpl->tpl_vars['controller_id']->value;?>
">

                <p><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Начало диапазона<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</p>
                <div class="input-group form-group">
                    <span class="input-group-addon"><i class="zmdi zmdi-calendar"></i></span>
                    <div class="dtp-container">
                        <input class="form-control date-time-picker from" type="text" name="<?php echo $_smarty_tpl->tpl_vars['cmp']->value->url_id;?>
_filter_date_from" value="<?php echo $_smarty_tpl->tpl_vars['cmp']->value->date_from;?>
" datefilter>
                    </div>
                </div>

                <p><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Конец диапазона<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</p>
                <div class="input-group form-group">
                    <span class="input-group-addon"><i class="zmdi zmdi-calendar"></i></span>
                    <div class="dtp-container">
                        <input class="form-control date-time-picker to" type="text" name="<?php echo $_smarty_tpl->tpl_vars['cmp']->value->url_id;?>
_filter_date_to" value="<?php echo $_smarty_tpl->tpl_vars['cmp']->value->date_to;?>
" datefilter>
                    </div>
                </div>

                <input type="submit" value="Применить" class="btn btn-primary">
            </div>
        </div>

        <?php if (!empty($_smarty_tpl->tpl_vars['cmp']->value->preset_groups)) {?> 
            <hr/>
            <div class="dropdown">
                <a id="presetGroupSelector-<?php echo $_smarty_tpl->tpl_vars['controller_id']->value;?>
" data-toggle="dropdown" class="widget-dropdown-handle"><span><?php echo $_smarty_tpl->tpl_vars['cmp']->value->current_preset_group_title;?>
</span> <i class="zmdi zmdi-chevron-down"></i></a>
                <ul class="dropdown-menu date-presets-groups" aria-labelledby="presetGroupSelector-<?php echo $_smarty_tpl->tpl_vars['controller_id']->value;?>
">

                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['cmp']->value->preset_groups, 'preset');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['preset']->value) {
?>
                        <?php if ($_smarty_tpl->tpl_vars['preset']->value['active']) {?>
                            <?php $_smarty_tpl->_assignInScope('active_group', $_smarty_tpl->tpl_vars['preset']->value['id']);
?>
                        <?php }?>
                        <li><a data-value="<?php echo $_smarty_tpl->tpl_vars['preset']->value['id'];?>
" class="item <?php if ($_smarty_tpl->tpl_vars['preset']->value['active']) {?>act<?php }?>"><?php echo $_smarty_tpl->tpl_vars['preset']->value['label'];?>
</a></li>
                    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                </ul>
                <input type="hidden" name="<?php echo $_smarty_tpl->tpl_vars['cmp']->value->url_id;?>
_filter_date_group" value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['active_group']->value)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['preset']->value['id'] : $tmp);?>
"/>
            </div>
        <?php }?>

        <?php if (!empty($_smarty_tpl->tpl_vars['cmp']->value->preset_waves)) {?> 
            <div id="presetWaves" class="dropdown" data-cookie="<?php echo $_smarty_tpl->tpl_vars['cmp']->value->url_id;?>
_filter_wave">
                <a id="presetWavesSelector-<?php echo $_smarty_tpl->tpl_vars['controller_id']->value;?>
" data-toggle="dropdown" class="widget-dropdown-handle"><span><?php echo $_smarty_tpl->tpl_vars['cmp']->value->current_preset_wave_title;?>
</span> <i class="zmdi zmdi-chevron-down"></i></a>
                <ul class="dropdown-menu date-presets-waves" aria-labelledby="presetWavesSelector-<?php echo $_smarty_tpl->tpl_vars['controller_id']->value;?>
">
                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['cmp']->value->preset_waves, 'preset');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['preset']->value) {
?>
                        <?php if ($_smarty_tpl->tpl_vars['preset']->value['active']) {?>
                            <?php $_smarty_tpl->_assignInScope('active_group', $_smarty_tpl->tpl_vars['preset']->value['id']);
?>
                        <?php }?>
                        <li><a data-value="<?php echo $_smarty_tpl->tpl_vars['preset']->value['id'];?>
" class="item <?php if ($_smarty_tpl->tpl_vars['preset']->value['active']) {?>act<?php }?>"><?php echo $_smarty_tpl->tpl_vars['preset']->value['label'];?>
</a></li>
                    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                </ul>
                <input type="hidden" name="<?php echo $_smarty_tpl->tpl_vars['cmp']->value->url_id;?>
_filter_wave" value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['active_group']->value)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['preset']->value['id'] : $tmp);?>
"/>
            </div>
        <?php }?>
    </form>
</div><?php }
}
