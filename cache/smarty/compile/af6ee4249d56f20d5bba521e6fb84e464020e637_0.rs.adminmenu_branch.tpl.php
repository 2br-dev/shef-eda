<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:32
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\menu\view\adminmenu_branch.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b4328e24_24234406',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'af6ee4249d56f20d5bba521e6fb84e464020e637' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\menu\\view\\adminmenu_branch.tpl',
      1 => 1549608219,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:adminmenu_branch.tpl' => 2,
  ),
),false)) {
function content_5c6117b4328e24_24234406 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_meter')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.meter.php';
?>

<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value, 'item');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
?>
    <li <?php if ($_smarty_tpl->tpl_vars['item']->value['child']) {?> class="sm-node rs-meter-group"<?php }
if ($_smarty_tpl->tpl_vars['item']->value['fields']['typelink'] == 'separator') {?> class="separator"<?php }?>>
        <?php if ($_smarty_tpl->tpl_vars['item']->value['fields']['typelink'] != 'separator') {?>
        <a class="<?php if (isset($_smarty_tpl->tpl_vars['sel_id']->value) && $_smarty_tpl->tpl_vars['sel_id']->value == $_smarty_tpl->tpl_vars['item']->value['fields']['id']) {?>active<?php }?>" href="<?php echo $_smarty_tpl->tpl_vars['item']->value['fields']['link'];?>
">
            
                <?php if ($_smarty_tpl->tpl_vars['item']->value['child']) {
echo smarty_function_meter(array(),$_smarty_tpl);?>

                <?php } else {
echo smarty_function_meter(array('key'=>"rs-admin-menu-".((string)$_smarty_tpl->tpl_vars['item']->value['fields']['alias'])),$_smarty_tpl);
}?>
            
            <span class="sm-node-title"><?php echo $_smarty_tpl->tpl_vars['item']->value['fields']['title'];?>
</span>
        </a>
        <?php }?>
        <?php if ($_smarty_tpl->tpl_vars['item']->value['child']) {?>
            <ul>
            <?php $_smarty_tpl->_subTemplateRender("rs:adminmenu_branch.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('list'=>$_smarty_tpl->tpl_vars['item']->value['child'],'is_first_level'=>false), 0, true);
?>

            </ul>
        <?php }?>
    </li>
<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
}
}
