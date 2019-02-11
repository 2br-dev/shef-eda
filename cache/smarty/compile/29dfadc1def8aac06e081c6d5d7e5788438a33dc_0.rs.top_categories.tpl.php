<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\catalog\blocks\topcategories\top_categories.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b98492a8_06503784',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '29dfadc1def8aac06e081c6d5d7e5788438a33dc' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\catalog\\blocks\\topcategories\\top_categories.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%THEME%/block_stub.tpl' => 1,
  ),
),false)) {
function content_5c6117b98492a8_06503784 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if ($_smarty_tpl->tpl_vars['categories']->value) {?>
    
    
    <?php $_smarty_tpl->_assignInScope('classSchema', array('M'=>array('imgSize'=>array(286,257),'imgScale'=>'cxy','class'=>'card-category-middle'),'s'=>array('imgSize'=>array(250,150),'imgScale'=>'cxy','class'=>'card-category-mini')));
?>

    <?php $_smarty_tpl->_assignInScope('sizeSchema', 'Msssssssssssss');
?> 
    <?php $_smarty_tpl->_assignInScope('i', 0);
?>

    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['categories']->value, 'category');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['category']->value) {
?>
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
            <?php if ($_smarty_tpl->tpl_vars['i']->value > (strlen($_smarty_tpl->tpl_vars['sizeSchema']->value)-1)) {
$_smarty_tpl->_assignInScope('i', 0);
}?>
            <?php $_smarty_tpl->_assignInScope('schemaItem', $_smarty_tpl->tpl_vars['classSchema']->value[$_smarty_tpl->tpl_vars['sizeSchema']->value[$_smarty_tpl->tpl_vars['i']->value]]);
?>
            <div class="card <?php echo $_smarty_tpl->tpl_vars['schemaItem']->value['class'];?>
 text-center" <?php echo $_smarty_tpl->tpl_vars['category']->value->getDebugAttributes();?>
>
                <div class="card-image">
                    <a href="<?php echo $_smarty_tpl->tpl_vars['category']->value->getUrl();?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['category']->value->getMainImage($_smarty_tpl->tpl_vars['schemaItem']->value['imgSize'][0],$_smarty_tpl->tpl_vars['schemaItem']->value['imgSize'][1]);?>
" alt="<?php echo $_smarty_tpl->tpl_vars['category']->value['name'];?>
"></a>
                </div>
                <div class="card-text"><a href="<?php echo $_smarty_tpl->tpl_vars['category']->value->getUrl();?>
"><span><?php echo $_smarty_tpl->tpl_vars['category']->value['name'];?>
</span></a></div>
            </div>
        </div>

        <?php $_smarty_tpl->_assignInScope('i', $_smarty_tpl->tpl_vars['i']->value+1);
?>
        <?php if ($_smarty_tpl->tpl_vars['i']->value > strlen($_smarty_tpl->tpl_vars['sizeSchema']->value)) {
$_smarty_tpl->_assignInScope('i', 0);
}?>
    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

<?php } else { ?>
    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-12">
        <?php ob_start();
echo smarty_function_adminUrl(array('do'=>false,'mod_controller'=>"catalog-ctrl"),$_smarty_tpl);
$_prefixVariable14=ob_get_clean();
ob_start();
echo $_smarty_tpl->tpl_vars['this_controller']->value->getSettingUrl();
$_prefixVariable15=ob_get_clean();
$_smarty_tpl->_subTemplateRender("rs:%THEME%/block_stub.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('class'=>"block-top-categories",'do'=>array(array('title'=>t("Добавьте категорию"),'href'=>$_prefixVariable14),array('title'=>t("Настройте блок"),'href'=>$_prefixVariable15,'class'=>'crud-add'))), 0, false);
?>

    </div>
<?php }
}
}
