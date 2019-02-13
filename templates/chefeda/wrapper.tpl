<div class="container">                              
    <header class='header'>
    {moduleinsert name="\Main\Controller\Block\Logo" width="200" height="75"}   
        <div class="header-container">
            <div class='header-top'>
            {moduleinsert name="\Menu\Controller\Block\Menu" indexTemplate='blocks/menu/header_menu.tpl' root='0'}
                <div class='header-top__container'>
                    <div>
                        <img class='header-top__image' src="{$THEME_IMG}/icons/phone.png" alt="8-800-800-80-80" title='8-800-800-80-80' />
                        <a class='header-top__phone' href="tel:88008008080">8-800-800-80-80</a>
                    </div>
                    <div>
                        <img class='header-top__image' src="{$THEME_IMG}/icons/location.png" alt="Анисовая, 36" title='Анисовая, 36' />
                        <a class='header-top__adress' target='_blank' href="https://www.google.com/maps/place/Anisovaya+Ulitsa,+36,+Krasnodar,+Krasnodarskiy+kray,+350062/@45.0658573,38.9451465,17z/data=!3m1!4b1!4m5!3m4!1s0x40f04f57e4d52571:0x109f51d87cdacdfc!8m2!3d45.0658535!4d38.9473352">г.
                        Краснодар, Анисовая, 36</a>
                    </div>
                </div>
            </div>

            <div class="header-bottom">
                {*Каталог с выпадающим списком*}
                <button class="header-bottom__button"><a href='/catalogue/'>Каталог</a></button>
                {moduleinsert name="\Catalog\Controller\Block\Category"}
                {*Поиск*}
                {moduleinsert name="\Catalog\Controller\Block\SearchLine"}
                <div class="header-bottom-icons">
                    {*Личный кабинет*}
                    {moduleinsert name="\Users\Controller\Block\AuthBlock"}
                    <img class="header-bottom-icons__icon search-catalogue" src="{$THEME_IMG}/icons/search.png" alt="Поиск по сайту" title='Поиск по сайту'>
                    <a href='/my/'><img class="header-bottom-icons__icon hover-account" src="{$THEME_IMG}/icons/account.png" alt="Личный кабинет" title='Личный кабинет'></a>
                    <a href='/cart/'><img class="header-bottom-icons__icon" src="{$THEME_IMG}/icons/basket.png" alt="Корзина" title='Корзина'></a>
                </div>
            </div>
        </div>
    </header>
</div>

{* Данный блок будет переопределен у наследников данного шаблона *}
{block name="content"}{/block}

<footer class="footer">
    <div class="container">
        <div class='footer-info'>
            <div>
                <p class='footer-info__header'>О компании</p>
                <a href="/suppliers">Поставщикам</a>
                <a href="/career">Карьера</a>
            </div>
            <div>
                <p class='footer-info__header'>Покупателям</p>
                <a href="/payment">Оплата и доставка</a>
                <a href="/howto">Как заказать</a>
                <a href="/ask">Задайте нам вопрос</a>
                <a href="/contacts">Контакты</a>
            </div>
        </div>

        <div class='footer-contacts'>
            <a class='footer-contacts__phone' href="tel:8-919-000-00-00">8-919-000-00-00</a>
            <a class='footer-contacts__mail' href="mailto:shef_eda@mail.ru">
                <img src="{$THEME_IMG}/icons/envelope.png" alt="shef_eda@mail.ru" title='shef_eda@mail.ru' />
                <span>shef_eda@mail.ru</span>
            </a>
            <p class='footer-contacts__text'> Вы можете сделать в <u>Интернет-магазине</u> круглосуточно. Обработка и приём
            заказов по телефону
            производится ежедневно</p>
            <p class='footer-contacts__time'>с 8:00 до 23:00</p>
            <p class='footer-contacts__adress'>Приходите к нам в гости по адресу</p>
            <a class='footer-contacts__adress-link' href="https://www.google.com/maps/place/Anisovaya+Ulitsa,+36,+Krasnodar,+Krasnodarskiy+kray,+350062/@45.0658573,38.9451465,17z/data=!3m1!4b1!4m5!3m4!1s0x40f04f57e4d52571:0x109f51d87cdacdfc!8m2!3d45.0658535!4d38.9473352">г.
            Краснодар, Анисовая, 36</a>
            <a class='footer-contacts__instagram' href="https://www.instagram.com">
                <img src="{$THEME_IMG}/icons/instagram-white.png" alt="Анисовая, 36" title="Анисовая, 36">
            </a>
        </div>
    </div>
</footer>

{* Плавающая корзина *}
{block name="fixedCart"}  
    <div class="fixedCart">
        <div class="viewport">
            <a href="#" class="up" id="up" title="{t}наверх{/t}">
                <i class="material-icons">arrow_upward</i>
            </a>           
            {if ModuleManager::staticModuleExists('shop')}
                {moduleinsert name="\Shop\Controller\Block\Cart"}
            {/if}
        </div>
    </div>
{/block}