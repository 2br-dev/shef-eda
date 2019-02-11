<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\menu\blocks\menu\hor_menu.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b92c9081_62036515',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '539b9614b0c54b03571418ab83087d986f091855' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\menu\\blocks\\menu\\hor_menu.tpl',
      1 => 1549608256,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:blocks/menu/branch.tpl' => 1,
    'rs:%THEME%/block_stub.tpl' => 1,
  ),
),false)) {
function content_5c6117b92c9081_62036515 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
?>

<?php if ($_smarty_tpl->tpl_vars['items']->value) {?>
    <nav>
        <ul class="theme-list left hidden-xs top-menu">
            <?php $_smarty_tpl->_subTemplateRender("rs:blocks/menu/branch.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('menu_level'=>$_smarty_tpl->tpl_vars['items']->value), 0, false);
?>

        </ul>
    </nav>
<?php } else { ?>
    <?php ob_start();
echo smarty_function_adminUrl(array('do'=>"add",'mod_controller'=>"menu-ctrl"),$_smarty_tpl);
$_prefixVariable2=ob_get_clean();
$_smarty_tpl->_subTemplateRender("rs:%THEME%/block_stub.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('class'=>"noBack blockSmall blockLeft blockMenu",'do'=>array($_prefixVariable2=>t("Добавьте пункт меню"))), 0, false);
?>

<?php }
}
}
