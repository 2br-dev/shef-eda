{addjs file='%shop%/mybalance.js'}

<h4 class='cursive'>{t}Выберите способ оплаты{/t}</h4>
{if $api->hasError()}
    <div class="pageError pbottom">
        {foreach $api->getErrors() as $item}
        <p>{$item}</p>
        {/foreach}
    </div>
{/if} 
<div class="addMoney">
    <form method="POST" class="formStyle">
        {foreach $pay_list as $item}
            <label class='addMoney-label' for="dlv_{$item.id}">
                <input type="radio" id="dlv_{$item.id}" value="{$item.id}" name="payment" {if $smarty.post.payment==$item.id}checked{/if}>
                <span style='margin-top: 15px'>{$item.title}</span>
            </label>
            <div class="help">{$item.description}</div>
        {/foreach}
            
        <div>
            <div class="fieldName input-field">
                <input type="number" name="cost" value="{$smarty.post.cost}" placeholder="0.00" class="value cost_field">
                {t}Укажите сумму пополнения{/t} ({$base_currency.stitle})
            </div>
            {if $current_currency.stitle != $base_currency.stitle}
                <label class="label_curr"></label>
            {/if}
            <input class="hidden_curr" data-ratio="{$current_currency.ratio}" data-liter="{$current_currency.stitle}" type="hidden" value="">
            <input type="submit" class='btn' style='padding: 0' value="{t}Пополнить{/t}">
        </div>
    </form>
</div>