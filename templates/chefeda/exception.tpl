<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>{t}Ой, ошибочка{/t} {$error.code}</title>
<!--[if lt IE 9]>
<script src="{$THEME_JS}/html5shiv.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="{$THEME_CSS}/normalize.css">
<link rel="stylesheet" type="text/css" href="{$THEME_CSS}/style.css">
<link rel="stylesheet" type="text/css" href="{$THEME_CSS}/materialize.css">
<link rel="stylesheet" type="text/css" href="{$THEME_CSS}/fonts.css">
<link rel="stylesheet" type="text/css" href="{$THEME_CSS}/fontawesome.css">
<link rel="stylesheet" type="text/css" href="{$THEME_CSS}/custom_styles.css">
{* {if $THEME_SHADE !== 'orange'}
<link rel="stylesheet" type="text/css" href="{$THEME_CSS}/{$THEME_SHADE}.css">
{/if} *}

</head>
<body>
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
        <div class="exception">
                <section class="error-container">
                    <span class="four"><span class="screen-reader-text">4</span></span>
                    <span class="zero"><span class="screen-reader-text">0</span></span>
                    <span class="four"><span class="screen-reader-text">4</span></span>
                </section>
                <div class="message">{$error.comment}
                <br>
                <br>
                <button class='btn btn-large'><a href="{$site->getRootUrl()}">{t}Перейти на главную{/t}</a></button>
                </div>
                <div class="clearBoth"></div>                    
            </div>    
        </div>
</div>

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

<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,600,700');
@import url('https://fonts.googleapis.com/css?family=Catamaran:400,800');
.error-container {
  text-align: center;
  font-size: 106px;
  font-family: 'Catamaran', sans-serif;
  font-weight: 800;
  margin: 0 15px 70px;
}
.error-container > span {
  display: inline-block;
  position: relative;
  filter: hue-rotate(115deg);
}
.error-container > span.four {
  width: 136px;
  height: 43px;
  border-radius: 999px;
  background:
    linear-gradient(140deg, rgba(0, 0, 0, 0.1) 0%, rgba(0, 0, 0, 0.07) 43%, transparent 44%, transparent 100%),
    linear-gradient(105deg, transparent 0%, transparent 40%, rgba(0, 0, 0, 0.06) 41%, rgba(0, 0, 0, 0.07) 76%, transparent 77%, transparent 100%),
    linear-gradient(to right, #d89ca4, #e27b7e);
}
.error-container > span.four:before,
.error-container > span.four:after {
  content: '';
  display: block;
  position: absolute;
  border-radius: 999px;
}
.error-container > span.four:before {
  width: 43px;
  height: 156px;
  left: 60px;
  bottom: -43px;
  background:
    linear-gradient(128deg, rgba(0, 0, 0, 0.1) 0%, rgba(0, 0, 0, 0.07) 40%, transparent 41%, transparent 100%),
    linear-gradient(116deg, rgba(0, 0, 0, 0.1) 0%, rgba(0, 0, 0, 0.07) 50%, transparent 51%, transparent 100%),
    linear-gradient(to top, #99749D, #B895AB, #CC9AA6, #D7969E, #E0787F);
}
.error-container > span.four:after {
  width: 137px;
  height: 43px;
  transform: rotate(-49.5deg);
  left: -18px;
  bottom: 36px;
  background: linear-gradient(to right, #99749D, #B895AB, #CC9AA6, #D7969E, #E0787F);
}

.error-container > span.zero {
  vertical-align: text-top;
  width: 156px;
  height: 156px;
  border-radius: 999px;
  background: linear-gradient(-45deg, transparent 0%, rgba(0, 0, 0, 0.06) 50%,  transparent 51%, transparent 100%),
    linear-gradient(to top right, #99749D, #99749D, #B895AB, #CC9AA6, #D7969E, #ED8687, #ED8687);
  overflow: hidden;
  animation: bgshadow 5s infinite;
}
.error-container > span.zero:before {
  content: '';
  display: block;
  position: absolute;
  transform: rotate(45deg);
  width: 90px;
  height: 90px;
  background-color: transparent;
  left: 0px;
  bottom: 0px;
  background:
    linear-gradient(95deg, transparent 0%, transparent 8%, rgba(0, 0, 0, 0.07) 9%, transparent 50%, transparent 100%),
    linear-gradient(85deg, transparent 0%, transparent 19%, rgba(0, 0, 0, 0.05) 20%, rgba(0, 0, 0, 0.07) 91%, transparent 92%, transparent 100%);
}
.error-container > span.zero:after {
  content: '';
  display: block;
  position: absolute;
  border-radius: 999px;
  width: 70px;
  height: 70px;
  left: 43px;
  bottom: 43px;
  background: #FDFAF5;
  box-shadow: -2px 2px 2px 0px rgba(0, 0, 0, 0.1);
}

.screen-reader-text {
    position: absolute;
    top: -9999em;
    left: -9999em;
}
    
@keyframes bgshadow {
  0% {
    box-shadow: inset -160px 160px 0px 5px rgba(0, 0, 0, 0.1);
  }
  45% {
    box-shadow: inset 0px 0px 0px 0px rgba(0, 0, 0, 0.1);
  }
  55% {
    box-shadow: inset 0px 0px 0px 0px rgba(0, 0, 0, 0.1);
  }
  100% {
    box-shadow: inset 160px -160px 0px 5px rgba(0, 0, 0, 0.1);
  }
}

    .btn-large {
        min-width: 300px;
    }
    .btn-large:hover > a{
        color: darkgreen !important;
    }
    .message {
        margin-top: 0;
    }
    .exception .message {
        text-align: center;
        margin-left: 0;
    }   

</style>

<script src="{$THEME_JS}/jquery.min.js"></script>
<script src="{$THEME_JS}/wow.min.js"></script>
<script src="{$THEME_JS}/slick.min.js"></script>
{tryinclude file="%THEME%/scripts.tpl"}

</body>
</html>
