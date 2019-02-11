<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:32
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\system\admin\body.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b4212e25_73199734',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '44a904c55390fe3517ce426f31ce7920fe3bcd32' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\system\\admin\\body.tpl',
      1 => 1549608261,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b4212e25_73199734 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_function_addmeta')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addmeta.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_function_meter')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.meter.php';
if (!is_callable('smarty_function_moduleinsert')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.moduleinsert.php';
if (!is_callable('smarty_function_modulegetvars')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.modulegetvars.php';
if (!is_callable('smarty_modifier_teaser')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\modifier.teaser.php';
echo smarty_function_addjs(array('file'=>"jquery.rs.autotranslit.js"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"jquery.rs.messenger.js"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"jstour/jquery.tour.engine.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"jstour/jquery.tour.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"%main%/jquery.rsnews.js"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"jquery.rs.admindebug.js"),$_smarty_tpl);?>


<?php echo smarty_function_addcss(array('file'=>"flatadmin/readyscript.ui/jquery-ui.css",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"flatadmin/app.css",'basepath'=>"common",'no_compress'=>true),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"flatadmin/iconic-font/css/material-design-iconic-font.min.css",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"common/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"common/tour.css",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"common/animate.css",'basepath'=>"common"),$_smarty_tpl);?>


<?php echo smarty_function_addjs(array('file'=>"jquery.min.js",'name'=>"jquery",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"dialog-options/jquery.dialogoptions.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"bootstrap/bootstrap.min.js",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js",'basepath'=>"common"),$_smarty_tpl);?>


<?php if (strstr($_SERVER['HTTP_USER_AGENT'],'iPad')) {?>
    <?php echo smarty_function_addmeta(array('name'=>"viewport",'content'=>"width=device-width, initial-scale=1, maximum-scale=1"),$_smarty_tpl);?>

<?php } else { ?>
    <?php echo smarty_function_addmeta(array('name'=>"viewport",'content'=>"width=device-width, initial-scale=0.75, maximum-scale=0.75"),$_smarty_tpl);?>

<?php }?>

<?php echo $_smarty_tpl->tpl_vars['app']->value->setBodyClass('admin-body admin-style');?>

<header id="header" class="clearfix" data-spy="affix" data-offset-top="65">
    <ul class="header-inner">
        <li class="rs-logo">
            <a href="<?php echo smarty_function_adminUrl(array('mod_controller'=>false,'do'=>false),$_smarty_tpl);?>
" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
на&nbsp;главную<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
" data-placement="right"></a>
            <div id="menu-trigger"><i class="zmdi zmdi-menu"></i></div>
        </li>
        
        <li class="header-panel">
            <div class="viewport">
                <div class="fixed-tools">
                    <a href="<?php echo smarty_function_adminUrl(array('mod_controller'=>false,'do'=>false),$_smarty_tpl);?>
" class="to-main">
                        <i class="rs-icon rs-black-logo"></i><br>
                        <span><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
главная<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
                    </a>

                    <a href="<?php echo $_smarty_tpl->tpl_vars['site_root_url']->value;?>
" class="to-site">
                        <i class="rs-icon rs-icon-view"></i><br>
                        <span><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
на сайт<?php $_block_repeat1=false;
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
                </div>

                <div class="float-tools">
                    <div class="dropdown rs-meter-group">
                        <a class="toggle visible-xs-inline-block" data-toggle="dropdown" id="floatTools" aria-haspopup="true">
                            <i class="zmdi zmdi-more-vert"><?php echo smarty_function_meter(array(),$_smarty_tpl);?>
</i>
                        </a>
                        <ul class="ft-dropdown-menu" aria-labelledby="floatTools">
                            <?php echo smarty_function_moduleinsert(array('name'=>"\Main\Controller\Admin\Block\HeaderPanel",'indexTemplate'=>"%main%/adminblocks/headerpanel/header_panel_items.tpl"),$_smarty_tpl,'C:\OpenServer\domains\READYSCRIPTTEST\templates\system\admin\body.tpl');?>

                            <?php echo smarty_function_moduleinsert(array('name'=>"\Main\Controller\Admin\Block\RsAlerts"),$_smarty_tpl,'C:\OpenServer\domains\READYSCRIPTTEST\templates\system\admin\body.tpl');?>

                            <?php echo smarty_function_moduleinsert(array('name'=>"\Main\Controller\Admin\Block\RsNews"),$_smarty_tpl,'C:\OpenServer\domains\READYSCRIPTTEST\templates\system\admin\body.tpl');?>


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

<aside id="sidebar">
    <?php if ($_COOKIE['rsAdminSideMenu']) {
echo $_smarty_tpl->tpl_vars['app']->value->setBodyClass('closed',true);
}?>
    <?php echo smarty_function_modulegetvars(array('name'=>"\Site\Controller\Admin\BlockSelectSite",'var'=>"sites"),$_smarty_tpl);?>


    <ul class="side-menu rs-site-manager">
        <li class="sm-node">
            <a class="current">
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['sites']->value['sites'], 'site');
$_smarty_tpl->tpl_vars['site']->iteration = 0;
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['site']->value) {
$_smarty_tpl->tpl_vars['site']->iteration++;
$__foreach_site_7_saved = $_smarty_tpl->tpl_vars['site'];
?>
                    <?php if ($_smarty_tpl->tpl_vars['site']->value['id'] == $_smarty_tpl->tpl_vars['sites']->value['current']['id']) {?>
                        <span class="number"><?php echo $_smarty_tpl->tpl_vars['site']->iteration;?>
</span>
                        <span class="domain"><?php echo smarty_modifier_teaser($_smarty_tpl->tpl_vars['sites']->value['current']['title'],"27");?>
</span>
                    <?php }?>
                <?php
$_smarty_tpl->tpl_vars['site'] = $__foreach_site_7_saved;
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                <span class="caret"></span>
            </a>
            <div class="sm">
                <div class="sm-head">
                    <a class="menu-close"><i class="zmdi zmdi-close"></i></a>
                    <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Выберите сайт<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

                </div>
                <div class="sm-body">
                    <ul>
                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['sites']->value['sites'], 'site');
$_smarty_tpl->tpl_vars['site']->iteration = 0;
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['site']->value) {
$_smarty_tpl->tpl_vars['site']->iteration++;
$__foreach_site_8_saved = $_smarty_tpl->tpl_vars['site'];
?>
                        <li>
                            <li <?php if ($_smarty_tpl->tpl_vars['sites']->value['current']['id'] == $_smarty_tpl->tpl_vars['site']->value['id']) {?>class="active"<?php }?>>
                                <a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('main.admin',array('Act'=>'changeSite','site'=>$_smarty_tpl->tpl_vars['site']->value['id']));?>
"><?php echo $_smarty_tpl->tpl_vars['site']->iteration;?>
. <?php echo $_smarty_tpl->tpl_vars['site']->value['title'];?>
</a>
                            </li>
                        </li>
                        <?php
$_smarty_tpl->tpl_vars['site'] = $__foreach_site_8_saved;
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                    </ul>
                </div>
            </div>
        </li>
    </ul>
    
    <div class="side-scroll">
        <?php echo smarty_function_moduleinsert(array('name'=>"\Menu\Controller\Admin\View"),$_smarty_tpl,'C:\OpenServer\domains\READYSCRIPTTEST\templates\system\admin\body.tpl');?>


        <?php if (\RS\Module\Manager::staticModuleExists('marketplace')) {?>
        <ul class="side-menu side-utilites">
            <li>
                <a href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getAdminUrl(false,array(),'marketplace-ctrl');?>
">
                    <i class="rs-icon rs-icon-marketplace"></i>
                    <span class="title"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array('alias'=>"маркетплейс"));
$_block_repeat1=true;
echo smarty_block_t(array('alias'=>"маркетплейс"), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Маркет<span class="visible-open">плейс</span><?php $_block_repeat1=false;
echo smarty_block_t(array('alias'=>"маркетплейс"), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
                </a>
            </li>
        </ul>
        <?php }?>
    </div>

    <a class="side-collapse" data-toggle-class="closed" data-target="body" data-toggle-cookie="rsAdminSideMenu">
        <i class="rs-icon rs-icon-back"></i>
        <span class="text"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Свернуть меню<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
    </a>
</aside>

<section id="content">
    <?php echo smarty_function_moduleinsert(array('name'=>"\Main\Controller\Admin\Block\RsVisibleAlerts"),$_smarty_tpl,'C:\OpenServer\domains\READYSCRIPTTEST\templates\system\admin\body.tpl');?>

    <?php echo $_smarty_tpl->tpl_vars['app']->value->blocks->getMainContent();?>

</section><?php }
}
