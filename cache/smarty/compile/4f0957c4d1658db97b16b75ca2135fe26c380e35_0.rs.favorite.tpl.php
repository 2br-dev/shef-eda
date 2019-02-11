<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\catalog\blocks\favorite\favorite.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b95d0b10_34093785',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4f0957c4d1658db97b16b75ca2135fe26c380e35' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\catalog\\blocks\\favorite\\favorite.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b95d0b10_34093785 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
?>

<?php if ($_smarty_tpl->tpl_vars['THEME_SETTINGS']->value['enable_favorite']) {?>
    <?php echo smarty_function_addjs(array('file'=>"rs.favorite.js"),$_smarty_tpl);?>

    <div class="gridblock rs-favorite-block<?php if ($_smarty_tpl->tpl_vars['countFavorite']->value) {?> active<?php }?>" data-favorite-url="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('catalog-front-favorite');?>
">
        <div class="cart-wrapper">
            <div class="cart-block">
                <div class="cart-block-wrapper">

                    <div class="icon-favorite rs-favorite-link" data-href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('catalog-front-favorite');?>
" >
                        <i class="i-svg i-svg-favorite"></i>
                        <i class="counter rs-favorite-items-count"><?php echo $_smarty_tpl->tpl_vars['countFavorite']->value;?>
</i>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php }
}
}
