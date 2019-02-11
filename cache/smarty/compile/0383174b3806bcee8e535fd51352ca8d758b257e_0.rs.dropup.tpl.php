<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:32
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\system\admin\html_elements\toolbar\button\dropup.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b4148b94_24462835',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '0383174b3806bcee8e535fd51352ca8d758b257e' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\system\\admin\\html_elements\\toolbar\\button\\dropup.tpl',
      1 => 1549608261,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b4148b94_24462835 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_assignInScope('first', $_smarty_tpl->tpl_vars['button']->value->getFirstItem());
?>

<?php if (count($_smarty_tpl->tpl_vars['button']->value->getAllItems()) > 1) {?>
    <div <?php echo $_smarty_tpl->tpl_vars['button']->value->getAttrLine();?>
>
        <?php if (isset($_smarty_tpl->tpl_vars['first']->value['attr']['href'])) {?>
            <a class="split-link <?php echo $_smarty_tpl->tpl_vars['button']->value->getItemClass($_smarty_tpl->tpl_vars['first']->value);?>
" <?php echo $_smarty_tpl->tpl_vars['button']->value->getItemAttrLine($_smarty_tpl->tpl_vars['first']->value);?>
><?php echo $_smarty_tpl->tpl_vars['first']->value['title'];?>
</a>
            <a class="split-caret l-border <?php echo $_smarty_tpl->tpl_vars['button']->value->getItemClass($_smarty_tpl->tpl_vars['first']->value,'toggle');?>
" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="caret"></span></a>
        <?php } else { ?>
            <a class="split-group <?php echo $_smarty_tpl->tpl_vars['button']->value->getItemClass($_smarty_tpl->tpl_vars['first']->value,'toggle');?>
" <?php echo $_smarty_tpl->tpl_vars['button']->value->getItemAttrLine($_smarty_tpl->tpl_vars['first']->value);?>
 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo $_smarty_tpl->tpl_vars['first']->value['title'];?>
 <span class="caret"></span></a>
        <?php }?>
        <?php if (count($_smarty_tpl->tpl_vars['button']->value->getDropItems())) {?>
            <ul class="dropdown-menu dropdown-menu-right">
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['button']->value->getDropItems(), 'item');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
?>
                <li>
                    <a class="<?php echo $_smarty_tpl->tpl_vars['button']->value->getItemClass($_smarty_tpl->tpl_vars['item']->value,'listitem');?>
" <?php echo $_smarty_tpl->tpl_vars['button']->value->getItemAttrLine($_smarty_tpl->tpl_vars['item']->value);?>
><?php echo $_smarty_tpl->tpl_vars['item']->value['title'];?>
</a>
                </li>
            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

            </ul>
        <?php }?>
    </div>
<?php } else { ?>
    <a class="<?php echo $_smarty_tpl->tpl_vars['button']->value->getItemClass($_smarty_tpl->tpl_vars['first']->value);?>
" <?php echo $_smarty_tpl->tpl_vars['button']->value->getItemAttrLine($_smarty_tpl->tpl_vars['first']->value);?>
><?php echo $_smarty_tpl->tpl_vars['first']->value['title'];?>
</a>
<?php }
}
}
