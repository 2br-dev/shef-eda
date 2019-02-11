<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\system\gs\bootstrap\section.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b921ed28_80223883',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'bb0416cbf925173758511f7815e350b0e8837569' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\system\\gs\\bootstrap\\section.tpl',
      1 => 1549608261,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%system%/gs/bootstrap/attribute.tpl' => 4,
    'rs:%system%/gs/".((string)$_smarty_tpl->tpl_vars[\'layouts\']->value[\'grid_system\'])."/sections.tpl' => 1,
    'rs:%system%/gs/blocks.tpl' => 1,
  ),
),false)) {
function content_5c6117b921ed28_80223883 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div class="<?php if ($_smarty_tpl->tpl_vars['level']->value['section']['element_type'] == 'row') {?>row<?php } else {
$_smarty_tpl->_subTemplateRender("rs:%system%/gs/bootstrap/attribute.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('field'=>"width"), 0, false);
$_smarty_tpl->_subTemplateRender("rs:%system%/gs/bootstrap/attribute.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('field'=>"prefix",'name'=>"offset-"), 0, true);
$_smarty_tpl->_subTemplateRender("rs:%system%/gs/bootstrap/attribute.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('field'=>"pull",'name'=>"pull-"), 0, true);
$_smarty_tpl->_subTemplateRender("rs:%system%/gs/bootstrap/attribute.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('field'=>"push",'name'=>"push-"), 0, true);
}?> <?php if ($_smarty_tpl->tpl_vars['level']->value['section']['css_class']) {
echo $_smarty_tpl->tpl_vars['level']->value['section']['css_class'];
}?>">
    
    <?php if (!empty($_smarty_tpl->tpl_vars['level']->value['childs'])) {?>
        <?php ob_start();
$_smarty_tpl->_subTemplateRender("rs:%system%/gs/".((string)$_smarty_tpl->tpl_vars['layouts']->value['grid_system'])."/sections.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('item'=>$_smarty_tpl->tpl_vars['level']->value['childs']), 0, true);
$_smarty_tpl->assign('wrapped_content', ob_get_clean());
?>

    <?php } else { ?>
        <?php ob_start();
$_smarty_tpl->_subTemplateRender("rs:%system%/gs/blocks.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
$_smarty_tpl->assign('wrapped_content', ob_get_clean());
?>

    <?php }?>
    
    <?php if ($_smarty_tpl->tpl_vars['level']->value['section']['inset_template']) {?>
        <?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['level']->value['section']['inset_template'], $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('wrapped_content'=>$_smarty_tpl->tpl_vars['wrapped_content']->value), 0, true);
?>

    <?php } else { ?>
        <?php echo $_smarty_tpl->tpl_vars['wrapped_content']->value;?>

    <?php }?>        
    
</div><?php }
}
