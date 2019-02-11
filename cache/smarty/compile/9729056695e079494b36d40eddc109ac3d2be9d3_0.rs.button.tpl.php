<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\emailsubscribe\blocks\button\button.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9a968c4_65422410',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '9729056695e079494b36d40eddc109ac3d2be9d3' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\emailsubscribe\\blocks\\button\\button.tpl',
      1 => 1549608256,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b9a968c4_65422410 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
?>


<?php echo smarty_function_addjs(array('file'=>"%emailsubscribe%/button.js"),$_smarty_tpl);?>


<section class="sec sec-form anti-container" id="signUpUpdate">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-lg-6">
                <div class="sec-form_description">
                    <h3><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Узнайте о наших событиях первыми!<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</h3>
                    <p><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Подпишитесь на последние обновления и узнавайте о новинках и специальных предложениях первыми<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</p>
                </div>
            </div>
            <div class="col-xs-12 col-lg-6">
                <div class="sec-form_subscribe">
                    <?php if ($_smarty_tpl->tpl_vars['success']->value) {?>
                        <div class="sec-form_succes"><?php echo $_smarty_tpl->tpl_vars['success']->value;?>
</div>
                    <?php } else { ?>
                        <form class="form-inline" action="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('emailsubscribe-block-subscribebutton');?>
" method="POST">
                            <div class="form-group"><input id="email" name="email" type="email" placeholder="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Напишите свой e-mail<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
" class="form-control"></div>
                            <div class="form-group"><button type="submit" class="theme-btn_subscribe"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Подписаться<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</button></div>
                            <div class="sec-form_unsubscribe"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Отписаться можно будет перейдя по ссылке, указанной в каждом рассылаемом письме<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</div>
                            <?php echo $_smarty_tpl->tpl_vars['this_controller']->value->myBlockIdInput();?>

                        </form>
                    <?php }?>
                </div>
            </div>
        </div>
    </div>
</section><?php }
}
