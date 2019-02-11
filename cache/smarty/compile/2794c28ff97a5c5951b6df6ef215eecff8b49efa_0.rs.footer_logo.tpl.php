<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\main\blocks\logo\footer_logo.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9acad79_53207140',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '2794c28ff97a5c5951b6df6ef215eecff8b49efa' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\main\\blocks\\logo\\footer_logo.tpl',
      1 => 1549608256,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%THEME%/block_stub.tpl' => 1,
  ),
),false)) {
function content_5c6117b9acad79_53207140 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
?>

<?php if ($_smarty_tpl->tpl_vars['site_config']->value['logo']) {?>
    <div class="footer_logo">
        <?php if ($_smarty_tpl->tpl_vars['link']->value != ' ') {?><a href="<?php echo $_smarty_tpl->tpl_vars['link']->value;?>
"><?php }?>
        <img src="<?php echo $_smarty_tpl->tpl_vars['site_config']->value['__logo']->getUrl($_smarty_tpl->tpl_vars['width']->value,$_smarty_tpl->tpl_vars['height']->value);?>
" alt=""/>
        <?php if ($_smarty_tpl->tpl_vars['link']->value != ' ') {?></a><?php }?>
        <div class="slogan"><?php echo $_smarty_tpl->tpl_vars['site_config']->value['slogan'];?>
</div>
    </div>
<?php } else { ?>
    <?php ob_start();
echo smarty_function_adminUrl(array('do'=>false,'mod_controller'=>"site-options"),$_smarty_tpl);
$_prefixVariable20=ob_get_clean();
$_smarty_tpl->_subTemplateRender("rs:%THEME%/block_stub.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('class'=>"block-logo text-center white",'do'=>array(array('title'=>t("Добавьте логотип"),'href'=>$_prefixVariable20))), 0, false);
?>

<?php }
}
}
