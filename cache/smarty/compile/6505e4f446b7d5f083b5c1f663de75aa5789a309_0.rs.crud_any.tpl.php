<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:32
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\system\admin\crud_any.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b40e6943_35608384',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6505e4f446b7d5f083b5c1f663de75aa5789a309' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\system\\admin\\crud_any.tpl',
      1 => 1549608261,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b40e6943_35608384 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_urlmake')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.urlmake.php';
echo $_smarty_tpl->tpl_vars['app']->value->autoloadScripsAjaxBefore();?>

<?php if (!$_smarty_tpl->tpl_vars['url']->value->isAjax()) {?>
<div class="crud-ajax-group">
            <div class="updatable" data-url="<?php echo smarty_function_urlmake(array(),$_smarty_tpl);?>
">
<?php }?>
                <div class="viewport">
                    <div class="top-toolbar">
                        <div class="c-head">
                            <h2 class="title titlebox"><?php echo $_smarty_tpl->tpl_vars['elements']->value['formTitle'];?>
 <?php if (isset($_smarty_tpl->tpl_vars['elements']->value['topHelp'])) {?><a class="help-icon" data-toggle-class="open" data-target-closest=".top-toolbar">?</a><?php }?></h2>

                            <?php if ($_smarty_tpl->tpl_vars['elements']->value['topToolbar']) {?>
                                <div class="buttons xs-dropdown place-left">
                                    <a class="btn btn-default toggle visible-xs-inline-block" data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false" id="clientHeadButtons" >
                                        <i class="zmdi zmdi-more-vert"></i>
                                    </a>
                                    <div class="xs-dropdown-menu" aria-labelledby="clientHeadButtons">
                                        <?php echo $_smarty_tpl->tpl_vars['elements']->value['topToolbar']->getView();?>

                                    </div>
                                </div>
                            <?php }?>
                        </div>

                        <div class="c-help notice notice-warning">
                            <?php echo $_smarty_tpl->tpl_vars['elements']->value['topHelp'];?>

                        </div>
                    </div>

                    <?php echo $_smarty_tpl->tpl_vars['elements']->value['headerHtml'];?>

                </div>

                <?php echo $_smarty_tpl->tpl_vars['elements']->value['form'];?>


<?php if (!$_smarty_tpl->tpl_vars['url']->value->isAjax()) {?>
            </div> <!-- .updatable -->
    
    <?php if ($_smarty_tpl->tpl_vars['elements']->value['bottomToolbar']) {?>
    <div class="footerspace"></div>
    <div class="bottom-toolbar fixed">
        <div class="viewport">
            <div class="common-column">
                    <?php echo $_smarty_tpl->tpl_vars['elements']->value['bottomToolbar']->getView();?>

            </div>
        </div>
    </div>    
    <?php }?>    
</div>
<?php }
echo $_smarty_tpl->tpl_vars['app']->value->autoloadScripsAjaxAfter();
}
}
