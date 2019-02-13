<div class="supportTopics">
    {$error=$supp->getErrors()}
    <div class="writeBlock {if $error}open{/if}">
        <a href="#" class="btn handler" style='padding: 0 15px' onclick="$(this).parent().addClass('open'); return false;">
            <i class='material-icons'>message</i>
        {t}Написать сообщение{/t}</a>
        <div class="caption">
            <h4 class='cursive'>{t}Написать сообщение в поддержку{/t}</h4>
            <i class='material-icons' onclick="$(this).closest('.writeBlock').removeClass('open'); return false;">clear</i>
        </div>      
        <form class="formStyle" method="POST">
            {if $error}
            <div class="pageError pbottom">
                {foreach $error as $err}
                <p>{$err}</p>
                {/foreach}
            </div>
            {/if}   

            {*select*}       
            <div class="input-field formLine">
                {if count($list)>0}
                    <select name="topic_id" id="topic_id">        
                        {foreach $list as $item}
                        <option value="{$item.id}" {if $item.id == $supp.topic_id}selected{/if}>{$item.title}</option>
                        {/foreach}
                        <option value="0" {if $supp.topic_id == 0}selected{/if}>{t}Новая тема...{/t}</option>
                    </select>
                {/if}
                <label>Тема</label>
            </div>

            <div class="formLine" id="newtopic" {if $supp.topic_id>0}style="display:none"{/if}>
                <input type="text" placeholder='Тема' name="topic" class="newtopic" value="{$supp.topic}">
            </div>
            <div class="formLine">
                <label>{t}Вопрос{/t}</label><br>
                <textarea class="materialize-textarea" name="message">{$supp.message}</textarea>
            </div>
            <div class="formLine">
                <input type="submit" class='btn' style='padding: 0 15px' value="{t}Отправить{/t}">
            </div>
        </form>
    </div>
    <br>
    {if count($list)>0}    
    <table class="themeTable supportTable striped responsive-table" border='0'>
        <thead>
            <tr>
                <td>{t}Обновлено{/t}</td>
                <td>{t}Тема обращения{/t}</td>
                <td>{t}Сообщений{/t}</td>
            </tr>
        </thead>
        <tbody>
            {foreach $list as $item}
            <tr data-id="{$item.id}">
                <td class="datetime">
                    <p class="date">{$item.updated|date_format:"%d.%m.%Y"}</p>
                    <p class="time">{$item.updated|date_format:"%H:%M"}</p>
                </td>
                <td class="title">
                    <a href="{$router->getUrl('support-front-support', [Act=>"viewTopic", id => $item.id])}">{$item.title}</a>
                </td>
                <td class="msgCount">
                    <a href="{$router->getUrl('support-front-support', [Act=>"viewTopic", id => $item.id])}">{$item.msgcount}{if $item.newcount>0} (новых: {$item.newcount}){/if}<i class='material-icons'>message</i></a>
                </td>
                <td class="remove">
                    <a href="{$router->getUrl('support-front-support', ["Act" => "delTopic", "id" => $item.id])}" class='delete' title="{t}Удалить переписку по этой теме{/t}"><i class='material-icons'>delete</i></a>
                </td>
            </tr>
            {/foreach}
        </tbody>
    </table>
    {/if}
</div>
            
<script>
    $(document).ready(function(){
        $('select').formSelect();
    });

    $(function() {
        $('#topic_id').change(function() {
            $('#newtopic').toggle( $(this).val() == 0 );
        });
        
        $('.supportTable .delete').click(function(){
            if (!confirm(lang.t('Вы действительно хотите удалить переписку по теме?'))) return false;
            var block = $(this).closest('[data-id]').css('opacity', 0.5);
            var topic_id = block.data('id');
            
            $.getJSON($(this).attr('href'), function(response) {
                if (response.success) {
                    location.reload();
                }
            });
            return false;
        });
    });
</script>