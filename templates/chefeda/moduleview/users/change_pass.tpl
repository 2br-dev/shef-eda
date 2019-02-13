<form method="POST" class="authorization formStyle">
    <h1>{t}Восстановление пароля{/t}</h1>
    <div class="forms">
        <div class="center">
            <div class="formLine input-field" style='margin-top: 20px'>
                <input id="new_pass" type="password" size="30" name="new_pass" class="validate inp{if !empty($error)}has-error{/if}">
                <label for="new_pass">{t}Новый пароль{/t}</label>
            </div>
            <span class="formFieldError">{$error}</span>
            <div class="formLine input-field">
                <input id="new_pass_confirm" type="password" size="30" name="new_pass_confirm"  class="inp">
                <label for="new_pass_confirm">{t}Повтор нового пароля{/t}</label>
            </div>           
            <input type="submit" class='btn' style='padding: 0' value="{t}Сменить пароль{/t}">
        </div>
    </div>
</form>