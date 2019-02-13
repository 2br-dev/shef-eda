<form method="POST" action="{$router->getUrl('users-front-register')}" class="authorization register-form register formStyle">
    <input type="hidden" name="referer" value="{$referer}">
    {$this_controller->myBlockIdInput()}
    {hook name="users-registers:form" title="{t}Регистрация:форма{/t}"}    
    <h1>{t}Регистрация пользователя{/t}</h1>
        {if count($user->getNonFormErrors())>0}
            <div class="pageError">
                {foreach $user->getNonFormErrors() as $item}
                <p>{$item}</p>
                {/foreach}
            </div>
        {/if}
        <div class="userType">
            <label for="ut_user">
                <input type="radio" id="ut_user" name="is_company" value="0" {if !$user.is_company}checked{/if} />
                <span>{t}Частное лицо{/t}</span>
            </label>
            <label for="ut_company">
                <input type="radio" id="ut_company" name="is_company" value="1" {if $user.is_company}checked{/if} />
                <span>{t}Компания{/t}</span>
            </label>
        </div>      
          
        <div class="forms">                        
            <div class="oh {if $user.is_company} thiscompany{/if}" id="fieldsBlock">
                {hook name="users-registers:form-fields" title="{t}Регистрация:поля формы{/t}"}
                <div class="half fleft">
                    <div class="companyFields">
                        <div class="formLine input-field">
                            {$user->getPropertyView('company')}
                            <label class="fieldName">{t}Название организации{/t}</label>
                        </div>   
                    </div>
                    <div class="formLine input-field">
                        {$user->getPropertyView('name')}
                        <label class="fieldName">{t}Имя{/t}</label>
                    </div>  
                    <div class="formLine input-field">
                        {$user->getPropertyView('surname')}
                        <label class="fieldName">{t}Фамилия{/t}</label>
                    </div>  
                    <div class="formLine input-field">
                        {$user->getPropertyView('midname')}
                        <label class="fieldName">{t}Отчество{/t}</label>
                    </div>  
                    <div class="formLine input-field">
                        {$user->getPropertyView('phone')}
                        <label class="fieldName">{t}Телефон{/t}</label>
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
                        <div class="formLine input-field">
                            {$user->getPropertyView('company_inn')}
                            <label class="fieldName">{t}ИНН{/t}</label>
                        </div>                             
                    </div>        
                    <div class="formLine input-field">
                        {$user->getPropertyView('e_mail')}
                        <label class="fieldName">{t}mail{/t}</label>
                    </div> 
                    <div class="formLine input-field">
                        <input type="password" name="openpass" {if count($user->getErrorsByForm('openpass'))}class="has-error"{/if}>
                        <label class="fieldName">{t}Пароль{/t}</label>
                    </div>
                    <div class="formFieldError">{$user->getErrorsByForm('openpass', ',')}</div>
                    <div class="formLine input-field">
                        <input type="password" name="openpass_confirm">
                        <label class="fieldName">{t}Повтор пароля{/t}</label>
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
                <input type="submit" class='btn' style='padding: 0' value="{t}Зарегистрироваться{/t}">
            </div> 
        </div>
    {/hook}
    
    <script type="text/javascript">
        $('.userType input').click(function() {
            $('#fieldsBlock').toggleClass('thiscompany', $(this).val() == 1);
            if ($(this).closest('#colorbox')) $.colorbox.resize();
        });    
    </script>    
</form>