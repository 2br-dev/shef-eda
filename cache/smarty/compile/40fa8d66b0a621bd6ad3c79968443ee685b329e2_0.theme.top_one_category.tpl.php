<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\catalog\blocks\topcategories\top_one_category.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b97bc665_02368591',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '40fa8d66b0a621bd6ad3c79968443ee685b329e2' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\catalog\\blocks\\topcategories\\top_one_category.tpl',
      1 => 1549608255,
      2 => 'theme',
    ),
  ),
  'includes' => 
  array (
    'rs:%THEME%/block_stub.tpl' => 1,
  ),
),false)) {
function content_5c6117b97bc665_02368591 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
?>


<?php $_smarty_tpl->_assignInScope('category', reset($_smarty_tpl->tpl_vars['categories']->value));
if ($_smarty_tpl->tpl_vars['category']->value) {?>

    <div class="card card-category" <?php echo $_smarty_tpl->tpl_vars['category']->value->getDebugAttributes();?>
>
        <div class="card-image">
            <a href="<?php echo $_smarty_tpl->tpl_vars['category']->value->getUrl();?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['category']->value->getMainImage(360,454,'axy');?>
" alt="<?php echo $_smarty_tpl->tpl_vars['category']->value['name'];?>
"></a>
        </div>
        <div class="card-text"><span class="card-title"><?php echo $_smarty_tpl->tpl_vars['category']->value['name'];?>
</span>
            <a href="<?php echo $_smarty_tpl->tpl_vars['category']->value->getUrl();?>
" class="link link-more pull-right"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Подробнее<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></div>
    </div>

<?php } else { ?>
    <?php ob_start();
echo smarty_function_adminUrl(array('do'=>false,'mod_controller'=>"catalog-ctrl"),$_smarty_tpl);
$_prefixVariable12=ob_get_clean();
ob_start();
echo $_smarty_tpl->tpl_vars['this_controller']->value->getSettingUrl();
$_prefixVariable13=ob_get_clean();
$_smarty_tpl->_subTemplateRender("rs:%THEME%/block_stub.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('class'=>"block-top-one-category",'do'=>array(array('title'=>t("Добавьте категорию"),'href'=>$_prefixVariable12),array('title'=>t("Настройте блок"),'href'=>$_prefixVariable13,'class'=>'crud-add'))), 0, false);
?>

<?php }
}
}
