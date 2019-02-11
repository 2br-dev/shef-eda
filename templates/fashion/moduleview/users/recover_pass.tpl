<form method="POST" action="{$router->getUrl('users-front-auth', ["Act" => "recover"])}" class="authorization formStyle">
    {$this_controller->myBlockIdInput()}
    {if $url->request('dialogWrap', $smarty.const.TYPE_INTEGER)}
        <h2 data-dialog-options='{ "width": "360" }'>{t}Восстановление пароля{/t}</h2>
        <div class="dialogForm">
            {if !empty($error)}<div class="error">{$error}</div>{/if}
            {if $send_success}
                <div class="recoverText success">
                    <i></i>
                    {t}Письмо успешно отправлено. Следуйте инструкциям в письме{/t}
                </div>
            {else}
                <div class="recoverText">
                    <i></i>
                    {t}На указанный E-mail будет отправлено письмо с дальнейшими инструкциями по восстановлению пароля{/t}
                </div>
                <input type="text" size="30" name="login" value="{$data.login}" placeholder="e-mail" class="login inp" value="{$data.login}" {if $send_success}readonly{/if}>
                <div class="floatWrap">
                    <input type="submit" value="{t}Отправить{/t}">
                </div>
            {/if}
        </div>
    {else}
        {if $send_success}
            <div class="formSuccessText">E-mail: {$data.login}<br>
                {t}Письмо успешно отправлено. Следуйте инструкциям в письме{/t}</div>
        {else}
            <table class="formTable">
                <tr>
                    <td class="key">E-mail</td>
                    <td class="value"><input type="text" size="30" name="login" value="{$data.login}" {if !empty($error)}class="has-error"{/if}>
                        <span class="formFieldError">{$error}</span>
                        <div class="help">{t}На указанный E-mail будет отправлено письмо с дальнейшими инструкциями по восстановлению пароля{/t}</div>
                    </td>
                </tr>
            </table>
            <input type="submit" value="{t}Отправить{/t}">
        {/if}
    {/if}
</form>