<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\catalog\blocks\lastviewed\products.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9977167_77127433',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'eb8e19827f729a826d1752c907256b53051fdf69' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\catalog\\blocks\\lastviewed\\products.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%catalog%/product_in_list_block.tpl' => 1,
  ),
),false)) {
function content_5c6117b9977167_77127433 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
?>

<?php if (count($_smarty_tpl->tpl_vars['products']->value)) {?>
    <?php echo smarty_function_addcss(array('file'=>"libs/owl.carousel.min.css"),$_smarty_tpl);?>

    <?php echo smarty_function_addjs(array('file'=>"libs/owl.carousel.min.js"),$_smarty_tpl);?>


    <?php $_smarty_tpl->_assignInScope('shop_config', \RS\Config\Loader::byModule('shop'));
?>
    <?php $_smarty_tpl->_assignInScope('check_quantity', $_smarty_tpl->tpl_vars['shop_config']->value['check_quantity']);
?>

    
    <?php if (count($_smarty_tpl->tpl_vars['products']->value) >= 8) {?>
        <?php $_smarty_tpl->_assignInScope('verticalNumber', 2);
?>
    <?php } else { ?>
        <?php $_smarty_tpl->_assignInScope('verticalNumber', 1);
?>
    <?php }?>

    <section class="sec sec-category">
        <div class="title anti-container">
            <div class="container-fluid">
                <span class="title-text"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Вы смотрели<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
                <div class="sec-nav"><i class="pe-7s-angle-left-circle pe-2x pe-va arrow-left"></i><i class="pe-7s-angle-right-circle pe-2x pe-va arrow-right"></i></div>
            </div>
        </div>

        <div class="category-carousel owl-carousel owl-theme">
            <?php if ($_smarty_tpl->tpl_vars['products']->value) {?>
                <div class="item">
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['products']->value, 'product', true);
$_smarty_tpl->tpl_vars['product']->iteration = 0;
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['product']->value) {
$_smarty_tpl->tpl_vars['product']->iteration++;
$_smarty_tpl->tpl_vars['product']->last = $_smarty_tpl->tpl_vars['product']->iteration == $_smarty_tpl->tpl_vars['product']->total;
$__foreach_product_23_saved = $_smarty_tpl->tpl_vars['product'];
?>
                    <?php $_smarty_tpl->_assignInScope('url', $_smarty_tpl->tpl_vars['product']->value->getUrl());
?>
                    <div class="col-xs-12">
                        <?php $_smarty_tpl->_subTemplateRender("rs:%catalog%/product_in_list_block.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('product'=>$_smarty_tpl->tpl_vars['product']->value), 0, true);
?>

                    </div>
                    <?php if (($_smarty_tpl->tpl_vars['product']->iteration%$_smarty_tpl->tpl_vars['verticalNumber']->value == 0) && !$_smarty_tpl->tpl_vars['product']->last) {?>
                        </div><div class="item">
                    <?php }?>
                <?php
$_smarty_tpl->tpl_vars['product'] = $__foreach_product_23_saved;
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                </div>
            <?php }?>
        </div>
    </section>
<?php }
}
}
