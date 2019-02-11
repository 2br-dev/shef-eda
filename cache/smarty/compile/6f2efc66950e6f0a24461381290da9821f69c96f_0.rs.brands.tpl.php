<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\catalog\blocks\brands\brands.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9a5e044_22481552',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6f2efc66950e6f0a24461381290da9821f69c96f' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\catalog\\blocks\\brands\\brands.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b9a5e044_22481552 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
?>


<?php echo smarty_function_addcss(array('file'=>"libs/owl.carousel.min.css"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"libs/owl.carousel.min.js"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"rs.brands.js"),$_smarty_tpl);?>


<?php if (!empty($_smarty_tpl->tpl_vars['brands']->value)) {?>
    <section class="sec sec-brand anti-container">
        <div class="title">
            <div class="container-fluid"><a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('catalog-front-allbrands');?>
" class="title-text"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Бренды<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a>
                <div class="sec-nav"><i class="pe-7s-angle-left-circle pe-2x pe-va arrow-left"></i><i class="pe-7s-angle-right-circle pe-2x pe-va arrow-right"></i></div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="brand-carousel owl-carousel owl-theme">
                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['brands']->value, 'brand');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['brand']->value) {
?>
                        <?php if ($_smarty_tpl->tpl_vars['brand']->value['image']) {?>
                            <div class="item" <?php echo $_smarty_tpl->tpl_vars['brand']->value->getDebugAttributes();?>
>
                                <a href="<?php echo $_smarty_tpl->tpl_vars['brand']->value->getUrl();?>
">
                                    <img src="<?php echo $_smarty_tpl->tpl_vars['brand']->value->__image->getUrl(100,100,'axy');?>
" alt="<?php echo $_smarty_tpl->tpl_vars['brand']->value['title'];?>
" class="center-block"/>
                                </a>
                            </div>
                        <?php }?>
                    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                </div>
            </div>
        </div>
    </section>
<?php }
}
}
