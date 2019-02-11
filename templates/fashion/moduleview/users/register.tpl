<form method="POST" action="{$router->getUrl('users-front-register')}" class="authorization register formStyle">
    <input type="hidden" name="referer" value="{$referer}">
    {$this_controller->myBlockIdInput()}
    {hook name="users-registers:form" title="{t}Регистрация:форма{/t}"}    
    <h1 data-dialog-options='{ "width": "755" }'>{t}Регистрация пользователя{/t}</h1>
        {if count($user->getNonFormErrors())>0}
            <div class="pageError">
                {foreach $user->getNonFormErrors() as $item}
                <p>{$item}</p>
                {/foreach}
            </div>
        {/if}
        <div class="userType">
            <input type="radio" id="ut_user" name="is_company" value="0" {if !$user.is_company}checked{/if}><label for="ut_user">{t}Частное лицо{/t}</label>
            <input type="radio" id="ut_company" name="is_company" value="1" {if $user.is_company}checked{/if}><label for="ut_company">{t}Компания{/t}</label>
        </div>        
        <div class="forms">                        
            <div class="oh {if $user.is_company} thiscompany{/if}" id="fieldsBlock">
                {hook name="users-registers:form-fields" title="{t}Регистрация:поля формы{/t}"}
                <div class="half fleft">
                    <div class="companyFields">
                        <div class="formLine">
                            <label class="fieldName">{t}Название организации{/t}</label>
                            {$user->getPropertyView('company')}
                        </div>
                    </div>
                    <div class="formLine">
                        <label class="fieldName">{t}Имя{/t}</label>
                        {$user->getPropertyView('name')}
                    </div>
                    <div class="formLine">
                        <label class="fieldName">{t}Фамилия{/t}</label>
                        {$user->getPropertyView('surname')}
                    </div>
                    <div class="formLine">
                        <label class="fieldName">{t}Отчество{/t}</label>
                        {$user->getPropertyView('midname')}
                    </div>
                    <div class="formLine">
                        <label class="fieldName">{t}Телефон{/t}</label>
                        {$user->getPropertyView('phone')}
                    </div>
                    <div class="formLine captcha">
                        <label class="fieldName">&nbsp;</label>
                        <div class="alignLeft">
                            {$user->getPropertyView('captcha')}
                            <br><span class="fieldName">{$user->__captcha->getTypeObject()->getFieldTitle()}</span>
                        </div>
                    </div>
                </div>
                <div class="half fright">
                    <div class="companyFields">
                        <div class="formLine">
                            <label class="fieldName">{t}ИНН{/t}</label>
                            {$user->getPropertyView('company_inn')}
                        </div>                                
                    </div>        
                    <div class="formLine">
                        <label class="fieldName">E-mail</label>
                        {$user->getPropertyView('e_mail')}
                    </div>
                    <div class="formLine">
                        <label class="fieldName">{t}Пароль{/t}</label>
                        <input type="password" name="openpass" {if count($user->getErrorsByForm('openpass'))}class="has-error"{/if}>
                        <div class="formFieldError">{$user->getErrorsByForm('openpass', ',')}</div>                    
                    </div>            
                    <div class="formLine">
                        <label class="fieldName">{t}Повтор пароля{/t}</label>
                        <input type="password" name="openpass_confirm">
                    </div>
                    {if $conf_userfields->notEmpty()}
                        {foreach $conf_userfields->getStructure() as $fld}
                        <div class="formLine">
                        <label class="fieldName">{$fld.title}</label>
                            {$conf_userfields->getForm($fld.alias)}
                            {$errname=$conf_userfields->getErrorForm($fld.alias)}
                            {$error=$user->getErrorsByForm($errname, ', ')}
                            {if !empty($error)}
                                <span class="formFieldError">{$error}</span>
                            {/if}
                        </div>
                        {/foreach}
                    {/if}              
                </div>
                {/hook}
            </div>
            <div class="buttons cboth">
                {if $CONFIG.enable_agreement_personal_data}
                    {include file="%site%/policy/agreement_phrase.tpl" button_title="{t}Зарегистрироваться{/t}"}
                {/if}
                <input type="submit" value="{t}Зарегистрироваться{/t}">
            </div> 
        </div>
    {/hook}
    
    <script type="text/javascript">
        $(function() {
            $('.userType input').click(function() {
                $('#fieldsBlock').toggleClass('thiscompany', $(this).val() == 1);
                if ($(this).closest('#colorbox')) $.colorbox.resize();
            });
        });        
    </script>    
</form>