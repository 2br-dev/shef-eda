<form method="POST" action="{$router->getUrl('users-front-auth', ["Act" => "recover"])}" class="restore authorization formStyle">
    {$this_controller->myBlockIdInput()}
    {if $url->request('dialogWrap', $smarty.const.TYPE_INTEGER)}
    <div class='restore-wrapper'>
        <h2>{t}Восстановление пароля{/t}</h2>
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

                <div class="recover-input input-field" style='margin-top: 20px'>
                    <input id="restore" type="text" size="30" name="login" value="{$data.login}" class="validate {if !empty($error)}has-error{/if}" {if $send_success}readonly{/if}>
                    <label for="restore">E-mail</label>
                </div>

                <div class="floatWrap">
                    <input type="submit"  class='btn' value="{t}Отправить{/t}">
                </div>
            {/if}
        </div>
    </div>    
    {else}
        {if $send_success}
            <div class="formSuccessText" style='font-size: 18px'>E-mail: {$data.login}<br>
                {t}Письмо успешно отправлено. Следуйте инструкциям в письме{/t}
            </div>
        {else}
                    
            <div class="input-field" style='margin-top: 20px'>
                <input id="login" type="text" size="30" name="login" value="{$data.login}" class="validate {if !empty($error)}has-error{/if}">
                <label for="login">E-mail</label>
            </div>
            <span class="formFieldError">{$error}</span>

            <div class="help">{t}На указанный E-mail будет отправлено письмо с дальнейшими инструкциями по восстановлению пароля{/t}</div>

            <input type="submit" class='btn' value="{t}Отправить{/t}">
        {/if}
    {/if}
</form>



