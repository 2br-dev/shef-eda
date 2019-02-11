<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:32
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\main\view\adminblocks\rsalerts\alert_item.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b4270a07_28105555',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8ad069f7657f099b3d89429c47cd4f6fe690a488' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\main\\view\\adminblocks\\rsalerts\\alert_item.tpl',
      1 => 1549608217,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b4270a07_28105555 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_function_meter')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.meter.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
?>
<li>
    <a class="rs-alerts" data-urls='{ "list":"<?php echo smarty_function_adminUrl(array('mod_controller'=>"main-block-rsalerts",'alerts_do'=>"ajaxgetalerts"),$_smarty_tpl);?>
" }'>
        <i class="rs-icon rs-icon-mail">
            <?php ob_start();
if ($_smarty_tpl->tpl_vars['counter_status']->value == "warning") {
echo "bg-amber";
}
$_prefixVariable1=ob_get_clean();
echo smarty_function_meter(array('key'=>"rs-notice",'class'=>$_prefixVariable1),$_smarty_tpl);?>

            <i class="hi-count bg-amber">9</i>
        </i>
        <span><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Уведомления<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
    </a>
</li><?php }
}
