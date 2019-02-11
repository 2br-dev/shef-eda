<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:32
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\menu\view\adminmenu.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b42fa892_96890199',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '658572b3cfba4f20e47842bd79e109d1a089df82' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\menu\\view\\adminmenu.tpl',
      1 => 1549608219,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:adminmenu_branch.tpl' => 1,
  ),
),false)) {
function content_5c6117b42fa892_96890199 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_function_meter')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.meter.php';
echo smarty_function_addjs(array('file'=>"%menu%/admin_menu.js"),$_smarty_tpl);?>

<div class="side-menu-overlay"></div>
<ul class="side-menu side-main">
    
    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['items']->value, 'item');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
?>
        <?php if ($_smarty_tpl->tpl_vars['item']->value['fields']['typelink'] != 'separator') {?>
        <li <?php if (!empty($_smarty_tpl->tpl_vars['item']->value['child'])) {?> class="sm-node rs-meter-group"<?php }?>>
            <a <?php if (isset($_smarty_tpl->tpl_vars['sel_id']->value) && $_smarty_tpl->tpl_vars['sel_id']->value == $_smarty_tpl->tpl_vars['item']->value['fields']['id']) {?>class="active"<?php }?> <?php if (!empty($_smarty_tpl->tpl_vars['item']->value['child'])) {?>data-url="<?php echo $_smarty_tpl->tpl_vars['item']->value['fields']['link'];?>
"<?php } else { ?>href="<?php echo $_smarty_tpl->tpl_vars['item']->value['fields']['link'];?>
"<?php }?>>
                <i class="rs-icon rs-icon-<?php echo $_smarty_tpl->tpl_vars['item']->value['fields']['alias'];?>
" <?php if ($_smarty_tpl->tpl_vars['item']->value['fields']['iconstyle']) {?>style="<?php echo $_smarty_tpl->tpl_vars['item']->value['fields']['iconstyle'];?>
"<?php }?>><?php echo smarty_function_meter(array(),$_smarty_tpl);?>
</i>
                <span class="title"><?php echo $_smarty_tpl->tpl_vars['item']->value['fields']['title'];?>
</span>
            </a>
            <?php if (!empty($_smarty_tpl->tpl_vars['item']->value['child'])) {?>
                <div class="sm">
                    <div class="sm-head">
                        <a class="menu-close"><i class="zmdi zmdi-close"></i></a>
                        <?php echo $_smarty_tpl->tpl_vars['item']->value['fields']['title'];?>

                    </div>
                    <div class="sm-body">
                        <ul>
                            <?php $_smarty_tpl->_subTemplateRender("rs:adminmenu_branch.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('list'=>$_smarty_tpl->tpl_vars['item']->value['child'],'is_second_level'=>true), 0, true);
?>

                        </ul>
                    </div>
                </div>
            <?php }?>
        </li>
        <?php }?>
    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

</ul><?php }
}
