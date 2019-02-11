{extends file="%alerts%/notice_template.tpl"}
{block name="content"}
     {t alias = "Сообщение пользователю регистрация"
     site = $url->getDomainStr()
     login = $data->user.login
          pass = $data->password
          user_link = $router->getUrl('users-front-profile', [], true)
     }

     <h1>Вы успешно зарегистрированы!</h1>
     <p>Мы рады приветствовать Вас на сайте %site.</p>

     <p>Логин: %login<br>
     Пароль: %pass</p>

     <p>Используйте этот логин и пароль для входа в личный кабинет по адресу <a href="%user_link">%user_link</a>.<br>
     В личном кабинете можно посмотреть историю Ваших заказов, их текущие статусы, а также написать письмо в службу поддержки клиентов.</p>

     <p>Чтобы сократить время оформления заказа, Вы можете использовать этот логин и пароль при следующем оформлении заказа.<br>
     Пожалуйста обратите внимание, что Вы можете изменять пароль в любое время редактируя ваш Профиль.</p>{/t}
{/block}