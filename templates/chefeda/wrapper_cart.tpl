{extends file="%THEME%/wrapper.tpl"}
{block name="content"}
    <div class="box">
        {moduleinsert name="\Main\Controller\Block\Breadcrumbs"}
        {$app->blocks->getMainContent()}
    </div>

    <script>
        setTimeout(function() {
            $('body').append($('.footer'));
        }, 0);
    </script>
{/block} 
{block name="fixedCart"}{/block} {* Исключаем плавающую корзину *}