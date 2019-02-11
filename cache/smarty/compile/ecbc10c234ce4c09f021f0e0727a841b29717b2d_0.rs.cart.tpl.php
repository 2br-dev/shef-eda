<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\shop\blocks\cart\cart.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b94ac828_51942551',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ecbc10c234ce4c09f021f0e0727a841b29717b2d' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\shop\\blocks\\cart\\cart.tpl',
      1 => 1549608256,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b94ac828_51942551 (Smarty_Internal_Template $_smarty_tpl) {
?>


<div class="gridblock<?php if ($_smarty_tpl->tpl_vars['cart_info']->value['items_count']) {?> active<?php }?>" id="rs-cart">
    <div class="cart-wrapper rs-cart-line">
        <div class="cart-block">
            <div class="cart-block-wrapper">
                <div class="t-drop-basket rs-popup-cart"></div>

                <div class="icon-cart <?php if ($_smarty_tpl->tpl_vars['router']->value->getCurrentRoute()->getId() != 'shop-front-cartpage') {?>rs-show-cart<?php }?>" data-href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('shop-front-cartpage');?>
">
                    <i class="i-svg i-svg-cart"></i>
                    <i class="counter rs-cart-items-count"><?php echo $_smarty_tpl->tpl_vars['cart_info']->value['items_count'];?>
</i>
                </div>
            </div>
        </div>
    </div>
</div><?php }
}
