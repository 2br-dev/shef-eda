{* Основной шаблон *}
{strip}
{$css_version=6}
{addcss file="/rss-news/" basepath="root" rel="alternate" type="application/rss+xml" title="t('Новости')"}
{addcss file="reset.css?v={$css_version}"}
{addcss file="style.css?v={$css_version}"}
{* {if $THEME_SHADE !== 'orange'}
    {addcss file="{$THEME_SHADE}.css?v={$css_version}"}
{/if}  *}
{addcss file="colorbox.css?v={$css_version}"}
{* CUSTOM*}
{addcss file="animate.css"}
{addcss file="fonts.css"}
{addcss file="normalize.css"}
{addcss file="fontawesome.css"}
{addcss file="slick.css"}
{addcss file="materialize.css"}
{*/END*}
{addcss file="custom_styles.css?v={$css_version}"} {* Файл для кастомных стилей *}
{* {addcss file="bootstrap.popover.min.css?v={$css_version}"}
{addjs file="bootstrap/bootstrap.min.js" basepath="common"} *}

{addjs file="html5shiv.js" unshift=true header=true}
{addjs file="jquery.min.js" name="jquery" basepath="common" unshift=true header=true}
{addjs file="jquery.autocomplete.js"}
{addjs file="jquery.activetabs.js"}
{addjs file="jquery.form/jquery.form.js" basepath="common"}
{addjs file="jquery.cookie/jquery.cookie.js" basepath="common"}
{addjs file="jquery.switcher.js"}
{addjs file="jquery.ajaxpagination.js"}
{addjs file="jquery.colorbox.js"}
{addjs file="modernizr.touch.js"}
{addjs file="materialize.js"}

{* CUSTOM*}
{addjs file="wow.min.js"}
{addjs file="slick.min.js"}
{*/END*}

{addjs file="common.js"}
{addjs file="theme.js"}
{$shop_config=ConfigLoader::byModule('shop')}
{if $shop_config}
    {addjs file="%shop%/jquery.oneclickcart.js"}
{/if}
{addmeta http-equiv="X-UA-Compatible" content="IE=Edge" unshift=true}
{if $shop_config===false}{$app->setBodyClass('shopBase', true)}{/if}

{$app->setDoctype('HTML')}
{/strip}
{$app->blocks->renderLayout()}

{* Подключаем файл scripts.tpl, если он существует в папке темы. В данном файле 
рекомендуется добавлять JavaScript код, который должен присутствовать на всех страницах сайта *}
{tryinclude file="%THEME%/scripts.tpl"}