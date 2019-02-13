<form method="POST" class="formStyle profile">
    {csrf}
    {$this_controller->myBlockIdInput()}
    <div class="userType">
        <label for="ut_user" class="userLabel f14">
            <input type="radio" id="ut_user" name="is_company" value="0" {if !$user.is_company}checked{/if} />
            <span>{t}Частное лицо{/t}</span>
        </label>
        <label for="ut_company" class="f14">
            <input type="radio" id="ut_company" name="is_company" value="1" {if $user.is_company}checked{/if} />
            <span>{t}Компания{/t}</span>
        </label>
    </div>         
    <div> 
        
        <div class="tab act">
            {if count($user->getNonFormErrors())>0}
                <div class="pageError"> 
                    {foreach $user->getNonFormErrors() as $item}
                    <p>{$item}</p>
                    {/foreach}
                </div>
            {/if}    

            {if $result}
                <div class="formResult success">{$result}</div>
            {/if}           
            <div class="oh">
                <div class="{if $user.is_company} thiscompany{/if}" id="fieldsBlock">
                   <div class="companyFields">
                        <div class="formLine input-field">
                            {$user->getPropertyView('company')}
                            <label class="fieldName">{t}Название организации{/t}</label>
                        </div>                            
                        <div class="formLine input-field">
                            {$user->getPropertyView('company_inn')}
                            <label class="fieldName">{t}ИНН{/t}</label>
                        </div>                                
                    </div>
                    <div class="formLine input-field">
                        {$user->getPropertyView('surname')}
                        <label class="fieldName">{t}Фамилия{/t}</label>
                    </div>                    
                    <div class="formLine input-field">
                        {$user->getPropertyView('name')}
                        <label class="fieldName">{t}Имя{/t}</label>
                    </div>
                    <div class="formLine input-field">
                        {$user->getPropertyView('midname')}
                        <label class="fieldName">{t}Отчество{/t}</label>
                    </div>
                    <div class="formLine input-field">
                        {$user->getPropertyView('phone')}
                        <label class="fieldName">{t}Телефон{/t}</label>
                    </div>
                    <div class="formLine input-field">
                        {$user->getPropertyView('e_mail')}
                        <label class="fieldName">E-mail</label>    
                    </div>
                    {if $conf_userfields->notEmpty()}
                        {foreach $conf_userfields->getStructure() as $fld}
                        <div class="formLine input-field">
                            {$conf_userfields->getForm($fld.alias)}
                            {$errname=$conf_userfields->getErrorForm($fld.alias)}
                            {$error=$user->getErrorsByForm($errname, ', ')}
                            <label class="fieldName">{$fld.title}</label>
                        </div>
                        {if !empty($error)}
                            <span class="formFieldError">{$error}</span>
                        {/if}
                        {/foreach}
                    {/if}                 
                </div>
                <div class="formLine mt30">
                    <div class="mb20">
                        <div class="switch">
                            <label for="changePass" class="ft14">
                            {t}Сменить пароль{/t}
                            <input type="checkbox" id="changePass" name="changepass" value="1" {if $user.changepass}checked{/if}>
                            <span class="lever"></span>
                            </label>
                        </div>
                    </div>
                    <div class="changePass {if !$user.changepass}hidden{/if}">
                        <div class="formLine input-field">
                            <input type="password" name="current_pass" {if count($user->getErrorsByForm('current_pass'))}class="has-error"{/if}>
                            <label class="fieldName">{t}Текущий пароль{/t}</label>                                     
                        </div>
                        <span class="formFieldError">{$user->getErrorsByForm('current_pass', ',')}</span>
                        <div class="formLine input-field">
                            <input type="password" name="openpass" {if count($user->getErrorsByForm('openpass'))}class="has-error"{/if}>
                            <label class="fieldName">{t}Новый пароль{/t}</label>                     
                        </div>  
                        <span class="formFieldError">{$user->getErrorsByForm('openpass', ',')}</span>                      
                        <div class="formLine input-field">
                            <input type="password" name="openpass_confirm" {if count($user->getErrorsByForm('openpass'))}class="has-error"{/if}>
                            <label class="fieldName">{t}Повторить пароль{/t}</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="buttons">
                <input type="submit" class='btn' style='padding: 0' value="{t}Сохранить{/t}">
            </div>
        </div>            
    </div>    
</form>    
<script type="text/javascript">
    $(function() {
        $('#changePass').change(function() {
            $('.changePass').toggleClass('hidden', !this.checked);
        });            
        
        $('.profile .userType input').click(function() {
            $('#fieldsBlock').toggleClass('thiscompany', $(this).val() == 1);
        });
    });        
</script>    