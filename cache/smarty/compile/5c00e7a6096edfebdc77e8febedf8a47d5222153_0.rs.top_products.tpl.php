<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\catalog\blocks\topproducts\top_products.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b98b7286_51827598',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5c00e7a6096edfebdc77e8febedf8a47d5222153' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\catalog\\blocks\\topproducts\\top_products.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%catalog%/product_in_list_block.tpl' => 1,
    'rs:%THEME%/block_stub.tpl' => 1,
  ),
),false)) {
function content_5c6117b98b7286_51827598 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if ($_smarty_tpl->tpl_vars['products']->value) {?>
    
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
                <a href="<?php echo $_smarty_tpl->tpl_vars['dir']->value->getUrl();?>
" class="title-text"><?php echo $_smarty_tpl->tpl_vars['dir']->value['name'];?>
</a>
                <div class="sec-nav"><i class="pe-7s-angle-left-circle pe-2x pe-va arrow-left"></i><i class="pe-7s-angle-right-circle pe-2x pe-va arrow-right"></i></div>
            </div>
        </div>

        <div class="category-carousel owl-carousel owl-theme">
            <div class="item">
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['products']->value, 'product', true);
$_smarty_tpl->tpl_vars['product']->iteration = 0;
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['product']->value) {
$_smarty_tpl->tpl_vars['product']->iteration++;
$_smarty_tpl->tpl_vars['product']->last = $_smarty_tpl->tpl_vars['product']->iteration == $_smarty_tpl->tpl_vars['product']->total;
$__foreach_product_21_saved = $_smarty_tpl->tpl_vars['product'];
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
$_smarty_tpl->tpl_vars['product'] = $__foreach_product_21_saved;
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

            </div>
        </div>
    </section>
<?php } else { ?>
    <div class="col-padding">
        <?php ob_start();
echo smarty_function_adminUrl(array('do'=>false,'mod_controller'=>"catalog-ctrl"),$_smarty_tpl);
$_prefixVariable16=ob_get_clean();
ob_start();
echo $_smarty_tpl->tpl_vars['this_controller']->value->getSettingUrl();
$_prefixVariable17=ob_get_clean();
$_smarty_tpl->_subTemplateRender("rs:%THEME%/block_stub.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('class'=>"block-top-products",'do'=>array(array('title'=>t("Добавьте категории товаров"),'href'=>$_prefixVariable16),array('title'=>t("Настройте блок"),'href'=>$_prefixVariable17,'class'=>'crud-add'))), 0, false);
?>

    </div>
<?php }
}
}
