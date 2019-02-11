<form method="POST" action="{$router->getUrl('users-front-auth', ["Act" => "recover"])}" class="authorization recoverPassword">
    {$this_controller->myBlockIdInput()}
    <h2 data-dialog-options='{ "width": "450" }'>{t}Восстановление пароля{/t}</h2>
    {if !empty($error)}<div class="error">{$error}</div>{/if}
    <div class="forms formStyle">
        <div class="center">            
            <div class="formLine">
                <label class="fielName">E-mail</label><br>
                <input type="text" name="login" value="{$data.login}" placeholder="e-mail" class="inp" value="{$data.login}" {if $send_success}readonly{/if}>
            </div>
            
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
                <div class="floatWrap">
                    <input type="submit" value="{t}Отправить{/t}">
                </div>
            {/if}
        </div>
    </div>        
    <div class="grayBlock">
        <i class="lines"></i>
        <a href="{$router->getUrl('users-front-register')}" class="reg inDialog">{t}Зарегистрируйтесь{/t}</a>
        <a href="{$router->getUrl('users-front-auth')}" class="reg inDialog mleft30">{t}Авторизуйтесь{/t}</a>
    </div>
</form>