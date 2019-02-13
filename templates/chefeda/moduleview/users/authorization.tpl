<div class='container'>
    <form method="POST" action="{$router->getUrl('users-front-auth')}" class="authorization formStyle">
        <h1 data-dialog-options='{ "width": "460" }'>{t}Авторизация{/t}</h1>
        {$this_controller->myBlockIdInput()}
        {hook name="users-authorization:form" title="{t}Авторизация:форма{/t}"}
        <div class='authorization-body'>
            <input type="hidden" name="referer" value="{$data.referer}">
            {if !empty($status_message)}<div class="pageError">{$status_message}</div>{/if}
            {if !empty($error)}<div class="error">{$error}</div>{/if}

            <div class="input-field" style='margin-top: 20px'>
                <input id="login" type="text" size="30" name="login" value="{$data.login|default:$Setup.DEFAULT_DEMO_LOGIN}" class="validate">
                <label for="login">E-mail</label>
            </div>
            <div class="input-field">
                <input id='pass' type="password" size="30" name="pass" value="{$Setup.DEFAULT_DEMO_PASS}" class="validate">
                <label for="pass">{t}Пароль{/t}</label>
            </div>  

            <label for="rememberMe">
                <input type="checkbox" id="rememberMe" class='filled-in' name="remember" value="1" {if $data.remember}checked{/if} />
                <span>{t}Запомнить меня{/t}</span>
            </label>

            <div class="oh authorization-controls">
                <div class="fleft">
                    <input class='btn' type="submit" value="{t}Войти{/t}">
                </div>
                <div class="fright">
                    <a href="{$router->getUrl('users-front-auth', ["Act" => "recover"])}" class="recover inDialog">{t}Забыли пароль?{/t}</a>
                </div>
            </div>
            <div class="underLine">
                <p>{t alias="Преимущества регистрации"}Зарегистрировавшись у нас, Вы сможете хранить всю информацию о Ваших покупках, адресах доставок на нашем сайте,
                     а также видеть ход исполнения заказов. Регистрация займет не более 2-х минут.{/t}</p>
                <a href="/register/" class="btn color reg">{t}Зарегистрироваться{/t}</a>
            </div>
        </div>    
        {/hook}
    </form>
</div>