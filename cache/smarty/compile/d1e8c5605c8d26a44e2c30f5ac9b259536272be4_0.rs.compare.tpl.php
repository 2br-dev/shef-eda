<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\catalog\blocks\compare\compare.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b963db99_36620813',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd1e8c5605c8d26a44e2c30f5ac9b259536272be4' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\catalog\\blocks\\compare\\compare.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b963db99_36620813 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
?>


<?php if ($_smarty_tpl->tpl_vars['THEME_SETTINGS']->value['enable_compare']) {?>
    <?php echo smarty_function_addjs(array('file'=>"rs.compare.js"),$_smarty_tpl);?>

    <?php $_smarty_tpl->_assignInScope('total', $_smarty_tpl->tpl_vars['this_controller']->value->api->getCount());
?>

    <div class="gridblock rs-compare-block <?php if ($_smarty_tpl->tpl_vars['total']->value) {?> active<?php }?>" data-compare-url='{ "add":"<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('catalog-block-compare',array("cpmdo"=>"ajaxAdd","_block_id"=>$_smarty_tpl->tpl_vars['_block_id']->value));?>
", "remove":"<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('catalog-block-compare',array("cpmdo"=>"ajaxRemove","_block_id"=>$_smarty_tpl->tpl_vars['_block_id']->value));?>
", "removeAll":"<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('catalog-block-compare',array("cpmdo"=>"ajaxRemoveAll","_block_id"=>$_smarty_tpl->tpl_vars['_block_id']->value));?>
", "compare":"<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('catalog-front-compare');?>
" }'>
        <div class="cart-wrapper">
            <div class="cart-block">
                <div class="cart-block-wrapper">

                    <div class="icon-compare rs-do-compare">
                        <i class="i-svg i-svg-compare"></i>
                        <i class="counter rs-compare-items-count"><?php echo $_smarty_tpl->tpl_vars['total']->value;?>
</i>
                    </div>

                </div>
            </div>
        </div>
    </div>
<?php }
}
}
