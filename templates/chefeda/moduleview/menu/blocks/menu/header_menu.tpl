 {if $items}
    <nav>
      <ul>  
        {foreach from=$items item=item}
            <li class="{if !empty($item.child)}node{/if}{if $item.fields.typelink=='separator'} separator{/if}{if $item.fields->isAct()} act{/if}" {if $item.fields.typelink != 'separator'}{$item.fields->getDebugAttributes()}{/if}>
                {if $item.fields.typelink != 'separator' && $item.fields.title != 'Каталог'}
                    <a href="{$item.fields->getHref()}" {if $item.fields.target_blank}target="_blank"{/if}>{$item.fields.title}</a>
                {else}
                    &nbsp;
                {/if}
            </li>
        {/foreach}
      </ul>
    </nav>
{else}
    {include file="%THEME%/block_stub.tpl"  class="noBack blockSmall blockLeft blockFootMenu" do=[
        {$this_controller->getSettingUrl()}    => t("Настройте блок")
    ]}
{/if}        
            
          