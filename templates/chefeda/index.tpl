{extends file="%THEME%/wrapper.tpl"}
{block name="content"}
    <main class='main-content'>  
        {* Навигация с баннером *}
        {include file="%THEME%/moduleview/main/blocks/navigation/navigation.tpl"}

        {* Карточки на главной *}
        {include file="%THEME%/moduleview/main/blocks/cardsonmain/item.tpl"}

        {* Слайдер *}
        {moduleinsert name="\Catalog\Controller\Block\TopProducts" dirs="samye-prodavaemye-veshchi" pageSize="5"}

        {* Конструктор *}
        {include file="%THEME%/moduleview/main/blocks/constructor/item.tpl"}

        {* Overlay *}
        {include file="%THEME%/moduleview/main/blocks/overlay/item.tpl"}
    </main>
    <main>
        {* Tomatoes *}
        {include file="%THEME%/moduleview/main/blocks/tomatoes/item.tpl"}

        {* Plates *}
        {include file="%THEME%/moduleview/main/blocks/plates/item.tpl"}
    </main>              
{/block}

