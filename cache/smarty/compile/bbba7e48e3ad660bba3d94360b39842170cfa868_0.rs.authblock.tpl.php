<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\users\blocks\authblock\authblock.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9508fc5_52829324',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'bbba7e48e3ad660bba3d94360b39842170cfa868' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\users\\blocks\\authblock\\authblock.tpl',
      1 => 1549608256,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b9508fc5_52829324 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_block_hook')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.hook.php';
?>


<?php $_smarty_tpl->_assignInScope('referer', urlencode($_smarty_tpl->tpl_vars['url']->value->server('REQUEST_URI')));
?>
<div class="gridblock">
    <div class="cart-wrapper hover-wrapper">
        <div class="cart-block">
            <div class="cart-block-wrapper">
                <?php if ($_smarty_tpl->tpl_vars['is_auth']->value) {?>
                    <div class="t-drop-account">
                        <div class="t-close"><i class="pe-2x pe-7s-close-circle"></i></div>
                        <div class="t-drop-account_wrap">
                            <?php ob_start();
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
echo "Блок авторизации:имя пользователя";
$_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
$_prefixVariable4=ob_get_clean();
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('hook', array('name'=>"users-blocks-authblock:username",'title'=>$_prefixVariable4));
$_block_repeat1=true;
echo smarty_block_hook(array('name'=>"users-blocks-authblock:username",'title'=>$_prefixVariable4), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>

                                <span class="t-drop-account__name"><?php echo $_smarty_tpl->tpl_vars['current_user']->value['name'];?>
 <?php echo $_smarty_tpl->tpl_vars['current_user']->value['surname'];?>
</span>
                            <?php $_block_repeat1=false;
echo smarty_block_hook(array('name'=>"users-blocks-authblock:username",'title'=>$_prefixVariable4), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>


                            <?php if ($_smarty_tpl->tpl_vars['use_personal_account']->value) {?>
                                <span class="t-drop-account__balance">Баланс:&nbsp;<?php ob_start();
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
echo "Блок авторизации:баланс";
$_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
$_prefixVariable5=ob_get_clean();
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('hook', array('name'=>"users-blocks-authblock:balance",'title'=>$_prefixVariable5));
$_block_repeat1=true;
echo smarty_block_hook(array('name'=>"users-blocks-authblock:balance",'title'=>$_prefixVariable5), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>

                                    <a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('shop-front-mybalance');?>
"><?php echo $_smarty_tpl->tpl_vars['current_user']->value->getBalance(true,true);?>
</a><?php $_block_repeat1=false;
echo smarty_block_hook(array('name'=>"users-blocks-authblock:balance",'title'=>$_prefixVariable5), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

                                </span>
                            <?php }?>

                            <ul class="t-drop-account__list">
                                <?php ob_start();
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
echo "Блок авторизации:пункты меню личного кабинета";
$_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
$_prefixVariable6=ob_get_clean();
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('hook', array('name'=>"users-blocks-authblock:cabinet-menu-items",'title'=>$_prefixVariable6));
$_block_repeat1=true;
echo smarty_block_hook(array('name'=>"users-blocks-authblock:cabinet-menu-items",'title'=>$_prefixVariable6), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>

                                    <li class="item"><a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('users-front-profile');?>
"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat2=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat2);
while ($_block_repeat2) {
ob_start();
?>
Профиль<?php $_block_repeat2=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat2);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
                                    <li class="item"><a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('shop-front-myorders');?>
"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat2=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat2);
while ($_block_repeat2) {
ob_start();
?>
Мои заказы<?php $_block_repeat2=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat2);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
                                    <?php if ($_smarty_tpl->tpl_vars['return_enable']->value) {?>
                                        <li class="item"><a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('shop-front-myproductsreturn');?>
"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat2=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat2);
while ($_block_repeat2) {
ob_start();
?>
Мои возвраты<?php $_block_repeat2=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat2);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
                                    <?php }?>
                                    <?php if ($_smarty_tpl->tpl_vars['use_personal_account']->value) {?>
                                        <li class="item"><a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('shop-front-mybalance');?>
"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat2=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat2);
while ($_block_repeat2) {
ob_start();
?>
Лицевой счет<?php $_block_repeat2=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat2);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></li>
                                    <?php }?>
                                <?php $_block_repeat1=false;
echo smarty_block_hook(array('name'=>"users-blocks-authblock:cabinet-menu-items",'title'=>$_prefixVariable6), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

                            </ul>
                            <div class="t-drop-account__logout">
                                <a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('users-front-auth',array('Act'=>'logout'));?>
" class="t-drop-account__logout-exit">
                                    <div class="t-drop-account__logout-icon">
                                        <svg id="Capa_1" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewbox="0 0 384.971 384.971" style="enable-background:new 0 0 384.971 384.971;"
                                            xml:space="preserve"><g><g id="Sign_Out"><path d="M180.455,360.91H24.061V24.061h156.394c6.641,0,12.03-5.39,12.03-12.03s-5.39-12.03-12.03-12.03H12.03C5.39,0.001,0,5.39,0,12.031V372.94c0,6.641,5.39,12.03,12.03,12.03h168.424c6.641,0,12.03-5.39,12.03-12.03C192.485,366.299,187.095,360.91,180.455,360.91z"></path><path d="M381.481,184.088l-83.009-84.2c-4.704-4.752-12.319-4.74-17.011,0c-4.704,4.74-4.704,12.439,0,17.179l62.558,63.46H96.279c-6.641,0-12.03,5.438-12.03,12.151c0,6.713,5.39,12.151,12.03,12.151h247.74l-62.558,63.46c-4.704,4.752-4.704,12.439,0,17.179c4.704,4.752,12.319,4.752,17.011,0l82.997-84.2C386.113,196.588,386.161,188.756,381.481,184.088z"></path></g></g></svg></div>
                                    <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Выйти<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a>
                            </div>
                        </div>
                    </div>
                    <div class="icon-account">
                        <i class="i-svg i-svg-user"></i>
                    </div>
                <?php } else { ?>
                    <div class="icon-account">
                        <a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('users-front-auth',array('referer'=>$_smarty_tpl->tpl_vars['referer']->value));?>
" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Войти или зарегистрироваться<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
" class="rs-in-dialog">
                            <i class="i-svg i-svg-user"></i></a>
                    </div>
                <?php }?>
            </div>
        </div>
    </div>
</div><?php }
}
