{assign var=shop_config value=ConfigLoader::byModule('shop')}
{addjs file="order.js"}

<form method="POST" class="checkoutBox formStyle {$order.user_type|default:"authorized"}" id="order-form" data-city-autocomplete-url="{$router->getUrl('shop-front-checkout', ['Act'=>'searchcity'])}">
    {if !$is_auth}
    <div class="userType">
        <label for="type-user">
            <input type="radio" id="type-user" name="user_type" value="person" {if $order.user_type=='person'}checked{/if}>
            <span>{t}Частное лицо{/t}</span>
        </label>
        <label for="type-company">
            <input type="radio" id="type-company" name="user_type" value="company" {if $order.user_type=='company'}checked{/if}>
            <span>{t}Компания{/t}</span>
        </label>
        <label for="type-noregister">
            <input type="radio" id="type-noregister" name="user_type" value="noregister" {if $order.user_type=='noregister'}checked{/if}>
            <span>{t}Без регистрации{/t}</span>
        </label>
        <label for="type-account">
            <input type="radio" id="type-account" name="user_type" value="user" {if $order.user_type=='user'}checked{/if}>
            <span>{t}Я регистрировался ранее{/t}</span>
        </label>
    </div>
    {/if}    
    
    {$errors=$order->getNonFormErrors()}
    {if $errors}
        <div class="pageError">
            {foreach $errors as $item}
                <p>{$item}</p>
            {/foreach}
        </div>
    {/if}    
    <div class="newAccount">    
    <h4 class='cursive'>{t}Контактные данные{/t}</h4>
    {if $is_auth}
        <table class="themeTable companyTable striped responsive-table">    
        {if $user.is_company}
            <tr>
                <td>{t}Наименование компании{/t}</td>
                <td>{$user.company}</td>
            </tr>        
            <tr>
                <td>{t}ИНН{/t}</td>
                <td>{$user.company_inn}</td>
            </tr>
        {/if}
            <tr>
                <td>{t}Имя{/t}</td>
                <td>{$user.name}</td>
            </tr>
            <tr>
                <td>{t}Фамилия{/t}</td>
                <td>{$user.surname}</td>
            </tr>
            <tr>
                <td>{t}Отчество{/t}</td>
                <td>{$user.midname}</td>
            </tr>
            <tr>
                <td>{t}Телефон{/t}</td>
                <td>{$user.phone}</td>
            </tr>            
            <tr>
                <td>E-mail</td>
                <td>{$user.e_mail}</td>
            </tr>                        
        </table>                    
        <div class="formLine changeUser">
            <a href="{urlmake logout=true}" class="btn">{t}Сменить пользователя{/t}</a>
        </div>
    {else}
        <div class="userRegister">
            <div class="organization">
                <div class="formLine input-field">
                    {$order->getPropertyView('reg_company')}
                    <label class="fieldName">{t}Наименование компании{/t}</label>                  
                </div>
                <div class="help">{t}Например: ООО Аудиторская фирма "Аудитор"{/t}</div>
                <div class="formLine input-field">
                    {$order->getPropertyView('reg_company_inn')}
                    <label class="fieldName">{t}ИНН{/t}</label>   
                </div>
                <div class="help">{t}10 или 12 цифр{/t}</div>
            </div>
            <div class="formLine input-field">
                {$order->getPropertyView('reg_name')}
                <label class="fieldName">{t}Имя{/t}</label>                       
            </div>
            <div class="help">{t}Имя покупателя, владельца аккаунта{/t}</div>
            <div class="formLine input-field"> 
                <label class="fieldName">{t}Фамилия{/t}</label> 
                {$order->getPropertyView('reg_surname')}                   
            </div>
            <div class="help">{t}Фамилия покупателя, владельца аккаунта{/t}</div>
            <div class="formLine input-field">   
                {$order->getPropertyView('reg_midname')}
                <label class="fieldName">{t}Отчество{/t}</label>
            </div>
            <div class="formLine input-field">
                {$order->getPropertyView('reg_phone')}
                <label class="fieldName">{t}Телефон{/t}</label>
            </div>
            <div class="help">{t}В формате: +7(123)9876543{/t}</div>
            <div class="formLine input-field">
                {$order->getPropertyView('reg_e_mail')}
                <label class="fieldName">E-mail</label>
            </div>


            
        {*     <div class="formLine input-field">

                <label class="fieldName">{t}Пароль{/t}</label>      
            </div> *}
            
               
            <div id="manual-login" {if $order.reg_autologin}style="display:none"{/if}>
                <div class="inline input-field">
                    {$order.__reg_openpass->formView(['form'])}
                    <label class="help">{t}Пароль{/t}</label>
                </div>
                <div class="inline input-field">
                    {$order.__reg_pass2->formView()}
                    <label class="help">{t}Повтор пароля{/t}</label>
                </div>
                <div class="help">{t}Нужен для проверки статуса заказа, обращения в поддержку, входа в кабинет{/t}</div>
            </div>

            <label for="reg-autologin">
                <input class='filled-in' type="checkbox" name="reg_autologin" {if $order.reg_autologin}checked{/if} value="1" id="reg-autologin"> 
                <span style='margin-top: 20px'>{t}Получить автоматически на e-mail{/t}</span>
            </label>
            
            <div class="formFieldError">{$order->getErrorsByForm('reg_openpass', ', ')}</div>

            {foreach $reg_userfields->getStructure() as $fld}
                <div class="formLine input-field">
                    {$reg_userfields->getForm($fld.alias)}
                    {$errname=$reg_userfields->getErrorForm($fld.alias)}
                    {$error=$order->getErrorsByForm($errname, ', ')} 
                    <label class="fieldName">{$fld.title}</label>      
                </div>
                {if !empty($error)}
                    <span class="formFieldError">{$error}</span>
                {/if}
            {/foreach}
        </div>
    {/if}
        
        <div class="userWithoutRegister">
           <div class="formLine input-field">
                {$order->getPropertyView('user_fio')}
                <label class="fieldName">{t}Ф.И.О.{/t}</label>              
           </div>
           <div class="help">{t}Фамилия, Имя и Отчество покупателя, владельца аккаунта{/t}</div>
           <div class="formLine input-field">
                {$order->getPropertyView('user_email')}
                <label class="fieldName">E-mail</label>                       
           </div>
           <div class="help">{t}E-mail покупателя, владельца аккаунта{/t}</div>
           <div class="formLine input-field">
                {$order->getPropertyView('user_phone')}
                <label class="fieldName">{t}Телефон{/t}</label>
           </div> 
           <div class="help">{t}В формате: +7(123)9876543{/t}</div> 
        </div>
        
        {if $have_to_address_delivery && $shop_config->isCanShowAddress()}
            <div class="address">
                <h4 class='cursive'>{t}Адрес{/t}</h4>
                {if $have_pickup_points} {* Если есть пункты самовывоза *}
                    <blockquote class="formPickUpTypeWrapper"> 
                        <label for="onlyPickUpPoints">
                            <input id="onlyPickUpPoints" type="radio" name="only_pickup_points" value="1" {if $order.only_pickup_points}checked{/if}/>
                            <span>{t}Самовывоз{/t}</span>
                        </label>
                        <br/>
                        <label for="onlyDelivery">
                            <input id="onlyDelivery" type="radio" name="only_pickup_points" value="0" {if $order.only_pickup_points}checked{/if}/>
                            <span>{t}Доставка по адресу{/t}</span>
                        </label> 
                    </blockquote>
                {/if}
                <div id="formAddressSectionWrapper" class="formAddressSectionWrapper {if $order.only_pickup_points}hidden{/if}">
                    {if count($address_list)>0}
                        <blockquote class="formLine lastAddress">
                            {foreach $address_list as $address}
                                <div class="line">
                                    <label for="adr_{$address.id}">
                                        <input type="radio" name="use_addr" value="{$address.id}" id="adr_{$address.id}" {if $order.use_addr == $address.id}checked{/if}>
                                        <span>{$address->getLineView()}</span>
                                    </label>
                                    <a href="{$router->getUrl('shop-front-checkout', ['Act' =>'deleteAddress', 'id' => $address.id])}"><i class='material-icons'>clear</i></a>
                                </div>
                            {/foreach}
                            <label for="use_addr_new">
                                <input type="radio" name="use_addr" value="0" id="use_addr_new" {if $order.use_addr == 0}checked{/if}>
                                <span>{t}Другой адрес{/t}</span>
                            </label>
                        </blockquote>
                    {else}
                        <input type="hidden" name="use_addr" value="0">
                    {/if}
                    
                    <div class="newAddress{if $order.use_addr>0 && $address_list} hide{/if}">
                        {if $shop_config.require_country}
                            <div class="formLine input-field">
                                {assign var=region_tools_url value=$router->getUrl('shop-front-regiontools', ["Act" => 'listByParent'])}
                                {$order->getPropertyView('addr_country_id', ['data-region-url' => $region_tools_url])}
                                <label class="fieldName">{t}Страна{/t}</label>
                            </div>
                        {/if}
                        {if $shop_config.require_region || $shop_config.require_city}
                            <div class="formLine form-line">
                                {if $shop_config.require_region}
                                    <span class="inline">
                                        <label class="fieldName">{t}Область/край{/t}</label>
                                        {assign var=regcount value=$order->regionList()}
                                        <span {if count($regcount) == 0}style="display:none"{/if} id="region-select">
                                            {$order.__addr_region_id->formView(['form'])}
                                        </span>

                                        <span {if count($regcount) > 0}{/if} id="region-input">
                                            {$order.__addr_region->formView()}
                                        </span>
                                    </span>
                                {/if}
                                {if $shop_config.require_city}
                                    <span class="inline">
                                        <div class="fieldName input-field">
                                            {$order->getPropertyView('addr_city')}
                                            <label>{t}Город{/t} <label>                                   
                                        </div>                                  
                                    </span>
                                {/if}
                            </div>
                        {/if}
                        {if $shop_config.require_zipcode || $shop_config.require_address}
                            <div class="formLine">
                                {if $shop_config.require_zipcode}
                                    <span class="inline">
                                        <label class="fieldName">{t}Индекс{/t}</label>
                                        {$order.__addr_zipcode->formView()}
                                    </span>
                                {/if}
                                {if $shop_config.require_address}
                                    <span class="inline">
                                        <div class="fieldName input-field">
                                            {$order->getPropertyView('addr_address')}
                                            <label>{t}Адрес{/t} <label>                                   
                                        </div>   
                                    </span>

                                {/if}
                            </div>
                        {/if}
                    </div>
                    {if $shop_config.show_contact_person}
                        <div class="formLine input-field" style='margin-bottom: 0'>
                            {$order->getPropertyView('contact_person')}
                            <label class="fieldName">{t}Контактное лицо{/t}</label>
                        </div>
                         <p class="help">{t}Лицо, которое встретит доставку. Например: Иван Иванович Пуговкин{/t}</p>
                    {/if}
                </div>
            </div>
        {else}
            <input type="hidden" name="only_pickup_points" value="1"/>
        {/if}
        
        {if $order->__code->isEnabled()}
            <label class="fieldName">{$order->__code->getTypeObject()->getFieldTitle()}</label> 
            <div class="formLine input-field captcha">
                {$order->getPropertyView('code')}     
            </div>
        {/if}
        {if $conf_userfields->notEmpty()}
            <div class="additional">
                <h2>{t}Дополнительные сведения{/t}</h2>
                {foreach $conf_userfields->getStructure() as $fld}
                    <div class="formLine">
                        <label class="fieldName">{$fld.title}</label>
                        {$conf_userfields->getForm($fld.alias)}
                        {assign var=errname value=$conf_userfields->getErrorForm($fld.alias)}
                        {assign var=error value=$order->getErrorsByForm($errname, ', ')}
                        {if !empty($error)}
                            <span class="formFieldError">{$error}</span>
                        {/if}
                    </div>
                {/foreach}
            </div>
        {/if}
        
        <div class="buttons">
            {if $CONFIG.enable_agreement_personal_data}
                {include file="%site%/policy/agreement_phrase.tpl" button_title="{t}Далее{/t}"}
            {/if}
            <input type="submit" class="btn" style='padding: 0 15px;' value="{t}Далее{/t}">
        </div>
    </div>
    <div class="hasAccount">
        <div class="workArea">
            <h2>{t}Вход{/t}</h2>
            <input type="hidden" name="ologin" value="1" id="doAuth" {if $order.user_type!='user'}disabled{/if}>
            <div class="formLine input-field">
                {$order->getPropertyView('login')}
                <label class="fieldName">E-mail</label>        
            </div>
            <div class="formLine input-field">
                {$order->getPropertyView('password')}
                <label class="fieldName">{t}Пароль{/t}</label>
            </div>
            <div class="input-field" style='text-align: center'>
                <input type="submit" class='btn' style='padding: 0 20px; width: 150px;' value="{t}Войти{/t}">
            </div>
        </div>
    </div>    
</form>

<script>
    $(document).ready(function() {
        $('select').formSelect();
    }); 

    $('#onlyPickUpPoints').click(function() {
        if ($('#formAddressSectionWrapper').css('display') === 'none') {
            $('#formAddressSectionWrapper').slideToggle();
        }     
    }) 
    $('#onlyDelivery').click(function() {
        if ($('#formAddressSectionWrapper').css('display') !== 'none') {
            $('#formAddressSectionWrapper').slideToggle();
        }     
    })   
</script>

