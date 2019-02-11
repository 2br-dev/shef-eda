<?php
/* Smarty version 3.1.30, created on 2019-02-11 09:35:41
  from "C:\OpenServer\domains\READYSCRIPTTEST\modules\antivirus\view\widget\state_info.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5c6117bdc58760_47649158',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '89e72d519457219f88f7ffcf4668af9057e03307' => 
    array (
      0 => 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\modules\\antivirus\\view\\widget\\state_info.tpl',
      1 => 1549608194,
      2 => 'rs',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c6117bdc58760_47649158 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_addcss')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.addcss.php';
if (!is_callable('smarty_function_adminUrl')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\function.adminUrl.php';
if (!is_callable('smarty_block_t')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\rsplugins\\block.t.php';
if (!is_callable('smarty_modifier_date_format')) require_once 'C:\\OpenServer\\domains\\READYSCRIPTTEST\\core\\smarty\\plugins\\modifier.date_format.php';
echo smarty_function_addcss(array('file'=>((string)$_smarty_tpl->tpl_vars['mod_css']->value)."stateinfo.css",'basepath'=>"root"),$_smarty_tpl);?>

<div class="stateinfo"
     data-refresh-url="<?php echo $_smarty_tpl->tpl_vars['refresh_url']->value;?>
"
     data-intensive="<?php if ($_smarty_tpl->tpl_vars['integrity']->value['is_intensive'] || $_smarty_tpl->tpl_vars['antivirus']->value['is_intensive']) {?>1<?php } else { ?>0<?php }?>">
    <?php if ($_smarty_tpl->tpl_vars['is_cron_work']->value) {?>
        <div class="stateinfo-checksum">
            <?php if ($_smarty_tpl->tpl_vars['integrity']->value['is_intensive']) {?>
                <div class="scan">
                    <div class="progress" style="width:<?php echo $_smarty_tpl->tpl_vars['integrity']->value['progress'];?>
%;"></div>
                    <div class="actions">
                        <a href="<?php echo smarty_function_adminUrl(array('avdo'=>"disableIntegrityIntensiveMode",'mod_controller'=>"antivirus-widget-stateinfo"),$_smarty_tpl);?>
"
                           class="call-update no-update-hash stateinfo-button gray-fill"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Стоп<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a>
                    </div>
                    <div class="info">
                        <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array('current'=>$_smarty_tpl->tpl_vars['integrity']->value['global_position'],'total'=>$_smarty_tpl->tpl_vars['integrity']->value['total_files_count']));
$_block_repeat1=true;
echo smarty_block_t(array('current'=>$_smarty_tpl->tpl_vars['integrity']->value['global_position'],'total'=>$_smarty_tpl->tpl_vars['integrity']->value['total_files_count']), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
<span class="big-text">Идет полная проверка файлов</span><span class="small-text">Проверено</span> <span>%current из %total</span><?php $_block_repeat1=false;
echo smarty_block_t(array('current'=>$_smarty_tpl->tpl_vars['integrity']->value['global_position'],'total'=>$_smarty_tpl->tpl_vars['integrity']->value['total_files_count']), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

                    </div>
                </div>
            <?php } else { ?>
                <?php if ($_smarty_tpl->tpl_vars['integrity']->value['unread_event_count']) {?>
                    <!-- Проблема -->
                    <div class="problem">
                        <div class="actions">
                            <a href="<?php echo $_smarty_tpl->tpl_vars['integrity']->value['event_list_url'];?>
" class="report" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
отчет<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></a>
                        </div>
                        <div class="problem-info">
                            <p><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Обнаружено измененных файлов:<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
 <?php echo $_smarty_tpl->tpl_vars['integrity']->value['unread_event_count'];?>
</p>
                            <a href="<?php echo $_smarty_tpl->tpl_vars['integrity']->value['event_list_url'];?>
" class="stateinfo-button white-fill"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
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
                            <a href="<?php echo smarty_function_adminUrl(array('avdo'=>"readIntegrityEvents",'mod_controller'=>"antivirus-widget-stateinfo"),$_smarty_tpl);?>
" class="call-update no-update-hash stateinfo-button white-border"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Скрыть<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a>
                        </div>
                    </div>
                <?php } else { ?>
                    <!-- Информация -->
                    <div class="information">
                        <div class="state">
                            <i class="ok" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Целостность файлов в норме<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></i>
                        </div>
                        <div class="section">
                            <div class="title"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Целостность файлов<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</div>
                            <?php if ($_smarty_tpl->tpl_vars['integrity']->value['completed']) {?>
                                <div class="last-cycle">
                                    <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Последняя проверка<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
 <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['integrity']->value['completed'],"d.m.Y H:i");?>

                                </div>
                            <?php }?>
                        </div>
                        <div class="actions">
                            <a href="<?php echo smarty_function_adminUrl(array('avdo'=>"enableIntegrityIntensiveMode",'mod_controller'=>"antivirus-widget-stateinfo"),$_smarty_tpl);?>
" class="run call-update no-update-hash" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Запустить полную проверку<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></a>
                            <a href="<?php echo $_smarty_tpl->tpl_vars['integrity']->value['event_list_url'];?>
" class="report" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Показать отчет<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></a>
                        </div>
                    </div>
                <?php }?>
            <?php }?>
        </div>


        <div class="stateinfo-proactive">

            <?php if ($_smarty_tpl->tpl_vars['proactive']->value['unread_event_count']) {?>
                <!-- Проблема -->
                <div class="problem">
                    <div class="actions">
                        <a href="<?php echo $_smarty_tpl->tpl_vars['proactive']->value['event_list_url'];?>
" class="report" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Показать отчет<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></a>
                    </div>
                    <div class="problem-info">
                        <p>
                            <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array('alias'=>"Зафиксированы атаки",'val'=>$_smarty_tpl->tpl_vars['proactive']->value['unread_event_count'],'ips'=>$_smarty_tpl->tpl_vars['ctrl']->value->getIpCount()));
$_block_repeat1=true;
echo smarty_block_t(array('alias'=>"Зафиксированы атаки",'val'=>$_smarty_tpl->tpl_vars['proactive']->value['unread_event_count'],'ips'=>$_smarty_tpl->tpl_vars['ctrl']->value->getIpCount()), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>

                                [plural:%val:Зафиксирована|Зафиксировано|Зафиксировано] %val [plural:%val:атака|атаки|атак]
                                c %ipsxIP [plural:%ips:адреса|адресов|адресов]
                            <?php $_block_repeat1=false;
echo smarty_block_t(array('alias'=>"Зафиксированы атаки",'val'=>$_smarty_tpl->tpl_vars['proactive']->value['unread_event_count'],'ips'=>$_smarty_tpl->tpl_vars['ctrl']->value->getIpCount()), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

                            
                        </p>
                        <a href="<?php echo $_smarty_tpl->tpl_vars['proactive']->value['event_list_url'];?>
" class="stateinfo-button white-fill"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
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
                        <a href="<?php echo smarty_function_adminUrl(array('avdo'=>"readProactiveEvents",'mod_controller'=>"antivirus-widget-stateinfo"),$_smarty_tpl);?>
" class="call-update no-update-hash stateinfo-button white-border"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Скрыть<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a>
                    </div>
                </div>
            <?php } else { ?>
                <!-- Информация -->
                <div class="information">
                    <div class="state">
                        <i class="ok" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Атаки не обнаружены<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></i>
                    </div>
                    <div class="section">
                        <div class="title"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Атаки на сайт<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</div>
                    </div>
                    <div class="actions">
                        <a href="<?php echo $_smarty_tpl->tpl_vars['proactive']->value['event_list_url'];?>
" class="report" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Показать отчет<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></a>
                    </div>
                </div>
            <?php }?>

        </div>


        <div class="stateinfo-antivirus">
            <?php if ($_smarty_tpl->tpl_vars['antivirus']->value['unread_event_count']) {?>
                <!-- Проблема -->
                <div class="problem">
                    <div class="actions">
                        <a class="report" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Показать отчет<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></a>
                    </div>
                    <div class="problem-info">
                        <p><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Обнаружено зараженных файлов:<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
 <?php echo $_smarty_tpl->tpl_vars['antivirus']->value['unread_event_count'];?>
</p>
                        <a href="<?php echo $_smarty_tpl->tpl_vars['antivirus']->value['event_list_url'];?>
" class="stateinfo-button white-fill"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
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
                        <a href="<?php echo smarty_function_adminUrl(array('avdo'=>"readAntivirusEvents",'mod_controller'=>"antivirus-widget-stateinfo"),$_smarty_tpl);?>
" class="call-update no-update-hash stateinfo-button white-border"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Скрыть<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a>
                    </div>
                </div>
            <?php } else { ?>
                <?php if ($_smarty_tpl->tpl_vars['antivirus']->value['is_intensive']) {?>
                    <!-- Идет проверка -->
                    <div class="scan">
                        <div class="progress" style="width:<?php echo $_smarty_tpl->tpl_vars['antivirus']->value['progress'];?>
%;"></div>
                        <div class="actions">
                            <a href="<?php echo smarty_function_adminUrl(array('avdo'=>"disableAntivirusIntensiveMode",'mod_controller'=>"antivirus-widget-stateinfo"),$_smarty_tpl);?>
"
                               class="call-update no-update-hash stateinfo-button gray-fill"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Стоп<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</a>
                        </div>
                        <div class="info"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array('current'=>$_smarty_tpl->tpl_vars['antivirus']->value['global_position'],'total'=>$_smarty_tpl->tpl_vars['antivirus']->value['total_files_count']));
$_block_repeat1=true;
echo smarty_block_t(array('current'=>$_smarty_tpl->tpl_vars['antivirus']->value['global_position'],'total'=>$_smarty_tpl->tpl_vars['antivirus']->value['total_files_count']), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
<span class="big-text">Идет полная проверка файлов</span> <span class="small-text">Проверено</span> <span>%current из %total</span><?php $_block_repeat1=false;
echo smarty_block_t(array('current'=>$_smarty_tpl->tpl_vars['antivirus']->value['global_position'],'total'=>$_smarty_tpl->tpl_vars['antivirus']->value['total_files_count']), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</div>
                    </div>
                <?php } else { ?>
                    <div class="information">
                        <div class="state">
                            <i class="ok" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Вирусы не обнаружены<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></i>
                        </div>
                        <div class="section">
                            <div class="title"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Вирусы<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</div>
                            <?php if ($_smarty_tpl->tpl_vars['antivirus']->value['completed']) {?>
                                <div class="last-cycle">
                                    <?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Последняя проверка<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
 <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['antivirus']->value['completed'],"d.m.Y H:i");?>

                                </div>
                            <?php }?>
                        </div>
                        <div class="actions">
                            <a href="<?php echo smarty_function_adminUrl(array('avdo'=>"enableAntivirusIntensiveMode",'mod_controller'=>"antivirus-widget-stateinfo"),$_smarty_tpl);?>
" class="run call-update no-update-hash" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Запустить полную проверку<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></a>
                            <a href="<?php echo $_smarty_tpl->tpl_vars['antivirus']->value['event_list_url'];?>
" class="report" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Показать отчет<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></a>
                        </div>
                    </div>
                <?php }?>
            <?php }?>
        </div>

        <div class="stateinfo-footer">
            <img src="<?php echo $_smarty_tpl->tpl_vars['mod_img']->value;?>
scan.gif" class="protect-img">
            <span class="protect big-text"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
защита включена<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</span>
            <a href="<?php echo smarty_function_adminUrl(array('do'=>"edit",'mod_controller'=>"modcontrol-control",'mod'=>"antivirus"),$_smarty_tpl);?>
" class="settings" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Настройки модуля<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></a>
            <a href="<?php echo $_smarty_tpl->tpl_vars['excluded_list_url']->value;?>
" class="trustzone" title="<?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Исключения<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
"></a>
        </div>

    <?php } else { ?>
        <!-- Есть ошибка -->
        <div class="trouble">
            <p><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
$_block_repeat1=true;
echo smarty_block_t(array(), null, $_smarty_tpl, $_block_repeat1);
while ($_block_repeat1) {
ob_start();
?>
Не зафиксирован запуск фонового модуля антивируса. Настройте запуск внутреннего планировщика cron.<?php $_block_repeat1=false;
echo smarty_block_t(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat1);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</p>
            <a href="http://readyscript.ru/manual/cron.html" class="stateinfo-button white-fill"><?php $_smarty_tpl->smarty->_cache['_tag_stack'][] = array('t', array());
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
        </div>
    <?php }?>
</div><?php }
}
