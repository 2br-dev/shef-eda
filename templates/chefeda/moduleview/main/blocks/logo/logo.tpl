{if $site_config.logo}
<a href="/">
    <img class='header__logo' src="{$site_config.__logo->getUrl($width, $height)}" alt="Интернет-магазин Шеф-Еда" title="Интернет-магазин Шеф-Еда" />
</a>

{else}
    {include file="%THEME%/block_stub.tpl"  class="noBack blockSmall blockLeft blockLogo" do=[
        {adminUrl do=false mod_controller="site-options"}    => t("Добавьте логотип")
    ]}
{/if}