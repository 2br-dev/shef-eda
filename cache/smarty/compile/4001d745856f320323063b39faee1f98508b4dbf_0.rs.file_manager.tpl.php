<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:32
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\templates\view\file_manager.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b409fe67_07635542',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4001d745856f320323063b39faee1f98508b4dbf' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\templates\\view\\file_manager.tpl',
      1 => 1549608241,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117b409fe67_07635542 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_function_addjs')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addjs.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
echo smarty_function_addcss(array('file'=>"%templates%/uploadfiles.css"),$_smarty_tpl);?>

<?php echo smarty_function_addcss(array('file'=>"common/lightgallery/css/lightgallery.min.css",'basepath'=>"common"),$_smarty_tpl);?>

<?php echo smarty_function_addjs(array('file'=>"lightgallery/lightgallery-all.min.js",'basepath'=>"common"),$_smarty_tpl);?>


<?php echo smarty_function_addjs(array('file'=>((string)$_smarty_tpl->tpl_vars['mod_js']->value)."tplmanager.js",'basepath'=>"root"),$_smarty_tpl);?>


<div class="common-column viewport tmanager">
    <div class="margvert10">
            <div class="category-filter dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <?php if ($_smarty_tpl->tpl_vars['list']->value['epath']['type'] == 'theme') {?>
                   <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Тема<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
:<?php echo $_smarty_tpl->tpl_vars['root_sections']->value['themes'][$_smarty_tpl->tpl_vars['list']->value['epath']['type_value']]['title'];?>

                <?php } else { ?>
                   <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Модуль<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
:<?php echo $_smarty_tpl->tpl_vars['root_sections']->value['modules'][$_smarty_tpl->tpl_vars['list']->value['epath']['type_value']]['title'];?>

                <?php }?>
                <span class="caret"></span></button>

                <ul class="dropdown-menu" aria-labelledby="dropdownMenu2" style="max-height:400px; overflow:auto;">
                   <li class="dropdown-header"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Темы<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</li>
                   <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['root_sections']->value['themes'], 'item', false, 'key');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['key']->value => $_smarty_tpl->tpl_vars['item']->value) {
?>
                       <li><a class="call-update" href="<?php echo smarty_function_adminUrl(array('mod_controller'=>"templates-filemanager",'path'=>"theme:".((string)$_smarty_tpl->tpl_vars['key']->value)),$_smarty_tpl);?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['title'];?>
</a></li>
                   <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>


                   <li class="dropdown-header"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Модули<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</li>
                   <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['root_sections']->value['modules'], 'item', false, 'key');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['key']->value => $_smarty_tpl->tpl_vars['item']->value) {
?>
                       <li><a class="call-update" href="<?php echo smarty_function_adminUrl(array('mod_controller'=>"templates-filemanager",'path'=>"module:".((string)$_smarty_tpl->tpl_vars['key']->value)),$_smarty_tpl);?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['title'];?>
</a></li>
                   <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                </ul>
            </div>

            <div class="folderpath">
                <a class="root call-update" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
корневая папка<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
" href="<?php echo smarty_function_adminUrl(array('mod_controller'=>"templates-filemanager",'path'=>((string)$_smarty_tpl->tpl_vars['list']->value['epath']['type']).":".((string)$_smarty_tpl->tpl_vars['list']->value['epath']['type_value'])."/"),$_smarty_tpl);?>
"></a>
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value['epath']['sections'], 'section', false, 'key', 'fp', array (
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['key']->value => $_smarty_tpl->tpl_vars['section']->value) {
?>
                    <a class="call-update" href="<?php echo smarty_function_adminUrl(array('mod_controller'=>"templates-filemanager",'path'=>((string)$_smarty_tpl->tpl_vars['key']->value)),$_smarty_tpl);?>
"><?php echo $_smarty_tpl->tpl_vars['section']->value;?>
</a> /
                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                <span class="filetypes">*.<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value['allow_extension'], 'one_ext', false, NULL, 'extlist', array (
  'first' => true,
  'index' => true,
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['one_ext']->value) {
$_smarty_tpl->tpl_vars['__smarty_foreach_extlist']->value['index']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_extlist']->value['first'] = !$_smarty_tpl->tpl_vars['__smarty_foreach_extlist']->value['index'];
if (!(isset($_smarty_tpl->tpl_vars['__smarty_foreach_extlist']->value['first']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_extlist']->value['first'] : null)) {?>,<?php }
echo $_smarty_tpl->tpl_vars['one_ext']->value;
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>
</span>
            </div>
    </div>

    <?php if ($_smarty_tpl->tpl_vars['list']->value['items'] || $_smarty_tpl->tpl_vars['list']->value['epath']['sections']) {?>
        <div class="file-list-container" data-current-folder="<?php echo $_smarty_tpl->tpl_vars['list']->value['epath']['public_dir'];?>
">
            <ul class="file-list">
                <?php if ($_smarty_tpl->tpl_vars['list']->value['epath']['sections']) {?>
                    <li class="dir"><a class="call-update" href="<?php echo smarty_function_adminUrl(array('mod_controller'=>"templates-filemanager",'path'=>$_smarty_tpl->tpl_vars['list']->value['epath']['parent']),$_smarty_tpl);?>
">..&nbsp;&nbsp;</a></li>
                <?php }?>
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value['items'], 'item');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
?>
                    <?php if ($_smarty_tpl->tpl_vars['item']->value['type'] == 'dir') {?>
                        <li class="item dir" data-path="<?php echo $_smarty_tpl->tpl_vars['item']->value['link'];?>
" data-name="<?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
">
                            <div class="name">
                                <a class="call-update" href="<?php echo smarty_function_adminUrl(array('mod_controller'=>"templates-filemanager",'path'=>$_smarty_tpl->tpl_vars['item']->value['link']),$_smarty_tpl);?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</a>
                            </div>
                            <span class="tools">
                                <a class="rename" data-old-value="<?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
" data-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"templates-filemanager",'do'=>"rename",'path'=>$_smarty_tpl->tpl_vars['item']->value['link']),$_smarty_tpl);?>
" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
переименовать<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"><i class="zmdi zmdi-comment-edit"></i></a>
                                <a class="delete" href="<?php echo smarty_function_adminUrl(array('mod_controller'=>"templates-filemanager",'do'=>"delete",'path'=>$_smarty_tpl->tpl_vars['item']->value['link']),$_smarty_tpl);?>
" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
удалить<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"><i class="zmdi zmdi-delete"></i></a>
                            </span>
                        </li>
                    <?php } else { ?>
                         <li class="item file <?php echo $_smarty_tpl->tpl_vars['item']->value['ext'];?>
" data-path="<?php echo $_smarty_tpl->tpl_vars['item']->value['link'];?>
" data-name="<?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
.<?php echo $_smarty_tpl->tpl_vars['item']->value['ext'];?>
">
                            <div class="name">
                                <?php if (isset($_smarty_tpl->tpl_vars['allow_edit_ext']->value[$_smarty_tpl->tpl_vars['item']->value['ext']])) {?>
                                    <a class="crud-edit" href="<?php echo smarty_function_adminUrl(array('mod_controller'=>"templates-filemanager",'do'=>"edit",'path'=>$_smarty_tpl->tpl_vars['item']->value['path'],'file'=>$_smarty_tpl->tpl_vars['item']->value['filename']),$_smarty_tpl);?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
.<span class="ext"><?php echo $_smarty_tpl->tpl_vars['item']->value['ext'];?>
</span></a>
                                <?php } else { ?>
                                    <a rel='lightbox-image-tour' href="<?php echo $_smarty_tpl->tpl_vars['list']->value['epath']['relative_rootpath'];?>
/<?php echo $_smarty_tpl->tpl_vars['item']->value['filename'];?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
.<span class="ext"><?php echo $_smarty_tpl->tpl_vars['item']->value['ext'];?>
</span></a>
                                <?php }?>
                            </div>
                            <span class="tools">
                                <a target="_blank" href="<?php echo smarty_function_adminUrl(array('mod_controller'=>"templates-filemanager",'do'=>"ajaxDownload",'path'=>$_smarty_tpl->tpl_vars['item']->value['link']),$_smarty_tpl);?>
" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
скачать<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"><i class="zmdi zmdi-download"></i></a>
                                <a class="rename" data-old-value="<?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
.<?php echo $_smarty_tpl->tpl_vars['item']->value['ext'];?>
" data-url="<?php echo smarty_function_adminUrl(array('mod_controller'=>"templates-filemanager",'do'=>"rename"),$_smarty_tpl);?>
" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
переименовать<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"><i class="zmdi zmdi-comment-edit"></i></a>
                                <a class="delete" href="<?php echo smarty_function_adminUrl(array('mod_controller'=>"templates-filemanager",'do'=>"delete",'path'=>$_smarty_tpl->tpl_vars['item']->value['link']),$_smarty_tpl);?>
" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
удалить<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"><i class="zmdi zmdi-delete"></i></a>
                            </span>
                        </li>
                    <?php }?>
                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

            </ul>
        </div>
    <?php } else { ?>
        <div class="empty-folder">
            <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Пустой каталог<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

        </div>
    <?php }?>
    <div class="footerspace"></div>
</div><?php }
}
