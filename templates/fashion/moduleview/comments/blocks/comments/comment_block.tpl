{addjs file="{$mod_js}comments.js" basepath="root"}

<div class="commentBlock">
    <a name="comments"></a>
    <div class="commentFormBlock{if !empty($error) || !$total} open{/if}">
        {if $mod_config.need_authorize == 'Y' && !$is_auth}
            <span class="needAuth">Чтобы оставить отзыв необходимо <a href="{$router->getUrl('users-front-auth', ['referer' => $referer])}" class="inDialog">{t}авторизоваться{/t}</a></span>
        {else}
            <a href="#" class="button handler" onclick="$(this).closest('.commentFormBlock').toggleClass('open');return false;">Написать отзыв и оценить товар</a>
            <div class="caption">
                {t}Оставить отзыв о товаре{/t}
                <a onclick="$(this).closest('.commentFormBlock').toggleClass('open')" class="close iconX" title="{t}закрыть{/t}"></a>
            </div>                                                
            <form method="POST" class="formStyle" action="#comments">
                {if !empty($error)}
                    <div class="errors">
                        {foreach $error as $one}
                        <p>{$one}</p>
                        {/foreach}
                    </div>
                {/if}                            
                {$this_controller->myBlockIdInput()}
                <textarea name="message">{$comment.message}</textarea>
                {if $already_write}<div class="already">{t}Разрешен один отзыв на товар, предыдущий отзыв будет заменен{/t}</div>{/if}
                <div class="rating">
                    <input class="inp_rate" type="hidden" name="rate" value="{$comment.rate}">                        
                    <span>{t}Ваша оценка{/t}</span>
                    <div class="starsBlock">
                        <i></i>
                        <i></i>
                        <i></i>
                        <i></i>
                        <i></i>
                    </div>
                    <span class="desc">{$comment->getRateText()}</span>
                </div>
                <p class="name">
                    <label>{t}Ваше имя{/t}</label>
                    <input type="text" name="user_name" value="{$comment.user_name}">
                </p>
                {if !$is_auth}
                    <div class="formLine captcha">
                        <div class="fieldName">{$comment->__captcha->getTypeObject()->getFieldTitle()}</div>
                        {$comment->getPropertyView('captcha')}
                    </div>
                {/if}
                <input type="submit" value="{t}Оставить отзыв{/t}">
            </form>
        {/if}
    </div>
    {if $total}
        <ul class="commentList">
            {$list_html}
        </ul>
    {else}
        <div class="noComments">{t}нет отзывов{/t}</div>
    {/if}
    {if $paginator->total_pages > $paginator->page}
        <a data-pagination-options='{ "appendElement":".commentList" }' data-href="{$router->getUrl('comments-block-comments', ['_block_id' => $_block_id, 'cp' => $paginator->page+1, 'aid' => $aid])}" class="button white oneMore ajaxPaginator">{t}еще комментарии...{/t}</a>
    {/if}
</div>

<script type="text/javascript">
    $(function() {
        $('.commentBlock').comments({
            rate:'.rating',
            stars: '.starsBlock i',
            rateDescr: '.rating .desc'
        });
    });
</script>