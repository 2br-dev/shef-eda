<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\banners\blocks\bannerzone\main_zone.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9928246_25497946',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a7d3d09c6f041ed38a4a57c52b036839764deeb2' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\banners\\blocks\\bannerzone\\main_zone.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b9928246_25497946 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
?>


<?php if ($_smarty_tpl->tpl_vars['zone']->value) {?>
    <?php if ($_smarty_tpl->tpl_vars['param']->value['rotate']) {?>
        <?php $_smarty_tpl->_assignInScope('onebanner', $_smarty_tpl->tpl_vars['zone']->value->getOneBanner());
?>
        <?php if ($_smarty_tpl->tpl_vars['onebanner']->value['id']) {?>
            <?php $_smarty_tpl->_assignInScope('banners', array(0=>$_smarty_tpl->tpl_vars['onebanner']->value));
?>
        <?php }?>
    <?php } else { ?>
        <?php $_smarty_tpl->_assignInScope('banners', $_smarty_tpl->tpl_vars['zone']->value->getBanners());
?>
    <?php }?>
    <?php if ($_smarty_tpl->tpl_vars['banners']->value) {?>
        <div class="side-banners">
            <div class="col-xs-12">
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['banners']->value, 'banner');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['banner']->value) {
?>
                    <div class="banner" <?php echo $_smarty_tpl->tpl_vars['banner']->value->getDebugAttributes();?>
>
                        <img src="<?php echo $_smarty_tpl->tpl_vars['banner']->value->getBannerUrl($_smarty_tpl->tpl_vars['zone']->value['width'],$_smarty_tpl->tpl_vars['zone']->value['height']);?>
" alt="<?php echo $_smarty_tpl->tpl_vars['banner']->value['title'];?>
">
                        <div class="col-xs-12 col-lg-6 col-lg-offset-6">
                            <div class="banner_description" <?php if (!$_smarty_tpl->tpl_vars['banner']->value->getInfoLine(0) && !$_smarty_tpl->tpl_vars['banner']->value->getInfoLine(1)) {?>style="background-color: transparent; box-shadow: none" <?php }?>>
                                <h3><?php echo $_smarty_tpl->tpl_vars['banner']->value->getInfoLine(0);?>
</h3>
                                <p><?php echo $_smarty_tpl->tpl_vars['banner']->value->getInfoLine(1);?>
</p>
                                <?php if ($_smarty_tpl->tpl_vars['banner']->value['link']) {?>
                                    <a href="<?php echo $_smarty_tpl->tpl_vars['banner']->value['link'];?>
" <?php if ($_smarty_tpl->tpl_vars['banner']->value['targetblank']) {?>target="_blank"<?php }?> class="theme-btn_subscribe">
                                        <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Подробнее<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

                                    </a>
                                <?php }?>
                            </div>
                        </div>
                    </div>
                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

            </div>
        </div>
        <div class="clearfix"></div>
    <?php }
}
}
}
