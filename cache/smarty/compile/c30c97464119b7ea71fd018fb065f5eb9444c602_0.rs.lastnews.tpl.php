<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:37
  from "C:\OpenServer\domains\READYSCRIPTTEST\templates\flatlines\moduleview\article\blocks\lastnews\lastnews.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117b99f6335_05291646',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'c30c97464119b7ea71fd018fb065f5eb9444c602' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\templates\\flatlines\\moduleview\\article\\blocks\\lastnews\\lastnews.tpl',
      1 => 1549608255,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
    'rs:%THEME%/block_stub.tpl' => 1,
  ),
),false)) {
function content_5c6117b99f6335_05291646 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_modifier_dateformat')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\modifier.dateformat.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
?>


<?php if ($_smarty_tpl->tpl_vars['category']->value && $_smarty_tpl->tpl_vars['news']->value) {?>
    <section class="sec sec-news">
        <div class="title anti-container">
            <div class="container-fluid">
                <a class="title-text" href="<?php echo $_smarty_tpl->tpl_vars['router']->value->getUrl('article-front-previewlist',array('category'=>$_smarty_tpl->tpl_vars['category']->value->getUrlId()));?>
"><?php echo $_smarty_tpl->tpl_vars['category']->value['title'];?>
</a>
            </div>
        </div>

        <?php $_smarty_tpl->_assignInScope('has_big', $_smarty_tpl->tpl_vars['news']->value[0]['image']);
?>
        <div class="clearfix row-news">
                <?php if ($_smarty_tpl->tpl_vars['has_big']->value) {?>
                    <div class="col-xs-12 col-md-6">
                        <?php $_smarty_tpl->_assignInScope('item', $_smarty_tpl->tpl_vars['news']->value[0]);
?>
                        <div class="news news-block" <?php echo $_smarty_tpl->tpl_vars['item']->value->getDebugAttributes();?>
>
                            <div class="news-image">
                                <a href="<?php echo $_smarty_tpl->tpl_vars['item']->value->getUrl();?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['item']->value['__image']->getUrl(750,300);?>
" alt="<?php echo $_smarty_tpl->tpl_vars['item']->value['title'];?>
"></a>
                            </div>
                            <div class="news-text">
                                <div class="news-block_publisher"><small><?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['item']->value['dateof'],"%d %v %Y, %H:%M");?>
</small></div>
                                <div class="news-block_title"><a href="<?php echo $_smarty_tpl->tpl_vars['item']->value->getUrl();?>
"><span><?php echo $_smarty_tpl->tpl_vars['item']->value['title'];?>
</span></a></div>
                                <div class="news-block_description">
                                    <?php echo $_smarty_tpl->tpl_vars['item']->value->getPreview();?>

                                </div>
                                <div class="news-block_link"><a href="<?php echo $_smarty_tpl->tpl_vars['item']->value->getUrl();?>
" class="link link-more"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Подробнее<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></div>
                            </div>
                        </div>
                    </div>
                <?php }?>

                <?php if ($_smarty_tpl->tpl_vars['has_big']->value) {?>
                    
                    <?php $_smarty_tpl->_assignInScope('chunked_news', array_chunk(array_slice($_smarty_tpl->tpl_vars['news']->value,1,3),3));
?>
                <?php } else { ?>
                    
                    <?php $_smarty_tpl->_assignInScope('chunked_news', array_chunk(array_slice($_smarty_tpl->tpl_vars['news']->value,0,6),3));
?>
                <?php }?>

                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['chunked_news']->value, 'chunk', false, 'n');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['n']->value => $_smarty_tpl->tpl_vars['chunk']->value) {
?>
                    <div class="col-xs-12 col-md-6">
                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['chunk']->value, 'item');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
?>
                            <div class="news news-list" <?php echo $_smarty_tpl->tpl_vars['item']->value->getDebugAttributes();?>
>
                                <div class="news-text">
                                    <div class="news-block_publisher"><small><?php echo smarty_modifier_dateformat($_smarty_tpl->tpl_vars['item']->value['dateof'],"%d %v %Y, %H:%M");?>
</small></div>
                                    <div class="news-block_title"><a href="<?php echo $_smarty_tpl->tpl_vars['item']->value->getUrl();?>
"><span><?php echo $_smarty_tpl->tpl_vars['item']->value['title'];?>
</span></a></div>
                                    <div class="news-block_description">
                                        <?php echo $_smarty_tpl->tpl_vars['item']->value->getPreview();?>

                                    </div>
                                    <div class="news-block_link"><a href="<?php echo $_smarty_tpl->tpl_vars['item']->value->getUrl();?>
" class="link link-more"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Подробнее<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a></div>
                                </div>
                            </div>
                        <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                    </div>
                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

        </div>
    </section>

<?php } else { ?>
    <div class="col-padding">
        <?php ob_start();
echo smarty_function_adminUrl(array('do'=>false,'mod_controller'=>"article-ctrl"),$_smarty_tpl);
$_prefixVariable18=ob_get_clean();
ob_start();
echo $_smarty_tpl->tpl_vars['this_controller']->value->getSettingUrl();
$_prefixVariable19=ob_get_clean();
$_smarty_tpl->_subTemplateRender("rs:%THEME%/block_stub.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('class'=>"blockLastNews",'do'=>array(array('title'=>t("Добавьте категорию с новостями"),'href'=>$_prefixVariable18),array('title'=>t("Настройте блок"),'href'=>$_prefixVariable19,'class'=>'crud-add'))), 0, false);
?>

    </div>
<?php }
}
}
