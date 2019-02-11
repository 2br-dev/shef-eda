<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\banners\blocks\slider\slider.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9747fd9_19979898',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'eac7183f113ea9fe656f5a362b4e17f1cadc5809' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\banners\\blocks\\slider\\slider.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%THEME%/block_stub.tpl' => 1,
  ),
),false)) {
function content_5c6117b9747fd9_19979898 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
?>

<?php if ($_smarty_tpl->tpl_vars['zone']->value) {?>
    <?php echo smarty_function_addcss(array('file'=>"libs/owl.carousel.min.css"),$_smarty_tpl);?>

    <?php echo smarty_function_addjs(array('file'=>"libs/owl.carousel.min.js"),$_smarty_tpl);?>

    <?php echo smarty_function_addjs(array('file'=>"rs.sliders.js"),$_smarty_tpl);?>


    <?php $_smarty_tpl->_assignInScope('banners', $_smarty_tpl->tpl_vars['zone']->value->getBanners());
?>
    <div class="owl-carousel owl-theme main-corousel rs-js-slider">
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['banners']->value, 'banner');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['banner']->value) {
?>
            <div class="item" <?php echo $_smarty_tpl->tpl_vars['banner']->value->getDebugAttributes();?>
>
                <a <?php if ($_smarty_tpl->tpl_vars['banner']->value['link']) {?>href="<?php echo $_smarty_tpl->tpl_vars['banner']->value['link'];?>
"<?php }?> <?php if ($_smarty_tpl->tpl_vars['banner']->value['targetblank']) {?>target="_blank"<?php }?>><!--
                    --><img src="<?php echo $_smarty_tpl->tpl_vars['banner']->value->getBannerUrl(1169,701,'cxy');?>
" alt="<?php echo $_smarty_tpl->tpl_vars['banner']->value['title'];?>
"><!--
                --></a>
            </div>
        <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

    </div>
<?php } else { ?>
    <?php ob_start();
echo smarty_function_adminUrl(array('do'=>false,'mod_controller'=>"banners-ctrl"),$_smarty_tpl);
$_prefixVariable10=ob_get_clean();
ob_start();
echo $_smarty_tpl->tpl_vars['this_controller']->value->getSettingUrl();
$_prefixVariable11=ob_get_clean();
$_smarty_tpl->_subTemplateRender("rs:%THEME%/block_stub.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('class'=>"block-banner-slider",'do'=>array(array('title'=>t("Добавьте баннерную зону 1169x701px и загрузите в неё баннеры"),'href'=>$_prefixVariable10),array('title'=>t("Настройте блок"),'href'=>$_prefixVariable11,'class'=>'crud-add'))), 0, false);
?>

<?php }
}
}
