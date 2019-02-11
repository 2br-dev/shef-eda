<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:32
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\main\view\adminblocks\rsnews\rsnews_item.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b42a05b4_76353547',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f3e0c63de65603f906b78f32cf229aafd29a085b' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\main\\view\\adminblocks\\rsnews\\rsnews_item.tpl',
      1 => 1549608217,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b42a05b4_76353547 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_function_meter')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.meter.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
?>
<li>
    <a class="rs-news-show" data-urls='{ "newsList": "<?php echo smarty_function_adminUrl(array('mod_controller'=>"main-block-rsnews",'rsnews_do'=>"ajaxGetNews"),$_smarty_tpl);?>
",
                                         "markAsViewed": "<?php echo smarty_function_adminUrl(array('mod_controller'=>"main-block-rsnews",'rsnews_do'=>"ajaxMarkAsViewed"),$_smarty_tpl);?>
",
                                         "markAllAsViewed": "<?php echo smarty_function_adminUrl(array('mod_controller'=>"main-block-rsnews",'rsnews_do'=>"ajaxMarkAllAsViewed"),$_smarty_tpl);?>
" }'>
        <i class="rs-icon rs-icon-news"><?php echo smarty_function_meter(array('key'=>"rs-news"),$_smarty_tpl);?>
</i>
        <span><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Новости<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
    </a>
</li><?php }
}
