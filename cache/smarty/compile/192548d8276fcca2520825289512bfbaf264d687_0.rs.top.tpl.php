<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\system\debug\top.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b9c730f6_13690790',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '192548d8276fcca2520825289512bfbaf264d687' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\system\\debug\\top.tpl',
      1 => 1549608261,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b9c730f6_13690790 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_function_moduleinsert')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.moduleinsert.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
echo smarty_function_addjs(array('file'=>"jquery.min.js",'name'=>"jquery",'basepath'=>"common",'header'=>true),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"jquery.ui/jquery-ui.min.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"dialog-options/jquery.dialogoptions.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"bootstrap/bootstrap.min.js",'name'=>"bootstrap",'basepath'=>"common"),$_smarty_tpl);?>


<?php echo smarty_function_addjs(array('file'=>"lab/lab.min.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"jquery.rs.admindebug.js",'basepath'=>"common"),$_smarty_tpl);?>


<?php echo smarty_function_addjs(array('file'=>"jquery.datetimeaddon/jquery.datetimeaddon.min.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"jquery.rs.debug.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"jquery.rs.ormobject.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"jquery.cookie/jquery.cookie.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"jquery.form/jquery.form.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"jstour/jquery.tour.engine.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"jstour/jquery.tour.js",'basepath'=>"common"),$_smarty_tpl);?>


<?php echo smarty_function_addcss(array('file'=>"flatadmin/iconic-font/css/material-design-iconic-font.min.css",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"flatadmin/readyscript.ui/jquery-ui.css",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"flatadmin/app.css",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"common/animate.css",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"common/tour.css",'basepath'=>"common"),$_smarty_tpl);?>


<?php if ($_smarty_tpl->tpl_vars['this_controller']->value->getDebugGroup()) {?>
    <?php echo smarty_function_addcss(array('file'=>"flatadmin/debug.css",'basepath'=>"common"),$_smarty_tpl);?>

<?php }?>

<div id="debug-top-block" class="admin-style">
    <header id="header">
        <ul class="header-inner">
            <li class="rs-logo debug">
                <a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getRootUrl();?>
"></a>
            </li>

            <li class="header-panel">
                <div class="viewport">
                    <div class="fixed-tools">
                        <a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('main.admin');?>
" class="to-admin">
                            <i class="rs-icon rs-icon-admin"></i><br>
                            <span><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
управление<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
                        </a>

                        <a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('main.admin',array("Act"=>"cleanCache"));?>
" class="rs-clean-cache">
                            <i class="rs-icon rs-icon-refresh"></i><br>
                            <span><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
кэш<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
                        </a>

                        <div class="debug-mode-switcher">
                            <div data-url="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('main.admin',array('Act'=>'ajaxToggleDebug'));?>
" class="toggle-switch rs-switch <?php if ($_smarty_tpl->tpl_vars['this_controller']->value->getDebugGroup()) {?>on<?php }?>">
                                <label class="ts-helper"></label>
                            </div>
                            <p class="debugmode-text"><span class="hidden-xs"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
режим отладки<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span><span class="visible-xs"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
отладка<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span></p>
                        </div>
                    </div>

                    <div class="float-tools">
                        <div class="dropdown">
                            <a class="toggle visible-xs-inline-block" data-toggle="dropdown" id="floatTools" aria-haspopup="true"><i class="zmdi zmdi-more-vert"></i></a>

                            <ul class="ft-dropdown-menu" aria-labelledby="floatTools">
                                <?php echo smarty_function_moduleinsert(array('name'=>"\Main\Controller\Admin\Block\HeaderPanel",'public'=>true,'indexTemplate'=>"%main%/adminblocks/headerpanel/header_public_panel_items.tpl"),$_smarty_tpl,'C:\OpenServer\domains\READYSCRIPTTEST\templates\system\debug\top.tpl');?>

                                <li>
                                    <a class="hidden-xs action start-tour" data-tour-id="welcome" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Обучение<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
">
                                        <i class="rs-icon rs-icon-tour"></i>
                                        <span><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Обучение<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
                                    </a>
                                </li>
                                <li class="ft-hover-node">
                                    <a href="<?php echo smarty_function_adminUrl(array('mod_controller'=>"users-ctrl",'do'=>"edit",'id'=>$_smarty_tpl->tpl_vars['current_user']->value['id']),$_smarty_tpl);?>
">
                                        <i class="rs-icon rs-icon-user"></i>
                                        <span><?php echo $_smarty_tpl->tpl_vars['current_user']->value->getFio();?>
</span>
                                    </a>

                                    <ul class="ft-sub">
                                        <li>
                                            <a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('main.admin',array('Act'=>'logout'));?>
">
                                                <i class="rs-icon zmdi zmdi-power"></i>
                                                <span><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Выход<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
                                            </a>
                                        </li>
                                    </ul>

                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </header>
</div>
<?php echo $_smarty_tpl->tpl_vars['result_html']->value;
}
}
