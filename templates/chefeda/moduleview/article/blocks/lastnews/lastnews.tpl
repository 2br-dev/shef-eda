{* {if $category && $news}
<h3><a href="{$router->getUrl('article-front-previewlist', [category => $category->getUrlId()])}">{t}Новости{/t}</a></h3>
<ul class="news">
    {foreach $news as $item}
    <li {$item->getDebugAttributes()}>
        <p class="date">{$item.dateof|dateformat:"%d %v %Y, %H:%M"}</p>
        <a href="{$item->getUrl()}" class="descr">{$item.title}</a>
    </li>
    {/foreach}
</ul>
{else}
    {include file="%THEME%/block_stub.tpl"  class="blockLastNews" do=[
        [
            'title' => t("Добавьте категорию с новостями"),
            'href' => {adminUrl do=false mod_controller="article-ctrl"}
        ],        
        [
            'title' => t("Настройте блок"),
            'href' => {$this_controller->getSettingUrl()},
            'class' => 'crud-add'
        ]        
    ]}
{/if} *}
{addjs file="jquery.changeoffer.js"}
{$shop_config=ConfigLoader::byModule('shop')}
{$check_quantity=$shop_config.check_quantity}
{* {$list = $this_controller->api->addProductsDirs($list)} *}

        {*Верхняя навигация по подразделам*}
        {if $category.description && !$THEME_SETTINGS.cat_description_bottom}<article class="categoryDescription">{$category.description}</article>{/if}
        {if count($sub_dirs)}{assign var=one_dir value=reset($sub_dirs)}{/if}
        {if empty($query) || (count($sub_dirs) && $dir_id != $one_dir.id)}
            <nav class="subCategory">
                {foreach $sub_dirs as $item}
                    <a href="{urlmake category=$item._alias p=null pf=null filters=null bfilter=null}">{$item.name}</a>
                {/foreach}
            </nav>
        {/if}