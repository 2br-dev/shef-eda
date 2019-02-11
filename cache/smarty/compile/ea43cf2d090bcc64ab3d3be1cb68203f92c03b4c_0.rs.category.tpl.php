<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\catalog\blocks\category\category.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b96cc8e9_20943295',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ea43cf2d090bcc64ab3d3be1cb68203f92c03b4c' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\catalog\\blocks\\category\\category.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%THEME%/block_stub.tpl' => 1,
  ),
),false)) {
function content_5c6117b96cc8e9_20943295 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_block_hook')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.hook.php';
if (!is_callable('smarty_function_moduleinsert')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.moduleinsert.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
?>


<?php echo smarty_function_addjs(array('file'=>"libs/jquery.mmenu.min.js"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"libs/jquery.mmenu.css"),$_smarty_tpl);?>



<?php if ($_smarty_tpl->tpl_vars['dirlist']->value) {?>
<nav>
    <ul class="nav navbar-nav">
        <?php ob_start();
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
echo "Доплнительные пункты меню, в меню каталога";
$_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
$_prefixVariable7=ob_get_clean();
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('hook', array('name'=>"catalog-blocks-category-category:list-item",'title'=>$_prefixVariable7));
$_block_repeat1=true;
echo smarty_block_hook(array('name'=>"catalog-blocks-category-category:list-item",'title'=>$_prefixVariable7), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>

        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['dirlist']->value, 'dir');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['dir']->value) {
?>
        <li class="<?php if (!empty($_smarty_tpl->tpl_vars['dir']->value['child'])) {?> t-dropdown<?php }?>" <?php echo $_smarty_tpl->tpl_vars['dir']->value['fields']->getDebugAttributes();?>
>
            
            <a <?php echo $_smarty_tpl->tpl_vars['dir']->value['fields']->getDebugAttributes();?>
 href="<?php echo $_smarty_tpl->tpl_vars['dir']->value['fields']->getUrl();?>
"><?php echo $_smarty_tpl->tpl_vars['dir']->value['fields']['name'];?>
</a>

            <?php if (!empty($_smarty_tpl->tpl_vars['dir']->value['child'])) {?>
                
                <div class="t-dropdown-menu">
                    <div class="container-fluid">
                        <div class="t-nav-catalog-list__inner">
                            <div class="t-close"><i class="pe-2x pe-7s-close-circle"></i></div>
                            <div class="t-nav-catalog-list__scene">

                                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['dir']->value['child'], 'subdir');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['subdir']->value) {
?>
                                    <div class="t-nav-catalog-list-block">
                                        <a <?php echo $_smarty_tpl->tpl_vars['subdir']->value['fields']->getDebugAttributes();?>
 href="<?php echo $_smarty_tpl->tpl_vars['subdir']->value['fields']->getUrl();?>
" class="t-nav-catalog-list-block__header"><?php echo $_smarty_tpl->tpl_vars['subdir']->value['fields']['name'];?>
</a>

                                        
                                        <?php if (!empty($_smarty_tpl->tpl_vars['subdir']->value['child'])) {?>
                                        <ul class="t-nav-catalog-list-block__list">
                                            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['subdir']->value['child'], 'subdir2');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['subdir2']->value) {
?>
                                                <li><a <?php echo $_smarty_tpl->tpl_vars['subdir2']->value['fields']->getDebugAttributes();?>
 href="<?php echo $_smarty_tpl->tpl_vars['subdir2']->value['fields']->getUrl();?>
" class="t-nav-catalog-list-block__link"><?php echo $_smarty_tpl->tpl_vars['subdir2']->value['fields']['name'];?>
</a></li>
                                            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                                        </ul>
                                        <?php }?>
                                    </div>
                                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>


                        </div>
                    </div>
                </div>
                </div>
            <?php }?>
        </li>
        <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

        <?php $_block_repeat1=false;
echo smarty_block_hook(array('name'=>"catalog-blocks-category-category:list-item",'title'=>$_prefixVariable7), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

    </ul>
</nav>



<nav id="mmenu" class="hidden">
    <ul>
        <li>
            <?php echo smarty_function_moduleinsert(array('name'=>"\Catalog\Controller\Block\SearchLine",'hideAutoComplete'=>true),$_smarty_tpl,'C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\catalog\blocks\category\category.tpl');?>

        </li>
        <?php ob_start();
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
echo "Доплнительные пункты меню, в меню каталога - мобильная версия";
$_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);
$_prefixVariable8=ob_get_clean();
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('hook', array('name'=>"catalog-blocks-category-category:list-item-mobile",'title'=>$_prefixVariable8));
$_block_repeat1=true;
echo smarty_block_hook(array('name'=>"catalog-blocks-category-category:list-item-mobile",'title'=>$_prefixVariable8), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>

        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['dirlist']->value, 'dir');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['dir']->value) {
?>
            <li>
                <a href="<?php echo $_smarty_tpl->tpl_vars['dir']->value['fields']->getUrl();?>
"><?php echo $_smarty_tpl->tpl_vars['dir']->value['fields']['name'];?>
</a>
                <?php if (!empty($_smarty_tpl->tpl_vars['dir']->value['child'])) {?>
                    <ul>
                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['dir']->value['child'], 'subdir');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['subdir']->value) {
?>
                            <li>
                                <a href="<?php echo $_smarty_tpl->tpl_vars['subdir']->value['fields']->getUrl();?>
"><?php echo $_smarty_tpl->tpl_vars['subdir']->value['fields']['name'];?>
</a>
                            </li>
                        <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                    </ul>
                <?php }?>
            </li>
        <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

        <?php $_block_repeat1=false;
echo smarty_block_hook(array('name'=>"catalog-blocks-category-category:list-item-mobile",'title'=>$_prefixVariable8), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

    </ul>
</nav>


<?php } else { ?>
    <div class="col-padding">
        <?php ob_start();
echo smarty_function_adminUrl(array('do'=>false,'mod_controller'=>"catalog-ctrl"),$_smarty_tpl);
$_prefixVariable9=ob_get_clean();
$_smarty_tpl->_subTemplateRender("rs:%THEME%/block_stub.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('class'=>"text-center white block-category",'do'=>array(array('title'=>t("Добавьте категории товаров"),'href'=>$_prefixVariable9))), 0, false);
?>

    </div>
<?php }
}
}
