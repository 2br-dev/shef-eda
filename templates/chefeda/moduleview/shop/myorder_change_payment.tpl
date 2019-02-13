<div class="changePaymentWrapper formStyle">
    <h4 class="cursive">{t}Способы оплаты{/t}</h4>
    {if $success}
        <div class="infotext forms success">
            {t}Способ доставки изменен{/t}
        </div>
    {else}
        <form method="POST" class="forms" enctype="multipart/form-data" action="{urlmake}">
            <div class="center">
                {csrf}
                {$this_controller->myBlockIdInput()}


                {if $errors}
                    {foreach from=$errors item=error_field}
                        {foreach from=$error_field item=error}
                            <div class="error">{$error}</div>
                        {/foreach}
                    {/foreach}
                {/if}

                {foreach $payments as $payment}
                <div class='change-payment-flex'>
                    <label class="formLine input-field" >
                        <input id="payment{$payment.id}" {if $payment.id == $order.payment}checked{/if} type="radio" name="payment" value="{$payment.id}">
                        <span class="fielName">{$payment.title}</span>
                    </label>
                </div>
                {/foreach}
                <div class="buttons">
                    <input type="submit" class='btn' style='padding: 0' value="{t}Отправить{/t}"/>
                </div>
            </div>
        </form>
    {/if}
</div>