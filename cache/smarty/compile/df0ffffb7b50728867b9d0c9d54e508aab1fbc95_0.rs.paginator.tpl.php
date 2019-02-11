<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:42
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\system\admin\widget\paginator.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117be096e41_39353603',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'df0ffffb7b50728867b9d0c9d54e508aab1fbc95' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\system\\admin\\widget\\paginator.tpl',
      1 => 1549608261,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117be096e41_39353603 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['paginator']->value->total_pages > 1) {?>
    <div class="widget-paginator <?php echo $_smarty_tpl->tpl_vars['paginatorClass']->value;?>
">
        <div class="putright">
            <?php ob_start();
echo (($tmp = @$_smarty_tpl->tpl_vars['paginator_len']->value)===null||$tmp==='' ? 5 : $tmp);
$_prefixVariable5=ob_get_clean();
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['paginator']->value->setPaginatorLen($_prefixVariable5)->getPages(), 'item');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
?>
            <?php if ($_smarty_tpl->tpl_vars['item']->value['class'] == 'page') {?>
                <a data-update-url="<?php echo $_smarty_tpl->tpl_vars['item']->value['href'];?>
" class="call-update<?php if ($_smarty_tpl->tpl_vars['noUpdateHash']->value) {?> no-update-hash<?php }
if ($_smarty_tpl->tpl_vars['item']->value['act']) {?> act<?php }?>"><span><?php echo $_smarty_tpl->tpl_vars['item']->value['n'];?>
</span></a>
            <?php } else { ?>
                <?php if ($_smarty_tpl->tpl_vars['item']->value['class'] == 'right') {?>
                    <a data-update-url="<?php echo $_smarty_tpl->tpl_vars['item']->value['href'];?>
" class="call-update<?php if ($_smarty_tpl->tpl_vars['noUpdateHash']->value) {?> no-update-hash<?php }
if ($_smarty_tpl->tpl_vars['item']->value['act']) {?> act<?php }?>"><span><?php echo $_smarty_tpl->tpl_vars['item']->value['n'];?>
&raquo;</span></a>
                <?php } else { ?>
                    <a data-update-url="<?php echo $_smarty_tpl->tpl_vars['item']->value['href'];?>
" class="call-update<?php if ($_smarty_tpl->tpl_vars['noUpdateHash']->value) {?> no-update-hash<?php }
if ($_smarty_tpl->tpl_vars['item']->value['act']) {?> act<?php }?>"><span>&laquo;<?php echo $_smarty_tpl->tpl_vars['item']->value['n'];?>
</span></a>
                <?php }?>
            <?php }?>
            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

        </div>
    </div>
<?php }
}
}
