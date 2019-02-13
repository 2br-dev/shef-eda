<div class="personalAccount">
    <div class="balance">
        <span class="text">{t}Ваш баланс:{/t} <strong>{$balance_string}</strong></span>
        <a href="{$router->getUrl('shop-front-mybalance', [Act=>addfunds])}" class="btn">
            <i class='material-icons'>account_balance_wallet</i>
            {t}Пополнить баланс{/t}
        </a>
    </div>
    
    {if $list}
    <h4 class='cursive'>{t}История операций{/t}</h4>
    <table class="themeTable">
        <thead>
            <tr>
                <td></td>
                <td></td>
                <td>{t}Приход{/t}</td>
                <td>{t}Расход{/t}</td>
            </tr>
        </thead>
        <tbody>
            {foreach $list as $item}
            <tr>
                <td class="datetime">
                    <p class="nimber">№ {$item.id}</p>
                    <p class="date">{$item.dateof|date_format:"d.m.Y"}</p>
                    <p class="time">{$item.dateof|date_format:"H:i"}</p>
                </td>
                <td class="message">
                    {$item->reason}
                </td>
                <td class="in">
                    {if !$item->order_id && $item->cost > 0}
                        <span class="scost">+{$item->getCost(false, true)}</span>
                    {/if}                
                </td>
                <td class="out">
                    {if $item->order_id}
                        <span class="tcost">-{$item->getCost(false, true)}</span>
                    {else}
                        {if $item->cost < 0}
                            <span class="tcost">{$item->getCost(false, true)}</span>
                        {/if}
                    {/if}
                </td>
            </tr>
            {/foreach}
        </tbody>
    </table>
    {include file="%THEME%/paginator.tpl"}
    {/if}
</div>