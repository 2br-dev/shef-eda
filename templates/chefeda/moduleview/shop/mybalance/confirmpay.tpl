<div class="confirmPay">
    <h4 class='cursive'>{t}Подтверждение оплаты{/t}</h4>

    {if $api->hasError()}
        <div class="pageError">
            {foreach $api->getErrors() as $item}
            <p>{$item}</p>
            {/foreach}
        </div>
    {/if}

    <table class="confirmPayTable striped responsive-table" style='border: none'>
        <tr>
            <td>{t}Сумма{/t}</td>
            <td><strong>{$transaction->getCost(true, true)}</strong></td>
        </tr>
        <tr>
            <td>{t}Назначение платежа{/t}</td>
            <td>{$transaction->reason}</td>
        </tr>    
        <tr>
            <td>{t}Источник{/t}</td>
            <td>{t}Лицевой счет{/t}</td>
        </tr>        
    </table>

    {if !$api->hasError()}
    <form method="POST" class="formStyle buttonLine">
        <input type="submit" class='btn' style='padding: 0' value="{t}Оплатить{/t}">
    </form>
    {else}
    <a href='/my/balance/addfunds/' class='btn' style='padding: 0 15px'>Пополнить баланс</a>
    {/if}
</div>