<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\menu\blocks\menu\footer_menu.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9b12036_32317232',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '077caca59c17fd7ad6cb219fffcfd8cac2ada18a' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\menu\\blocks\\menu\\footer_menu.tpl',
      1 => 1549608256,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%THEME%/block_stub.tpl' => 1,
  ),
),false)) {
function content_5c6117b9b12036_32317232 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
?>

<?php if ($_smarty_tpl->tpl_vars['items']->value) {?>
    <div class="column">
        <div class="footer-social_wrapper">
            <div class="column_title"><span><?php ob_start();
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
echo "КОМПАНИЯ";
$_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
$_prefixVariable21=ob_get_clean();
echo (($tmp = @$_smarty_tpl->tpl_vars['root']->value['title'])===null||$tmp==='' ? $_prefixVariable21 : $tmp);?>
</span></div>
            <ul class="column_menu">
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['items']->value, 'item');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
?>
                    <li class="<?php if ($_smarty_tpl->tpl_vars['item']->value['fields']['typelink'] == 'separator') {?>separator<?php }?>" <?php echo $_smarty_tpl->tpl_vars['item']->value['fields']->getDebugAttributes();?>
>
                        <?php if ($_smarty_tpl->tpl_vars['item']->value['fields']['typelink'] != 'separator') {?><a href="<?php echo $_smarty_tpl->tpl_vars['item']->value['fields']->getHref();?>
" <?php if ($_smarty_tpl->tpl_vars['item']->value['fields']['target_blank']) {?>target="_blank"<?php }?>><?php echo $_smarty_tpl->tpl_vars['item']->value['fields']['title'];?>
</a><?php } else { ?>&nbsp;<?php }?>
                    </li>
                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

            </ul>
        </div>
    </div>
<?php } else { ?>
    <?php ob_start();
echo $_smarty_tpl->tpl_vars['this_controller']->value->getSettingUrl();
$_prefixVariable22=ob_get_clean();
$_smarty_tpl->_subTemplateRender("rs:%THEME%/block_stub.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('class'=>"block-footer-menu white",'do'=>array($_prefixVariable22=>t("Настройте блок"))), 0, false);
?>

<?php }
}
}
