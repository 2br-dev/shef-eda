-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 11 2019 г., 09:36
-- Версия сервера: 5.6.34
-- Версия PHP: 7.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shef-eda`
--

-- --------------------------------------------------------

--
-- Структура таблицы `md_access_menu`
--

CREATE TABLE `md_access_menu` (
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `menu_id` varchar(50) DEFAULT NULL COMMENT 'ID пункта меню',
  `menu_type` enum('user','admin') NOT NULL DEFAULT 'user' COMMENT 'Тип меню',
  `user_id` int(11) DEFAULT NULL COMMENT 'ID пользователя',
  `group_alias` varchar(50) DEFAULT NULL COMMENT 'ID группы'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_access_menu`
--

INSERT INTO `md_access_menu` (`site_id`, `menu_id`, `menu_type`, `user_id`, `group_alias`) VALUES
(1, '-1', 'user', NULL, 'admins'),
(1, '-2', 'admin', NULL, 'admins'),
(1, '-1', 'user', NULL, 'clients'),
(1, '-1', 'user', NULL, 'guest');

-- --------------------------------------------------------

--
-- Структура таблицы `md_access_module`
--

CREATE TABLE `md_access_module` (
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `module` varchar(150) DEFAULT NULL COMMENT 'Идентификатор модуля',
  `user_id` int(11) DEFAULT NULL COMMENT 'ID пользователя',
  `group_alias` varchar(50) DEFAULT NULL COMMENT 'ID группы',
  `access` int(11) DEFAULT NULL COMMENT 'Уровень доступа'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_access_module_right`
--

CREATE TABLE `md_access_module_right` (
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `group_alias` varchar(50) DEFAULT NULL COMMENT 'ID группы',
  `module` varchar(50) DEFAULT NULL COMMENT 'Идентификатор модуля',
  `right` varchar(150) DEFAULT NULL COMMENT 'Идентификатор права',
  `access` enum('allow','disallow') NOT NULL DEFAULT 'allow' COMMENT 'Уровень доступа'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_access_site`
--

CREATE TABLE `md_access_site` (
  `group_alias` varchar(50) DEFAULT NULL COMMENT 'ID группы',
  `user_id` int(11) DEFAULT NULL COMMENT 'ID пользователя',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта, к которому разрешен доступ'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_access_site`
--

INSERT INTO `md_access_site` (`group_alias`, `user_id`, `site_id`) VALUES
('admins', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `md_affiliate`
--

CREATE TABLE `md_affiliate` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Наименование(регион или город)',
  `alias` varchar(255) DEFAULT NULL COMMENT 'URL имя',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Родитель',
  `clickable` int(11) DEFAULT '1' COMMENT 'Разрешить выбор данного филиала',
  `cost_id` int(11) DEFAULT NULL COMMENT 'Тип цен',
  `short_contacts` mediumtext COMMENT 'Краткая контактная информация',
  `contacts` mediumtext COMMENT 'Контактная информация',
  `coord_lng` decimal(10,6) DEFAULT NULL COMMENT 'Долгота',
  `coord_lat` decimal(10,6) DEFAULT NULL COMMENT 'Широта',
  `skip_geolocation` int(1) NOT NULL DEFAULT '0' COMMENT 'Не выбирать данный филиал с помощью геолокации',
  `sortn` int(11) DEFAULT NULL COMMENT 'Порядк. №',
  `is_default` int(1) NOT NULL COMMENT 'Филиал по умолчанию',
  `is_highlight` int(1) DEFAULT NULL COMMENT 'Выделить филиал визуально',
  `public` int(11) DEFAULT '1' COMMENT 'Публичный',
  `meta_title` varchar(1000) DEFAULT NULL COMMENT 'Заголовок',
  `meta_keywords` varchar(1000) DEFAULT NULL COMMENT 'Ключевые слова',
  `meta_description` varchar(1000) DEFAULT NULL COMMENT 'Описание'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_antivirus_events`
--

CREATE TABLE `md_antivirus_events` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата события',
  `component` varchar(255) DEFAULT NULL COMMENT 'Компонент',
  `type` varchar(255) DEFAULT NULL COMMENT 'Тип события',
  `file` varchar(2048) DEFAULT NULL COMMENT 'Путь к файлу',
  `details` mediumblob COMMENT 'Детали проблемы/уязвимости',
  `viewed` int(1) NOT NULL COMMENT 'Флаг просмотра события администратором'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_antivirus_excluded_files`
--

CREATE TABLE `md_antivirus_excluded_files` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата добавления',
  `component` varchar(255) DEFAULT NULL COMMENT 'Компонент',
  `file` varchar(2048) DEFAULT NULL COMMENT 'Путь к файлу'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_antivirus_request_count`
--

CREATE TABLE `md_antivirus_request_count` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `ip` varchar(100) DEFAULT NULL COMMENT 'IP адрес',
  `last_time` bigint(11) DEFAULT NULL COMMENT 'Дата последнего запроса в милисекундах',
  `count` int(11) NOT NULL COMMENT 'Количество запросов',
  `malicious_count` int(11) NOT NULL COMMENT 'Количество вредоносных запросов'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_antivirus_request_count`
--

INSERT INTO `md_antivirus_request_count` (`id`, `ip`, `last_time`, `count`, `malicious_count`) VALUES
(1, '127.0.0.1', 1549866946005, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `md_article`
--

CREATE TABLE `md_article` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(150) DEFAULT NULL COMMENT 'Название',
  `alias` varchar(150) DEFAULT NULL COMMENT 'Псевдоним(Ан.яз)',
  `content` mediumtext COMMENT 'Содержимое',
  `parent` int(11) DEFAULT NULL COMMENT 'Рубрика',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата и время',
  `image` varchar(255) DEFAULT NULL COMMENT 'Картинка',
  `user_id` bigint(11) DEFAULT NULL COMMENT 'Автор',
  `rating` decimal(3,1) DEFAULT '0.0' COMMENT 'Средний балл(рейтинг)',
  `comments` int(11) DEFAULT '0' COMMENT 'Кол-во комментариев к статье',
  `public` int(1) NOT NULL DEFAULT '1' COMMENT 'Публичный',
  `attached_products` varchar(4000) DEFAULT NULL COMMENT 'Прикреплённые товары',
  `short_content` mediumtext COMMENT 'Краткий текст',
  `meta_title` varchar(1000) DEFAULT NULL COMMENT 'Заголовок',
  `meta_keywords` varchar(1000) DEFAULT NULL COMMENT 'Ключевые слова',
  `meta_description` varchar(1000) DEFAULT NULL COMMENT 'Описание'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_article_category`
--

CREATE TABLE `md_article_category` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(150) DEFAULT NULL COMMENT 'Название',
  `alias` varchar(150) DEFAULT NULL COMMENT 'Псевдоним(Ан.яз)',
  `parent` int(11) DEFAULT NULL COMMENT 'Родительская категория',
  `public` int(1) DEFAULT '1' COMMENT 'Показывать на сайте?',
  `sortn` int(11) DEFAULT NULL COMMENT 'Сортировочный индекс',
  `use_in_sitemap` int(11) DEFAULT NULL COMMENT 'Добавлять в sitemap',
  `meta_title` varchar(1000) DEFAULT NULL COMMENT 'Заголовок',
  `meta_keywords` varchar(1000) DEFAULT NULL COMMENT 'Ключевые слова',
  `meta_description` varchar(1000) DEFAULT NULL COMMENT 'Описание',
  `mobile_public` int(1) DEFAULT '0' COMMENT 'Показывать в мобильном приложении',
  `mobile_image` varchar(50) DEFAULT NULL COMMENT 'Идентификатор картинки Ionic 2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_banner`
--

CREATE TABLE `md_banner` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название баннера',
  `file` varchar(255) DEFAULT NULL COMMENT 'Баннер',
  `use_original_file` int(11) DEFAULT NULL COMMENT 'Использовать оригинал файла для вставки',
  `link` varchar(255) DEFAULT NULL COMMENT 'Ссылка',
  `targetblank` int(11) DEFAULT NULL COMMENT 'Открывать ссылку в новом окне',
  `info` mediumtext COMMENT 'Дополнительная информация',
  `public` int(1) DEFAULT NULL COMMENT 'Публичный',
  `weight` int(11) DEFAULT '100' COMMENT 'Вес от 1 до 100',
  `use_schedule` varchar(255) DEFAULT '0' COMMENT 'Использовать показ по расписанию?',
  `date_start` datetime DEFAULT NULL COMMENT 'Дата начала показа',
  `date_end` datetime DEFAULT NULL COMMENT 'Дата окончания показа',
  `mobile_banner_type` varchar(255) DEFAULT '0' COMMENT 'Тип баннера',
  `mobile_link` varchar(255) DEFAULT '' COMMENT 'Страницы для показа пользователю',
  `mobile_menu_id` int(11) DEFAULT '0' COMMENT 'Страницы для показа пользователю',
  `mobile_product_id` int(11) DEFAULT '0' COMMENT 'Товар для показа пользователю',
  `mobile_category_id` int(11) DEFAULT '0' COMMENT 'Категория для показа пользователю'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_banner_x_zone`
--

CREATE TABLE `md_banner_x_zone` (
  `zone_id` int(11) DEFAULT NULL COMMENT 'ID зоны',
  `banner_id` int(11) DEFAULT NULL COMMENT 'ID баннера'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_banner_zone`
--

CREATE TABLE `md_banner_zone` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `alias` varchar(255) DEFAULT NULL COMMENT 'Симв. идентификатор',
  `width` int(11) DEFAULT NULL COMMENT 'Ширина области, px',
  `height` int(11) DEFAULT NULL COMMENT 'Высота области, px'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_blocked_ip`
--

CREATE TABLE `md_blocked_ip` (
  `ip` varchar(100) NOT NULL COMMENT 'IP-адрес',
  `expire` datetime DEFAULT NULL COMMENT 'Дата разблокировки',
  `comment` varchar(255) DEFAULT NULL COMMENT 'Комментарий'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_brand`
--

CREATE TABLE `md_brand` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(250) DEFAULT NULL COMMENT 'Название бренда',
  `alias` varchar(255) DEFAULT NULL COMMENT 'URL имя',
  `public` int(1) DEFAULT '1' COMMENT 'Публичный',
  `image` varchar(255) DEFAULT NULL COMMENT 'Картинка',
  `description` mediumtext COMMENT 'Описание',
  `xml_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор в системе 1C',
  `sortn` int(11) DEFAULT NULL COMMENT 'Сортировочный номер',
  `meta_title` varchar(1000) DEFAULT NULL COMMENT 'Заголовок',
  `meta_keywords` varchar(1000) DEFAULT NULL COMMENT 'Ключевые слова',
  `meta_description` varchar(1000) DEFAULT NULL COMMENT 'Описание'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_cart`
--

CREATE TABLE `md_cart` (
  `site_id` int(11) NOT NULL COMMENT 'ID сайта',
  `session_id` varchar(32) NOT NULL COMMENT 'ID сессии',
  `uniq` varchar(10) NOT NULL COMMENT 'ID в рамках одной корзины',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата добавления',
  `user_id` bigint(11) DEFAULT NULL COMMENT 'Пользователь',
  `type` enum('product','service','coupon') DEFAULT NULL COMMENT 'Тип записи товар, услуга, скидочный купон',
  `entity_id` varchar(50) DEFAULT NULL COMMENT 'ID объекта type',
  `offer` int(11) DEFAULT NULL COMMENT 'Комплектация',
  `multioffers` mediumtext COMMENT 'Многомерные комплектации',
  `amount` decimal(11,3) DEFAULT '1.000' COMMENT 'Количество',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `extra` mediumtext COMMENT 'Дополнительные сведения'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_comments`
--

CREATE TABLE `md_comments` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `type` varchar(150) DEFAULT NULL COMMENT 'Класс комментария',
  `aid` int(12) DEFAULT NULL COMMENT 'Идентификатор объект',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата',
  `user_id` int(11) DEFAULT NULL COMMENT 'Пользователь',
  `user_name` varchar(100) DEFAULT NULL COMMENT 'Имя пользователя',
  `message` mediumtext COMMENT 'Сообщение',
  `moderated` int(1) DEFAULT NULL COMMENT 'Проверено',
  `rate` int(5) DEFAULT NULL COMMENT 'Оценка (от 1 до 5)',
  `help_yes` int(11) NOT NULL COMMENT 'Ответ помог',
  `help_no` int(11) NOT NULL COMMENT 'Ответ не помог',
  `ip` varchar(15) DEFAULT NULL COMMENT 'IP адрес',
  `useful` int(11) NOT NULL COMMENT 'Полезность'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_comments_votes`
--

CREATE TABLE `md_comments_votes` (
  `ip` varchar(255) DEFAULT NULL COMMENT 'IP пользователя, который оставил комментарий',
  `comment_id` int(11) DEFAULT NULL COMMENT 'ID комментария',
  `help` int(11) DEFAULT NULL COMMENT 'Оценка полезности комментария'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_connect_form`
--

CREATE TABLE `md_connect_form` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(150) DEFAULT NULL COMMENT 'Название',
  `sortn` int(11) DEFAULT NULL COMMENT 'Сортировочный индекс',
  `email` varchar(250) DEFAULT NULL COMMENT 'Email получения писем',
  `subject` varchar(255) DEFAULT 'Получение письма из формы' COMMENT 'Заголовок письма',
  `template` varchar(255) DEFAULT '%feedback%/mail/default.tpl' COMMENT 'Путь к шаблону письма',
  `successMessage` varchar(255) DEFAULT NULL COMMENT 'Сообщение об успешной отправке формы',
  `use_captcha` int(1) DEFAULT NULL COMMENT 'Использовать каптчу',
  `use_csrf_protection` int(11) DEFAULT NULL COMMENT 'Использовать CSRF защиту'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_connect_form`
--

INSERT INTO `md_connect_form` (`id`, `site_id`, `title`, `sortn`, `email`, `subject`, `template`, `successMessage`, `use_captcha`, `use_csrf_protection`) VALUES
(1, 1, 'Обратная связь', NULL, NULL, 'Получение письма из формы', '%feedback%/mail/default.tpl', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `md_connect_form_field`
--

CREATE TABLE `md_connect_form_field` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(150) DEFAULT NULL COMMENT 'Название',
  `alias` varchar(150) DEFAULT NULL COMMENT 'Псевдоним(Ан.яз)',
  `hint` varchar(150) DEFAULT NULL COMMENT 'Подпись поля',
  `form_id` int(11) DEFAULT NULL COMMENT 'Форма',
  `required` int(11) DEFAULT NULL COMMENT 'Обязательное поле',
  `length` int(11) DEFAULT NULL COMMENT 'Длина поля',
  `show_type` varchar(10) DEFAULT NULL COMMENT 'Тип',
  `anwer_list` mediumtext COMMENT 'Значения списка',
  `show_list_as` varchar(255) DEFAULT NULL COMMENT 'Отображать список как',
  `file_size` int(11) DEFAULT '8192' COMMENT 'Макс. размер файлов (Кб)',
  `file_ext` varchar(150) DEFAULT NULL COMMENT 'Допустимые форматы файлов',
  `use_mask` varchar(20) DEFAULT NULL COMMENT 'Маска проверки',
  `mask` varchar(255) DEFAULT NULL COMMENT 'Произвольная маска проверки',
  `attributes` mediumtext COMMENT 'Список дополнительных атрибутов поля в сериализованном виде',
  `error_text` varchar(255) DEFAULT NULL COMMENT 'Текст ошибки',
  `sortn` int(11) DEFAULT NULL COMMENT 'Сортировочный индекс'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_connect_form_field`
--

INSERT INTO `md_connect_form_field` (`id`, `site_id`, `title`, `alias`, `hint`, `form_id`, `required`, `length`, `show_type`, `anwer_list`, `show_list_as`, `file_size`, `file_ext`, `use_mask`, `mask`, `attributes`, `error_text`, `sortn`) VALUES
(1, 1, 'Имя', 'name', 'Представьтесь, пожалуйста', 1, 1, NULL, 'string', '', NULL, 8192, '', '', '', NULL, '', 1),
(2, 1, 'E-mail', 'email', 'Электронный ящик, на который будет направлен ответ', 1, 1, NULL, 'email', '', NULL, 8192, '', '', '', NULL, '', 2),
(3, 1, 'Сообщение', 'message', '', 1, 1, NULL, 'text', '', NULL, 8192, '', '', '', NULL, '', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `md_connect_form_result`
--

CREATE TABLE `md_connect_form_result` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `form_id` int(11) DEFAULT NULL COMMENT 'Форма',
  `title` varchar(150) DEFAULT NULL COMMENT 'Название',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата отправки',
  `status` enum('new','viewed') NOT NULL DEFAULT 'new' COMMENT 'Статус',
  `ip` varchar(150) DEFAULT NULL COMMENT 'IP Пользователя',
  `stext` mediumtext COMMENT 'Содержимое результата формы',
  `answer` mediumtext COMMENT 'Ответ'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_crm_autotaskrule`
--

CREATE TABLE `md_crm_autotaskrule` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `enable` int(11) DEFAULT NULL COMMENT 'Включено',
  `rule_if_class` varchar(255) DEFAULT 'crm-createorder' COMMENT 'Когда создавать задачи?',
  `rule_if_data` mediumtext COMMENT 'Дополнительные параметры',
  `rule_then_data` mediumtext COMMENT 'Данные, которые описывают создание связанных задач'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_crm_custom_data`
--

CREATE TABLE `md_crm_custom_data` (
  `object_type_alias` varchar(50) NOT NULL COMMENT 'Тип объекта, к которому привязан статус',
  `object_id` int(11) NOT NULL COMMENT 'ID объекта',
  `field` varchar(255) NOT NULL COMMENT 'Идентификатор поля',
  `value_float` float DEFAULT NULL COMMENT 'Числовое значение для поиска',
  `value_string` varchar(100) DEFAULT NULL COMMENT 'Строковое значение для поиска',
  `value` mediumtext COMMENT 'Текстовое значение'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_crm_deal`
--

CREATE TABLE `md_crm_deal` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `deal_num` varchar(20) DEFAULT NULL COMMENT 'Уникальный номер сделки',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название сделки',
  `status_id` int(11) DEFAULT NULL COMMENT 'Статус',
  `manager_id` bigint(11) DEFAULT NULL COMMENT 'Менеджер, создавший сделку',
  `client_type` enum('guest','user') DEFAULT 'guest' COMMENT 'Тип клиента',
  `client_name` varchar(255) DEFAULT NULL COMMENT 'Имя клиента',
  `client_id` bigint(11) DEFAULT NULL COMMENT 'Клиент, для которого создается сделка',
  `date_of_create` datetime DEFAULT NULL COMMENT 'Дата создания',
  `message` mediumtext COMMENT 'Комментарий',
  `cost` decimal(20,2) DEFAULT NULL COMMENT 'Сумма сделки',
  `board_sortn` int(11) DEFAULT NULL COMMENT 'Сортировочный индекс на доске',
  `is_archived` int(11) NOT NULL COMMENT 'Сделка архивная?'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_crm_interaction`
--

CREATE TABLE `md_crm_interaction` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `title` varchar(255) DEFAULT NULL COMMENT 'Короткое описание',
  `date_of_create` datetime DEFAULT NULL COMMENT 'Дата создания',
  `duration` varchar(255) DEFAULT NULL COMMENT 'Продолжительность',
  `creator_user_id` bigint(11) DEFAULT NULL COMMENT 'Создатель взаимодействия',
  `message` mediumtext COMMENT 'Комментарий'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_crm_link`
--

CREATE TABLE `md_crm_link` (
  `source_type` varchar(50) DEFAULT NULL COMMENT 'Тип объекта источника',
  `source_id` int(11) DEFAULT NULL COMMENT 'ID объекта источника',
  `link_type` varchar(50) DEFAULT NULL COMMENT 'Тип связываемого объекта ',
  `link_id` int(11) DEFAULT NULL COMMENT 'ID связываемого объекта'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_crm_statuses`
--

CREATE TABLE `md_crm_statuses` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `object_type_alias` varchar(50) DEFAULT NULL COMMENT 'Тип объекта, к которому привязан статус',
  `title` varchar(255) DEFAULT NULL COMMENT 'Наименование статуса',
  `alias` varchar(50) NOT NULL COMMENT 'Англ. идентификатор',
  `color` varchar(7) DEFAULT NULL COMMENT 'Цвет',
  `sortn` int(11) DEFAULT NULL COMMENT 'Порядок'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_crm_statuses`
--

INSERT INTO `md_crm_statuses` (`id`, `object_type_alias`, `title`, `alias`, `color`, `sortn`) VALUES
(1, 'crm-task', 'Новая', 'new', '#cc4b83', 1),
(2, 'crm-task', 'Сделать', 'todo', '#edaf3b', 2),
(3, 'crm-task', 'В работе', 'in-work', '#d1cd5a', 3),
(4, 'crm-task', 'На проверке', 'review', '#6fb3f2', 4),
(5, 'crm-task', 'Выполнена', 'complete', '#28c950', 5),
(6, 'crm-deal', 'Новая', 'new', '#c6d460', 1),
(7, 'crm-deal', 'В работе', 'in-work', '#4c4cf5', 2),
(8, 'crm-deal', 'Успешно завершена', 'success', '#3bc753', 3),
(9, 'crm-deal', 'Отменена', 'fail', '#f21d1d', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `md_crm_task`
--

CREATE TABLE `md_crm_task` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `task_num` varchar(20) DEFAULT NULL COMMENT 'Уникальный номер задачи',
  `title` varchar(255) DEFAULT NULL COMMENT 'Суть задачи',
  `status_id` int(11) DEFAULT NULL COMMENT 'Статус',
  `description` mediumtext COMMENT 'Описание',
  `date_of_create` datetime DEFAULT NULL COMMENT 'Дата создания',
  `date_of_planned_end` datetime DEFAULT NULL COMMENT 'Планируемая дата завершения задачи',
  `date_of_end` datetime DEFAULT NULL COMMENT 'Фактическая дата завершения задачи',
  `expiration_notice_time` int(11) DEFAULT '300' COMMENT 'Уведомить исполнителя о скором истечении срока выполнении задачи за...',
  `expiration_notice_is_send` int(11) DEFAULT NULL COMMENT 'Было ли отправлено уведомление об истечении срока выполнения задачи?',
  `creator_user_id` bigint(11) DEFAULT NULL COMMENT 'Создатель задачи',
  `implementer_user_id` bigint(11) DEFAULT NULL COMMENT 'Исполнитель задачи',
  `board_sortn` int(11) DEFAULT NULL COMMENT 'Сортировочный индекс на доске',
  `is_archived` int(11) NOT NULL COMMENT 'Задача архивная?',
  `autotask_index` int(11) DEFAULT NULL COMMENT 'Порядковый номер автозадачи',
  `autotask_group` int(11) DEFAULT NULL COMMENT 'Идентификатор группы связанных заказов',
  `is_autochange_status` int(11) DEFAULT NULL COMMENT 'Включить автосмену статуса',
  `autochange_status_rule` mediumtext COMMENT 'Условия для смены статуса'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_crm_task_filter`
--

CREATE TABLE `md_crm_task_filter` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `user_id` bigint(11) DEFAULT NULL COMMENT 'Пользователь, для которого настраивается фильтр',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название выборки',
  `filters` mediumtext COMMENT 'Значения фильтров',
  `sortn` int(11) DEFAULT NULL COMMENT 'Порядок'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_csv_map`
--

CREATE TABLE `md_csv_map` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `schema` varchar(255) DEFAULT NULL COMMENT 'Схема импорта-экспорта',
  `type` enum('export','import') DEFAULT NULL COMMENT 'Тип операции',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название предустановки',
  `_columns` varchar(5000) DEFAULT NULL COMMENT 'Информация о колонках'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_currency`
--

CREATE TABLE `md_currency` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(3) DEFAULT NULL COMMENT 'Трехсимвольный идентификатор валюты (Ан. яз)',
  `stitle` varchar(10) DEFAULT NULL COMMENT 'Символ валюты',
  `is_base` int(11) DEFAULT NULL COMMENT 'Это базовая валюта?',
  `ratio` float DEFAULT NULL COMMENT 'Коэффициент относительно базовой валюты',
  `public` int(11) DEFAULT NULL COMMENT 'Видимость',
  `default` int(11) DEFAULT NULL COMMENT 'Выбирать по-умолчанию',
  `percent` float DEFAULT '0' COMMENT 'Увеличивать/уменьшать курс на %'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_currency`
--

INSERT INTO `md_currency` (`id`, `site_id`, `title`, `stitle`, `is_base`, `ratio`, `public`, `default`, `percent`) VALUES
(1, 1, 'RUB', 'р.', 1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `md_document_inventorization`
--

CREATE TABLE `md_document_inventorization` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `applied` int(11) DEFAULT '1' COMMENT 'Проведен',
  `comment` mediumtext COMMENT 'Комментарий',
  `warehouse` int(250) DEFAULT NULL COMMENT 'Склад',
  `fact_amount` int(11) DEFAULT NULL COMMENT 'Фактическое кол-во',
  `calc_amount` int(11) DEFAULT NULL COMMENT 'Расчетное кол-во',
  `dif_amount` int(11) DEFAULT NULL COMMENT 'Разница',
  `date` datetime DEFAULT NULL COMMENT 'Дата',
  `type` varchar(255) DEFAULT NULL COMMENT 'Тип документа'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_document_inventory`
--

CREATE TABLE `md_document_inventory` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `applied` int(11) DEFAULT '1' COMMENT 'Проведен',
  `comment` mediumtext COMMENT 'Комментарий',
  `archived` int(11) DEFAULT '0' COMMENT 'Заархивирован?',
  `warehouse` int(250) DEFAULT NULL COMMENT 'Склад',
  `date` datetime DEFAULT NULL COMMENT 'Дата',
  `provider` int(11) DEFAULT NULL COMMENT 'Поставщик',
  `type` enum('arrival','waiting','reserve','write_off') DEFAULT NULL COMMENT 'Тип документа',
  `items_count` int(11) DEFAULT NULL COMMENT 'Количество товаров'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_document_inventory_products`
--

CREATE TABLE `md_document_inventory_products` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `title` varchar(250) DEFAULT NULL COMMENT 'Название',
  `fact_amount` int(11) DEFAULT NULL COMMENT 'Фактическое кол-во',
  `calc_amount` int(11) DEFAULT NULL COMMENT 'Расчетное кол-во',
  `dif_amount` int(11) DEFAULT NULL COMMENT 'Разница',
  `uniq` varchar(250) DEFAULT NULL COMMENT 'uniq',
  `product_id` int(250) DEFAULT NULL COMMENT 'id товара',
  `offer_id` int(250) DEFAULT NULL COMMENT 'id комплектации',
  `document_id` int(250) DEFAULT NULL COMMENT 'id документа'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_document_links`
--

CREATE TABLE `md_document_links` (
  `source_id` int(11) DEFAULT NULL COMMENT 'id источника',
  `source_type` varchar(255) DEFAULT NULL COMMENT 'тип источника',
  `document_id` varchar(255) DEFAULT NULL COMMENT 'id документа',
  `document_type` varchar(255) DEFAULT NULL COMMENT 'тип документа',
  `order_num` varchar(255) DEFAULT NULL COMMENT 'Номер заказа'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_document_movement`
--

CREATE TABLE `md_document_movement` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `applied` int(11) DEFAULT '1' COMMENT 'Проведен',
  `comment` mediumtext COMMENT 'Комментарий',
  `warehouse_from` int(250) DEFAULT NULL COMMENT 'Со склада',
  `warehouse_to` int(250) DEFAULT NULL COMMENT 'На склад',
  `date` datetime DEFAULT NULL COMMENT 'Дата',
  `type` varchar(255) DEFAULT NULL COMMENT 'Тип документа'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_document_movement_products`
--

CREATE TABLE `md_document_movement_products` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `title` varchar(250) DEFAULT NULL COMMENT 'Название',
  `amount` int(11) DEFAULT NULL COMMENT 'Количество',
  `uniq` varchar(250) DEFAULT NULL COMMENT 'uniq',
  `product_id` int(250) DEFAULT NULL COMMENT 'id товара',
  `offer_id` int(250) DEFAULT NULL COMMENT 'id комплектации',
  `document_id` int(250) DEFAULT NULL COMMENT 'id документа'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_document_products`
--

CREATE TABLE `md_document_products` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `title` varchar(250) DEFAULT NULL COMMENT 'Название',
  `amount` varchar(250) DEFAULT NULL COMMENT 'Количество',
  `uniq` varchar(250) DEFAULT NULL COMMENT 'Уникальный Идентификатор',
  `product_id` int(250) DEFAULT NULL COMMENT 'Id товара',
  `offer_id` int(250) DEFAULT NULL COMMENT 'Id комплектации',
  `warehouse` int(250) DEFAULT NULL COMMENT 'Id склада',
  `document_id` int(250) DEFAULT NULL COMMENT 'Id документа'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_document_products_archive`
--

CREATE TABLE `md_document_products_archive` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `title` varchar(250) DEFAULT NULL COMMENT 'Название',
  `amount` varchar(250) DEFAULT NULL COMMENT 'Количество',
  `uniq` varchar(250) DEFAULT NULL COMMENT 'Уникальный Идентификатор',
  `product_id` int(250) DEFAULT NULL COMMENT 'Id товара',
  `offer_id` int(250) DEFAULT NULL COMMENT 'Id комплектации',
  `warehouse` int(250) DEFAULT NULL COMMENT 'Id склада',
  `document_id` int(250) DEFAULT NULL COMMENT 'Id документа'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_document_products_start_num`
--

CREATE TABLE `md_document_products_start_num` (
  `product_id` int(11) DEFAULT NULL COMMENT 'ID товара',
  `offer_id` int(11) DEFAULT NULL COMMENT 'ID комплектации',
  `warehouse_id` int(11) DEFAULT NULL COMMENT 'ID склада',
  `stock` decimal(11,3) DEFAULT '0.000' COMMENT 'Доступно',
  `reserve` decimal(11,3) DEFAULT '0.000' COMMENT 'Резерв',
  `waiting` decimal(11,3) DEFAULT '0.000' COMMENT 'Ожидание',
  `remains` decimal(11,3) DEFAULT '0.000' COMMENT 'Остаток'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_exchange_history`
--

CREATE TABLE `md_exchange_history` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата обмена',
  `method` varchar(10) DEFAULT NULL COMMENT 'Метод',
  `type` varchar(20) DEFAULT NULL COMMENT 'Тип',
  `mode` varchar(20) DEFAULT NULL COMMENT 'Режим',
  `query` varchar(1024) DEFAULT NULL COMMENT 'Запрос',
  `postsize` int(10) DEFAULT NULL COMMENT 'Размер post',
  `response` mediumtext COMMENT 'Ответ сервера',
  `duration` decimal(10,3) DEFAULT NULL COMMENT 'Время обработки запроса сек.',
  `memory_peak` int(10) DEFAULT NULL COMMENT 'Памяти израсходовано',
  `readed_nodes` int(10) DEFAULT NULL COMMENT 'Позиция, на которой остановился импорт',
  `log` mediumtext COMMENT 'Записи в лог-файл'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_export_profile`
--

CREATE TABLE `md_export_profile` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `alias` varchar(150) DEFAULT NULL COMMENT 'URL имя',
  `class` varchar(255) DEFAULT NULL COMMENT 'Класс экспорта',
  `life_time` int(11) DEFAULT NULL COMMENT 'Период экспорта',
  `url_params` varchar(255) DEFAULT NULL COMMENT 'Дополнительные параметры<br/> для ссылки на товар',
  `_serialized` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_external_api_log`
--

CREATE TABLE `md_external_api_log` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата совершения запроса',
  `request_uri` mediumtext COMMENT 'URL запроса к API',
  `request_params` blob COMMENT 'Параметры запроса',
  `response` mediumblob COMMENT 'Ответ на запрос',
  `ip` varchar(255) DEFAULT NULL COMMENT 'IP-адрес',
  `user_id` int(11) DEFAULT NULL COMMENT 'Пользователь',
  `token` varchar(255) DEFAULT NULL COMMENT 'Авторизационный токен',
  `client_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор клиента',
  `method` varchar(255) DEFAULT NULL COMMENT 'Метод API',
  `error_code` varchar(255) DEFAULT NULL COMMENT 'Код ошибки'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_external_api_token`
--

CREATE TABLE `md_external_api_token` (
  `token` varchar(255) DEFAULT NULL COMMENT 'Авторизационный токен',
  `user_id` int(11) DEFAULT NULL COMMENT 'ID Пользователя',
  `app_type` varchar(255) DEFAULT NULL COMMENT 'Класс приложения',
  `ip` varchar(255) DEFAULT NULL COMMENT 'IP-адрес',
  `dateofcreate` datetime DEFAULT NULL COMMENT 'Дата создания',
  `expire` int(11) DEFAULT NULL COMMENT 'Срок истечения авторизационного токена'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_external_api_user_allow_methods`
--

CREATE TABLE `md_external_api_user_allow_methods` (
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `user_id` bigint(11) DEFAULT NULL COMMENT 'Пользователь',
  `api_method` varchar(255) DEFAULT NULL COMMENT 'Имя метода API'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_fast_link`
--

CREATE TABLE `md_fast_link` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название ссылки',
  `link` varchar(255) DEFAULT NULL COMMENT 'Ссылка',
  `target` enum('window','blank') DEFAULT NULL COMMENT 'Открывать',
  `icon` varchar(255) DEFAULT 'zmdi-open-in-new' COMMENT 'Иконка',
  `bgcolor` varchar(7) DEFAULT '#eeeeee' COMMENT 'Цвет фона иконки',
  `sortn` int(11) DEFAULT NULL COMMENT 'Порядок'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_files`
--

CREATE TABLE `md_files` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `servername` varchar(50) DEFAULT NULL COMMENT 'Имя файла на сервере',
  `name` varchar(255) DEFAULT NULL COMMENT 'Название файла',
  `description` mediumtext COMMENT 'Описание',
  `size` varchar(255) DEFAULT NULL COMMENT 'Размер файла',
  `mime` varchar(255) DEFAULT NULL COMMENT 'Mime тип файла',
  `access` varchar(255) DEFAULT NULL COMMENT 'Уровень доступа',
  `sortn` int(11) DEFAULT NULL COMMENT 'Порядковый номер',
  `link_type_class` varchar(100) DEFAULT NULL COMMENT 'Класс типа связываемых объектов',
  `link_id` int(11) DEFAULT NULL COMMENT 'ID связанного объекта',
  `xml_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор в сторонней системе',
  `uniq` varchar(32) DEFAULT NULL COMMENT 'Уникальный идентификатор',
  `uniq_name` varchar(255) DEFAULT NULL COMMENT 'Уникальное название файла (url-имя)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_hash_store`
--

CREATE TABLE `md_hash_store` (
  `hash` bigint(12) NOT NULL COMMENT 'Хэш ключа',
  `value` varchar(4000) DEFAULT NULL COMMENT 'Значение для ключа'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_hash_store`
--

INSERT INTO `md_hash_store` (`hash`, `value`) VALUES
(3227350232, 'b:1;'),
(3203139685, 'b:1;'),
(1318362129, 'b:1;'),
(876603600, 'b:1;'),
(1263585396, 'b:1;'),
(2721279297, 'b:1;'),
(2774444376, 'b:1;'),
(3410143375, 'b:1;'),
(1380710709, 'b:1;'),
(330477605, 'b:1;'),
(1689616563, 'b:1;'),
(4030504467, 'b:1;'),
(330825122, 'b:1;'),
(3938926908, 'b:1;'),
(2392926377, 'b:1;'),
(2045954494, 'b:1;'),
(2467047061, 'b:1;'),
(2830556431, 'b:1;'),
(880788988, 'b:1;'),
(1658998507, 'b:1;'),
(3540042858, 'b:1;'),
(2270996553, 'b:1;'),
(3796323324, 'b:1;'),
(3681538968, 'b:1;'),
(617101625, 'b:1;'),
(2420634801, 'b:1;'),
(3196438845, 'b:1;'),
(1599035878, 'b:1;'),
(1763814139, 'b:1;'),
(626166410, 'b:1;'),
(3614776887, 'b:1;'),
(1233211065, 'b:1;'),
(2840897447, 'b:1;'),
(2296611849, 'b:1;'),
(4160181905, 'b:1;'),
(3945304734, 'b:1;'),
(2638322274, 'b:1;'),
(2773365246, 'b:1;'),
(2887763448, 'b:1;'),
(2253723831, 'b:1;'),
(1865858434, 'b:1;'),
(4131384376, 'b:1;'),
(105347148, 'b:1;'),
(1982696643, 'b:1;'),
(2552491503, 'b:1;'),
(1757201611, 'b:1;'),
(1906832778, 'b:1;'),
(2839650087, 'b:1;'),
(2618964412, 'b:1;'),
(841392839, 'b:1;'),
(725455750, 'b:1;'),
(3000203793, 'b:1;'),
(1294996616, 'b:1;'),
(22065818, 'b:1;'),
(2448404235, 'b:1;'),
(2454582507, 'b:1;'),
(3302029545, 's:25:\"2129681177-32923876713849\";'),
(2098456608, 's:32:\"55d3755572a4c4b7ab15b7387a6b8a3d\";'),
(1778353382, 's:411:\"a:41:{i:0;i:1319;i:1;i:36;i:2;i:39;i:3;i:56;i:4;i:39;i:5;i:11;i:6;i:35;i:7;i:1074;i:8;i:9;i:9;i:24;i:10;i:21;i:11;i:34;i:12;i:42;i:13;i:10;i:14;i:47;i:15;i:29;i:16;i:26;i:17;i:37;i:18;i:10;i:19;i:140;i:20;i:26;i:21;i:48;i:22;i:12;i:23;i:88;i:24;i:18;i:25;i:10;i:26;i:10;i:27;i:23;i:28;i:23;i:29;i:35;i:30;i:12;i:31;i:419;i:32;i:36;i:33;i:7;i:34;i:21;i:35;i:76;i:36;i:30;i:37;i:15;i:38;i:91;i:39;i:79;i:40;i:33;}\";'),
(1236226021, 'i:5771;'),
(3606101029, 's:3:\"110\";'),
(2287582876, 's:3:\"193\";'),
(3236832156, 'b:1;');

-- --------------------------------------------------------

--
-- Структура таблицы `md_images`
--

CREATE TABLE `md_images` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `servername` varchar(25) DEFAULT NULL COMMENT 'Имя файла на сервере',
  `filename` varchar(255) DEFAULT NULL COMMENT 'Оригинальное имя файла',
  `view_count` int(11) DEFAULT NULL COMMENT 'Количество просмотров',
  `size` int(11) DEFAULT NULL COMMENT 'Размер файла',
  `mime` varchar(20) DEFAULT NULL COMMENT 'Mime тип изображения',
  `sortn` int(11) NOT NULL COMMENT 'Порядковый номер',
  `title` mediumtext COMMENT 'Подпись изображения',
  `type` varchar(20) DEFAULT NULL COMMENT 'Название объекта, которому принадлежат изображения',
  `linkid` int(11) DEFAULT NULL COMMENT 'Идентификатор объекта, которому принадлежит изображение',
  `extra` varchar(255) DEFAULT NULL COMMENT 'Дополнительный символьный идентификатор изображения',
  `hash` varchar(50) DEFAULT NULL COMMENT 'Хэш содержимого файла'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_license`
--

CREATE TABLE `md_license` (
  `license` varchar(24) NOT NULL COMMENT 'Лицензионный номер',
  `data` blob,
  `crypt_type` varchar(255) DEFAULT 'mcrypt',
  `type` varchar(50) DEFAULT NULL COMMENT 'Тип лицензии'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_license`
--

INSERT INTO `md_license` (`license`, `data`, `crypt_type`, `type`) VALUES
('00KP-FY1Q-472W-Q8QG-55A9', 0x6748635a5574387246626f356f556678513255784d4d694b654442394f61495371706d354f6c7374395131612b7870484445735151702f58706752396a3856562f487a4d68575672466a38446a4d506b76735161533648335178485854567a6c667a4f6962796c5758756b3958525362597a68755258423955776e4c485854736f4b4e6f654d5054326778766b6c426b4455304e34753249777833524e5a4d4a6554526a32354c46727443546f6b54686273536e5672476b776e306e336f654453615278504e52744f41474d4f30346a5a56447a392b724747766e7263384e7732686c4577576a43547678566836425948687735787753704c305035323838517351585230374975454e584f4d41556875564b2f6634313464744c4f7157494874447a6b696b45754f413352466e5157326b4a3537656e6a796637745459763147667a5641674367794a724e487973363134566a43515651737258633965326b6d646e696f6c513877666d5650493151444f51694d4b43475150577164727352546d47796c586a6c2f4f754c58456c6a2f362f736f4a5945334566424b436358444a4a70617a7271534d514b34634d792b712f4647626d48377a784f6b75337162717668715873447962376c6f6e6c616768344534413d3d, 'mcrypt', 'script');

-- --------------------------------------------------------

--
-- Структура таблицы `md_menu`
--

CREATE TABLE `md_menu` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `menutype` varchar(70) DEFAULT NULL COMMENT 'Тип меню',
  `title` varchar(150) DEFAULT NULL COMMENT 'Название',
  `hide_from_url` int(1) DEFAULT NULL COMMENT 'Не использовать для построения URL',
  `alias` varchar(150) DEFAULT NULL COMMENT 'Симв. идентификатор',
  `parent` int(11) DEFAULT NULL COMMENT 'Родитель',
  `public` int(1) DEFAULT '1' COMMENT 'Публичный',
  `typelink` varchar(20) DEFAULT 'article' COMMENT 'Тип элемента',
  `sortn` int(11) DEFAULT NULL COMMENT 'Порядк. №',
  `content` mediumtext COMMENT 'Статья',
  `link` varchar(255) DEFAULT NULL COMMENT 'Ссылка',
  `target_blank` int(1) DEFAULT '0' COMMENT 'Открывать ссылку в новом окне',
  `link_template` varchar(255) DEFAULT NULL COMMENT 'Шаблон',
  `affiliate_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Филиал',
  `mobile_public` int(1) DEFAULT '0' COMMENT 'Показывать в мобильном приложении',
  `mobile_image` varchar(50) DEFAULT NULL COMMENT 'Идентификатор картинки Ionic 2',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Партнёрский сайт'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_menu`
--

INSERT INTO `md_menu` (`id`, `site_id`, `menutype`, `title`, `hide_from_url`, `alias`, `parent`, `public`, `typelink`, `sortn`, `content`, `link`, `target_blank`, `link_template`, `affiliate_id`, `mobile_public`, `mobile_image`, `partner_id`) VALUES
(1, 1, NULL, 'контакты', NULL, 'kontakty', 0, 1, 'affiliate', NULL, NULL, NULL, 0, NULL, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `md_module_config`
--

CREATE TABLE `md_module_config` (
  `site_id` int(11) NOT NULL COMMENT 'ID сайта',
  `module` varchar(150) NOT NULL COMMENT 'Имя модуля',
  `data` mediumtext COMMENT 'Данные модуля'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_module_config`
--

INSERT INTO `md_module_config` (`site_id`, `module`, `data`) VALUES
(1, 'menu', 'a:3:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;}'),
(1, 'site', 'a:3:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;}'),
(1, 'main', 'a:16:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:13:\"image_quality\";s:2:\"95\";s:9:\"watermark\";N;s:15:\"wmark_min_width\";s:3:\"300\";s:16:\"wmark_min_height\";s:3:\"300\";s:11:\"wmark_pos_x\";s:6:\"center\";s:11:\"wmark_pos_y\";s:6:\"middle\";s:13:\"wmark_opacity\";s:3:\"100\";s:11:\"csv_charset\";s:12:\"windows-1251\";s:13:\"csv_delimiter\";s:1:\";\";s:17:\"csv_check_timeout\";s:1:\"1\";s:11:\"csv_timeout\";s:2:\"26\";s:14:\"geo_ip_service\";s:9:\"ipgeobase\";s:12:\"dadata_token\";N;}'),
(1, 'users', 'a:8:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:24:\"generate_password_length\";s:1:\"8\";s:25:\"generate_password_symbols\";s:64:\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789#?\";s:10:\"userfields\";N;s:19:\"clear_for_last_time\";i:2160;s:12:\"clear_random\";i:5;}'),
(1, 'modcontrol', 'a:3:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;}'),
(1, 'alerts', 'a:9:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:16:\"sms_sender_class\";s:9:\"smsuslugi\";s:16:\"sms_sender_login\";N;s:15:\"sms_sender_pass\";N;s:14:\"sms_sender_log\";i:0;s:25:\"notice_items_delete_hours\";s:3:\"120\";s:17:\"allow_user_groups\";a:2:{i:0;s:10:\"supervisor\";i:1;s:6:\"admins\";}}'),
(0, 'antivirus', 'a:17:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:20:\"signverify_step_size\";s:2:\"50\";s:30:\"signverify_step_size_intensive\";s:3:\"500\";s:23:\"signverify_auto_recover\";s:1:\"0\";s:19:\"antivirus_step_size\";s:2:\"10\";s:29:\"antivirus_step_size_intensive\";s:3:\"100\";s:26:\"antivirus_max_file_size_kb\";s:3:\"512\";s:22:\"antivirus_auto_recover\";s:1:\"0\";s:26:\"proactive_allowed_interval\";s:4:\"1000\";s:24:\"proactive_block_duration\";s:4:\"3600\";s:20:\"proactive_auto_block\";s:1:\"0\";s:31:\"proactive_trigger_request_count\";s:2:\"30\";s:41:\"proactive_trigger_malicious_request_count\";s:1:\"5\";s:21:\"proactive_trusted_ips\";N;s:29:\"proactive_trusted_user_agents\";N;}'),
(1, 'article', 'a:5:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:21:\"preview_list_pagesize\";s:2:\"10\";s:13:\"search_fields\";a:4:{i:0;s:5:\"title\";i:1;s:13:\"short_content\";i:2;s:7:\"content\";i:3;s:13:\"meta_keywords\";}}'),
(1, 'atolonline', 'a:12:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:11:\"service_url\";N;s:14:\"_load_settings\";N;s:5:\"login\";N;s:4:\"pass\";N;s:10:\"group_code\";N;s:3:\"inn\";N;s:3:\"sno\";N;s:6:\"domain\";N;s:11:\"api_version\";s:1:\"3\";}'),
(1, 'banners', 'a:3:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;}'),
(1, 'cdn', 'a:5:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:6:\"domain\";N;s:12:\"cdn_elements\";a:2:{i:0;s:2:\"js\";i:1;s:3:\"img\";}}'),
(1, 'comments', 'a:7:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:13:\"need_moderate\";s:1:\"N\";s:19:\"allow_more_comments\";s:1:\"0\";s:14:\"need_authorize\";s:1:\"N\";s:23:\"widget_newlist_pagesize\";s:1:\"8\";}'),
(0, 'crm', 'a:9:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:20:\"widget_task_pagesize\";s:2:\"15\";s:31:\"expiration_task_notice_statuses\";a:1:{i:0;s:1:\"0\";}s:35:\"expiration_task_default_notice_time\";a:1:{i:0;s:3:\"300\";}s:15:\"deal_userfields\";N;s:22:\"interaction_userfields\";N;s:15:\"task_userfields\";N;}'),
(1, 'emailsubscribe', 'a:4:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:17:\"dialog_open_delay\";s:1:\"0\";}'),
(1, 'exchange', 'a:44:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:10:\"file_limit\";s:6:\"204800\";s:7:\"use_zip\";i:1;s:14:\"brand_property\";N;s:12:\"import_brand\";i:0;s:15:\"weight_property\";N;s:7:\"use_log\";s:1:\"0\";s:13:\"history_depth\";s:1:\"0\";s:20:\"dont_check_sale_init\";i:0;s:22:\"catalog_element_action\";s:7:\"nothing\";s:20:\"catalog_offer_action\";N;s:22:\"catalog_section_action\";s:7:\"nothing\";s:23:\"catalog_import_interval\";s:2:\"30\";s:15:\"is_unic_barcode\";N;s:15:\"is_unic_dirname\";N;s:23:\"catalog_translit_on_add\";N;s:26:\"catalog_translit_on_update\";N;s:22:\"catalog_keep_spec_dirs\";s:1:\"1\";s:21:\"catalog_update_parent\";s:1:\"1\";s:18:\"product_update_dir\";s:1:\"1\";s:16:\"dont_delete_prop\";i:1;s:17:\"dont_delete_costs\";N;s:18:\"dont_update_fields\";N;s:24:\"dont_update_offer_fields\";N;s:24:\"dont_update_group_fields\";N;s:22:\"multi_separator_fields\";s:0:\"\";s:24:\"allow_insert_multioffers\";s:1:\"1\";s:20:\"unique_offer_barcode\";i:0;s:20:\"sort_offers_by_title\";i:0;s:24:\"cat_for_catless_porducts\";N;s:22:\"sale_export_only_payed\";N;s:20:\"sale_export_statuses\";a:0:{}s:29:\"sale_final_status_on_delivery\";s:1:\"0\";s:24:\"sale_final_status_on_pay\";N;s:29:\"sale_final_status_on_shipment\";N;s:28:\"sale_final_status_on_success\";N;s:27:\"sale_final_status_on_cancel\";N;s:32:\"order_flag_cancel_requisite_name\";s:14:\"Отменен\";s:21:\"sale_replace_currency\";s:7:\"руб.\";s:19:\"order_update_status\";i:0;s:15:\"export_timezone\";s:7:\"default\";s:16:\"uniq_delivery_id\";N;}'),
(1, 'export', 'a:3:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;}'),
(1, 'extcsv', 'a:6:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:13:\"csv_id_fields\";a:1:{i:0;s:7:\"barcode\";}s:24:\"csv_recommended_id_field\";s:5:\"title\";s:24:\"csv_concomitant_id_field\";s:5:\"title\";}'),
(1, 'externalapi', 'a:11:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:12:\"allow_domain\";N;s:7:\"api_key\";s:8:\"ahgin6up\";s:15:\"enable_api_help\";s:1:\"0\";s:27:\"show_internal_error_details\";s:1:\"0\";s:14:\"token_lifetime\";s:8:\"31536000\";s:19:\"default_api_version\";s:1:\"1\";s:18:\"enable_request_log\";N;s:17:\"allow_api_methods\";a:1:{i:0;s:3:\"all\";}}'),
(1, 'feedback', 'a:3:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;}'),
(1, 'files', 'a:3:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;}'),
(1, 'install', 'a:3:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;}'),
(1, 'kaptcha', 'a:3:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;}'),
(1, 'marketplace', 'a:4:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:20:\"allow_remote_install\";i:1;}'),
(1, 'mobilemanagerapp', 'a:5:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:17:\"allow_user_groups\";a:2:{i:0;s:10:\"supervisor\";i:1;s:6:\"admins\";}s:11:\"push_enable\";s:1:\"1\";}'),
(1, 'mobilesiteapp', 'a:20:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:13:\"default_theme\";s:13:\"mobilesiteapp\";s:17:\"allow_user_groups\";a:4:{i:0;s:10:\"supervisor\";i:1;s:6:\"admins\";i:2;s:7:\"clients\";i:3;s:5:\"guest\";}s:11:\"disable_buy\";s:1:\"0\";s:11:\"push_enable\";s:1:\"1\";s:11:\"banner_zone\";s:1:\"0\";s:12:\"mobile_phone\";s:0:\"\";s:8:\"root_dir\";s:1:\"0\";s:21:\"tablet_root_dir_sizes\";s:10:\"ssMssMssss\";s:17:\"products_pagesize\";s:2:\"20\";s:13:\"menu_root_dir\";s:1:\"0\";s:16:\"top_products_dir\";s:1:\"0\";s:21:\"top_products_pagesize\";s:1:\"8\";s:18:\"top_products_order\";s:5:\"title\";s:20:\"mobile_products_size\";s:1:\"6\";s:20:\"tablet_products_size\";s:1:\"4\";s:21:\"article_root_category\";N;s:18:\"enable_app_sticker\";s:1:\"1\";}'),
(1, 'notes', 'a:4:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:22:\"widget_notes_page_size\";s:2:\"10\";}'),
(1, 'pageseo', 'a:3:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;}'),
(1, 'photo', 'a:7:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:22:\"original_photos_resize\";s:1:\"1\";s:21:\"original_photos_width\";s:4:\"1500\";s:22:\"original_photos_height\";s:4:\"1500\";s:23:\"product_sort_photo_desc\";s:1:\"0\";}'),
(1, 'pushsender', 'a:5:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:20:\"googlefcm_server_key\";N;s:10:\"enable_log\";N;}'),
(1, 'search', 'a:5:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:14:\"search_service\";s:26:\"\\Search\\Model\\Engine\\Mysql\";s:11:\"search_type\";s:4:\"like\";}'),
(1, 'sitemap', 'a:10:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:8:\"priority\";s:3:\"0.5\";s:10:\"changefreq\";s:8:\"disabled\";s:28:\"set_generate_time_as_lastmod\";N;s:8:\"lifetime\";s:4:\"1440\";s:8:\"add_urls\";N;s:12:\"exclude_urls\";N;s:20:\"max_chunk_item_count\";s:5:\"50000\";}'),
(1, 'siteupdate', 'a:4:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:26:\"file_download_part_size_mb\";s:1:\"7\";}'),
(1, 'statistic', 'a:4:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:22:\"consider_orders_status\";a:1:{i:0;s:1:\"0\";}}'),
(1, 'support', 'a:5:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:25:\"send_admin_message_notice\";s:1:\"Y\";s:24:\"send_user_message_notice\";s:1:\"Y\";}'),
(1, 'tags', 'a:3:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;}'),
(1, 'templates', 'a:3:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;}'),
(1, 'yandexmarketcpa', 'a:51:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:15:\"secret_part_url\";s:8:\"yoz88v6a\";s:10:\"auth_token\";N;s:6:\"ytoken\";N;s:13:\"ytoken_expire\";N;s:11:\"campaign_id\";N;s:10:\"enable_log\";N;s:20:\"ignore_city_unexists\";s:1:\"1\";s:20:\"disable_status_graph\";N;s:18:\"reserve_until_days\";s:1:\"3\";s:15:\"min_pickup_days\";s:1:\"1\";s:15:\"max_pickup_days\";s:2:\"14\";s:24:\"payment_cash_on_delivery\";i:2;s:24:\"payment_card_on_delivery\";i:3;s:15:\"payment_generic\";i:1;s:16:\"status_cancelled\";s:1:\"6\";s:24:\"status_cancelled_reverse\";a:1:{i:0;s:1:\"6\";}s:15:\"status_delivery\";i:7;s:23:\"status_delivery_reverse\";a:1:{i:0;i:7;}s:16:\"status_delivered\";s:1:\"5\";s:24:\"status_delivered_reverse\";a:1:{i:0;s:1:\"5\";}s:13:\"status_pickup\";i:8;s:21:\"status_pickup_reverse\";a:1:{i:0;i:9;}s:17:\"status_processing\";s:1:\"1\";s:25:\"status_processing_reverse\";a:1:{i:0;s:1:\"1\";}s:15:\"status_reserved\";i:9;s:23:\"status_reserved_reverse\";N;s:13:\"status_unpaid\";s:1:\"2\";s:21:\"status_unpaid_reverse\";a:1:{i:0;s:1:\"2\";}s:28:\"substatus_processing_expired\";s:1:\"1\";s:36:\"substatus_processing_expired_reverse\";a:1:{i:0;s:1:\"1\";}s:25:\"substatus_replacing_order\";s:1:\"2\";s:33:\"substatus_replacing_order_reverse\";a:1:{i:0;s:1:\"2\";}s:29:\"substatus_reservation_expired\";s:1:\"3\";s:37:\"substatus_reservation_expired_reverse\";a:1:{i:0;s:1:\"3\";}s:21:\"substatus_shop_failed\";s:1:\"4\";s:29:\"substatus_shop_failed_reverse\";a:1:{i:0;s:1:\"4\";}s:27:\"substatus_user_changed_mind\";s:1:\"5\";s:35:\"substatus_user_changed_mind_reverse\";a:1:{i:0;s:1:\"5\";}s:23:\"substatus_user_not_paid\";s:1:\"6\";s:31:\"substatus_user_not_paid_reverse\";a:1:{i:0;s:1:\"6\";}s:31:\"substatus_user_refused_delivery\";s:1:\"7\";s:39:\"substatus_user_refused_delivery_reverse\";a:1:{i:0;s:1:\"7\";}s:30:\"substatus_user_refused_product\";s:1:\"8\";s:38:\"substatus_user_refused_product_reverse\";a:1:{i:0;s:1:\"8\";}s:30:\"substatus_user_refused_quality\";s:1:\"9\";s:38:\"substatus_user_refused_quality_reverse\";a:1:{i:0;s:1:\"9\";}s:26:\"substatus_user_unreachable\";s:2:\"10\";s:34:\"substatus_user_unreachable_reverse\";a:1:{i:0;s:2:\"10\";}}'),
(1, 'catalog', 'a:62:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:12:\"default_cost\";i:1;s:8:\"old_cost\";N;s:23:\"hide_unobtainable_goods\";s:1:\"N\";s:14:\"list_page_size\";s:2:\"12\";s:13:\"items_on_page\";N;s:18:\"list_default_order\";s:5:\"sortn\";s:28:\"list_default_order_direction\";s:3:\"asc\";s:23:\"list_order_instok_first\";i:0;s:20:\"list_default_view_as\";s:6:\"blocks\";s:12:\"default_unit\";s:10:\"грамм\";s:15:\"concat_dir_meta\";s:1:\"1\";s:12:\"auto_barcode\";s:6:\"a{n|6}\";s:20:\"disable_search_index\";s:1:\"0\";s:11:\"price_round\";s:4:\"0.01\";s:8:\"cbr_link\";N;s:24:\"cbr_auto_update_interval\";i:1440;s:18:\"cbr_percent_update\";i:0;s:14:\"use_offer_unit\";s:1:\"0\";s:21:\"import_photos_timeout\";s:2:\"20\";s:15:\"use_seo_filters\";s:1:\"0\";s:17:\"show_all_products\";s:1:\"0\";s:17:\"price_like_slider\";s:1:\"0\";s:13:\"search_fields\";a:5:{i:0;s:10:\"properties\";i:1;s:7:\"barcode\";i:2;s:5:\"brand\";i:3;s:17:\"short_description\";i:4;s:13:\"meta_keywords\";}s:22:\"not_public_product_404\";s:1:\"1\";s:29:\"link_property_to_offer_amount\";N;s:11:\"clickfields\";N;s:13:\"buyinoneclick\";s:1:\"1\";s:18:\"dont_buy_when_null\";s:1:\"0\";s:22:\"oneclick_name_required\";s:1:\"1\";s:13:\"csv_id_fields\";a:2:{i:0;s:5:\"title\";i:1;s:7:\"barcode\";}s:30:\"csv_offer_product_search_field\";s:5:\"title\";s:22:\"csv_offer_search_field\";s:5:\"sortn\";s:22:\"brand_products_specdir\";s:1:\"0\";s:18:\"brand_products_cnt\";s:1:\"8\";s:32:\"brand_products_hide_unobtainable\";N;s:16:\"warehouse_sticks\";s:12:\"1,5,15,25,50\";s:27:\"affiliate_stock_restriction\";N;s:24:\"inventory_control_enable\";s:1:\"0\";s:16:\"ic_enable_button\";i:0;s:19:\"provider_user_group\";N;s:16:\"csv_id_fields_ic\";s:7:\"barcode\";s:19:\"yuml_import_setting\";s:1:\"0\";s:18:\"import_yml_timeout\";s:2:\"20\";s:18:\"import_yml_cost_id\";N;s:22:\"catalog_element_action\";N;s:22:\"catalog_section_action\";N;s:18:\"dont_update_fields\";N;s:14:\"use_htmlentity\";i:0;s:13:\"increase_cost\";i:0;s:14:\"use_vendorcode\";s:8:\"offer_id\";s:26:\"default_product_meta_title\";N;s:29:\"default_product_meta_keywords\";N;s:32:\"default_product_meta_description\";N;s:14:\"default_weight\";s:1:\"0\";s:11:\"weight_unit\";s:1:\"g\";s:23:\"property_product_length\";N;s:22:\"property_product_width\";N;s:23:\"property_product_height\";N;s:15:\"dimensions_unit\";s:2:\"sm\";}'),
(1, 'shop', 'a:57:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:14:\"basketminlimit\";s:1:\"0\";s:20:\"basketminweightlimit\";N;s:14:\"check_quantity\";s:1:\"0\";s:18:\"first_order_status\";i:2;s:21:\"user_orders_page_size\";s:2:\"10\";s:20:\"use_personal_account\";s:1:\"1\";s:11:\"reservation\";s:1:\"0\";s:28:\"allow_concomitant_count_edit\";s:1:\"0\";s:11:\"source_cost\";N;s:18:\"auto_change_status\";N;s:24:\"auto_change_timeout_days\";N;s:23:\"auto_change_from_status\";N;s:21:\"auto_change_to_status\";N;s:23:\"auto_send_supply_notice\";s:1:\"1\";s:18:\"courier_user_group\";N;s:15:\"ban_courier_del\";s:1:\"0\";s:25:\"remove_nopublic_from_cart\";s:1:\"0\";s:10:\"userfields\";N;s:20:\"default_checkout_tab\";s:6:\"person\";s:15:\"default_country\";s:1:\"0\";s:14:\"default_region\";s:1:\"0\";s:12:\"default_city\";s:1:\"0\";s:15:\"default_zipcode\";s:0:\"\";s:15:\"require_country\";s:1:\"1\";s:14:\"require_region\";s:1:\"1\";s:12:\"require_city\";s:1:\"1\";s:15:\"require_zipcode\";s:1:\"0\";s:15:\"require_address\";s:1:\"1\";s:13:\"check_captcha\";s:1:\"1\";s:19:\"show_contact_person\";s:1:\"1\";s:23:\"use_geolocation_address\";s:1:\"1\";s:27:\"require_email_in_noregister\";s:1:\"1\";s:27:\"require_phone_in_noregister\";s:1:\"0\";s:26:\"myself_delivery_is_default\";i:0;s:21:\"require_license_agree\";N;s:17:\"license_agreement\";N;s:23:\"use_generated_order_num\";s:1:\"0\";s:23:\"generated_ordernum_mask\";s:3:\"{n}\";s:26:\"generated_ordernum_numbers\";s:1:\"6\";s:13:\"hide_delivery\";s:1:\"0\";s:12:\"hide_payment\";s:1:\"0\";s:13:\"manager_group\";i:0;s:18:\"set_random_manager\";N;s:18:\"cashregister_class\";s:10:\"atolonline\";s:23:\"cashregister_enable_log\";s:1:\"0\";s:30:\"cashregister_enable_auto_check\";s:1:\"1\";s:3:\"ofd\";s:11:\"platformofd\";s:13:\"return_enable\";s:1:\"0\";s:12:\"return_rules\";s:2104:\"\n            <p>Статья 25. Право потребителя на обмен товара надлежащего качества</p>\n            <p>1. Потребитель вправе обменять непродовольственный товар надлежащего качества на аналогичный товар у продавца, у которого этот товар был\n            приобретен, если указанный товар не подошел по форме, габаритам, фасону, расцветке, размеру или комплектации.\n            Потребитель имеет право на обмен непродовольственного товара надлежащего качества в течение четырнадцати дней, не считая дня его покупки.\n            Обмен непродовольственного товара надлежащего качества проводится, если указанный товар не был в употреблении, сохранены его товарный вид,\n            потребительские свойства, пломбы, фабричные ярлыки, а также имеется товарный чек или кассовый чек либо иной подтверждающий оплату указанного\n            товара документ. Отсутствие у потребителя товарного чека или кассового чека либо иного подтверждающего оплату товара документа не лишает его\n            возможности ссылаться на свидетельские показания.</p>\n            <p>Перечень товаров, не подлежащих обмену по основаниям, указанным в настоящей статье, утверждается Правительством Российской Федерации.</p>\n            \n        \";s:21:\"return_print_form_tpl\";s:26:\"%shop%/return/pdf_form.tpl\";s:17:\"discount_code_len\";s:2:\"10\";s:23:\"discount_base_cost_type\";N;s:32:\"fixed_discount_max_order_percent\";s:3:\"100\";s:37:\"fixed_discount_max_order_item_percent\";s:3:\"100\";}'),
(1, 'affiliate', 'a:6:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:10:\"use_geo_ip\";N;s:18:\"coord_max_distance\";s:1:\"4\";s:19:\"confirm_city_select\";s:1:\"0\";}'),
(1, 'partnership', 'a:9:{s:9:\"installed\";b:1;s:10:\"lastupdate\";N;s:7:\"enabled\";b:1;s:10:\"main_title\";N;s:19:\"main_short_contacts\";N;s:13:\"main_contacts\";N;s:11:\"coordinates\";a:3:{s:7:\"address\";s:0:\"\";s:3:\"lat\";d:55.753300000000003;s:3:\"lng\";d:37.622599999999998;}s:23:\"redirect_to_geo_partner\";N;s:29:\"show_confirmation_geo_partner\";N;}');

-- --------------------------------------------------------

--
-- Структура таблицы `md_notes_note`
--

CREATE TABLE `md_notes_note` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `title` varchar(255) DEFAULT NULL COMMENT 'Краткий текст заметки',
  `status` enum('open','inwork','close') DEFAULT 'open' COMMENT 'Статус',
  `message` mediumtext COMMENT 'Сообщение',
  `date_of_create` datetime DEFAULT NULL COMMENT 'Дата создания заметки',
  `date_of_update` datetime DEFAULT NULL COMMENT 'Дата последнего обновления',
  `creator_user_id` bigint(11) DEFAULT NULL COMMENT 'Создатель заметки',
  `is_private` int(11) NOT NULL COMMENT 'Видна только мне'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_notice_config`
--

CREATE TABLE `md_notice_config` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `enable_email` int(1) NOT NULL DEFAULT '1' COMMENT 'Отправка E-mail',
  `enable_sms` int(1) NOT NULL DEFAULT '1' COMMENT 'Отправка SMS',
  `enable_desktop` int(1) NOT NULL DEFAULT '1' COMMENT 'Отправка на ПК',
  `class` varchar(255) DEFAULT NULL COMMENT 'Класс уведомления',
  `template_email` varchar(255) DEFAULT NULL COMMENT 'E-Mail шаблон',
  `template_sms` varchar(255) DEFAULT NULL COMMENT 'SMS шаблон',
  `template_desktop` varchar(255) DEFAULT NULL COMMENT 'ПК шаблон',
  `additional_recipients` varchar(255) DEFAULT NULL COMMENT 'Дополнительные e-mail получателей'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_notice_config`
--

INSERT INTO `md_notice_config` (`id`, `site_id`, `enable_email`, `enable_sms`, `enable_desktop`, `class`, `template_email`, `template_sms`, `template_desktop`, `additional_recipients`) VALUES
(1, 1, 1, 1, 1, '\\Install\\Model\\Notice\\InstallSuccess', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `md_notice_item`
--

CREATE TABLE `md_notice_item` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `dateofcreate` datetime DEFAULT NULL COMMENT 'Дата создания',
  `title` varchar(255) DEFAULT NULL COMMENT 'Заголовок уведомления',
  `short_message` varchar(400) DEFAULT NULL COMMENT 'Короткий текст уведомления',
  `full_message` mediumtext COMMENT 'Полный текст уведомления',
  `link` varchar(255) DEFAULT NULL COMMENT 'Ссылка',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Подпись к ссылке',
  `notice_type` varchar(255) DEFAULT NULL COMMENT 'Тип уведомления',
  `destination_user_id` int(11) NOT NULL COMMENT 'Пользователь-адресат уведомления'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_notice_lock`
--

CREATE TABLE `md_notice_lock` (
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `user_id` int(11) DEFAULT NULL COMMENT 'Пользователь',
  `notice_type` varchar(100) DEFAULT NULL COMMENT 'Тип Desktop уведомления'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_one_click`
--

CREATE TABLE `md_one_click` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `user_id` bigint(11) DEFAULT NULL COMMENT 'Пользователь',
  `user_fio` varchar(255) DEFAULT NULL COMMENT 'Ф.И.О. пользователя',
  `user_phone` varchar(50) DEFAULT NULL COMMENT 'Телефон пользователя',
  `title` varchar(150) DEFAULT NULL COMMENT 'Номер сообщения',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата отправки',
  `status` enum('new','viewed','cancelled') NOT NULL DEFAULT 'new' COMMENT 'Статус',
  `ip` varchar(150) DEFAULT NULL COMMENT 'IP Пользователя',
  `currency` varchar(5) DEFAULT NULL COMMENT 'Трехсимвольный идентификатор валюты на момент покупки',
  `sext_fields` mediumtext COMMENT 'Дополнительными сведения',
  `stext` mediumtext COMMENT 'Cведения о товарах',
  `partner_id` int(11) DEFAULT '0' COMMENT 'Партнёрский сайт',
  `source_id` int(11) DEFAULT '0' COMMENT 'Источник перехода пользователя',
  `utm_source` varchar(50) DEFAULT NULL COMMENT 'Рекламная система UTM_SOURCE',
  `utm_medium` varchar(50) DEFAULT NULL COMMENT 'Тип трафика UTM_MEDIUM',
  `utm_campaign` varchar(50) DEFAULT NULL COMMENT 'Рекламная кампания UTM_COMPAING',
  `utm_term` varchar(50) DEFAULT NULL COMMENT 'Ключевое слово UTM_TERM',
  `utm_content` varchar(50) DEFAULT NULL COMMENT 'Различия UTM_CONTENT',
  `utm_dateof` date DEFAULT NULL COMMENT 'Дата события'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_order`
--

CREATE TABLE `md_order` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `order_num` varchar(20) DEFAULT NULL COMMENT 'Уникальный идентификатор номера заказа',
  `user_id` bigint(11) NOT NULL COMMENT 'ID покупателя',
  `currency` varchar(5) DEFAULT NULL COMMENT 'Трехсимвольный идентификатор валюты на момент оформления заказа',
  `currency_ratio` float DEFAULT NULL COMMENT 'Курс относительно базовой валюты',
  `currency_stitle` varchar(10) DEFAULT NULL COMMENT 'Символ валюты',
  `ip` varchar(15) DEFAULT NULL COMMENT 'IP',
  `manager_user_id` int(11) NOT NULL COMMENT 'Менеджер заказа',
  `create_refund_receipt` int(11) DEFAULT NULL COMMENT 'Выбить чек возврата',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата заказа',
  `dateofupdate` datetime DEFAULT NULL COMMENT 'Дата обновления',
  `totalcost` decimal(15,2) NOT NULL COMMENT 'Общая стоимость',
  `profit` decimal(15,2) DEFAULT NULL COMMENT 'Доход',
  `user_delivery_cost` decimal(15,2) DEFAULT NULL COMMENT 'Стоимость доставки, определенная администратором',
  `is_payed` int(1) DEFAULT NULL COMMENT 'Заказ полностью оплачен?',
  `status` int(11) DEFAULT NULL COMMENT 'Статус',
  `admin_comments` mediumtext COMMENT 'Комментарии администратора (не отображаются пользователю)',
  `user_text` mediumtext COMMENT 'Текст для покупателя',
  `_serialized` mediumtext COMMENT 'Дополнительные сведения',
  `userfields` mediumtext COMMENT 'Дополнительные сведения',
  `hash` varchar(32) DEFAULT NULL,
  `is_exported` int(1) DEFAULT '0' COMMENT 'Выгружен ли заказ',
  `delivery_order_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор заказа доставки',
  `delivery_shipment_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор партии заказов доставки',
  `track_number` varchar(30) DEFAULT NULL COMMENT 'Трек-номер',
  `contact_person` varchar(255) DEFAULT NULL COMMENT 'Контактное лицо',
  `use_addr` int(11) DEFAULT NULL COMMENT 'ID адреса доставки',
  `delivery` int(11) DEFAULT NULL COMMENT 'Доставка',
  `deliverycost` decimal(15,2) DEFAULT NULL COMMENT 'Стоимость доставки',
  `courier_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Курьер',
  `warehouse` int(11) DEFAULT NULL COMMENT 'Склад',
  `payment` int(11) DEFAULT NULL COMMENT 'Тип оплаты',
  `comments` mediumtext COMMENT 'Комментарий',
  `substatus` int(11) DEFAULT NULL COMMENT 'Причина отклонения заказа',
  `user_fio` varchar(255) DEFAULT NULL COMMENT 'Ф.И.О.',
  `user_email` varchar(255) DEFAULT NULL COMMENT 'E-mail',
  `user_phone` varchar(255) DEFAULT NULL COMMENT 'Телефон',
  `is_mobile_checkout` int(1) DEFAULT NULL COMMENT 'Оформлен через мобильное приложение?',
  `partner_id` int(11) DEFAULT NULL COMMENT 'ID партнера',
  `source_id` int(11) DEFAULT '0' COMMENT 'Источник перехода пользователя',
  `utm_source` varchar(50) DEFAULT NULL COMMENT 'Рекламная система UTM_SOURCE',
  `utm_medium` varchar(50) DEFAULT NULL COMMENT 'Тип трафика UTM_MEDIUM',
  `utm_campaign` varchar(50) DEFAULT NULL COMMENT 'Рекламная кампания UTM_COMPAING',
  `utm_term` varchar(50) DEFAULT NULL COMMENT 'Ключевое слово UTM_TERM',
  `utm_content` varchar(50) DEFAULT NULL COMMENT 'Различия UTM_CONTENT',
  `utm_dateof` date DEFAULT NULL COMMENT 'Дата события',
  `id_yandex_market_cpa_order` bigint(11) DEFAULT NULL COMMENT 'ID заказа в Яндекс.маркете'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_action_template`
--

CREATE TABLE `md_order_action_template` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название действия (коротко)',
  `client_sms_message` mediumtext COMMENT 'Текст SMS сообщения, направляемого клиенту',
  `client_email_message` mediumtext COMMENT 'Текст Email сообщения, направляемого клиенту',
  `public` int(11) DEFAULT NULL COMMENT 'Включен'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_address`
--

CREATE TABLE `md_order_address` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `user_id` int(11) DEFAULT '0' COMMENT 'Пользователь',
  `order_id` int(11) DEFAULT '0' COMMENT 'Заказ пользователя',
  `zipcode` varchar(20) DEFAULT NULL COMMENT 'Индекс',
  `country` varchar(100) DEFAULT NULL COMMENT 'Страна',
  `region` varchar(100) DEFAULT NULL COMMENT 'Регион',
  `city` varchar(100) DEFAULT NULL COMMENT 'Город',
  `address` varchar(255) DEFAULT NULL COMMENT 'Адрес',
  `street` varchar(100) DEFAULT NULL COMMENT 'Улица',
  `house` varchar(20) DEFAULT NULL COMMENT 'Дом',
  `block` varchar(20) DEFAULT NULL COMMENT 'Корпус',
  `apartment` varchar(20) DEFAULT NULL COMMENT 'Квартира',
  `entrance` varchar(20) DEFAULT NULL COMMENT 'Подъезд',
  `entryphone` varchar(20) DEFAULT NULL COMMENT 'Домофон',
  `floor` varchar(20) DEFAULT NULL COMMENT 'Этаж',
  `subway` varchar(20) DEFAULT NULL COMMENT 'Станция метро',
  `city_id` int(11) DEFAULT NULL COMMENT 'ID города',
  `region_id` int(11) DEFAULT NULL COMMENT 'ID региона',
  `country_id` int(11) DEFAULT NULL COMMENT 'ID страны',
  `deleted` int(1) DEFAULT '0' COMMENT 'Удалён?'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_delivery`
--

CREATE TABLE `md_order_delivery` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `admin_suffix` varchar(255) DEFAULT NULL COMMENT 'Пояснение',
  `description` mediumtext COMMENT 'Описание',
  `picture` varchar(255) DEFAULT NULL COMMENT 'Логотип',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Категория',
  `min_price` int(11) NOT NULL DEFAULT '0' COMMENT 'Минимальная сумма заказа',
  `max_price` int(11) NOT NULL DEFAULT '0' COMMENT 'Максимальная сумма заказа',
  `min_weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Минимальный вес заказа гр.',
  `max_weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Максимальный вес заказа гр.',
  `min_cnt` int(11) NOT NULL DEFAULT '0' COMMENT 'Минимальное количество товаров в заказе',
  `first_status` int(11) DEFAULT NULL COMMENT 'Стартовый статус заказа',
  `user_type` enum('all','user','company') NOT NULL COMMENT 'Категория пользователей для данного способа доставки',
  `extrachange_discount` float DEFAULT '0' COMMENT 'Наценка/скидка на доставку',
  `extrachange_discount_type` int(1) DEFAULT '0' COMMENT 'Тип скидки или наценки',
  `extrachange_discount_implementation` float DEFAULT '1' COMMENT 'Наценка/скидка расчитывается от стоимости',
  `public` int(1) DEFAULT '1' COMMENT 'Публичный',
  `default` int(1) DEFAULT '0' COMMENT 'По умолчанию',
  `class` varchar(255) DEFAULT NULL COMMENT 'Расчетный класс (тип доставки)',
  `_serialized` mediumtext COMMENT 'Параметры расчетного класса',
  `sortn` int(11) DEFAULT NULL COMMENT 'Сорт. индекс',
  `_delivery_periods` mediumtext COMMENT 'Сроки доставки в регионы (Сохранение данных)',
  `_tax_ids` varchar(255) DEFAULT NULL COMMENT 'Налоги (сериализованные)',
  `_show_on_partners` varchar(255) DEFAULT NULL COMMENT 'Показывать на партнёрских саайтах сайтах (сериализованное)',
  `is_use_yandex_market_cpa` int(1) DEFAULT NULL COMMENT 'Использовать для доставки с Я.Маркета',
  `is_map_holiday` int(11) DEFAULT NULL COMMENT 'Проверять, чтобы дата доставки не выпадала на выходные и праздничные дни, согласно настройкам кампании Яндекс.Маркета'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_delivery_dir`
--

CREATE TABLE `md_order_delivery_dir` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `sortn` int(11) DEFAULT NULL COMMENT 'Сорт. номер'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_delivery_x_zone`
--

CREATE TABLE `md_order_delivery_x_zone` (
  `delivery_id` int(11) DEFAULT NULL COMMENT 'ID Доставки',
  `zone_id` int(11) DEFAULT NULL COMMENT 'ID Зоны'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_discount`
--

CREATE TABLE `md_order_discount` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `code` varchar(50) DEFAULT NULL COMMENT 'Код',
  `descr` varchar(2000) DEFAULT NULL COMMENT 'Описание скидки',
  `active` int(1) DEFAULT NULL COMMENT 'Включен',
  `sproducts` mediumtext COMMENT 'Список товаров, на которые распространяется скидка',
  `period` enum('timelimit','forever') DEFAULT NULL COMMENT 'Срок действия',
  `endtime` datetime DEFAULT NULL COMMENT 'Время окончания действия скидки',
  `min_order_price` decimal(20,2) DEFAULT NULL COMMENT 'Минимальная сумма заказа',
  `discount` decimal(20,2) DEFAULT NULL COMMENT 'Скидка',
  `discount_type` enum('','%','base') DEFAULT NULL COMMENT 'Скидка указана в процентах или в базовой валюте?',
  `round` int(1) DEFAULT NULL COMMENT 'Округлять скидку до целых чисел?',
  `uselimit` int(5) DEFAULT NULL COMMENT 'Лимит использования, раз',
  `oneuserlimit` int(5) DEFAULT NULL COMMENT 'Лимит использования одним пользователем, раз',
  `wasused` int(5) NOT NULL DEFAULT '0' COMMENT 'Была использована, раз'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_items`
--

CREATE TABLE `md_order_items` (
  `order_id` int(11) NOT NULL COMMENT 'ID заказа',
  `uniq` varchar(10) NOT NULL COMMENT 'ID в рамках одной корзины',
  `type` enum('product','coupon','commission','tax','delivery','order_discount','subtotal') DEFAULT NULL COMMENT 'Тип записи товар, услуга, скидочный купон',
  `entity_id` varchar(50) DEFAULT NULL COMMENT 'ID объекта type',
  `multioffers` mediumtext COMMENT 'Многомерные комплектации',
  `offer` int(11) DEFAULT NULL COMMENT 'Комплектация',
  `amount` decimal(11,3) DEFAULT '1.000' COMMENT 'Количество',
  `barcode` varchar(100) DEFAULT NULL COMMENT 'Артикул',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `model` varchar(255) DEFAULT NULL COMMENT 'Модель',
  `single_weight` double DEFAULT NULL COMMENT 'Вес',
  `single_cost` decimal(20,2) DEFAULT NULL COMMENT 'Цена за единицу продукции',
  `price` decimal(20,2) DEFAULT '0.00' COMMENT 'Стоимость',
  `profit` decimal(20,2) DEFAULT '0.00' COMMENT 'Доход',
  `discount` decimal(20,2) DEFAULT '0.00' COMMENT 'Скидка',
  `sortn` int(11) DEFAULT NULL COMMENT 'Порядок',
  `extra` mediumtext COMMENT 'Дополнительные сведения'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_payment`
--

CREATE TABLE `md_order_payment` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `admin_suffix` varchar(255) DEFAULT NULL COMMENT 'Пояснение',
  `description` mediumtext COMMENT 'Описание',
  `picture` varchar(255) DEFAULT NULL COMMENT 'Логотип',
  `first_status` int(11) DEFAULT NULL COMMENT 'Стартовый статус заказа',
  `success_status` int(11) DEFAULT NULL COMMENT 'Статус заказа в случае успешной оплаты',
  `user_type` enum('all','user','company') NOT NULL COMMENT 'Категория пользователей для данного типа оплаты',
  `target` enum('all','orders','refill') NOT NULL COMMENT 'Область применения',
  `_delivery` varchar(1500) DEFAULT NULL COMMENT 'Связь с доставками',
  `public` int(1) DEFAULT '1' COMMENT 'Публичный',
  `default_payment` int(1) DEFAULT '0' COMMENT 'Оплата по-умолчанию?',
  `commission` float DEFAULT '0' COMMENT 'Комиссия за оплату в %',
  `commission_include_delivery` int(1) DEFAULT '0' COMMENT 'Включать стоимость доставки в комиссию',
  `commission_as_product_discount` int(1) DEFAULT '0' COMMENT 'Присваивать комиссию в качестве скидки к товарам',
  `create_cash_receipt` int(1) DEFAULT '0' COMMENT 'Выбить чек после оплаты?',
  `class` varchar(255) DEFAULT NULL COMMENT 'Расчетный класс (тип оплаты)',
  `_serialized` mediumtext COMMENT 'Параметры рассчетного класса',
  `sortn` int(11) DEFAULT NULL COMMENT 'Сорт. индекс',
  `_show_on_partners` varchar(255) DEFAULT NULL COMMENT 'Показывать на партнёрских саайтах сайтах (сериализованное)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_order_payment`
--

INSERT INTO `md_order_payment` (`id`, `site_id`, `title`, `admin_suffix`, `description`, `picture`, `first_status`, `success_status`, `user_type`, `target`, `_delivery`, `public`, `default_payment`, `commission`, `commission_include_delivery`, `commission_as_product_discount`, `create_cash_receipt`, `class`, `_serialized`, `sortn`, `_show_on_partners`) VALUES
(1, 1, 'Оплата через Яндекс (\"Заказах на Яндекс\")', NULL, NULL, NULL, NULL, NULL, 'all', 'all', 'N;', 0, 0, 0, 0, 0, 0, 'ym-generic', 'N;', 1, NULL),
(2, 1, 'Оплата наличными при получении (\"Заказы на Яндекс\")', NULL, NULL, NULL, NULL, NULL, 'all', 'all', 'N;', 0, 0, 0, 0, 0, 0, 'ym-cash-on-delivery', 'N;', 2, NULL),
(3, 1, 'Оплата картой при получении (\"Заказы на Яндекс\")', NULL, NULL, NULL, NULL, NULL, 'all', 'all', 'N;', 0, 0, 0, 0, 0, 0, 'ym-card-on-delivery', 'N;', 3, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_products_return`
--

CREATE TABLE `md_order_products_return` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `return_num` varchar(20) DEFAULT NULL COMMENT 'Номер возврата',
  `order_id` int(20) DEFAULT NULL COMMENT 'Id заказа',
  `user_id` bigint(11) NOT NULL COMMENT 'ID пользователя',
  `status` enum('new','in_progress','complete','refused') NOT NULL COMMENT 'Статус возврата',
  `name` varchar(255) DEFAULT NULL COMMENT 'Имя пользователя',
  `surname` varchar(255) DEFAULT NULL COMMENT 'Фамилия пользователя',
  `midname` varchar(255) DEFAULT NULL COMMENT 'Отчество пользователя',
  `passport_series` varchar(50) DEFAULT NULL COMMENT 'Серия паспорта',
  `passport_number` varchar(50) DEFAULT NULL COMMENT 'Номер паспорта',
  `passport_issued_by` varchar(100) DEFAULT NULL COMMENT 'Кем выдан паспорт',
  `phone` varchar(50) DEFAULT NULL COMMENT 'Номер телефона',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата оформления возврата',
  `date_exec` datetime DEFAULT NULL COMMENT 'Дата выполнения возврата',
  `return_reason` varchar(200) DEFAULT NULL COMMENT 'Причина возврата',
  `bank_name` varchar(100) DEFAULT NULL COMMENT 'Название банка',
  `bik` varchar(50) DEFAULT NULL COMMENT 'БИК',
  `bank_account` varchar(100) DEFAULT NULL COMMENT 'Рассчетный счет',
  `correspondent_account` varchar(100) DEFAULT NULL COMMENT 'Корреспондентский счет',
  `cost_total` decimal(10,0) DEFAULT NULL COMMENT 'Сумма возврата',
  `currency` varchar(20) DEFAULT NULL COMMENT 'Id валюты',
  `currency_ratio` decimal(20,0) DEFAULT NULL COMMENT 'Курс на момент оформления заказа',
  `currency_stitle` varchar(20) DEFAULT NULL COMMENT 'Символ курса валюты'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_products_return_item`
--

CREATE TABLE `md_order_products_return_item` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL,
  `uniq` varchar(20) DEFAULT NULL COMMENT 'Уникальный идентификатор',
  `return_id` int(20) DEFAULT NULL COMMENT 'Id возврата',
  `amount` int(20) DEFAULT NULL COMMENT 'Количество товара',
  `cost` decimal(20,0) DEFAULT NULL COMMENT 'Цена товара',
  `barcode` varchar(255) DEFAULT NULL COMMENT 'Артикул',
  `model` varchar(255) DEFAULT NULL COMMENT 'Модель',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_regions`
--

CREATE TABLE `md_order_regions` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Родитель',
  `zipcode` varchar(20) DEFAULT NULL COMMENT 'Индекс',
  `is_city` int(1) DEFAULT '0' COMMENT 'Является городом?',
  `area` varchar(255) DEFAULT NULL COMMENT 'Муниципальный район',
  `sortn` int(11) DEFAULT '100' COMMENT 'Порядок',
  `russianpost_arriveinfo` varchar(255) DEFAULT NULL COMMENT 'Срок доставки Почтой России (строка)',
  `russianpost_arrive_min` varchar(10) DEFAULT NULL COMMENT 'Минимальное количество дней доставки Почтой России',
  `russianpost_arrive_max` varchar(10) DEFAULT NULL COMMENT 'Максимальное количество дней доставки Почтой России'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_order_regions`
--

INSERT INTO `md_order_regions` (`id`, `site_id`, `title`, `parent_id`, `zipcode`, `is_city`, `area`, `sortn`, `russianpost_arriveinfo`, `russianpost_arrive_min`, `russianpost_arrive_max`) VALUES
(1, 1, 'Россия', 0, '', 0, NULL, 100, NULL, NULL, NULL),
(2, 1, 'Мурманская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(3, 1, 'Мордовия', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(4, 1, 'Чувашия', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(5, 1, 'Оренбургская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(6, 1, 'Свердловская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(7, 1, 'Новгородская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(8, 1, 'Башкортостан', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(9, 1, 'Астраханская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(10, 1, 'Орловская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(11, 1, 'Пермский край', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(12, 1, 'Саха (Якутия)', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(13, 1, 'Северная Осетия', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(14, 1, 'Татарстан', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(15, 1, 'Тверская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(16, 1, 'Тульская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(17, 1, 'Псковская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(18, 1, 'Чечня', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(19, 1, 'Усть-Ордынский Бурятский АО', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(20, 1, 'Смоленская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(21, 1, 'Удмуртия', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(22, 1, 'Иркутская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(23, 1, 'Липецкая область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(24, 1, 'Курская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(25, 1, 'Курганская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(26, 1, 'Самарская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(27, 1, 'Кемеровская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(28, 1, 'Карачаево-Черкессия', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(29, 1, 'Калининградская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(30, 1, 'Красноярский край', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(31, 1, 'Дагестан', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(32, 1, 'Воронежская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(33, 1, 'Московская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(34, 1, 'Москва', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(35, 1, 'Крым', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(36, 1, 'Ярославская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(37, 1, 'Ростовская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(38, 1, 'Нижегородская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(39, 1, 'Ненецкий АО', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(40, 1, 'Омская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(41, 1, 'Новосибирская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(42, 1, 'Белгородская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(43, 1, 'Пензенская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(44, 1, 'Сахалинская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(45, 1, 'Ульяновская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(46, 1, 'Ханты-Мансийский АО', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(47, 1, 'Хакасия', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(48, 1, 'Томская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(49, 1, 'Тыва (Тува)', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(50, 1, 'Челябинская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(51, 1, 'Хабаровский край', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(52, 1, 'Тамбовская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(53, 1, 'Ставропольский край', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(54, 1, 'Тюменская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(55, 1, 'Приморский край', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(56, 1, 'Ингушетия', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(57, 1, 'Ямало-Ненецкий АО', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(58, 1, 'Коми', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(59, 1, 'Магаданская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(60, 1, 'Ленинградская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(61, 1, 'Рязанская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(62, 1, 'Кировская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(63, 1, 'Кабардино-Балкария', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(64, 1, 'Забайкальский край', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(65, 1, 'Карелия', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(66, 1, 'Камчатский край', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(67, 1, 'Калужская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(68, 1, 'Калмыкия', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(69, 1, 'Саратовская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(70, 1, 'Чукотский АО', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(71, 1, 'Ивановская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(72, 1, 'Брянская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(73, 1, 'Адыгея', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(74, 1, 'Алтай', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(75, 1, 'Амурская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(76, 1, 'Архангельская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(77, 1, 'Краснодарский край', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(78, 1, 'Еврейская АО', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(79, 1, 'Алтайский край', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(80, 1, 'Вологодская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(81, 1, 'Волгоградская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(82, 1, 'Владимирская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(83, 1, 'Бурятия', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(84, 1, 'Марий-Эл', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(85, 1, 'Костромская область', 1, '', 0, NULL, 100, NULL, NULL, NULL),
(86, 1, 'Буй', 85, '157000', 1, NULL, 100, NULL, NULL, NULL),
(87, 1, 'Волгореченск', 85, '156901', 1, NULL, 100, NULL, NULL, NULL),
(88, 1, 'Галич', 85, '157200', 1, NULL, 100, NULL, NULL, NULL),
(89, 1, 'Кологрив', 85, '157440', 1, NULL, 100, NULL, NULL, NULL),
(90, 1, 'Кострома', 85, '156000', 1, NULL, 100, NULL, NULL, NULL),
(91, 1, 'Макарьев', 85, '157460', 1, NULL, 100, NULL, NULL, NULL),
(92, 1, 'Мантурово', 85, '157300', 1, NULL, 100, NULL, NULL, NULL),
(93, 1, 'Нерехта', 85, '157800', 1, NULL, 100, NULL, NULL, NULL),
(94, 1, 'Нея', 85, '157330', 1, NULL, 100, NULL, NULL, NULL),
(95, 1, 'Солигалич', 85, '157170', 1, NULL, 100, NULL, NULL, NULL),
(96, 1, 'Чухлома', 85, '157130', 1, NULL, 100, NULL, NULL, NULL),
(97, 1, 'Шарья', 85, '157500', 1, NULL, 100, NULL, NULL, NULL),
(98, 1, 'Апрелевка', 33, '143360', 1, NULL, 100, NULL, NULL, NULL),
(99, 1, 'Балашиха', 33, '143900', 1, NULL, 100, NULL, NULL, NULL),
(100, 1, 'Бронницы', 33, '140170', 1, NULL, 100, NULL, NULL, NULL),
(101, 1, 'Верея', 33, '140153', 1, NULL, 100, NULL, NULL, NULL),
(102, 1, 'Видное', 33, '142700', 1, NULL, 100, NULL, NULL, NULL),
(103, 1, 'Волоколамск', 33, '143600', 1, NULL, 100, NULL, NULL, NULL),
(104, 1, 'Воскресенск', 33, '140200', 1, NULL, 100, NULL, NULL, NULL),
(105, 1, 'Высоковск', 33, '141650', 1, NULL, 100, NULL, NULL, NULL),
(106, 1, 'Голицыно', 33, '143040', 1, NULL, 100, NULL, NULL, NULL),
(107, 1, 'Дедовск', 33, '143530', 1, NULL, 100, NULL, NULL, NULL),
(108, 1, 'Дзержинский', 33, '140090', 1, NULL, 100, NULL, NULL, NULL),
(109, 1, 'Дмитров', 33, '141800', 1, NULL, 100, NULL, NULL, NULL),
(110, 1, 'Долгопрудный', 33, '141700', 1, NULL, 100, NULL, NULL, NULL),
(111, 1, 'Домодедово', 33, '142000', 1, NULL, 100, NULL, NULL, NULL),
(112, 1, 'Дрезна', 33, '142660', 1, NULL, 100, NULL, NULL, NULL),
(113, 1, 'Дубна', 33, '141980', 1, NULL, 100, NULL, NULL, NULL),
(114, 1, 'Егорьевск', 33, '140300', 1, NULL, 100, NULL, NULL, NULL),
(115, 1, 'Железнодорожный', 33, '143920', 1, NULL, 100, NULL, NULL, NULL),
(116, 1, 'Жуковский', 33, '140180', 1, NULL, 100, NULL, NULL, NULL),
(117, 1, 'Зарайск', 33, '140600', 1, NULL, 100, NULL, NULL, NULL),
(118, 1, 'Звенигород', 33, '143180', 1, NULL, 100, NULL, NULL, NULL),
(119, 1, 'Ивантеевка', 33, '141280', 1, NULL, 100, NULL, NULL, NULL),
(120, 1, 'Истра', 33, '143500', 1, NULL, 100, NULL, NULL, NULL),
(121, 1, 'Истра-1', 33, '143501', 1, NULL, 100, NULL, NULL, NULL),
(122, 1, 'Кашира', 33, '142900', 1, NULL, 100, NULL, NULL, NULL),
(123, 1, 'Климовск', 33, '142180', 1, NULL, 100, NULL, NULL, NULL),
(124, 1, 'Клин', 33, '141601', 1, NULL, 100, NULL, NULL, NULL),
(125, 1, 'Коломна', 33, '140400', 1, NULL, 100, NULL, NULL, NULL),
(126, 1, 'Королев', 33, '141060', 1, NULL, 100, NULL, NULL, NULL),
(127, 1, 'Котельники', 33, '140053', 1, NULL, 100, NULL, NULL, NULL),
(128, 1, 'Красноармейск', 33, '141290', 1, NULL, 100, NULL, NULL, NULL),
(129, 1, 'Красногорск', 33, '143401', 1, NULL, 100, NULL, NULL, NULL),
(130, 1, 'Краснозаводск', 33, '141321', 1, NULL, 100, NULL, NULL, NULL),
(131, 1, 'Кубинка', 33, '143070', 1, NULL, 100, NULL, NULL, NULL),
(132, 1, 'Куровское', 33, '142620', 1, NULL, 100, NULL, NULL, NULL),
(133, 1, 'Ликино-Дулево', 33, '142670', 1, NULL, 100, NULL, NULL, NULL),
(134, 1, 'Лобня', 33, '141730', 1, NULL, 100, NULL, NULL, NULL),
(135, 1, 'Лосино-Петровский', 33, '141150', 1, NULL, 100, NULL, NULL, NULL),
(136, 1, 'Луховицы', 33, '140500', 1, NULL, 100, NULL, NULL, NULL),
(137, 1, 'Лыткарино', 33, '140080', 1, NULL, 100, NULL, NULL, NULL),
(138, 1, 'Люберцы', 33, '140000', 1, NULL, 100, NULL, NULL, NULL),
(139, 1, 'Можайск', 33, '143200', 1, NULL, 100, NULL, NULL, NULL),
(140, 1, 'Москва', 33, '101000', 1, NULL, 100, NULL, NULL, NULL),
(141, 1, 'Мытищи', 33, '141000', 1, NULL, 100, NULL, NULL, NULL),
(142, 1, 'Наро-Фоминск', 33, '143300', 1, NULL, 100, NULL, NULL, NULL),
(143, 1, 'Ногинск', 33, '142400', 1, NULL, 100, NULL, NULL, NULL),
(144, 1, 'Одинцово', 33, '143000', 1, NULL, 100, NULL, NULL, NULL),
(145, 1, 'Ожерелье', 33, '142920', 1, NULL, 100, NULL, NULL, NULL),
(146, 1, 'Озеры', 33, '140560', 1, NULL, 100, NULL, NULL, NULL),
(147, 1, 'Орехово-Зуево', 33, '142600', 1, NULL, 100, NULL, NULL, NULL),
(148, 1, 'Павловский Посад', 33, '142500', 1, NULL, 100, NULL, NULL, NULL),
(149, 1, 'Пересвет', 33, '141320', 1, NULL, 100, NULL, NULL, NULL),
(150, 1, 'Подольск', 33, '142096', 1, NULL, 100, NULL, NULL, NULL),
(151, 1, 'Протвино', 33, '142280', 1, NULL, 100, NULL, NULL, NULL),
(152, 1, 'Пушкино', 33, '141200', 1, NULL, 100, NULL, NULL, NULL),
(153, 1, 'Пущино', 33, '142290', 1, NULL, 100, NULL, NULL, NULL),
(154, 1, 'Раменское', 33, '140100', 1, NULL, 100, NULL, NULL, NULL),
(155, 1, 'Реутов', 33, '143960', 1, NULL, 100, NULL, NULL, NULL),
(156, 1, 'Рошаль', 33, '140730', 1, NULL, 100, NULL, NULL, NULL),
(157, 1, 'Руза', 33, '143100', 1, NULL, 100, NULL, NULL, NULL),
(158, 1, 'Сергиев Посад', 33, '141300', 1, NULL, 100, NULL, NULL, NULL),
(159, 1, 'Сергиев Посад-7', 33, '141307', 1, NULL, 100, NULL, NULL, NULL),
(160, 1, 'Серпухов', 33, '142200', 1, NULL, 100, NULL, NULL, NULL),
(161, 1, 'Солнечногорск', 33, '141501', 1, NULL, 100, NULL, NULL, NULL),
(162, 1, 'Солнечногорск-2', 33, '141502', 1, NULL, 100, NULL, NULL, NULL),
(163, 1, 'Солнечногорск-25', 33, '141501', 1, NULL, 100, NULL, NULL, NULL),
(164, 1, 'Солнечногорск-30', 33, '141590', 1, NULL, 100, NULL, NULL, NULL),
(165, 1, 'Солнечногорск-7', 33, '141507', 1, NULL, 100, NULL, NULL, NULL),
(166, 1, 'Старая Купавна', 33, '142450', 1, NULL, 100, NULL, NULL, NULL),
(167, 1, 'Ступино', 33, '142800', 1, NULL, 100, NULL, NULL, NULL),
(168, 1, 'Талдом', 33, '141900', 1, NULL, 100, NULL, NULL, NULL),
(169, 1, 'Фрязино', 33, '141190', 1, NULL, 100, NULL, NULL, NULL),
(170, 1, 'Химки', 33, '141400', 1, NULL, 100, NULL, NULL, NULL),
(171, 1, 'Хотьково', 33, '141370', 1, NULL, 100, NULL, NULL, NULL),
(172, 1, 'Черноголовка', 33, '142432', 1, NULL, 100, NULL, NULL, NULL),
(173, 1, 'Чехов', 33, '142300', 1, NULL, 100, NULL, NULL, NULL),
(174, 1, 'Чехов-2', 33, '142302', 1, NULL, 100, NULL, NULL, NULL),
(175, 1, 'Чехов-3', 33, '142303', 1, NULL, 100, NULL, NULL, NULL),
(176, 1, 'Чехов-8', 33, '142300', 1, NULL, 100, NULL, NULL, NULL),
(177, 1, 'Шатура', 33, '140700', 1, NULL, 100, NULL, NULL, NULL),
(178, 1, 'Щелково', 33, '141100', 1, NULL, 100, NULL, NULL, NULL),
(179, 1, 'Электрогорск', 33, '142530', 1, NULL, 100, NULL, NULL, NULL),
(180, 1, 'Электросталь', 33, '144000', 1, NULL, 100, NULL, NULL, NULL),
(181, 1, 'Электроугли', 33, '142455', 1, NULL, 100, NULL, NULL, NULL),
(182, 1, 'Яхрома', 33, '141840', 1, NULL, 100, NULL, NULL, NULL),
(183, 1, 'Волжск', 84, '425000', 1, NULL, 100, NULL, NULL, NULL),
(184, 1, 'Звенигово', 84, '425060', 1, NULL, 100, NULL, NULL, NULL),
(185, 1, 'Йошкар-Ола', 84, '424000', 1, NULL, 100, NULL, NULL, NULL),
(186, 1, 'Козьмодемьянск', 84, '150525', 1, NULL, 100, NULL, NULL, NULL),
(187, 1, 'Бабушкин', 83, '671230', 1, NULL, 100, NULL, NULL, NULL),
(188, 1, 'Гусиноозерск', 83, '671160', 1, NULL, 100, NULL, NULL, NULL),
(189, 1, 'Закаменск', 83, '671950', 1, NULL, 100, NULL, NULL, NULL),
(190, 1, 'Кяхта', 83, '446722', 1, NULL, 100, NULL, NULL, NULL),
(191, 1, 'Северобайкальск', 83, '671700', 1, NULL, 100, NULL, NULL, NULL),
(192, 1, 'Улан-Удэ', 83, '670000', 1, NULL, 100, NULL, NULL, NULL),
(193, 1, 'Александров', 82, '347233', 1, NULL, 100, NULL, NULL, NULL),
(194, 1, 'Владимир', 82, '600000', 1, NULL, 100, NULL, NULL, NULL),
(195, 1, 'Вязники', 82, '601440', 1, NULL, 100, NULL, NULL, NULL),
(196, 1, 'Гороховец', 82, '601480', 1, NULL, 100, NULL, NULL, NULL),
(197, 1, 'Гусь-Хрустальный', 82, '601500', 1, NULL, 100, NULL, NULL, NULL),
(198, 1, 'Камешково', 82, '601300', 1, NULL, 100, NULL, NULL, NULL),
(199, 1, 'Карабаново', 82, '601640', 1, NULL, 100, NULL, NULL, NULL),
(200, 1, 'Киржач', 82, '601010', 1, NULL, 100, NULL, NULL, NULL),
(201, 1, 'Ковров', 82, '601900', 1, NULL, 100, NULL, NULL, NULL),
(202, 1, 'Кольчугино', 82, '297551', 1, NULL, 100, NULL, NULL, NULL),
(203, 1, 'Костерево', 82, '601110', 1, NULL, 100, NULL, NULL, NULL),
(204, 1, 'Курлово', 82, '601570', 1, NULL, 100, NULL, NULL, NULL),
(205, 1, 'Лакинск', 82, '0', 1, NULL, 100, NULL, NULL, NULL),
(206, 1, 'Меленки', 82, '150530', 1, NULL, 100, NULL, NULL, NULL),
(207, 1, 'Муром', 82, '309257', 1, NULL, 100, NULL, NULL, NULL),
(208, 1, 'Петушки', 82, '215049', 1, NULL, 100, NULL, NULL, NULL),
(209, 1, 'Покров', 82, '152075', 1, NULL, 100, NULL, NULL, NULL),
(210, 1, 'Радужный', 82, '140483', 1, NULL, 100, NULL, NULL, NULL),
(211, 1, 'Собинка', 82, '601201', 1, NULL, 100, NULL, NULL, NULL),
(212, 1, 'Струнино', 82, '601670', 1, NULL, 100, NULL, NULL, NULL),
(213, 1, 'Судогда', 82, '601351', 1, NULL, 100, NULL, NULL, NULL),
(214, 1, 'Суздаль', 82, '601291', 1, NULL, 100, NULL, NULL, NULL),
(215, 1, 'Юрьев-Польский', 82, '601800', 1, NULL, 100, NULL, NULL, NULL),
(216, 1, 'Волгоград', 81, '400000', 1, NULL, 100, NULL, NULL, NULL),
(217, 1, 'Волжский', 81, '404100', 1, NULL, 100, NULL, NULL, NULL),
(218, 1, 'Дубовка', 81, '356210', 1, NULL, 100, NULL, NULL, NULL),
(219, 1, 'Жирновск', 81, '403790', 1, NULL, 100, NULL, NULL, NULL),
(220, 1, 'Калач-на-Дону', 81, '404500', 1, NULL, 100, NULL, NULL, NULL),
(221, 1, 'Камышин', 81, '403870', 1, NULL, 100, NULL, NULL, NULL),
(222, 1, 'Котельниково', 81, '157250', 1, NULL, 100, NULL, NULL, NULL),
(223, 1, 'Котово', 81, '143521', 1, NULL, 100, NULL, NULL, NULL),
(224, 1, 'Краснослободск', 81, '404160', 1, NULL, 100, NULL, NULL, NULL),
(225, 1, 'Ленинск', 81, '404620', 1, NULL, 100, NULL, NULL, NULL),
(226, 1, 'Михайловка', 81, '161306', 1, NULL, 100, NULL, NULL, NULL),
(227, 1, 'Николаевск', 81, '404030', 1, NULL, 100, NULL, NULL, NULL),
(228, 1, 'Новоаннинский', 81, '403950', 1, NULL, 100, NULL, NULL, NULL),
(229, 1, 'Палласовка', 81, '404260', 1, NULL, 100, NULL, NULL, NULL),
(230, 1, 'Петров Вал', 81, '403840', 1, NULL, 100, NULL, NULL, NULL),
(231, 1, 'Серафимович', 81, '403441', 1, NULL, 100, NULL, NULL, NULL),
(232, 1, 'Суровикино', 81, '404410', 1, NULL, 100, NULL, NULL, NULL),
(233, 1, 'Урюпинск', 81, '403110', 1, NULL, 100, NULL, NULL, NULL),
(234, 1, 'Фролово', 81, '171637', 1, NULL, 100, NULL, NULL, NULL),
(235, 1, 'Бабаево', 80, '152080', 1, NULL, 100, NULL, NULL, NULL),
(236, 1, 'Белозерск', 80, '161200', 1, NULL, 100, NULL, NULL, NULL),
(237, 1, 'Великий Устюг', 80, '160839', 1, NULL, 100, NULL, NULL, NULL),
(238, 1, 'Вологда', 80, '160000', 1, NULL, 100, NULL, NULL, NULL),
(239, 1, 'Вытегра', 80, '162900', 1, NULL, 100, NULL, NULL, NULL),
(240, 1, 'Грязовец', 80, '162000', 1, NULL, 100, NULL, NULL, NULL),
(241, 1, 'Кадников', 80, '162107', 1, NULL, 100, NULL, NULL, NULL),
(242, 1, 'Кириллов', 80, '161100', 1, NULL, 100, NULL, NULL, NULL),
(243, 1, 'Красавино', 80, '161390', 1, NULL, 100, NULL, NULL, NULL),
(244, 1, 'Никольск', 80, '161440', 1, NULL, 100, NULL, NULL, NULL),
(245, 1, 'Сокол', 80, '161157', 1, NULL, 100, NULL, NULL, NULL),
(246, 1, 'Тотьма', 80, '161300', 1, NULL, 100, NULL, NULL, NULL),
(247, 1, 'Устюжна', 80, '162840', 1, NULL, 100, NULL, NULL, NULL),
(248, 1, 'Харовск', 80, '162250', 1, NULL, 100, NULL, NULL, NULL),
(249, 1, 'Череповец', 80, '160860', 1, NULL, 100, NULL, NULL, NULL),
(250, 1, 'Бобров', 32, '397700', 1, NULL, 100, NULL, NULL, NULL),
(251, 1, 'Богучар', 32, '396790', 1, NULL, 100, NULL, NULL, NULL),
(252, 1, 'Борисоглебск', 32, '397160', 1, NULL, 100, NULL, NULL, NULL),
(253, 1, 'Бутурлиновка', 32, '397500', 1, NULL, 100, NULL, NULL, NULL),
(254, 1, 'Воронеж', 32, '394000', 1, NULL, 100, NULL, NULL, NULL),
(255, 1, 'Калач', 32, '397600', 1, NULL, 100, NULL, NULL, NULL),
(256, 1, 'Лиски', 32, '397900', 1, NULL, 100, NULL, NULL, NULL),
(257, 1, 'Нововоронеж', 32, '396070', 1, NULL, 100, NULL, NULL, NULL),
(258, 1, 'Новохоперск', 32, '397400', 1, NULL, 100, NULL, NULL, NULL),
(259, 1, 'Острогожск', 32, '397850', 1, NULL, 100, NULL, NULL, NULL),
(260, 1, 'Павловск', 32, '196620', 1, NULL, 100, NULL, NULL, NULL),
(261, 1, 'Поворино', 32, '397350', 1, NULL, 100, NULL, NULL, NULL),
(262, 1, 'Россошь', 32, '346073', 1, NULL, 100, NULL, NULL, NULL),
(263, 1, 'Семилуки', 32, '396900', 1, NULL, 100, NULL, NULL, NULL),
(264, 1, 'Эртиль', 32, '397030', 1, NULL, 100, NULL, NULL, NULL),
(265, 1, 'Алейск', 79, '658130', 1, NULL, 100, NULL, NULL, NULL),
(266, 1, 'Барнаул', 79, '656000', 1, NULL, 100, NULL, NULL, NULL),
(267, 1, 'Белокуриха', 79, '659900', 1, NULL, 100, NULL, NULL, NULL),
(268, 1, 'Бийск', 79, '659300', 1, NULL, 100, NULL, NULL, NULL),
(269, 1, 'Горняк', 79, '171115', 1, NULL, 100, NULL, NULL, NULL),
(270, 1, 'Заринск', 79, '659100', 1, NULL, 100, NULL, NULL, NULL),
(271, 1, 'Змеиногорск', 79, '658480', 1, NULL, 100, NULL, NULL, NULL),
(272, 1, 'Камень-на-Оби', 79, '658700', 1, NULL, 100, NULL, NULL, NULL),
(273, 1, 'Новоалтайск', 79, '658067', 1, NULL, 100, NULL, NULL, NULL),
(274, 1, 'Рубцовск', 79, '658200', 1, NULL, 100, NULL, NULL, NULL),
(275, 1, 'Славгород', 79, '658820', 1, NULL, 100, NULL, NULL, NULL),
(276, 1, 'Яровое', 79, '627227', 1, NULL, 100, NULL, NULL, NULL),
(277, 1, 'Буйнакск', 31, '368220', 1, NULL, 100, NULL, NULL, NULL),
(278, 1, 'Дагестанские Огни', 31, '368670', 1, NULL, 100, NULL, NULL, NULL),
(279, 1, 'Дербент', 31, '368551', 1, NULL, 100, NULL, NULL, NULL),
(280, 1, 'Избербаш', 31, '368500', 1, NULL, 100, NULL, NULL, NULL),
(281, 1, 'Каспийск', 31, '368300', 1, NULL, 100, NULL, NULL, NULL),
(282, 1, 'Кизилюрт', 31, '368120', 1, NULL, 100, NULL, NULL, NULL),
(283, 1, 'Кизляр', 31, '363709', 1, NULL, 100, NULL, NULL, NULL),
(284, 1, 'Махачкала', 31, '367000', 1, NULL, 100, NULL, NULL, NULL),
(285, 1, 'Хасавюрт', 31, '368000', 1, NULL, 100, NULL, NULL, NULL),
(286, 1, 'Южно-Сухокумск', 31, '368890', 1, NULL, 100, NULL, NULL, NULL),
(287, 1, 'Биробиджан', 78, '679000', 1, NULL, 100, NULL, NULL, NULL),
(288, 1, 'Облучье', 78, '679100', 1, NULL, 100, NULL, NULL, NULL),
(289, 1, 'Абинск', 77, '353320', 1, NULL, 100, NULL, NULL, NULL),
(290, 1, 'Анапа', 77, '353440', 1, NULL, 100, NULL, NULL, NULL),
(291, 1, 'Апшеронск', 77, '352690', 1, NULL, 100, NULL, NULL, NULL),
(292, 1, 'Армавир', 77, '352900', 1, NULL, 100, NULL, NULL, NULL),
(293, 1, 'Белореченск', 77, '352630', 1, NULL, 100, NULL, NULL, NULL),
(294, 1, 'Геленджик', 77, '353460', 1, NULL, 100, NULL, NULL, NULL),
(295, 1, 'Горячий Ключ', 77, '353290', 1, NULL, 100, NULL, NULL, NULL),
(296, 1, 'Гулькевичи', 77, '352190', 1, NULL, 100, NULL, NULL, NULL),
(297, 1, 'Ейск', 77, '353680', 1, NULL, 100, NULL, NULL, NULL),
(298, 1, 'Кореновск', 77, '353180', 1, NULL, 100, NULL, NULL, NULL),
(299, 1, 'Краснодар', 77, '350000', 1, NULL, 100, NULL, NULL, NULL),
(300, 1, 'Кропоткин', 77, '352380', 1, NULL, 100, NULL, NULL, NULL),
(301, 1, 'Крымск', 77, '353380', 1, NULL, 100, NULL, NULL, NULL),
(302, 1, 'Курганинск', 77, '352430', 1, NULL, 100, NULL, NULL, NULL),
(303, 1, 'Лабинск', 77, '352500', 1, NULL, 100, NULL, NULL, NULL),
(304, 1, 'Новокубанск', 77, '352240', 1, NULL, 100, NULL, NULL, NULL),
(305, 1, 'Новороссийск', 77, '353900', 1, NULL, 100, NULL, NULL, NULL),
(306, 1, 'Приморско-Ахтарск', 77, '353860', 1, NULL, 100, NULL, NULL, NULL),
(307, 1, 'Славянск-на-Кубани', 77, '353560', 1, NULL, 100, NULL, NULL, NULL),
(308, 1, 'Сочи', 77, '354000', 1, NULL, 100, NULL, NULL, NULL),
(309, 1, 'Темрюк', 77, '353500', 1, NULL, 100, NULL, NULL, NULL),
(310, 1, 'Тимашевск', 77, '352700', 1, NULL, 100, NULL, NULL, NULL),
(311, 1, 'Тихорецк', 77, '352120', 1, NULL, 100, NULL, NULL, NULL),
(312, 1, 'Туапсе', 77, '352800', 1, NULL, 100, NULL, NULL, NULL),
(313, 1, 'Усть-Лабинск', 77, '352330', 1, NULL, 100, NULL, NULL, NULL),
(314, 1, 'Хадыженск', 77, '352680', 1, NULL, 100, NULL, NULL, NULL),
(315, 1, 'Артемовск', 30, '662951', 1, NULL, 100, NULL, NULL, NULL),
(316, 1, 'Ачинск', 30, '660816', 1, NULL, 100, NULL, NULL, NULL),
(317, 1, 'Боготол', 30, '662060', 1, NULL, 100, NULL, NULL, NULL),
(318, 1, 'Бородино', 30, '143240', 1, NULL, 100, NULL, NULL, NULL),
(319, 1, 'Дивногорск', 30, '663090', 1, NULL, 100, NULL, NULL, NULL),
(320, 1, 'Дудинка', 30, '647000', 1, NULL, 100, NULL, NULL, NULL),
(321, 1, 'Енисейск', 30, '663180', 1, NULL, 100, NULL, NULL, NULL),
(322, 1, 'Железногорск', 30, '307170', 1, NULL, 100, NULL, NULL, NULL),
(323, 1, 'Заозерный', 30, '627741', 1, NULL, 100, NULL, NULL, NULL),
(324, 1, 'Зеленогорск', 30, '197720', 1, NULL, 100, NULL, NULL, NULL),
(325, 1, 'Игарка', 30, '663200', 1, NULL, 100, NULL, NULL, NULL),
(326, 1, 'Иланский', 30, '663800', 1, NULL, 100, NULL, NULL, NULL),
(327, 1, 'Канск', 30, '660861', 1, NULL, 100, NULL, NULL, NULL),
(328, 1, 'Кодинск', 30, '663490', 1, NULL, 100, NULL, NULL, NULL),
(329, 1, 'Красноярск', 30, '660000', 1, NULL, 100, NULL, NULL, NULL),
(330, 1, 'Лесосибирск', 30, '662540', 1, NULL, 100, NULL, NULL, NULL),
(331, 1, 'Минусинск', 30, '660860', 1, NULL, 100, NULL, NULL, NULL),
(332, 1, 'Назарово', 30, '152734', 1, NULL, 100, NULL, NULL, NULL),
(333, 1, 'Норильск', 30, '663300', 1, NULL, 100, NULL, NULL, NULL),
(334, 1, 'Сосновоборск', 30, '442570', 1, NULL, 100, NULL, NULL, NULL),
(335, 1, 'Ужур', 30, '662250', 1, NULL, 100, NULL, NULL, NULL),
(336, 1, 'Уяр', 30, '663920', 1, NULL, 100, NULL, NULL, NULL),
(337, 1, 'Шарыпово', 30, '662310', 1, NULL, 100, NULL, NULL, NULL),
(338, 1, 'Архангельск', 76, '163000', 1, NULL, 100, NULL, NULL, NULL),
(339, 1, 'Вельск', 76, '165150', 1, NULL, 100, NULL, NULL, NULL),
(340, 1, 'Каргополь', 76, '164110', 1, NULL, 100, NULL, NULL, NULL),
(341, 1, 'Коряжма', 76, '165650', 1, NULL, 100, NULL, NULL, NULL),
(342, 1, 'Котлас', 76, '165300', 1, NULL, 100, NULL, NULL, NULL),
(343, 1, 'Мезень', 76, '164750', 1, NULL, 100, NULL, NULL, NULL),
(344, 1, 'Мирный', 76, '162236', 1, NULL, 100, NULL, NULL, NULL),
(345, 1, 'Новодвинск', 76, '164900', 1, NULL, 100, NULL, NULL, NULL),
(346, 1, 'Няндома', 76, '164200', 1, NULL, 100, NULL, NULL, NULL),
(347, 1, 'Онега', 76, '164840', 1, NULL, 100, NULL, NULL, NULL),
(348, 1, 'Северодвинск', 76, '164500', 1, NULL, 100, NULL, NULL, NULL),
(349, 1, 'Сольвычегодск', 76, '165330', 1, NULL, 100, NULL, NULL, NULL),
(350, 1, 'Шенкурск', 76, '165160', 1, NULL, 100, NULL, NULL, NULL),
(351, 1, 'Белогорск', 75, '297600', 1, NULL, 100, NULL, NULL, NULL),
(352, 1, 'Благовещенск', 75, '453430', 1, NULL, 100, NULL, NULL, NULL),
(353, 1, 'Завитинск', 75, '676870', 1, NULL, 100, NULL, NULL, NULL),
(354, 1, 'Зея', 75, '675824', 1, NULL, 100, NULL, NULL, NULL),
(355, 1, 'Райчихинск', 75, '676770', 1, NULL, 100, NULL, NULL, NULL),
(356, 1, 'Свободный', 75, '346958', 1, NULL, 100, NULL, NULL, NULL),
(357, 1, 'Сковородино', 75, '676010', 1, NULL, 100, NULL, NULL, NULL),
(358, 1, 'Тында', 75, '675828', 1, NULL, 100, NULL, NULL, NULL),
(359, 1, 'Углегорск', 75, '676470', 1, NULL, 100, NULL, NULL, NULL),
(360, 1, 'Шимановск', 75, '676301', 1, NULL, 100, NULL, NULL, NULL),
(361, 1, 'Горно-Алтайск', 74, '649000', 1, NULL, 100, NULL, NULL, NULL),
(362, 1, 'Адыгейск', 73, '385200', 1, NULL, 100, NULL, NULL, NULL),
(363, 1, 'Майкоп', 73, '385000', 1, NULL, 100, NULL, NULL, NULL),
(364, 1, 'Брянск', 72, '241000', 1, NULL, 100, NULL, NULL, NULL),
(365, 1, 'Дятьково', 72, '242600', 1, NULL, 100, NULL, NULL, NULL),
(366, 1, 'Жуковка', 72, '242700', 1, NULL, 100, NULL, NULL, NULL),
(367, 1, 'Злынка', 72, '243600', 1, NULL, 100, NULL, NULL, NULL),
(368, 1, 'Карачев', 72, '242500', 1, NULL, 100, NULL, NULL, NULL),
(369, 1, 'Клинцы', 72, '243140', 1, NULL, 100, NULL, NULL, NULL),
(370, 1, 'Мглин', 72, '243220', 1, NULL, 100, NULL, NULL, NULL),
(371, 1, 'Новозыбков', 72, '243020', 1, NULL, 100, NULL, NULL, NULL),
(372, 1, 'Почеп', 72, '243400', 1, NULL, 100, NULL, NULL, NULL),
(373, 1, 'Севск', 72, '242440', 1, NULL, 100, NULL, NULL, NULL),
(374, 1, 'Сельцо', 72, '187052', 1, NULL, 100, NULL, NULL, NULL),
(375, 1, 'Стародуб', 72, '243240', 1, NULL, 100, NULL, NULL, NULL),
(376, 1, 'Сураж', 72, '243500', 1, NULL, 100, NULL, NULL, NULL),
(377, 1, 'Трубчевск', 72, '242220', 1, NULL, 100, NULL, NULL, NULL),
(378, 1, 'Унеча', 72, '243300', 1, NULL, 100, NULL, NULL, NULL),
(379, 1, 'Фокино', 72, '242610', 1, NULL, 100, NULL, NULL, NULL),
(380, 1, 'Вичуга', 71, '155330', 1, NULL, 100, NULL, NULL, NULL),
(381, 1, 'Гаврилов Посад', 71, '155000', 1, NULL, 100, NULL, NULL, NULL),
(382, 1, 'Заволжск', 71, '155410', 1, NULL, 100, NULL, NULL, NULL),
(383, 1, 'Иваново', 71, '140331', 1, NULL, 100, NULL, NULL, NULL),
(384, 1, 'Кинешма', 71, '155800', 1, NULL, 100, NULL, NULL, NULL),
(385, 1, 'Комсомольск', 71, '155150', 1, NULL, 100, NULL, NULL, NULL),
(386, 1, 'Кохма', 71, '153510', 1, NULL, 100, NULL, NULL, NULL),
(387, 1, 'Наволоки', 71, '155830', 1, NULL, 100, NULL, NULL, NULL),
(388, 1, 'Плес', 71, '155555', 1, NULL, 100, NULL, NULL, NULL),
(389, 1, 'Приволжск', 71, '155550', 1, NULL, 100, NULL, NULL, NULL),
(390, 1, 'Пучеж', 71, '155360', 1, NULL, 100, NULL, NULL, NULL),
(391, 1, 'Родники', 71, '140143', 1, NULL, 100, NULL, NULL, NULL),
(392, 1, 'Тейково', 71, '155040', 1, NULL, 100, NULL, NULL, NULL),
(393, 1, 'Фурманов', 71, '155520', 1, NULL, 100, NULL, NULL, NULL),
(394, 1, 'Шуя', 71, '155900', 1, NULL, 100, NULL, NULL, NULL),
(395, 1, 'Южа', 71, '155630', 1, NULL, 100, NULL, NULL, NULL),
(396, 1, 'Юрьевец', 71, '155450', 1, NULL, 100, NULL, NULL, NULL),
(397, 1, 'Анадырь', 70, '689000', 1, NULL, 100, NULL, NULL, NULL),
(398, 1, 'Билибино', 70, '689450', 1, NULL, 100, NULL, NULL, NULL),
(399, 1, 'Певек', 70, '689400', 1, NULL, 100, NULL, NULL, NULL),
(400, 1, 'Аркадак', 69, '412210', 1, NULL, 100, NULL, NULL, NULL),
(401, 1, 'Аткарск', 69, '412420', 1, NULL, 100, NULL, NULL, NULL),
(402, 1, 'Балаково', 69, '413823', 1, NULL, 100, NULL, NULL, NULL),
(403, 1, 'Балашов', 69, '412292', 1, NULL, 100, NULL, NULL, NULL),
(404, 1, 'Вольск', 69, '412900', 1, NULL, 100, NULL, NULL, NULL),
(405, 1, 'Вольск-18', 69, '412918', 1, NULL, 100, NULL, NULL, NULL),
(406, 1, 'Ершов', 69, '413500', 1, NULL, 100, NULL, NULL, NULL),
(407, 1, 'Калининск', 69, '412479', 1, NULL, 100, NULL, NULL, NULL),
(408, 1, 'Красный Кут', 69, '346462', 1, NULL, 100, NULL, NULL, NULL),
(409, 1, 'Маркс', 69, '413089', 1, NULL, 100, NULL, NULL, NULL),
(410, 1, 'Новоузенск', 69, '413360', 1, NULL, 100, NULL, NULL, NULL),
(411, 1, 'Петровск', 69, '412540', 1, NULL, 100, NULL, NULL, NULL),
(412, 1, 'Пугачев', 69, '413720', 1, NULL, 100, NULL, NULL, NULL),
(413, 1, 'Ртищево', 69, '303719', 1, NULL, 100, NULL, NULL, NULL),
(414, 1, 'Саратов', 69, '410000', 1, NULL, 100, NULL, NULL, NULL),
(415, 1, 'Хвалынск', 69, '412780', 1, NULL, 100, NULL, NULL, NULL),
(416, 1, 'Шиханы', 69, '412950', 1, NULL, 100, NULL, NULL, NULL),
(417, 1, 'Энгельс', 69, '413100', 1, NULL, 100, NULL, NULL, NULL),
(418, 1, 'Багратионовск', 29, '238420', 1, NULL, 100, NULL, NULL, NULL),
(419, 1, 'Балтийск', 29, '238520', 1, NULL, 100, NULL, NULL, NULL),
(420, 1, 'Гвардейск', 29, '238210', 1, NULL, 100, NULL, NULL, NULL),
(421, 1, 'Гурьевск', 29, '238300', 1, NULL, 100, NULL, NULL, NULL),
(422, 1, 'Гусев', 29, '238050', 1, NULL, 100, NULL, NULL, NULL),
(423, 1, 'Зеленоградск', 29, '238326', 1, NULL, 100, NULL, NULL, NULL),
(424, 1, 'Калининград', 29, '236001', 1, NULL, 100, NULL, NULL, NULL),
(425, 1, 'Краснознаменск', 29, '143090', 1, NULL, 100, NULL, NULL, NULL),
(426, 1, 'Ладушкин', 29, '238460', 1, NULL, 100, NULL, NULL, NULL),
(427, 1, 'Мамоново', 29, '238450', 1, NULL, 100, NULL, NULL, NULL),
(428, 1, 'Неман', 29, '238710', 1, NULL, 100, NULL, NULL, NULL),
(429, 1, 'Нестеров', 29, '238010', 1, NULL, 100, NULL, NULL, NULL),
(430, 1, 'Озерск', 29, '238120', 1, NULL, 100, NULL, NULL, NULL),
(431, 1, 'Пионерский', 29, '161061', 1, NULL, 100, NULL, NULL, NULL),
(432, 1, 'Полесск', 29, '238630', 1, NULL, 100, NULL, NULL, NULL),
(433, 1, 'Правдинск', 29, '238400', 1, NULL, 100, NULL, NULL, NULL),
(434, 1, 'Приморск', 29, '188910', 1, NULL, 100, NULL, NULL, NULL),
(435, 1, 'Светлогорск', 29, '238560', 1, NULL, 100, NULL, NULL, NULL),
(436, 1, 'Светлый', 29, '164557', 1, NULL, 100, NULL, NULL, NULL),
(437, 1, 'Славск', 29, '238600', 1, NULL, 100, NULL, NULL, NULL),
(438, 1, 'Советск', 29, '236876', 1, NULL, 100, NULL, NULL, NULL),
(439, 1, 'Черняховск', 29, '236816', 1, NULL, 100, NULL, NULL, NULL),
(440, 1, 'Городовиковск', 68, '359050', 1, NULL, 100, NULL, NULL, NULL),
(441, 1, 'Лагань', 68, '359220', 1, NULL, 100, NULL, NULL, NULL),
(442, 1, 'Элиста', 68, '358000', 1, NULL, 100, NULL, NULL, NULL),
(443, 1, 'Балабаново', 67, '249000', 1, NULL, 100, NULL, NULL, NULL),
(444, 1, 'Белоусово', 67, '162930', 1, NULL, 100, NULL, NULL, NULL),
(445, 1, 'Боровск', 67, '249010', 1, NULL, 100, NULL, NULL, NULL),
(446, 1, 'Ермолино', 67, '141923', 1, NULL, 100, NULL, NULL, NULL),
(447, 1, 'Жиздра', 67, '249340', 1, NULL, 100, NULL, NULL, NULL),
(448, 1, 'Жуков', 67, '249190', 1, NULL, 100, NULL, NULL, NULL),
(449, 1, 'Калуга', 67, '248000', 1, NULL, 100, NULL, NULL, NULL),
(450, 1, 'Киров', 67, '249440', 1, NULL, 100, NULL, NULL, NULL),
(451, 1, 'Козельск', 67, '249141', 1, NULL, 100, NULL, NULL, NULL),
(452, 1, 'Кондрово', 67, '249830', 1, NULL, 100, NULL, NULL, NULL),
(453, 1, 'Кременки', 67, '249185', 1, NULL, 100, NULL, NULL, NULL),
(454, 1, 'Людиново', 67, '249342', 1, NULL, 100, NULL, NULL, NULL),
(455, 1, 'Малоярославец', 67, '249091', 1, NULL, 100, NULL, NULL, NULL),
(456, 1, 'Медынь', 67, '249950', 1, NULL, 100, NULL, NULL, NULL),
(457, 1, 'Мещовск', 67, '249240', 1, NULL, 100, NULL, NULL, NULL),
(458, 1, 'Мосальск', 67, '249930', 1, NULL, 100, NULL, NULL, NULL),
(459, 1, 'Обнинск', 67, '249030', 1, NULL, 100, NULL, NULL, NULL),
(460, 1, 'Сосенский', 67, '249710', 1, NULL, 100, NULL, NULL, NULL),
(461, 1, 'Спас-Деменск', 67, '249610', 1, NULL, 100, NULL, NULL, NULL),
(462, 1, 'Сухиничи', 67, '249270', 1, NULL, 100, NULL, NULL, NULL),
(463, 1, 'Таруса', 67, '249100', 1, NULL, 100, NULL, NULL, NULL),
(464, 1, 'Юхнов', 67, '249910', 1, NULL, 100, NULL, NULL, NULL),
(465, 1, 'Вилючинск', 66, '684090', 1, NULL, 100, NULL, NULL, NULL),
(466, 1, 'Елизово', 66, '684000', 1, NULL, 100, NULL, NULL, NULL),
(467, 1, 'Петропавловск-Камчатский', 66, '683000', 1, NULL, 100, NULL, NULL, NULL),
(468, 1, 'Карачаевск', 28, '369200', 1, NULL, 100, NULL, NULL, NULL),
(469, 1, 'Теберда', 28, '369210', 1, NULL, 100, NULL, NULL, NULL),
(470, 1, 'Усть-Джегута', 28, '369300', 1, NULL, 100, NULL, NULL, NULL),
(471, 1, 'Черкесск', 28, '369000', 1, NULL, 100, NULL, NULL, NULL),
(472, 1, 'Беломорск', 65, '186500', 1, NULL, 100, NULL, NULL, NULL),
(473, 1, 'Кемь', 65, '186610', 1, NULL, 100, NULL, NULL, NULL),
(474, 1, 'Кондопога', 65, '186215', 1, NULL, 100, NULL, NULL, NULL),
(475, 1, 'Костомукша', 65, '186930', 1, NULL, 100, NULL, NULL, NULL),
(476, 1, 'Лахденпохья', 65, '186730', 1, NULL, 100, NULL, NULL, NULL),
(477, 1, 'Медвежьегорск', 65, '186302', 1, NULL, 100, NULL, NULL, NULL),
(478, 1, 'Олонец', 65, '186000', 1, NULL, 100, NULL, NULL, NULL),
(479, 1, 'Петрозаводск', 65, '185000', 1, NULL, 100, NULL, NULL, NULL),
(480, 1, 'Питкяранта', 65, '186810', 1, NULL, 100, NULL, NULL, NULL),
(481, 1, 'Пудож', 65, '186150', 1, NULL, 100, NULL, NULL, NULL),
(482, 1, 'Сегежа', 65, '186420', 1, NULL, 100, NULL, NULL, NULL),
(483, 1, 'Сортавала', 65, '186790', 1, NULL, 100, NULL, NULL, NULL),
(484, 1, 'Суоярви', 65, '186870', 1, NULL, 100, NULL, NULL, NULL),
(485, 1, 'Анжеро-Судженск', 27, '652470', 1, NULL, 100, NULL, NULL, NULL),
(486, 1, 'Белово', 27, '157138', 1, NULL, 100, NULL, NULL, NULL),
(487, 1, 'Березовский', 27, '249355', 1, NULL, 100, NULL, NULL, NULL),
(488, 1, 'Калтан', 27, '652740', 1, NULL, 100, NULL, NULL, NULL),
(489, 1, 'Кемерово', 27, '650000', 1, NULL, 100, NULL, NULL, NULL),
(490, 1, 'Киселевск', 27, '652700', 1, NULL, 100, NULL, NULL, NULL),
(491, 1, 'Ленинск-Кузнецкий', 27, '652500', 1, NULL, 100, NULL, NULL, NULL),
(492, 1, 'Мариинск', 27, '652150', 1, NULL, 100, NULL, NULL, NULL),
(493, 1, 'Междуреченск', 27, '169260', 1, NULL, 100, NULL, NULL, NULL),
(494, 1, 'Мыски', 27, '652840', 1, NULL, 100, NULL, NULL, NULL),
(495, 1, 'Новокузнецк', 27, '654000', 1, NULL, 100, NULL, NULL, NULL),
(496, 1, 'Осинники', 27, '652800', 1, NULL, 100, NULL, NULL, NULL),
(497, 1, 'Полысаево', 27, '0', 1, NULL, 100, NULL, NULL, NULL),
(498, 1, 'Прокопьевск', 27, '653000', 1, NULL, 100, NULL, NULL, NULL),
(499, 1, 'Салаир', 27, '0', 1, NULL, 100, NULL, NULL, NULL),
(500, 1, 'Тайга', 27, '164644', 1, NULL, 100, NULL, NULL, NULL),
(501, 1, 'Таштагол', 27, '652990', 1, NULL, 100, NULL, NULL, NULL),
(502, 1, 'Топки', 27, '303187', 1, NULL, 100, NULL, NULL, NULL),
(503, 1, 'Юрга', 27, '652050', 1, NULL, 100, NULL, NULL, NULL),
(504, 1, 'Балей', 64, '673450', 1, NULL, 100, NULL, NULL, NULL),
(505, 1, 'Борзя', 64, '674600', 1, NULL, 100, NULL, NULL, NULL),
(506, 1, 'Краснокаменск', 64, '662955', 1, NULL, 100, NULL, NULL, NULL),
(507, 1, 'Могоча', 64, '673730', 1, NULL, 100, NULL, NULL, NULL),
(508, 1, 'Нерчинск', 64, '672840', 1, NULL, 100, NULL, NULL, NULL),
(509, 1, 'Петровск-Забайкальский', 64, '672801', 1, NULL, 100, NULL, NULL, NULL),
(510, 1, 'Сретенск', 64, '673500', 1, NULL, 100, NULL, NULL, NULL),
(511, 1, 'Хилок', 64, '673200', 1, NULL, 100, NULL, NULL, NULL),
(512, 1, 'Чита', 64, '422792', 1, NULL, 100, NULL, NULL, NULL),
(513, 1, 'Шилка', 64, '673302', 1, NULL, 100, NULL, NULL, NULL),
(514, 1, 'Баксан', 63, '361530', 1, NULL, 100, NULL, NULL, NULL),
(515, 1, 'Майский', 63, '160508', 1, NULL, 100, NULL, NULL, NULL),
(516, 1, 'Нальчик', 63, '360000', 1, NULL, 100, NULL, NULL, NULL),
(517, 1, 'Нарткала', 63, '361330', 1, NULL, 100, NULL, NULL, NULL),
(518, 1, 'Прохладный', 63, '361040', 1, NULL, 100, NULL, NULL, NULL),
(519, 1, 'Терек', 63, '356837', 1, NULL, 100, NULL, NULL, NULL),
(520, 1, 'Тырныауз', 63, '361621', 1, NULL, 100, NULL, NULL, NULL),
(521, 1, 'Чегем', 63, '361400', 1, NULL, 100, NULL, NULL, NULL),
(522, 1, 'Белая Холуница', 62, '613200', 1, NULL, 100, NULL, NULL, NULL),
(523, 1, 'Вятские Поляны', 62, '612960', 1, NULL, 100, NULL, NULL, NULL),
(524, 1, 'Зуевка', 62, '306137', 1, NULL, 100, NULL, NULL, NULL),
(525, 1, 'Кирово-Чепецк', 62, '613040', 1, NULL, 100, NULL, NULL, NULL),
(526, 1, 'Кирс', 62, '612820', 1, NULL, 100, NULL, NULL, NULL),
(527, 1, 'Котельнич', 62, '612600', 1, NULL, 100, NULL, NULL, NULL),
(528, 1, 'Луза', 62, '613980', 1, NULL, 100, NULL, NULL, NULL),
(529, 1, 'Малмыж', 62, '612920', 1, NULL, 100, NULL, NULL, NULL),
(530, 1, 'Мураши', 62, '613710', 1, NULL, 100, NULL, NULL, NULL),
(531, 1, 'Нолинск', 62, '613440', 1, NULL, 100, NULL, NULL, NULL),
(532, 1, 'Омутнинск', 62, '612704', 1, NULL, 100, NULL, NULL, NULL),
(533, 1, 'Орлов', 62, '347135', 1, NULL, 100, NULL, NULL, NULL),
(534, 1, 'Слободской', 62, '346652', 1, NULL, 100, NULL, NULL, NULL),
(535, 1, 'Сосновка', 62, '140576', 1, NULL, 100, NULL, NULL, NULL),
(536, 1, 'Уржум', 62, '613530', 1, NULL, 100, NULL, NULL, NULL),
(537, 1, 'Яранск', 62, '612260', 1, NULL, 100, NULL, NULL, NULL),
(538, 1, 'Жигулевск', 26, '445350', 1, NULL, 100, NULL, NULL, NULL),
(539, 1, 'Кинель', 26, '446430', 1, NULL, 100, NULL, NULL, NULL),
(540, 1, 'Нефтегорск', 26, '352685', 1, NULL, 100, NULL, NULL, NULL),
(541, 1, 'Новокуйбышевск', 26, '446200', 1, NULL, 100, NULL, NULL, NULL),
(542, 1, 'Октябрьск', 26, '445240', 1, NULL, 100, NULL, NULL, NULL),
(543, 1, 'Отрадный', 26, '346605', 1, NULL, 100, NULL, NULL, NULL),
(544, 1, 'Похвистнево', 26, '446450', 1, NULL, 100, NULL, NULL, NULL),
(545, 1, 'Самара', 26, '443000', 1, NULL, 100, NULL, NULL, NULL),
(546, 1, 'Сызрань', 26, '446000', 1, NULL, 100, NULL, NULL, NULL),
(547, 1, 'Тольятти', 26, '445000', 1, NULL, 100, NULL, NULL, NULL),
(548, 1, 'Чапаевск', 26, '446100', 1, NULL, 100, NULL, NULL, NULL),
(549, 1, 'Касимов', 61, '391300', 1, NULL, 100, NULL, NULL, NULL),
(550, 1, 'Кораблино', 61, '390515', 1, NULL, 100, NULL, NULL, NULL),
(551, 1, 'Михайлов', 61, '347071', 1, NULL, 100, NULL, NULL, NULL),
(552, 1, 'Новомичуринск', 61, '391160', 1, NULL, 100, NULL, NULL, NULL),
(553, 1, 'Рыбное', 61, '141821', 1, NULL, 100, NULL, NULL, NULL),
(554, 1, 'Ряжск', 61, '391960', 1, NULL, 100, NULL, NULL, NULL),
(555, 1, 'Рязань', 61, '390000', 1, NULL, 100, NULL, NULL, NULL),
(556, 1, 'Сасово', 61, '391430', 1, NULL, 100, NULL, NULL, NULL),
(557, 1, 'Скопин', 61, '391800', 1, NULL, 100, NULL, NULL, NULL),
(558, 1, 'Спас-Клепики', 61, '391030', 1, NULL, 100, NULL, NULL, NULL),
(559, 1, 'Спасск-Рязанский', 61, '391050', 1, NULL, 100, NULL, NULL, NULL),
(560, 1, 'Шацк', 61, '391550', 1, NULL, 100, NULL, NULL, NULL),
(561, 1, 'Далматово', 25, '641730', 1, NULL, 100, NULL, NULL, NULL),
(562, 1, 'Катайск', 25, '641700', 1, NULL, 100, NULL, NULL, NULL),
(563, 1, 'Курган', 25, '618613', 1, NULL, 100, NULL, NULL, NULL),
(564, 1, 'Куртамыш', 25, '641430', 1, NULL, 100, NULL, NULL, NULL),
(565, 1, 'Макушино', 25, '182340', 1, NULL, 100, NULL, NULL, NULL),
(566, 1, 'Петухово', 25, '641640', 1, NULL, 100, NULL, NULL, NULL),
(567, 1, 'Шадринск', 25, '641804', 1, NULL, 100, NULL, NULL, NULL),
(568, 1, 'Шумиха', 25, '622921', 1, NULL, 100, NULL, NULL, NULL),
(569, 1, 'Щучье', 25, '172468', 1, NULL, 100, NULL, NULL, NULL),
(570, 1, 'Дмитриев', 24, '0', 1, NULL, 100, NULL, NULL, NULL),
(571, 1, 'Курск', 24, '188442', 1, NULL, 100, NULL, NULL, NULL),
(572, 1, 'Курчатов', 24, '307250', 1, NULL, 100, NULL, NULL, NULL),
(573, 1, 'Льгов', 24, '303944', 1, NULL, 100, NULL, NULL, NULL),
(574, 1, 'Обоянь', 24, '306230', 1, NULL, 100, NULL, NULL, NULL),
(575, 1, 'Рыльск', 24, '307331', 1, NULL, 100, NULL, NULL, NULL),
(576, 1, 'Суджа', 24, '307800', 1, NULL, 100, NULL, NULL, NULL),
(577, 1, 'Фатеж', 24, '307100', 1, NULL, 100, NULL, NULL, NULL),
(578, 1, 'Щигры', 24, '306509', 1, NULL, 100, NULL, NULL, NULL),
(579, 1, 'Бокситогорск', 60, '187650', 1, NULL, 100, NULL, NULL, NULL),
(580, 1, 'Волосово', 60, '187844', 1, NULL, 100, NULL, NULL, NULL),
(581, 1, 'Волхов', 60, '187401', 1, NULL, 100, NULL, NULL, NULL),
(582, 1, 'Всеволожск', 60, '188640', 1, NULL, 100, NULL, NULL, NULL),
(583, 1, 'Выборг', 60, '188800', 1, NULL, 100, NULL, NULL, NULL),
(584, 1, 'Высоцк', 60, '188909', 1, NULL, 100, NULL, NULL, NULL),
(585, 1, 'Гатчина', 60, '188300', 1, NULL, 100, NULL, NULL, NULL),
(586, 1, 'Ивангород', 60, '188490', 1, NULL, 100, NULL, NULL, NULL),
(587, 1, 'Каменногорск', 60, '188950', 1, NULL, 100, NULL, NULL, NULL),
(588, 1, 'Кингисепп', 60, '188452', 1, NULL, 100, NULL, NULL, NULL),
(589, 1, 'Кириши', 60, '187110', 1, NULL, 100, NULL, NULL, NULL),
(590, 1, 'Кировск', 60, '184250', 1, NULL, 100, NULL, NULL, NULL),
(591, 1, 'Коммунар', 60, '188320', 1, NULL, 100, NULL, NULL, NULL),
(592, 1, 'Лодейное Поле', 60, '187700', 1, NULL, 100, NULL, NULL, NULL),
(593, 1, 'Луга', 60, '188229', 1, NULL, 100, NULL, NULL, NULL),
(594, 1, 'Любань', 60, '187050', 1, NULL, 100, NULL, NULL, NULL),
(595, 1, 'Никольское', 60, '143724', 1, NULL, 100, NULL, NULL, NULL),
(596, 1, 'Новая Ладога', 60, '187450', 1, NULL, 100, NULL, NULL, NULL),
(597, 1, 'Отрадное', 60, '143442', 1, NULL, 100, NULL, NULL, NULL),
(598, 1, 'Пикалево', 60, '187600', 1, NULL, 100, NULL, NULL, NULL),
(599, 1, 'Подпорожье', 60, '186164', 1, NULL, 100, NULL, NULL, NULL),
(600, 1, 'Приозерск', 60, '188760', 1, NULL, 100, NULL, NULL, NULL),
(601, 1, 'Санкт-Петербург', 60, '190000', 1, NULL, 100, NULL, NULL, NULL),
(602, 1, 'Светогорск', 60, '188990', 1, NULL, 100, NULL, NULL, NULL),
(603, 1, 'Сертолово', 60, '188650', 1, NULL, 100, NULL, NULL, NULL),
(604, 1, 'Сланцы', 60, '188560', 1, NULL, 100, NULL, NULL, NULL),
(605, 1, 'Сосновый Бор', 60, '182277', 1, NULL, 100, NULL, NULL, NULL),
(606, 1, 'Сясьстрой', 60, '187420', 1, NULL, 100, NULL, NULL, NULL),
(607, 1, 'Тихвин', 60, '187549', 1, NULL, 100, NULL, NULL, NULL),
(608, 1, 'Тосно', 60, '187000', 1, NULL, 100, NULL, NULL, NULL),
(609, 1, 'Шлиссельбург', 60, '187320', 1, NULL, 100, NULL, NULL, NULL),
(610, 1, 'Грязи', 23, '399050', 1, NULL, 100, NULL, NULL, NULL),
(611, 1, 'Данков', 23, '399835', 1, NULL, 100, NULL, NULL, NULL),
(612, 1, 'Елец', 23, '399002', 1, NULL, 100, NULL, NULL, NULL),
(613, 1, 'Задонск', 23, '399200', 1, NULL, 100, NULL, NULL, NULL),
(614, 1, 'Лебедянь', 23, '399610', 1, NULL, 100, NULL, NULL, NULL),
(615, 1, 'Липецк', 23, '398000', 1, NULL, 100, NULL, NULL, NULL),
(616, 1, 'Усмань', 23, '399370', 1, NULL, 100, NULL, NULL, NULL),
(617, 1, 'Чаплыгин', 23, '352185', 1, NULL, 100, NULL, NULL, NULL),
(618, 1, 'Магадан', 59, '685000', 1, NULL, 100, NULL, NULL, NULL),
(619, 1, 'Сусуман', 59, '686314', 1, NULL, 100, NULL, NULL, NULL),
(620, 1, 'Воркута', 58, '169900', 1, NULL, 100, NULL, NULL, NULL),
(621, 1, 'Вуктыл', 58, '169570', 1, NULL, 100, NULL, NULL, NULL),
(622, 1, 'Емва', 58, '169200', 1, NULL, 100, NULL, NULL, NULL),
(623, 1, 'Инта', 58, '169840', 1, NULL, 100, NULL, NULL, NULL),
(624, 1, 'Микунь', 58, '169060', 1, NULL, 100, NULL, NULL, NULL),
(625, 1, 'Печора', 58, '169600', 1, NULL, 100, NULL, NULL, NULL),
(626, 1, 'Сосногорск', 58, '169500', 1, NULL, 100, NULL, NULL, NULL),
(627, 1, 'Сыктывкар', 58, '167000', 1, NULL, 100, NULL, NULL, NULL),
(628, 1, 'Усинск', 58, '169710', 1, NULL, 100, NULL, NULL, NULL),
(629, 1, 'Ухта', 58, '169300', 1, NULL, 100, NULL, NULL, NULL),
(630, 1, 'Губкинский', 57, '629830', 1, NULL, 100, NULL, NULL, NULL),
(631, 1, 'Лабытнанги', 57, '629400', 1, NULL, 100, NULL, NULL, NULL),
(632, 1, 'Муравленко', 57, '629601', 1, NULL, 100, NULL, NULL, NULL),
(633, 1, 'Надым', 57, '629730', 1, NULL, 100, NULL, NULL, NULL),
(634, 1, 'Новый Уренгой', 57, '629300', 1, NULL, 100, NULL, NULL, NULL),
(635, 1, 'Ноябрьск', 57, '629800', 1, NULL, 100, NULL, NULL, NULL),
(636, 1, 'Салехард', 57, '629000', 1, NULL, 100, NULL, NULL, NULL),
(637, 1, 'Тарко-Сале', 57, '629850', 1, NULL, 100, NULL, NULL, NULL),
(638, 1, 'Алзамай', 22, '0', 1, NULL, 100, NULL, NULL, NULL),
(639, 1, 'Ангарск', 22, '665800', 1, NULL, 100, NULL, NULL, NULL),
(640, 1, 'Байкальск', 22, '665930', 1, NULL, 100, NULL, NULL, NULL),
(641, 1, 'Бирюсинск', 22, '0', 1, NULL, 100, NULL, NULL, NULL),
(642, 1, 'Бодайбо', 22, '666900', 1, NULL, 100, NULL, NULL, NULL),
(643, 1, 'Братск', 22, '664899', 1, NULL, 100, NULL, NULL, NULL),
(644, 1, 'Вихоревка', 22, '665770', 1, NULL, 100, NULL, NULL, NULL),
(645, 1, 'Железногорск-Илимский', 22, '665650', 1, NULL, 100, NULL, NULL, NULL),
(646, 1, 'Зима', 22, '665382', 1, NULL, 100, NULL, NULL, NULL),
(647, 1, 'Иркутск', 22, '664000', 1, NULL, 100, NULL, NULL, NULL),
(648, 1, 'Киренск', 22, '666700', 1, NULL, 100, NULL, NULL, NULL),
(649, 1, 'Нижнеудинск', 22, '664810', 1, NULL, 100, NULL, NULL, NULL),
(650, 1, 'Саянск', 22, '662654', 1, NULL, 100, NULL, NULL, NULL),
(651, 1, 'Свирск', 22, '665420', 1, NULL, 100, NULL, NULL, NULL),
(652, 1, 'Слюдянка', 22, '665900', 1, NULL, 100, NULL, NULL, NULL),
(653, 1, 'Тайшет', 22, '664802', 1, NULL, 100, NULL, NULL, NULL),
(654, 1, 'Тулун', 22, '665250', 1, NULL, 100, NULL, NULL, NULL),
(655, 1, 'Усолье-Сибирское', 22, '665450', 1, NULL, 100, NULL, NULL, NULL),
(656, 1, 'Усть-Илимск', 22, '666670', 1, NULL, 100, NULL, NULL, NULL),
(657, 1, 'Усть-Кут', 22, '666780', 1, NULL, 100, NULL, NULL, NULL),
(658, 1, 'Черемхово', 22, '665400', 1, NULL, 100, NULL, NULL, NULL),
(659, 1, 'Шелехов', 22, '666031', 1, NULL, 100, NULL, NULL, NULL),
(660, 1, 'Карабулак', 56, '386230', 1, NULL, 100, NULL, NULL, NULL),
(661, 1, 'Магас', 56, '386001', 1, NULL, 100, NULL, NULL, NULL),
(662, 1, 'Малгобек', 56, '386300', 1, NULL, 100, NULL, NULL, NULL),
(663, 1, 'Назрань', 56, '386100', 1, NULL, 100, NULL, NULL, NULL),
(664, 1, 'Арсеньев', 55, '692330', 1, NULL, 100, NULL, NULL, NULL),
(665, 1, 'Артем', 55, '692486', 1, NULL, 100, NULL, NULL, NULL),
(666, 1, 'Большой Камень', 55, '628107', 1, NULL, 100, NULL, NULL, NULL),
(667, 1, 'Владивосток', 55, '690000', 1, NULL, 100, NULL, NULL, NULL),
(668, 1, 'Дальнегорск', 55, '692441', 1, NULL, 100, NULL, NULL, NULL),
(669, 1, 'Дальнереченск', 55, '692102', 1, NULL, 100, NULL, NULL, NULL),
(670, 1, 'Лесозаводск', 55, '692031', 1, NULL, 100, NULL, NULL, NULL),
(671, 1, 'Находка', 55, '629360', 1, NULL, 100, NULL, NULL, NULL),
(672, 1, 'Партизанск', 55, '663404', 1, NULL, 100, NULL, NULL, NULL),
(673, 1, 'Спасск-Дальний', 55, '692230', 1, NULL, 100, NULL, NULL, NULL),
(674, 1, 'Уссурийск', 55, '692500', 1, NULL, 100, NULL, NULL, NULL),
(675, 1, 'Воткинск', 21, '427430', 1, NULL, 100, NULL, NULL, NULL),
(676, 1, 'Глазов', 21, '427601', 1, NULL, 100, NULL, NULL, NULL),
(677, 1, 'Ижевск', 21, '426000', 1, NULL, 100, NULL, NULL, NULL),
(678, 1, 'Камбарка', 21, '427950', 1, NULL, 100, NULL, NULL, NULL),
(679, 1, 'Можга', 21, '427327', 1, NULL, 100, NULL, NULL, NULL),
(680, 1, 'Сарапул', 21, '427960', 1, NULL, 100, NULL, NULL, NULL),
(681, 1, 'Заводоуковск', 54, '627139', 1, NULL, 100, NULL, NULL, NULL),
(682, 1, 'Ишим', 54, '627705', 1, NULL, 100, NULL, NULL, NULL),
(683, 1, 'Тобольск', 54, '626147', 1, NULL, 100, NULL, NULL, NULL),
(684, 1, 'Тюмень', 54, '625000', 1, NULL, 100, NULL, NULL, NULL),
(685, 1, 'Ялуторовск', 54, '625805', 1, NULL, 100, NULL, NULL, NULL),
(686, 1, 'Велиж', 20, '216290', 1, NULL, 100, NULL, NULL, NULL),
(687, 1, 'Вязьма', 20, '215110', 1, NULL, 100, NULL, NULL, NULL),
(688, 1, 'Гагарин', 20, '215010', 1, NULL, 100, NULL, NULL, NULL),
(689, 1, 'Демидов', 20, '216240', 1, NULL, 100, NULL, NULL, NULL),
(690, 1, 'Десногорск', 20, '216400', 1, NULL, 100, NULL, NULL, NULL),
(691, 1, 'Дорогобуж', 20, '215710', 1, NULL, 100, NULL, NULL, NULL),
(692, 1, 'Духовщина', 20, '216200', 1, NULL, 100, NULL, NULL, NULL),
(693, 1, 'Ельня', 20, '216330', 1, NULL, 100, NULL, NULL, NULL),
(694, 1, 'Починок', 20, '157195', 1, NULL, 100, NULL, NULL, NULL),
(695, 1, 'Рославль', 20, '216500', 1, NULL, 100, NULL, NULL, NULL),
(696, 1, 'Рудня', 20, '216790', 1, NULL, 100, NULL, NULL, NULL),
(697, 1, 'Сафоново', 20, '164767', 1, NULL, 100, NULL, NULL, NULL),
(698, 1, 'Смоленск', 20, '214000', 1, NULL, 100, NULL, NULL, NULL),
(699, 1, 'Сычевка', 20, '215279', 1, NULL, 100, NULL, NULL, NULL),
(700, 1, 'Ярцево', 20, '162804', 1, NULL, 100, NULL, NULL, NULL),
(701, 1, 'Благодарный', 53, '356420', 1, NULL, 100, NULL, NULL, NULL),
(702, 1, 'Буденновск', 53, '356800', 1, NULL, 100, NULL, NULL, NULL),
(703, 1, 'Георгиевск', 53, '357820', 1, NULL, 100, NULL, NULL, NULL),
(704, 1, 'Ессентуки', 53, '357600', 1, NULL, 100, NULL, NULL, NULL),
(705, 1, 'Железноводск', 53, '357400', 1, NULL, 100, NULL, NULL, NULL),
(706, 1, 'Зеленокумск', 53, '357910', 1, NULL, 100, NULL, NULL, NULL),
(707, 1, 'Изобильный', 53, '347674', 1, NULL, 100, NULL, NULL, NULL),
(708, 1, 'Ипатово', 53, '356630', 1, NULL, 100, NULL, NULL, NULL),
(709, 1, 'Кисловодск', 53, '357700', 1, NULL, 100, NULL, NULL, NULL),
(710, 1, 'Лермонтов', 53, '357340', 1, NULL, 100, NULL, NULL, NULL),
(711, 1, 'Минеральные Воды', 53, '357200', 1, NULL, 100, NULL, NULL, NULL),
(712, 1, 'Невинномысск', 53, '357100', 1, NULL, 100, NULL, NULL, NULL),
(713, 1, 'Нефтекумск', 53, '356880', 1, NULL, 100, NULL, NULL, NULL),
(714, 1, 'Новоалександровск', 53, '356000', 1, NULL, 100, NULL, NULL, NULL),
(715, 1, 'Новопавловск', 53, '357300', 1, NULL, 100, NULL, NULL, NULL),
(716, 1, 'Пятигорск', 53, '357500', 1, NULL, 100, NULL, NULL, NULL),
(717, 1, 'Светлоград', 53, '356530', 1, NULL, 100, NULL, NULL, NULL),
(718, 1, 'Ставрополь', 53, '355000', 1, NULL, 100, NULL, NULL, NULL),
(719, 1, 'Жердевка', 52, '393670', 1, NULL, 100, NULL, NULL, NULL),
(720, 1, 'Кирсанов', 52, '393360', 1, NULL, 100, NULL, NULL, NULL),
(721, 1, 'Котовск', 52, '393190', 1, NULL, 100, NULL, NULL, NULL),
(722, 1, 'Мичуринск', 52, '393013', 1, NULL, 100, NULL, NULL, NULL),
(723, 1, 'Моршанск', 52, '393931', 1, NULL, 100, NULL, NULL, NULL),
(724, 1, 'Рассказово', 52, '393250', 1, NULL, 100, NULL, NULL, NULL),
(725, 1, 'Тамбов', 52, '392000', 1, NULL, 100, NULL, NULL, NULL),
(726, 1, 'Уварово', 52, '172882', 1, NULL, 100, NULL, NULL, NULL),
(727, 1, 'Амурск', 51, '682640', 1, NULL, 100, NULL, NULL, NULL),
(728, 1, 'Бикин', 51, '682970', 1, NULL, 100, NULL, NULL, NULL),
(729, 1, 'Вяземский', 51, '682950', 1, NULL, 100, NULL, NULL, NULL),
(730, 1, 'Комсомольск-на-Амуре', 51, '680801', 1, NULL, 100, NULL, NULL, NULL),
(731, 1, 'Николаевск-на-Амуре', 51, '682455', 1, NULL, 100, NULL, NULL, NULL),
(732, 1, 'Советская Гавань', 51, '680881', 1, NULL, 100, NULL, NULL, NULL),
(733, 1, 'Хабаровск', 51, '680000', 1, NULL, 100, NULL, NULL, NULL),
(734, 1, 'Аргун', 18, '366281', 1, NULL, 100, NULL, NULL, NULL),
(735, 1, 'Грозный', 18, '364000', 1, NULL, 100, NULL, NULL, NULL),
(736, 1, 'Гудермес', 18, '366200', 1, NULL, 100, NULL, NULL, NULL),
(737, 1, 'Урус-Мартан', 18, '366500', 1, NULL, 100, NULL, NULL, NULL),
(738, 1, 'Шали', 18, '366300', 1, NULL, 100, NULL, NULL, NULL),
(739, 1, 'Аша', 50, '456010', 1, NULL, 100, NULL, NULL, NULL),
(740, 1, 'Бакал', 50, '456900', 1, NULL, 100, NULL, NULL, NULL),
(741, 1, 'Верхнеуральск', 50, '457670', 1, NULL, 100, NULL, NULL, NULL),
(742, 1, 'Верхний Уфалей', 50, '456800', 1, NULL, 100, NULL, NULL, NULL),
(743, 1, 'Еманжелинск', 50, '456580', 1, NULL, 100, NULL, NULL, NULL),
(744, 1, 'Златоуст', 50, '456200', 1, NULL, 100, NULL, NULL, NULL),
(745, 1, 'Карабаш', 50, '423229', 1, NULL, 100, NULL, NULL, NULL),
(746, 1, 'Карталы', 50, '457350', 1, NULL, 100, NULL, NULL, NULL),
(747, 1, 'Касли', 50, '456830', 1, NULL, 100, NULL, NULL, NULL),
(748, 1, 'Катав-Ивановск', 50, '456110', 1, NULL, 100, NULL, NULL, NULL),
(749, 1, 'Копейск', 50, '456600', 1, NULL, 100, NULL, NULL, NULL),
(750, 1, 'Коркино', 50, '187045', 1, NULL, 100, NULL, NULL, NULL),
(751, 1, 'Куса', 50, '456940', 1, NULL, 100, NULL, NULL, NULL),
(752, 1, 'Кыштым', 50, '456870', 1, NULL, 100, NULL, NULL, NULL);
INSERT INTO `md_order_regions` (`id`, `site_id`, `title`, `parent_id`, `zipcode`, `is_city`, `area`, `sortn`, `russianpost_arriveinfo`, `russianpost_arrive_min`, `russianpost_arrive_max`) VALUES
(753, 1, 'Магнитогорск', 50, '455000', 1, NULL, 100, NULL, NULL, NULL),
(754, 1, 'Миасс', 50, '456300', 1, NULL, 100, NULL, NULL, NULL),
(755, 1, 'Миньяр', 50, '456007', 1, NULL, 100, NULL, NULL, NULL),
(756, 1, 'Нязепетровск', 50, '456970', 1, NULL, 100, NULL, NULL, NULL),
(757, 1, 'Пласт', 50, '457020', 1, NULL, 100, NULL, NULL, NULL),
(758, 1, 'Сатка', 50, '456910', 1, NULL, 100, NULL, NULL, NULL),
(759, 1, 'Сим', 50, '456020', 1, NULL, 100, NULL, NULL, NULL),
(760, 1, 'Снежинск', 50, '456770', 1, NULL, 100, NULL, NULL, NULL),
(761, 1, 'Трехгорный', 50, '456080', 1, NULL, 100, NULL, NULL, NULL),
(762, 1, 'Усть-Катав', 50, '456040', 1, NULL, 100, NULL, NULL, NULL),
(763, 1, 'Чебаркуль', 50, '456438', 1, NULL, 100, NULL, NULL, NULL),
(764, 1, 'Челябинск', 50, '454000', 1, NULL, 100, NULL, NULL, NULL),
(765, 1, 'Южноуральск', 50, '457018', 1, NULL, 100, NULL, NULL, NULL),
(766, 1, 'Юрюзань', 50, '456120', 1, NULL, 100, NULL, NULL, NULL),
(767, 1, 'Великие Луки', 17, '182100', 1, NULL, 100, NULL, NULL, NULL),
(768, 1, 'Великие Луки-1', 17, '182171', 1, NULL, 100, NULL, NULL, NULL),
(769, 1, 'Гдов', 17, '181600', 1, NULL, 100, NULL, NULL, NULL),
(770, 1, 'Дно', 17, '182670', 1, NULL, 100, NULL, NULL, NULL),
(771, 1, 'Невель', 17, '182500', 1, NULL, 100, NULL, NULL, NULL),
(772, 1, 'Новоржев', 17, '182440', 1, NULL, 100, NULL, NULL, NULL),
(773, 1, 'Новосокольники', 17, '182200', 1, NULL, 100, NULL, NULL, NULL),
(774, 1, 'Опочка', 17, '182330', 1, NULL, 100, NULL, NULL, NULL),
(775, 1, 'Остров', 17, '152235', 1, NULL, 100, NULL, NULL, NULL),
(776, 1, 'Печоры', 17, '181500', 1, NULL, 100, NULL, NULL, NULL),
(777, 1, 'Порхов', 17, '182620', 1, NULL, 100, NULL, NULL, NULL),
(778, 1, 'Псков', 17, '180000', 1, NULL, 100, NULL, NULL, NULL),
(779, 1, 'Пустошка', 17, '162708', 1, NULL, 100, NULL, NULL, NULL),
(780, 1, 'Пыталово', 17, '181410', 1, NULL, 100, NULL, NULL, NULL),
(781, 1, 'Себеж', 17, '182250', 1, NULL, 100, NULL, NULL, NULL),
(782, 1, 'Ак-Довурак', 49, '668050', 1, NULL, 100, NULL, NULL, NULL),
(783, 1, 'Кызыл', 49, '667000', 1, NULL, 100, NULL, NULL, NULL),
(784, 1, 'Туран', 49, '668510', 1, NULL, 100, NULL, NULL, NULL),
(785, 1, 'Чадан', 49, '668110', 1, NULL, 100, NULL, NULL, NULL),
(786, 1, 'Шагонар', 49, '668210', 1, NULL, 100, NULL, NULL, NULL),
(787, 1, 'Алексин', 16, '301360', 1, NULL, 100, NULL, NULL, NULL),
(788, 1, 'Белев', 16, '301530', 1, NULL, 100, NULL, NULL, NULL),
(789, 1, 'Богородицк', 16, '301830', 1, NULL, 100, NULL, NULL, NULL),
(790, 1, 'Болохово', 16, '301280', 1, NULL, 100, NULL, NULL, NULL),
(791, 1, 'Венев', 16, '301320', 1, NULL, 100, NULL, NULL, NULL),
(792, 1, 'Донской', 16, '301760', 1, NULL, 100, NULL, NULL, NULL),
(793, 1, 'Ефремов', 16, '301840', 1, NULL, 100, NULL, NULL, NULL),
(794, 1, 'Кимовск', 16, '301720', 1, NULL, 100, NULL, NULL, NULL),
(795, 1, 'Киреевск', 16, '301260', 1, NULL, 100, NULL, NULL, NULL),
(796, 1, 'Липки', 16, '216461', 1, NULL, 100, NULL, NULL, NULL),
(797, 1, 'Новомосковск', 16, '301650', 1, NULL, 100, NULL, NULL, NULL),
(798, 1, 'Плавск', 16, '301470', 1, NULL, 100, NULL, NULL, NULL),
(799, 1, 'Суворов', 16, '301430', 1, NULL, 100, NULL, NULL, NULL),
(800, 1, 'Тула', 16, '300000', 1, NULL, 100, NULL, NULL, NULL),
(801, 1, 'Узловая', 16, '301600', 1, NULL, 100, NULL, NULL, NULL),
(802, 1, 'Чекалин', 16, '301414', 1, NULL, 100, NULL, NULL, NULL),
(803, 1, 'Щекино', 16, '162361', 1, NULL, 100, NULL, NULL, NULL),
(804, 1, 'Ясногорск', 16, '301030', 1, NULL, 100, NULL, NULL, NULL),
(805, 1, 'Асино', 48, '636840', 1, NULL, 100, NULL, NULL, NULL),
(806, 1, 'Кедровый', 48, '628544', 1, NULL, 100, NULL, NULL, NULL),
(807, 1, 'Колпашево', 48, '636460', 1, NULL, 100, NULL, NULL, NULL),
(808, 1, 'Северск', 48, '636000', 1, NULL, 100, NULL, NULL, NULL),
(809, 1, 'Стрежевой', 48, '634878', 1, NULL, 100, NULL, NULL, NULL),
(810, 1, 'Томск', 48, '634000', 1, NULL, 100, NULL, NULL, NULL),
(811, 1, 'Андреаполь', 15, '172800', 1, NULL, 100, NULL, NULL, NULL),
(812, 1, 'Бежецк', 15, '171980', 1, NULL, 100, NULL, NULL, NULL),
(813, 1, 'Белый', 15, '172530', 1, NULL, 100, NULL, NULL, NULL),
(814, 1, 'Бологое', 15, '171070', 1, NULL, 100, NULL, NULL, NULL),
(815, 1, 'Весьегонск', 15, '171720', 1, NULL, 100, NULL, NULL, NULL),
(816, 1, 'Вышний Волочек', 15, '171147', 1, NULL, 100, NULL, NULL, NULL),
(817, 1, 'Западная Двина', 15, '172610', 1, NULL, 100, NULL, NULL, NULL),
(818, 1, 'Зубцов', 15, '172332', 1, NULL, 100, NULL, NULL, NULL),
(819, 1, 'Калязин', 15, '171571', 1, NULL, 100, NULL, NULL, NULL),
(820, 1, 'Кашин', 15, '171591', 1, NULL, 100, NULL, NULL, NULL),
(821, 1, 'Кимры', 15, '171500', 1, NULL, 100, NULL, NULL, NULL),
(822, 1, 'Конаково', 15, '171250', 1, NULL, 100, NULL, NULL, NULL),
(823, 1, 'Красный Холм', 15, '171660', 1, NULL, 100, NULL, NULL, NULL),
(824, 1, 'Кувшиново', 15, '172110', 1, NULL, 100, NULL, NULL, NULL),
(825, 1, 'Лихославль', 15, '171210', 1, NULL, 100, NULL, NULL, NULL),
(826, 1, 'Нелидово', 15, '143628', 1, NULL, 100, NULL, NULL, NULL),
(827, 1, 'Осташков', 15, '172218', 1, NULL, 100, NULL, NULL, NULL),
(828, 1, 'Ржев', 15, '172380', 1, NULL, 100, NULL, NULL, NULL),
(829, 1, 'Старица', 15, '171360', 1, NULL, 100, NULL, NULL, NULL),
(830, 1, 'Тверь', 15, '170000', 1, NULL, 100, NULL, NULL, NULL),
(831, 1, 'Торжок', 15, '172000', 1, NULL, 100, NULL, NULL, NULL),
(832, 1, 'Торопец', 15, '172840', 1, NULL, 100, NULL, NULL, NULL),
(833, 1, 'Удомля', 15, '171841', 1, NULL, 100, NULL, NULL, NULL),
(834, 1, 'Агрыз', 14, '422230', 1, NULL, 100, NULL, NULL, NULL),
(835, 1, 'Азнакаево', 14, '423330', 1, NULL, 100, NULL, NULL, NULL),
(836, 1, 'Альметьевск', 14, '423403', 1, NULL, 100, NULL, NULL, NULL),
(837, 1, 'Арск', 14, '422000', 1, NULL, 100, NULL, NULL, NULL),
(838, 1, 'Бавлы', 14, '423930', 1, NULL, 100, NULL, NULL, NULL),
(839, 1, 'Болгар', 14, '422840', 1, NULL, 100, NULL, NULL, NULL),
(840, 1, 'Бугульма', 14, '423230', 1, NULL, 100, NULL, NULL, NULL),
(841, 1, 'Буинск', 14, '422430', 1, NULL, 100, NULL, NULL, NULL),
(842, 1, 'Елабуга', 14, '423600', 1, NULL, 100, NULL, NULL, NULL),
(843, 1, 'Заинск', 14, '423520', 1, NULL, 100, NULL, NULL, NULL),
(844, 1, 'Зеленодольск', 14, '422540', 1, NULL, 100, NULL, NULL, NULL),
(845, 1, 'Иннополис', 14, '420500', 1, NULL, 100, NULL, NULL, NULL),
(846, 1, 'Казань', 14, '420000', 1, NULL, 100, NULL, NULL, NULL),
(847, 1, 'Лаишево', 14, '422610', 1, NULL, 100, NULL, NULL, NULL),
(848, 1, 'Лениногорск', 14, '423250', 1, NULL, 100, NULL, NULL, NULL),
(849, 1, 'Мамадыш', 14, '422190', 1, NULL, 100, NULL, NULL, NULL),
(850, 1, 'Менделеевск', 14, '423650', 1, NULL, 100, NULL, NULL, NULL),
(851, 1, 'Мензелинск', 14, '423700', 1, NULL, 100, NULL, NULL, NULL),
(852, 1, 'Набережные Челны', 14, '423800', 1, NULL, 100, NULL, NULL, NULL),
(853, 1, 'Нижнекамск', 14, '423544', 1, NULL, 100, NULL, NULL, NULL),
(854, 1, 'Нурлат', 14, '423040', 1, NULL, 100, NULL, NULL, NULL),
(855, 1, 'Тетюши', 14, '422370', 1, NULL, 100, NULL, NULL, NULL),
(856, 1, 'Чистополь', 14, '422980', 1, NULL, 100, NULL, NULL, NULL),
(857, 1, 'Абаза', 47, '655750', 1, NULL, 100, NULL, NULL, NULL),
(858, 1, 'Абакан', 47, '655000', 1, NULL, 100, NULL, NULL, NULL),
(859, 1, 'Саяногорск', 47, '655602', 1, NULL, 100, NULL, NULL, NULL),
(860, 1, 'Сорск', 47, '655111', 1, NULL, 100, NULL, NULL, NULL),
(861, 1, 'Черногорск', 47, '655151', 1, NULL, 100, NULL, NULL, NULL),
(862, 1, 'Белоярский', 46, '412561', 1, NULL, 100, NULL, NULL, NULL),
(863, 1, 'Когалым', 46, '628481', 1, NULL, 100, NULL, NULL, NULL),
(864, 1, 'Лангепас', 46, '628671', 1, NULL, 100, NULL, NULL, NULL),
(865, 1, 'Лянтор', 46, '628449', 1, NULL, 100, NULL, NULL, NULL),
(866, 1, 'Мегион', 46, '628680', 1, NULL, 100, NULL, NULL, NULL),
(867, 1, 'Нефтеюганск', 46, '628301', 1, NULL, 100, NULL, NULL, NULL),
(868, 1, 'Нижневартовск', 46, '628600', 1, NULL, 100, NULL, NULL, NULL),
(869, 1, 'Нягань', 46, '628180', 1, NULL, 100, NULL, NULL, NULL),
(870, 1, 'Покачи', 46, '628660', 1, NULL, 100, NULL, NULL, NULL),
(871, 1, 'Пыть-Ях', 46, '628380', 1, NULL, 100, NULL, NULL, NULL),
(872, 1, 'Советский', 46, '157433', 1, NULL, 100, NULL, NULL, NULL),
(873, 1, 'Сургут', 46, '446551', 1, NULL, 100, NULL, NULL, NULL),
(874, 1, 'Урай', 46, '628280', 1, NULL, 100, NULL, NULL, NULL),
(875, 1, 'Ханты-Мансийск', 46, '628000', 1, NULL, 100, NULL, NULL, NULL),
(876, 1, 'Югорск', 46, '628260', 1, NULL, 100, NULL, NULL, NULL),
(877, 1, 'Барыш', 45, '433750', 1, NULL, 100, NULL, NULL, NULL),
(878, 1, 'Димитровград', 45, '433500', 1, NULL, 100, NULL, NULL, NULL),
(879, 1, 'Инза', 45, '433030', 1, NULL, 100, NULL, NULL, NULL),
(880, 1, 'Новоульяновск', 45, '433300', 1, NULL, 100, NULL, NULL, NULL),
(881, 1, 'Сенгилей', 45, '433380', 1, NULL, 100, NULL, NULL, NULL),
(882, 1, 'Ульяновск', 45, '432000', 1, NULL, 100, NULL, NULL, NULL),
(883, 1, 'Алагир', 13, '363240', 1, NULL, 100, NULL, NULL, NULL),
(884, 1, 'Ардон', 13, '363330', 1, NULL, 100, NULL, NULL, NULL),
(885, 1, 'Беслан', 13, '363020', 1, NULL, 100, NULL, NULL, NULL),
(886, 1, 'Владикавказ', 13, '362000', 1, NULL, 100, NULL, NULL, NULL),
(887, 1, 'Дигора', 13, '363410', 1, NULL, 100, NULL, NULL, NULL),
(888, 1, 'Моздок', 13, '362028', 1, NULL, 100, NULL, NULL, NULL),
(889, 1, 'Алдан', 12, '678900', 1, NULL, 100, NULL, NULL, NULL),
(890, 1, 'Верхоянск', 12, '678530', 1, NULL, 100, NULL, NULL, NULL),
(891, 1, 'Вилюйск', 12, '678200', 1, NULL, 100, NULL, NULL, NULL),
(892, 1, 'Ленск', 12, '617452', 1, NULL, 100, NULL, NULL, NULL),
(893, 1, 'Нерюнгри', 12, '678960', 1, NULL, 100, NULL, NULL, NULL),
(894, 1, 'Нюрба', 12, '678450', 1, NULL, 100, NULL, NULL, NULL),
(895, 1, 'Олекминск', 12, '678100', 1, NULL, 100, NULL, NULL, NULL),
(896, 1, 'Покровск', 12, '249718', 1, NULL, 100, NULL, NULL, NULL),
(897, 1, 'Среднеколымск', 12, '678790', 1, NULL, 100, NULL, NULL, NULL),
(898, 1, 'Томмот', 12, '678953', 1, NULL, 100, NULL, NULL, NULL),
(899, 1, 'Удачный', 12, '678188', 1, NULL, 100, NULL, NULL, NULL),
(900, 1, 'Якутск', 12, '677000', 1, NULL, 100, NULL, NULL, NULL),
(901, 1, 'Александровск-Сахалинский', 44, '694420', 1, NULL, 100, NULL, NULL, NULL),
(902, 1, 'Анива', 44, '694030', 1, NULL, 100, NULL, NULL, NULL),
(903, 1, 'Долинск', 44, '694051', 1, NULL, 100, NULL, NULL, NULL),
(904, 1, 'Корсаков', 44, '694020', 1, NULL, 100, NULL, NULL, NULL),
(905, 1, 'Курильск', 44, '694530', 1, NULL, 100, NULL, NULL, NULL),
(906, 1, 'Макаров', 44, '694140', 1, NULL, 100, NULL, NULL, NULL),
(907, 1, 'Невельск', 44, '694740', 1, NULL, 100, NULL, NULL, NULL),
(908, 1, 'Оха', 44, '694490', 1, NULL, 100, NULL, NULL, NULL),
(909, 1, 'Поронайск', 44, '694240', 1, NULL, 100, NULL, NULL, NULL),
(910, 1, 'Северо-Курильск', 44, '694550', 1, NULL, 100, NULL, NULL, NULL),
(911, 1, 'Томари', 44, '694820', 1, NULL, 100, NULL, NULL, NULL),
(912, 1, 'Холмск', 44, '694620', 1, NULL, 100, NULL, NULL, NULL),
(913, 1, 'Шахтерск', 44, '694910', 1, NULL, 100, NULL, NULL, NULL),
(914, 1, 'Южно-Сахалинск', 44, '693000', 1, NULL, 100, NULL, NULL, NULL),
(915, 1, 'Александровск', 11, '618320', 1, NULL, 100, NULL, NULL, NULL),
(916, 1, 'Березники', 11, '152183', 1, NULL, 100, NULL, NULL, NULL),
(917, 1, 'Верещагино', 11, '152334', 1, NULL, 100, NULL, NULL, NULL),
(918, 1, 'Горнозаводск', 11, '618820', 1, NULL, 100, NULL, NULL, NULL),
(919, 1, 'Гремячинск', 11, '618270', 1, NULL, 100, NULL, NULL, NULL),
(920, 1, 'Губаха', 11, '618250', 1, NULL, 100, NULL, NULL, NULL),
(921, 1, 'Добрянка', 11, '618740', 1, NULL, 100, NULL, NULL, NULL),
(922, 1, 'Кизел', 11, '618350', 1, NULL, 100, NULL, NULL, NULL),
(923, 1, 'Красновишерск', 11, '618590', 1, NULL, 100, NULL, NULL, NULL),
(924, 1, 'Краснокамск', 11, '617060', 1, NULL, 100, NULL, NULL, NULL),
(925, 1, 'Кудымкар', 11, '619000', 1, NULL, 100, NULL, NULL, NULL),
(926, 1, 'Кунгур', 11, '617470', 1, NULL, 100, NULL, NULL, NULL),
(927, 1, 'Лысьва', 11, '618441', 1, NULL, 100, NULL, NULL, NULL),
(928, 1, 'Нытва', 11, '617000', 1, NULL, 100, NULL, NULL, NULL),
(929, 1, 'Оса', 11, '612621', 1, NULL, 100, NULL, NULL, NULL),
(930, 1, 'Оханск', 11, '618100', 1, NULL, 100, NULL, NULL, NULL),
(931, 1, 'Очер', 11, '617140', 1, NULL, 100, NULL, NULL, NULL),
(932, 1, 'Пермь', 11, '614000', 1, NULL, 100, NULL, NULL, NULL),
(933, 1, 'Соликамск', 11, '618540', 1, NULL, 100, NULL, NULL, NULL),
(934, 1, 'Усолье', 11, '446733', 1, NULL, 100, NULL, NULL, NULL),
(935, 1, 'Чайковский', 11, '617760', 1, NULL, 100, NULL, NULL, NULL),
(936, 1, 'Чердынь', 11, '618601', 1, NULL, 100, NULL, NULL, NULL),
(937, 1, 'Чермоз', 11, '617040', 1, NULL, 100, NULL, NULL, NULL),
(938, 1, 'Чернушка', 11, '613573', 1, NULL, 100, NULL, NULL, NULL),
(939, 1, 'Чусовой', 11, '618200', 1, NULL, 100, NULL, NULL, NULL),
(940, 1, 'Белинский', 43, '442250', 1, NULL, 100, NULL, NULL, NULL),
(941, 1, 'Городище', 43, '142811', 1, NULL, 100, NULL, NULL, NULL),
(942, 1, 'Заречный', 43, '442960', 1, NULL, 100, NULL, NULL, NULL),
(943, 1, 'Каменка', 43, '141894', 1, NULL, 100, NULL, NULL, NULL),
(944, 1, 'Кузнецк', 43, '442530', 1, NULL, 100, NULL, NULL, NULL),
(945, 1, 'Кузнецк-12', 43, '442542', 1, NULL, 100, NULL, NULL, NULL),
(946, 1, 'Кузнецк-8', 43, '442538', 1, NULL, 100, NULL, NULL, NULL),
(947, 1, 'Нижний Ломов', 43, '442150', 1, NULL, 100, NULL, NULL, NULL),
(948, 1, 'Пенза', 43, '440000', 1, NULL, 100, NULL, NULL, NULL),
(949, 1, 'Сердобск', 43, '442890', 1, NULL, 100, NULL, NULL, NULL),
(950, 1, 'Спасск', 43, '442600', 1, NULL, 100, NULL, NULL, NULL),
(951, 1, 'Сурск', 43, '442300', 1, NULL, 100, NULL, NULL, NULL),
(952, 1, 'Болхов', 10, '303140', 1, NULL, 100, NULL, NULL, NULL),
(953, 1, 'Дмитровск', 10, '303240', 1, NULL, 100, NULL, NULL, NULL),
(954, 1, 'Ливны', 10, '303850', 1, NULL, 100, NULL, NULL, NULL),
(955, 1, 'Малоархангельск', 10, '303369', 1, NULL, 100, NULL, NULL, NULL),
(956, 1, 'Мценск', 10, '303030', 1, NULL, 100, NULL, NULL, NULL),
(957, 1, 'Новосиль', 10, '303500', 1, NULL, 100, NULL, NULL, NULL),
(958, 1, 'Орел', 10, '181603', 1, NULL, 100, NULL, NULL, NULL),
(959, 1, 'Астрахань', 9, '414000', 1, NULL, 100, NULL, NULL, NULL),
(960, 1, 'Ахтубинск', 9, '416500', 1, NULL, 100, NULL, NULL, NULL),
(961, 1, 'Знаменск', 9, '238200', 1, NULL, 100, NULL, NULL, NULL),
(962, 1, 'Камызяк', 9, '416340', 1, NULL, 100, NULL, NULL, NULL),
(963, 1, 'Нариманов', 9, '416111', 1, NULL, 100, NULL, NULL, NULL),
(964, 1, 'Харабали', 9, '416009', 1, NULL, 100, NULL, NULL, NULL),
(965, 1, 'Агидель', 8, '452920', 1, NULL, 100, NULL, NULL, NULL),
(966, 1, 'Баймак', 8, '453630', 1, NULL, 100, NULL, NULL, NULL),
(967, 1, 'Белебей', 8, '452000', 1, NULL, 100, NULL, NULL, NULL),
(968, 1, 'Белорецк', 8, '453500', 1, NULL, 100, NULL, NULL, NULL),
(969, 1, 'Бирск', 8, '452450', 1, NULL, 100, NULL, NULL, NULL),
(970, 1, 'Давлеканово', 8, '453400', 1, NULL, 100, NULL, NULL, NULL),
(971, 1, 'Дюртюли', 8, '452320', 1, NULL, 100, NULL, NULL, NULL),
(972, 1, 'Ишимбай', 8, '453200', 1, NULL, 100, NULL, NULL, NULL),
(973, 1, 'Кумертау', 8, '453300', 1, NULL, 100, NULL, NULL, NULL),
(974, 1, 'Межгорье', 8, '453570', 1, NULL, 100, NULL, NULL, NULL),
(975, 1, 'Мелеуз', 8, '453850', 1, NULL, 100, NULL, NULL, NULL),
(976, 1, 'Нефтекамск', 8, '452680', 1, NULL, 100, NULL, NULL, NULL),
(977, 1, 'Октябрьский', 8, '140060', 1, NULL, 100, NULL, NULL, NULL),
(978, 1, 'Салават', 8, '453250', 1, NULL, 100, NULL, NULL, NULL),
(979, 1, 'Сибай', 8, '453830', 1, NULL, 100, NULL, NULL, NULL),
(980, 1, 'Стерлитамак', 8, '453100', 1, NULL, 100, NULL, NULL, NULL),
(981, 1, 'Туймазы', 8, '452750', 1, NULL, 100, NULL, NULL, NULL),
(982, 1, 'Уфа', 8, '450000', 1, NULL, 100, NULL, NULL, NULL),
(983, 1, 'Учалы', 8, '453700', 1, NULL, 100, NULL, NULL, NULL),
(984, 1, 'Янаул', 8, '452800', 1, NULL, 100, NULL, NULL, NULL),
(985, 1, 'Алексеевка', 42, '181309', 1, NULL, 100, NULL, NULL, NULL),
(986, 1, 'Белгород', 42, '308000', 1, NULL, 100, NULL, NULL, NULL),
(987, 1, 'Бирюч', 42, '309910', 1, NULL, 100, NULL, NULL, NULL),
(988, 1, 'Валуйки', 42, '309990', 1, NULL, 100, NULL, NULL, NULL),
(989, 1, 'Грайворон', 42, '309370', 1, NULL, 100, NULL, NULL, NULL),
(990, 1, 'Губкин', 42, '309180', 1, NULL, 100, NULL, NULL, NULL),
(991, 1, 'Короча', 42, '309210', 1, NULL, 100, NULL, NULL, NULL),
(992, 1, 'Новый Оскол', 42, '309626', 1, NULL, 100, NULL, NULL, NULL),
(993, 1, 'Старый Оскол', 42, '309500', 1, NULL, 100, NULL, NULL, NULL),
(994, 1, 'Строитель', 42, '309062', 1, NULL, 100, NULL, NULL, NULL),
(995, 1, 'Шебекино', 42, '309290', 1, NULL, 100, NULL, NULL, NULL),
(996, 1, 'Барабинск', 41, '630833', 1, NULL, 100, NULL, NULL, NULL),
(997, 1, 'Бердск', 41, '633000', 1, NULL, 100, NULL, NULL, NULL),
(998, 1, 'Болотное', 41, '633340', 1, NULL, 100, NULL, NULL, NULL),
(999, 1, 'Искитим', 41, '633200', 1, NULL, 100, NULL, NULL, NULL),
(1000, 1, 'Карасук', 41, '632860', 1, NULL, 100, NULL, NULL, NULL),
(1001, 1, 'Каргат', 41, '632400', 1, NULL, 100, NULL, NULL, NULL),
(1002, 1, 'Куйбышев', 41, '404146', 1, NULL, 100, NULL, NULL, NULL),
(1003, 1, 'Купино', 41, '309263', 1, NULL, 100, NULL, NULL, NULL),
(1004, 1, 'Новосибирск', 41, '630000', 1, NULL, 100, NULL, NULL, NULL),
(1005, 1, 'Обь', 41, '633100', 1, NULL, 100, NULL, NULL, NULL),
(1006, 1, 'Татарск', 41, '216156', 1, NULL, 100, NULL, NULL, NULL),
(1007, 1, 'Тогучин', 41, '633450', 1, NULL, 100, NULL, NULL, NULL),
(1008, 1, 'Черепаново', 41, '461227', 1, NULL, 100, NULL, NULL, NULL),
(1009, 1, 'Чулым', 41, '632550', 1, NULL, 100, NULL, NULL, NULL),
(1010, 1, 'Чулым-3', 41, '632553', 1, NULL, 100, NULL, NULL, NULL),
(1011, 1, 'Боровичи', 7, '174400', 1, NULL, 100, NULL, NULL, NULL),
(1012, 1, 'Валдай', 7, '175400', 1, NULL, 100, NULL, NULL, NULL),
(1013, 1, 'Великий Новгород', 7, '173000', 1, NULL, 100, NULL, NULL, NULL),
(1014, 1, 'Малая Вишера', 7, '174260', 1, NULL, 100, NULL, NULL, NULL),
(1015, 1, 'Окуловка', 7, '174350', 1, NULL, 100, NULL, NULL, NULL),
(1016, 1, 'Пестово', 7, '174510', 1, NULL, 100, NULL, NULL, NULL),
(1017, 1, 'Сольцы', 7, '175040', 1, NULL, 100, NULL, NULL, NULL),
(1018, 1, 'Сольцы 2', 7, '175042', 1, NULL, 100, NULL, NULL, NULL),
(1019, 1, 'Старая Русса', 7, '175200', 1, NULL, 100, NULL, NULL, NULL),
(1020, 1, 'Холм', 7, '152876', 1, NULL, 100, NULL, NULL, NULL),
(1021, 1, 'Чудово', 7, '174210', 1, NULL, 100, NULL, NULL, NULL),
(1022, 1, 'Алапаевск', 6, '624600', 1, NULL, 100, NULL, NULL, NULL),
(1023, 1, 'Арамиль', 6, '624000', 1, NULL, 100, NULL, NULL, NULL),
(1024, 1, 'Артемовский', 6, '623780', 1, NULL, 100, NULL, NULL, NULL),
(1025, 1, 'Асбест', 6, '624260', 1, NULL, 100, NULL, NULL, NULL),
(1026, 1, 'Богданович', 6, '623530', 1, NULL, 100, NULL, NULL, NULL),
(1027, 1, 'Верхний Тагил', 6, '0', 1, NULL, 100, NULL, NULL, NULL),
(1028, 1, 'Верхняя Пышма', 6, '624090', 1, NULL, 100, NULL, NULL, NULL),
(1029, 1, 'Верхняя Салда', 6, '624760', 1, NULL, 100, NULL, NULL, NULL),
(1030, 1, 'Верхняя Тура', 6, '0', 1, NULL, 100, NULL, NULL, NULL),
(1031, 1, 'Верхотурье', 6, '624380', 1, NULL, 100, NULL, NULL, NULL),
(1032, 1, 'Волчанск', 6, '0', 1, NULL, 100, NULL, NULL, NULL),
(1033, 1, 'Дегтярск', 6, '0', 1, NULL, 100, NULL, NULL, NULL),
(1034, 1, 'Екатеринбург', 6, '620000', 1, NULL, 100, NULL, NULL, NULL),
(1035, 1, 'Ивдель', 6, '624445', 1, NULL, 100, NULL, NULL, NULL),
(1036, 1, 'Ирбит', 6, '623850', 1, NULL, 100, NULL, NULL, NULL),
(1037, 1, 'Каменск-Уральский', 6, '623400', 1, NULL, 100, NULL, NULL, NULL),
(1038, 1, 'Камышлов', 6, '624860', 1, NULL, 100, NULL, NULL, NULL),
(1039, 1, 'Карпинск', 6, '624930', 1, NULL, 100, NULL, NULL, NULL),
(1040, 1, 'Качканар', 6, '624350', 1, NULL, 100, NULL, NULL, NULL),
(1041, 1, 'Кировград', 6, '624140', 1, NULL, 100, NULL, NULL, NULL),
(1042, 1, 'Краснотурьинск', 6, '624440', 1, NULL, 100, NULL, NULL, NULL),
(1043, 1, 'Красноуральск', 6, '461348', 1, NULL, 100, NULL, NULL, NULL),
(1044, 1, 'Красноуфимск', 6, '623300', 1, NULL, 100, NULL, NULL, NULL),
(1045, 1, 'Кушва', 6, '624300', 1, NULL, 100, NULL, NULL, NULL),
(1046, 1, 'Лесной', 6, '140451', 1, NULL, 100, NULL, NULL, NULL),
(1047, 1, 'Михайловск', 6, '356240', 1, NULL, 100, NULL, NULL, NULL),
(1048, 1, 'Невьянск', 6, '624191', 1, NULL, 100, NULL, NULL, NULL),
(1049, 1, 'Нижние Серги', 6, '623090', 1, NULL, 100, NULL, NULL, NULL),
(1050, 1, 'Нижние Серги-3', 6, '623093', 1, NULL, 100, NULL, NULL, NULL),
(1051, 1, 'Нижний Тагил', 6, '622000', 1, NULL, 100, NULL, NULL, NULL),
(1052, 1, 'Нижняя Салда', 6, '624740', 1, NULL, 100, NULL, NULL, NULL),
(1053, 1, 'Нижняя Тура', 6, '624220', 1, NULL, 100, NULL, NULL, NULL),
(1054, 1, 'Новая Ляля', 6, '624400', 1, NULL, 100, NULL, NULL, NULL),
(1055, 1, 'Новоуральск', 6, '462232', 1, NULL, 100, NULL, NULL, NULL),
(1056, 1, 'Первоуральск', 6, '623100', 1, NULL, 100, NULL, NULL, NULL),
(1057, 1, 'Полевской', 6, '623380', 1, NULL, 100, NULL, NULL, NULL),
(1058, 1, 'Ревда', 6, '184580', 1, NULL, 100, NULL, NULL, NULL),
(1059, 1, 'Реж', 6, '623750', 1, NULL, 100, NULL, NULL, NULL),
(1060, 1, 'Североуральск', 6, '624480', 1, NULL, 100, NULL, NULL, NULL),
(1061, 1, 'Серов', 6, '624980', 1, NULL, 100, NULL, NULL, NULL),
(1062, 1, 'Среднеуральск', 6, '0', 1, NULL, 100, NULL, NULL, NULL),
(1063, 1, 'Сухой Лог', 6, '624800', 1, NULL, 100, NULL, NULL, NULL),
(1064, 1, 'Сысерть', 6, '624021', 1, NULL, 100, NULL, NULL, NULL),
(1065, 1, 'Тавда', 6, '623950', 1, NULL, 100, NULL, NULL, NULL),
(1066, 1, 'Талица', 6, '155456', 1, NULL, 100, NULL, NULL, NULL),
(1067, 1, 'Туринск', 6, '623900', 1, NULL, 100, NULL, NULL, NULL),
(1068, 1, 'Исилькуль', 40, '646020', 1, NULL, 100, NULL, NULL, NULL),
(1069, 1, 'Калачинск', 40, '646900', 1, NULL, 100, NULL, NULL, NULL),
(1070, 1, 'Называевск', 40, '646100', 1, NULL, 100, NULL, NULL, NULL),
(1071, 1, 'Омск', 40, '644000', 1, NULL, 100, NULL, NULL, NULL),
(1072, 1, 'Тара', 40, '646530', 1, NULL, 100, NULL, NULL, NULL),
(1073, 1, 'Тюкалинск', 40, '646330', 1, NULL, 100, NULL, NULL, NULL),
(1074, 1, 'Абдулино', 5, '461740', 1, NULL, 100, NULL, NULL, NULL),
(1075, 1, 'Бугуруслан', 5, '461630', 1, NULL, 100, NULL, NULL, NULL),
(1076, 1, 'Бузулук', 5, '461040', 1, NULL, 100, NULL, NULL, NULL),
(1077, 1, 'Гай', 5, '462631', 1, NULL, 100, NULL, NULL, NULL),
(1078, 1, 'Кувандык', 5, '462240', 1, NULL, 100, NULL, NULL, NULL),
(1079, 1, 'Медногорск', 5, '462271', 1, NULL, 100, NULL, NULL, NULL),
(1080, 1, 'Новотроицк', 5, '462351', 1, NULL, 100, NULL, NULL, NULL),
(1081, 1, 'Оренбург', 5, '460000', 1, NULL, 100, NULL, NULL, NULL),
(1082, 1, 'Орск', 5, '462400', 1, NULL, 100, NULL, NULL, NULL),
(1083, 1, 'Соль-Илецк', 5, '461500', 1, NULL, 100, NULL, NULL, NULL),
(1084, 1, 'Сорочинск', 5, '461900', 1, NULL, 100, NULL, NULL, NULL),
(1085, 1, 'Ясный', 5, '164628', 1, NULL, 100, NULL, NULL, NULL),
(1086, 1, 'Алатырь', 4, '429805', 1, NULL, 100, NULL, NULL, NULL),
(1087, 1, 'Канаш', 4, '422584', 1, NULL, 100, NULL, NULL, NULL),
(1088, 1, 'Козловка', 4, '216527', 1, NULL, 100, NULL, NULL, NULL),
(1089, 1, 'Мариинский Посад', 4, '429570', 1, NULL, 100, NULL, NULL, NULL),
(1090, 1, 'Новочебоксарск', 4, '429950', 1, NULL, 100, NULL, NULL, NULL),
(1091, 1, 'Цивильск', 4, '429900', 1, NULL, 100, NULL, NULL, NULL),
(1092, 1, 'Чебоксары', 4, '428000', 1, NULL, 100, NULL, NULL, NULL),
(1093, 1, 'Шумерля', 4, '429120', 1, NULL, 100, NULL, NULL, NULL),
(1094, 1, 'Ядрин', 4, '429060', 1, NULL, 100, NULL, NULL, NULL),
(1095, 1, 'Ардатов', 3, '431860', 1, NULL, 100, NULL, NULL, NULL),
(1096, 1, 'Инсар', 3, '431430', 1, NULL, 100, NULL, NULL, NULL),
(1097, 1, 'Ковылкино', 3, '431350', 1, NULL, 100, NULL, NULL, NULL),
(1098, 1, 'Рузаевка', 3, '431440', 1, NULL, 100, NULL, NULL, NULL),
(1099, 1, 'Саранск', 3, '430000', 1, NULL, 100, NULL, NULL, NULL),
(1100, 1, 'Темников', 3, '431220', 1, NULL, 100, NULL, NULL, NULL),
(1101, 1, 'Апатиты', 2, '184200', 1, NULL, 100, NULL, NULL, NULL),
(1102, 1, 'Гаджиево', 2, '184670', 1, NULL, 100, NULL, NULL, NULL),
(1103, 1, 'Заозерск', 2, '184310', 1, NULL, 100, NULL, NULL, NULL),
(1104, 1, 'Заполярный', 2, '184430', 1, NULL, 100, NULL, NULL, NULL),
(1105, 1, 'Кандалакша', 2, '184012', 1, NULL, 100, NULL, NULL, NULL),
(1106, 1, 'Ковдор', 2, '184141', 1, NULL, 100, NULL, NULL, NULL),
(1107, 1, 'Кола', 2, '184380', 1, NULL, 100, NULL, NULL, NULL),
(1108, 1, 'Мончегорск', 2, '184505', 1, NULL, 100, NULL, NULL, NULL),
(1109, 1, 'Мурманск', 2, '183000', 1, NULL, 100, NULL, NULL, NULL),
(1110, 1, 'Оленегорск', 2, '184530', 1, NULL, 100, NULL, NULL, NULL),
(1111, 1, 'Оленегорск-1', 2, '184531', 1, NULL, 100, NULL, NULL, NULL),
(1112, 1, 'Оленегорск-2', 2, '184532', 1, NULL, 100, NULL, NULL, NULL),
(1113, 1, 'Островной', 2, '184640', 1, NULL, 100, NULL, NULL, NULL),
(1114, 1, 'Полярные Зори', 2, '184230', 1, NULL, 100, NULL, NULL, NULL),
(1115, 1, 'Полярный', 2, '184650', 1, NULL, 100, NULL, NULL, NULL),
(1116, 1, 'Североморск', 2, '184601', 1, NULL, 100, NULL, NULL, NULL),
(1117, 1, 'Снежногорск', 2, '184682', 1, NULL, 100, NULL, NULL, NULL),
(1118, 1, 'Нарьян-Мар', 39, '166000', 1, NULL, 100, NULL, NULL, NULL),
(1119, 1, 'Арзамас', 38, '607220', 1, NULL, 100, NULL, NULL, NULL),
(1120, 1, 'Балахна', 38, '399221', 1, NULL, 100, NULL, NULL, NULL),
(1121, 1, 'Богородск', 38, '168057', 1, NULL, 100, NULL, NULL, NULL),
(1122, 1, 'Бор', 38, '152281', 1, NULL, 100, NULL, NULL, NULL),
(1123, 1, 'Ветлуга', 38, '606860', 1, NULL, 100, NULL, NULL, NULL),
(1124, 1, 'Володарск', 38, '606070', 1, NULL, 100, NULL, NULL, NULL),
(1125, 1, 'Ворсма', 38, '606120', 1, NULL, 100, NULL, NULL, NULL),
(1126, 1, 'Выкса', 38, '607060', 1, NULL, 100, NULL, NULL, NULL),
(1127, 1, 'Горбатов', 38, '606125', 1, NULL, 100, NULL, NULL, NULL),
(1128, 1, 'Городец', 38, '188286', 1, NULL, 100, NULL, NULL, NULL),
(1129, 1, 'Дзержинск', 38, '606000', 1, NULL, 100, NULL, NULL, NULL),
(1130, 1, 'Заволжье', 38, '150027', 1, NULL, 100, NULL, NULL, NULL),
(1131, 1, 'Княгинино', 38, '242435', 1, NULL, 100, NULL, NULL, NULL),
(1132, 1, 'Кстово', 38, '607650', 1, NULL, 100, NULL, NULL, NULL),
(1133, 1, 'Кулебаки', 38, '607010', 1, NULL, 100, NULL, NULL, NULL),
(1134, 1, 'Лукоянов', 38, '607800', 1, NULL, 100, NULL, NULL, NULL),
(1135, 1, 'Лысково', 38, '457150', 1, NULL, 100, NULL, NULL, NULL),
(1136, 1, 'Навашино', 38, '607100', 1, NULL, 100, NULL, NULL, NULL),
(1137, 1, 'Нижний Новгород', 38, '603000', 1, NULL, 100, NULL, NULL, NULL),
(1138, 1, 'Павлово', 38, '187323', 1, NULL, 100, NULL, NULL, NULL),
(1139, 1, 'Первомайск', 38, '431530', 1, NULL, 100, NULL, NULL, NULL),
(1140, 1, 'Перевоз', 38, '393525', 1, NULL, 100, NULL, NULL, NULL),
(1141, 1, 'Саров', 38, '607180', 1, NULL, 100, NULL, NULL, NULL),
(1142, 1, 'Семенов', 38, '606650', 1, NULL, 100, NULL, NULL, NULL),
(1143, 1, 'Сергач', 38, '607510', 1, NULL, 100, NULL, NULL, NULL),
(1144, 1, 'Урень', 38, '606800', 1, NULL, 100, NULL, NULL, NULL),
(1145, 1, 'Чкаловск', 38, '606540', 1, NULL, 100, NULL, NULL, NULL),
(1146, 1, 'Шахунья', 38, '606910', 1, NULL, 100, NULL, NULL, NULL),
(1147, 1, 'Азов', 37, '346780', 1, NULL, 100, NULL, NULL, NULL),
(1148, 1, 'Аксай', 37, '346720', 1, NULL, 100, NULL, NULL, NULL),
(1149, 1, 'Батайск', 37, '346880', 1, NULL, 100, NULL, NULL, NULL),
(1150, 1, 'Белая Калитва', 37, '347040', 1, NULL, 100, NULL, NULL, NULL),
(1151, 1, 'Волгодонск', 37, '346686', 1, NULL, 100, NULL, NULL, NULL),
(1152, 1, 'Гуково', 37, '346399', 1, NULL, 100, NULL, NULL, NULL),
(1153, 1, 'Донецк', 37, '346330', 1, NULL, 100, NULL, NULL, NULL),
(1154, 1, 'Зверево', 37, '346310', 1, NULL, 100, NULL, NULL, NULL),
(1155, 1, 'Зерноград', 37, '347740', 1, NULL, 100, NULL, NULL, NULL),
(1156, 1, 'Каменск-Шахтинский', 37, '347800', 1, NULL, 100, NULL, NULL, NULL),
(1157, 1, 'Константиновск', 37, '347250', 1, NULL, 100, NULL, NULL, NULL),
(1158, 1, 'Красный Сулин', 37, '346350', 1, NULL, 100, NULL, NULL, NULL),
(1159, 1, 'Миллерово', 37, '346130', 1, NULL, 100, NULL, NULL, NULL),
(1160, 1, 'Морозовск', 37, '347210', 1, NULL, 100, NULL, NULL, NULL),
(1161, 1, 'Новочеркасск', 37, '346400', 1, NULL, 100, NULL, NULL, NULL),
(1162, 1, 'Новошахтинск', 37, '346900', 1, NULL, 100, NULL, NULL, NULL),
(1163, 1, 'Пролетарск', 37, '347540', 1, NULL, 100, NULL, NULL, NULL),
(1164, 1, 'Ростов-на-Дону', 37, '344000', 1, NULL, 100, NULL, NULL, NULL),
(1165, 1, 'Сальск', 37, '347630', 1, NULL, 100, NULL, NULL, NULL),
(1166, 1, 'Семикаракорск', 37, '346630', 1, NULL, 100, NULL, NULL, NULL),
(1167, 1, 'Таганрог', 37, '347900', 1, NULL, 100, NULL, NULL, NULL),
(1168, 1, 'Цимлянск', 37, '347320', 1, NULL, 100, NULL, NULL, NULL),
(1169, 1, 'Шахты', 37, '346500', 1, NULL, 100, NULL, NULL, NULL),
(1170, 1, 'Гаврилов-Ям', 36, '0', 1, NULL, 100, NULL, NULL, NULL),
(1171, 1, 'Данилов', 36, '152070', 1, NULL, 100, NULL, NULL, NULL),
(1172, 1, 'Любим', 36, '152470', 1, NULL, 100, NULL, NULL, NULL),
(1173, 1, 'Мышкин', 36, '152830', 1, NULL, 100, NULL, NULL, NULL),
(1174, 1, 'Переславль-Залесский', 36, '152020', 1, NULL, 100, NULL, NULL, NULL),
(1175, 1, 'Пошехонье', 36, '152850', 1, NULL, 100, NULL, NULL, NULL),
(1176, 1, 'Ростов', 36, '152150', 1, NULL, 100, NULL, NULL, NULL),
(1177, 1, 'Рыбинск', 36, '152900', 1, NULL, 100, NULL, NULL, NULL),
(1178, 1, 'Тутаев', 36, '152300', 1, NULL, 100, NULL, NULL, NULL),
(1179, 1, 'Углич', 36, '152610', 1, NULL, 100, NULL, NULL, NULL),
(1180, 1, 'Ярославль', 36, '150000', 1, NULL, 100, NULL, NULL, NULL),
(1181, 1, 'Алупка', 35, '0', 1, NULL, 100, NULL, NULL, NULL),
(1182, 1, 'Алушта', 35, '298500', 1, NULL, 100, NULL, NULL, NULL),
(1183, 1, 'Армянск', 35, '296012', 1, NULL, 100, NULL, NULL, NULL),
(1184, 1, 'Бахчисарай', 35, '298400', 1, NULL, 100, NULL, NULL, NULL),
(1185, 1, 'Джанкой', 35, '296100', 1, NULL, 100, NULL, NULL, NULL),
(1186, 1, 'Евпатория', 35, '297402', 1, NULL, 100, NULL, NULL, NULL),
(1187, 1, 'Керчь', 35, '298233', 1, NULL, 100, NULL, NULL, NULL),
(1188, 1, 'Красноперекопск', 35, '296000', 1, NULL, 100, NULL, NULL, NULL),
(1189, 1, 'Саки', 35, '296500', 1, NULL, 100, NULL, NULL, NULL),
(1190, 1, 'Симферополь', 35, '295000', 1, NULL, 100, NULL, NULL, NULL),
(1191, 1, 'Старый Крым', 35, '297345', 1, NULL, 100, NULL, NULL, NULL),
(1192, 1, 'Судак', 35, '298000', 1, NULL, 100, NULL, NULL, NULL),
(1193, 1, 'Феодосия', 35, '297183', 1, NULL, 100, NULL, NULL, NULL),
(1194, 1, 'Щелкино', 35, '298213', 1, NULL, 100, NULL, NULL, NULL),
(1195, 1, 'Ялта', 35, '298600', 1, NULL, 100, NULL, NULL, NULL),
(1196, 1, 'Зеленоград', 34, '0', 1, NULL, 100, NULL, NULL, NULL),
(1197, 1, 'Московский', 34, '142784', 1, NULL, 100, NULL, NULL, NULL),
(1198, 1, 'Троицк', 34, '142190', 1, NULL, 100, NULL, NULL, NULL),
(1199, 1, 'Щербинка', 34, '142170', 1, NULL, 100, NULL, NULL, NULL),
(1200, 1, 'Санкт-Петербург', 1, NULL, 0, NULL, 100, NULL, NULL, NULL),
(1201, 1, 'Колпино', 1200, '196650', 1, NULL, 100, NULL, NULL, NULL),
(1202, 1, 'Красное Село', 1200, '0', 1, NULL, 100, NULL, NULL, NULL),
(1203, 1, 'Кронштадт', 1200, '197760', 1, NULL, 100, NULL, NULL, NULL),
(1204, 1, 'Ломоносов', 1200, '198411', 1, NULL, 100, NULL, NULL, NULL),
(1205, 1, 'Петергоф', 1200, '0', 1, NULL, 100, NULL, NULL, NULL),
(1206, 1, 'Пушкин', 1200, '196601', 1, NULL, 100, NULL, NULL, NULL),
(1207, 1, 'Сестрорецк', 1200, '197701', 1, NULL, 100, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_substatus`
--

CREATE TABLE `md_order_substatus` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название статуса',
  `alias` varchar(255) DEFAULT NULL COMMENT 'Псевдоним',
  `sortn` int(11) DEFAULT NULL COMMENT 'Порядок сортировки'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_order_substatus`
--

INSERT INTO `md_order_substatus` (`id`, `site_id`, `title`, `alias`, `sortn`) VALUES
(1, 1, 'Магазин не обработал заказ вовремя', 'processing_expired', 1),
(2, 1, 'Покупатель изменяет состав заказа', 'replacing_order', 2),
(3, 1, 'Покупатель не завершил оформление зарезервированного заказа вовремя', 'reservation_expired', 3),
(4, 1, 'Магазин не может выполнить заказ', 'shop_failed', 4),
(5, 1, 'Покупатель отменил заказ по собственным причинам', 'user_changed_mind', 5),
(6, 1, 'Покупатель не оплатил заказ', 'user_not_paid', 6),
(7, 1, 'Покупателя не устраивают условия доставки', 'user_refused_delivery', 7),
(8, 1, 'Покупателю не подошел товар', 'user_refused_product', 8),
(9, 1, 'Покупателя не устраивает качество товара', 'user_refused_quality', 9),
(10, 1, 'Не удалось связаться с покупателем', 'user_unreachable', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_tax`
--

CREATE TABLE `md_order_tax` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `alias` varchar(255) DEFAULT NULL COMMENT 'Идентификатор (Английские буквы или цифры)',
  `description` varchar(255) DEFAULT NULL COMMENT 'Описание',
  `enabled` int(11) DEFAULT NULL COMMENT 'Включен',
  `user_type` enum('all','user','company') DEFAULT NULL COMMENT 'Тип плательщиков',
  `included` int(11) DEFAULT NULL COMMENT 'Входит в цену',
  `is_nds` int(11) DEFAULT '1' COMMENT 'Это НДС',
  `sortn` int(11) DEFAULT NULL COMMENT 'Порядок применения'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_tax_rate`
--

CREATE TABLE `md_order_tax_rate` (
  `tax_id` int(11) DEFAULT NULL COMMENT 'Название',
  `region_id` int(11) DEFAULT NULL COMMENT 'ID региона',
  `rate` decimal(12,4) DEFAULT NULL COMMENT 'Ставка налога'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_userstatus`
--

CREATE TABLE `md_order_userstatus` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Статус',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Родитель',
  `bgcolor` varchar(7) DEFAULT NULL COMMENT 'Цвет фона',
  `type` varchar(20) DEFAULT NULL COMMENT 'Идентификатор(Англ.яз)',
  `copy_type` varchar(20) DEFAULT NULL COMMENT 'Дублирует системный статус',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT 'Это системный статус. (его нельзя удалять)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_order_userstatus`
--

INSERT INTO `md_order_userstatus` (`id`, `site_id`, `title`, `parent_id`, `bgcolor`, `type`, `copy_type`, `is_system`) VALUES
(1, 1, 'Новый', 0, '#83b7b3', 'new', NULL, 1),
(2, 1, 'Ожидает оплату', 0, '#687482', 'waitforpay', NULL, 1),
(3, 1, 'В обработке', 0, '#f2aa17', 'inprogress', NULL, 1),
(4, 1, 'Ожидание чека', 0, '#808000', 'needreceipt', NULL, 1),
(5, 1, 'Выполнен и закрыт', 0, '#5f8456', 'success', NULL, 1),
(6, 1, 'Отменен', 0, '#ef533a', 'cancelled', NULL, 1),
(7, 1, 'Заказ передан в доставку', 0, '#68d4b4', 'delivery', NULL, 1),
(8, 1, 'Заказ доставлен в пункт самовывоза', 0, '#a1b019', 'pickup', NULL, 1),
(9, 1, 'Заказ в резерве', 0, '#e07445', 'reserved', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_x_region`
--

CREATE TABLE `md_order_x_region` (
  `zone_id` int(11) DEFAULT NULL COMMENT 'ID Зоны',
  `region_id` int(11) DEFAULT NULL COMMENT 'ID Региона'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_order_x_region`
--

INSERT INTO `md_order_x_region` (`zone_id`, `region_id`) VALUES
(1, 12),
(1, 22),
(1, 64),
(1, 75),
(1, 83),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 11),
(2, 13),
(2, 14),
(2, 17),
(2, 18),
(2, 21),
(2, 26),
(2, 28),
(2, 29),
(2, 37),
(2, 39),
(2, 42),
(2, 43),
(2, 45),
(2, 50),
(2, 53),
(2, 56),
(2, 58),
(2, 60),
(2, 62),
(2, 63),
(2, 65),
(2, 68),
(2, 69),
(2, 73),
(2, 76),
(2, 77),
(2, 81),
(2, 84),
(3, 44),
(3, 51),
(3, 55),
(3, 59),
(3, 66),
(3, 70),
(3, 78),
(4, 10),
(4, 15),
(4, 16),
(4, 20),
(4, 23),
(4, 24),
(4, 32),
(4, 33),
(4, 34),
(4, 36),
(4, 38),
(4, 52),
(4, 61),
(4, 67),
(4, 71),
(4, 72),
(4, 80),
(4, 82),
(4, 85),
(4, 1200),
(5, 25),
(5, 27),
(5, 30),
(5, 31),
(5, 40),
(5, 41),
(5, 46),
(5, 47),
(5, 48),
(5, 49),
(5, 54),
(5, 57),
(5, 74),
(5, 79);

-- --------------------------------------------------------

--
-- Структура таблицы `md_order_zone`
--

CREATE TABLE `md_order_zone` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_order_zone`
--

INSERT INTO `md_order_zone` (`id`, `site_id`, `title`) VALUES
(1, 1, 'Магистральный пояс 4'),
(2, 1, 'Магистральный пояс 2'),
(3, 1, 'Магистральный пояс 5'),
(4, 1, 'Магистральный пояс 1'),
(5, 1, 'Магистральный пояс 3');

-- --------------------------------------------------------

--
-- Структура таблицы `md_page_seo`
--

CREATE TABLE `md_page_seo` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `route_id` varchar(255) DEFAULT NULL COMMENT 'Маршрут',
  `meta_title` varchar(1000) DEFAULT NULL COMMENT 'Заголовок',
  `meta_keywords` varchar(1000) DEFAULT NULL COMMENT 'Ключевые слова',
  `meta_description` varchar(1000) DEFAULT NULL COMMENT 'Описание'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_partnership`
--

CREATE TABLE `md_partnership` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название партнера',
  `user_id` bigint(11) DEFAULT NULL COMMENT 'Пользователь',
  `logo` varchar(255) DEFAULT NULL COMMENT 'Логотип',
  `favicon` varchar(255) DEFAULT NULL COMMENT 'Иконка сайта 16x16 (PNG, ICO)',
  `slogan` varchar(255) DEFAULT NULL COMMENT 'Слоган',
  `short_contacts` varchar(255) DEFAULT NULL COMMENT 'Короткая контактная информация',
  `contacts` mediumtext COMMENT 'Контактная информация',
  `price_base_id` int(11) DEFAULT NULL COMMENT 'Базовая цена для расчета',
  `price_inc_value` int(11) DEFAULT NULL COMMENT 'Увеличения стоимости, %',
  `cost_type_id` int(11) DEFAULT NULL COMMENT 'Привязанная к партнеру цена',
  `domains` mediumtext COMMENT 'Доменные имена (через запятую или с новой строки)',
  `address` varchar(255) DEFAULT NULL COMMENT 'Адрес партнёра',
  `coordinate_lat` float DEFAULT NULL COMMENT 'Координата широты партнёра',
  `coordinate_lng` float DEFAULT NULL COMMENT 'Координата долготы партнёра',
  `redirect_to_https` int(11) NOT NULL COMMENT 'Перенаправлять на https',
  `theme` varchar(255) DEFAULT NULL COMMENT 'Тема оформления партнера',
  `_products` mediumtext,
  `is_closed` int(11) DEFAULT NULL COMMENT 'Закрыть доступ к сайту',
  `close_message` varchar(255) DEFAULT NULL COMMENT 'Причина закрытия сайта',
  `notice_from` varchar(255) DEFAULT NULL COMMENT 'Будет указано в письме в поле  ''От''',
  `notice_reply` varchar(255) DEFAULT NULL COMMENT 'Куда присылать ответные письма? (поле Reply)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product`
--

CREATE TABLE `md_product` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Короткое название',
  `alias` varchar(150) DEFAULT NULL COMMENT 'URL имя',
  `short_description` mediumtext COMMENT 'Краткое описание',
  `description` mediumtext COMMENT 'Описание товара',
  `barcode` varchar(50) DEFAULT NULL COMMENT 'Артикул',
  `weight` float DEFAULT NULL COMMENT 'Вес',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата поступления',
  `num` decimal(11,3) NOT NULL COMMENT 'Доступно',
  `waiting` decimal(11,3) NOT NULL COMMENT 'Ожидание',
  `reserve` decimal(11,3) NOT NULL COMMENT 'Зарезервировано',
  `remains` decimal(11,3) NOT NULL COMMENT 'Остаток',
  `amount_step` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT 'Шаг изменения количества товара в корзине',
  `unit` int(11) DEFAULT NULL COMMENT 'Единица измерения',
  `min_order` int(11) DEFAULT NULL COMMENT 'Минимальное количество товара для заказа',
  `max_order` int(11) DEFAULT NULL COMMENT 'Максимальное количество товара для заказа',
  `public` int(1) DEFAULT NULL COMMENT 'Показывать товар',
  `no_export` int(1) DEFAULT '0' COMMENT 'Не экспортировать',
  `maindir` int(11) DEFAULT NULL COMMENT 'Основная категория',
  `reservation` enum('default','throughout','forced') NOT NULL DEFAULT 'default' COMMENT 'Предварительный заказ',
  `brand_id` int(11) DEFAULT '0' COMMENT 'Бренд товара',
  `format` varchar(20) DEFAULT NULL COMMENT 'Загружен из',
  `rating` decimal(3,1) DEFAULT NULL COMMENT 'Средний балл(рейтинг)',
  `comments` int(11) DEFAULT NULL COMMENT 'Кол-во комментариев',
  `last_id` varchar(36) DEFAULT NULL COMMENT 'Прошлый ID',
  `processed` int(2) DEFAULT NULL,
  `is_new` int(1) DEFAULT NULL COMMENT 'Служебное поле',
  `group_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор группы товаров',
  `xml_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор в системе 1C',
  `import_hash` varchar(32) DEFAULT NULL COMMENT 'Хэш данных импорта',
  `sku` varchar(50) DEFAULT NULL COMMENT 'Штрихкод',
  `sortn` int(11) DEFAULT '100' COMMENT 'Сортировочный вес',
  `recommended` varchar(4000) DEFAULT NULL COMMENT 'Рекомендуемые товары',
  `concomitant` varchar(4000) DEFAULT NULL COMMENT 'Сопутствующие товары',
  `payment_subject` varchar(255) DEFAULT 'commodity' COMMENT 'Признак предмета товара',
  `offer_caption` varchar(200) DEFAULT NULL COMMENT 'Подпись к комплектациям',
  `meta_title` varchar(1000) DEFAULT NULL COMMENT 'SEO Заголовок',
  `meta_keywords` varchar(1000) DEFAULT NULL COMMENT 'SEO Ключевые слова(keywords)',
  `meta_description` varchar(1000) DEFAULT NULL COMMENT 'SEO Описание(description)',
  `tax_ids` varchar(255) DEFAULT 'category' COMMENT 'Налоги'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_dir`
--

CREATE TABLE `md_product_dir` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `xml_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор в системе 1C',
  `name` varchar(255) DEFAULT NULL COMMENT 'Название категории',
  `alias` varchar(150) DEFAULT NULL COMMENT 'Псевдоним',
  `parent` int(11) DEFAULT NULL COMMENT 'Родитель',
  `public` int(1) DEFAULT NULL COMMENT 'Публичный',
  `sortn` int(11) DEFAULT NULL COMMENT 'Порядк. N',
  `is_spec_dir` varchar(1) DEFAULT NULL COMMENT 'Это спец. список?',
  `is_label` int(1) NOT NULL DEFAULT '0' COMMENT 'Показывать как ярлык у товаров',
  `itemcount` int(11) DEFAULT NULL COMMENT 'Количество элементов',
  `level` int(11) DEFAULT NULL COMMENT 'Уровень вложенности',
  `image` varchar(255) DEFAULT NULL COMMENT 'Изображение',
  `weight` int(11) DEFAULT NULL COMMENT 'Вес товара по умолчанию, грамм',
  `processed` int(2) DEFAULT NULL,
  `description` mediumtext COMMENT 'Описание категории',
  `meta_title` varchar(1000) DEFAULT NULL COMMENT 'Заголовок',
  `meta_keywords` varchar(1000) DEFAULT NULL COMMENT 'Ключевые слова',
  `meta_description` varchar(1000) DEFAULT NULL COMMENT 'Описание',
  `product_meta_title` varchar(1000) DEFAULT NULL COMMENT 'Заголовок товаров',
  `product_meta_keywords` varchar(1000) DEFAULT NULL COMMENT 'Ключевые слова товаров',
  `product_meta_description` varchar(1000) DEFAULT NULL COMMENT 'Описание товаров',
  `in_list_properties` mediumtext COMMENT 'Характеристики списка',
  `is_virtual` int(11) DEFAULT NULL COMMENT 'Включить подбор товаров',
  `virtual_data` mediumtext COMMENT 'Параметры выборки товаров',
  `export_name` varchar(255) DEFAULT NULL COMMENT 'Название категории при экспорте',
  `recommended` varchar(4000) DEFAULT NULL COMMENT 'Рекомендуемые товары',
  `concomitant` varchar(4000) DEFAULT NULL COMMENT 'Сопутствующие товары',
  `mobile_background_color` varchar(11) DEFAULT '#E0E0E0' COMMENT 'Цвет фона для планшета',
  `mobile_tablet_background_image` varchar(255) DEFAULT NULL COMMENT 'Картинка для планшета',
  `mobile_tablet_icon` varchar(255) DEFAULT NULL COMMENT 'Картинка для мобильной версии',
  `tax_ids` varchar(255) DEFAULT 'all' COMMENT 'Налоги'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_favorite`
--

CREATE TABLE `md_product_favorite` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `guest_id` varchar(50) DEFAULT NULL COMMENT 'id гостя',
  `user_id` int(11) DEFAULT NULL COMMENT 'id пользователя',
  `product_id` int(11) DEFAULT NULL COMMENT 'id товара'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_multioffer`
--

CREATE TABLE `md_product_multioffer` (
  `product_id` int(11) DEFAULT NULL COMMENT 'id товара',
  `prop_id` int(11) DEFAULT NULL COMMENT 'id характеристики',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название уровня',
  `is_photo` int(11) DEFAULT '0' COMMENT 'Представление в виде фото?',
  `sortn` int(11) DEFAULT '0' COMMENT 'Индекс сортировки'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_offer`
--

CREATE TABLE `md_product_offer` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `product_id` int(11) DEFAULT NULL COMMENT 'ID товара',
  `title` varchar(300) DEFAULT NULL COMMENT 'Название',
  `barcode` varchar(50) NOT NULL COMMENT 'Артикул',
  `weight` float DEFAULT '0' COMMENT 'Вес',
  `pricedata` text COMMENT 'Цена (сериализован)',
  `propsdata` text COMMENT 'Характеристики комплектации (сериализован)',
  `num` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT 'Остаток на складе',
  `waiting` decimal(11,3) NOT NULL COMMENT 'Ожидание',
  `reserve` decimal(11,3) NOT NULL COMMENT 'Зарезервировано',
  `remains` decimal(11,3) NOT NULL COMMENT 'Остаток',
  `photos` varchar(1000) DEFAULT NULL COMMENT 'Фотографии комплектаций',
  `sortn` int(11) DEFAULT NULL COMMENT 'Порядковый номер',
  `unit` int(11) DEFAULT '0' COMMENT 'Единица измерения',
  `processed` int(2) DEFAULT NULL COMMENT 'Флаг обработанной во время импорта комплектации',
  `xml_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор товара в системе 1C',
  `import_hash` varchar(32) DEFAULT NULL COMMENT 'Хэш данных импорта',
  `sku` varchar(50) DEFAULT NULL COMMENT 'Штрихкод'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_prop`
--

CREATE TABLE `md_product_prop` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название характеристики',
  `alias` varchar(255) DEFAULT NULL COMMENT 'Англ. псевдоним',
  `type` varchar(10) DEFAULT 'string' COMMENT 'Тип',
  `description` mediumtext COMMENT 'Описание',
  `sortn` int(11) DEFAULT NULL COMMENT 'Сорт. индекс',
  `parent_sortn` int(11) DEFAULT NULL COMMENT 'Сорт. индекс группы',
  `unit` varchar(30) DEFAULT NULL COMMENT 'Единица измерения',
  `unit_export` varchar(30) DEFAULT NULL COMMENT 'Размерная сетка',
  `name_for_export` varchar(30) DEFAULT NULL COMMENT 'Имя, выгружаемое на Яндекс маркет',
  `xml_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор товара в системе 1C',
  `parent_id` int(11) NOT NULL COMMENT 'Группа',
  `int_hide_inputs` int(1) DEFAULT '0' COMMENT 'Скрывать поля ввода границ диапазона',
  `hidden` int(1) DEFAULT '0' COMMENT 'Не отображать в карточке товара',
  `no_export` int(1) DEFAULT '0' COMMENT 'Не экспортировать'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_prop_dir`
--

CREATE TABLE `md_product_prop_dir` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `hidden` int(1) DEFAULT '0' COMMENT 'Не отображать в карточке товара',
  `sortn` int(11) DEFAULT NULL COMMENT 'Сорт. номер'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_prop_link`
--

CREATE TABLE `md_product_prop_link` (
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `prop_id` int(11) DEFAULT NULL COMMENT 'ID характеристики',
  `product_id` int(11) DEFAULT NULL COMMENT 'ID товара',
  `group_id` int(11) DEFAULT NULL COMMENT 'ID группы товаров',
  `val_str` varchar(255) DEFAULT NULL COMMENT 'Строковое значение',
  `val_int` float DEFAULT NULL COMMENT 'Числовое значение',
  `val_list_id` int(11) DEFAULT NULL COMMENT 'Списковое значение',
  `available` int(1) NOT NULL DEFAULT '1' COMMENT 'Есть в наличии товары с такой характеристикой',
  `public` int(1) DEFAULT NULL COMMENT 'Участие в фильтрах. Для group_id>0',
  `is_expanded` int(1) NOT NULL DEFAULT '0' COMMENT 'Показывать всегда развернутым',
  `xml_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор товара в системе 1C',
  `extra` varchar(255) DEFAULT NULL COMMENT 'Дополнительное поле для данных'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_prop_value`
--

CREATE TABLE `md_product_prop_value` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `prop_id` int(11) DEFAULT NULL COMMENT 'Характеристика',
  `value` varchar(255) DEFAULT NULL COMMENT 'Значение характеристики',
  `alias` varchar(255) DEFAULT NULL COMMENT 'Англ. псевдоним',
  `color` varchar(7) DEFAULT NULL COMMENT 'Цвет',
  `image` varchar(255) DEFAULT NULL COMMENT 'Изображение',
  `sortn` int(11) DEFAULT NULL COMMENT 'Порядок',
  `xml_id` varchar(255) DEFAULT NULL COMMENT 'Внешний идентификатор'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_reservation`
--

CREATE TABLE `md_product_reservation` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `product_id` int(11) DEFAULT NULL COMMENT 'ID товара',
  `product_barcode` int(11) DEFAULT NULL COMMENT 'Артикул товара',
  `product_title` varchar(255) DEFAULT NULL COMMENT 'Название товара',
  `offer` varchar(255) DEFAULT NULL COMMENT 'Название комплектации товара',
  `offer_id` int(11) DEFAULT NULL COMMENT 'Комплектация товара',
  `currency` varchar(255) DEFAULT NULL COMMENT 'Валюта на момент оформления заявки',
  `multioffer` varchar(255) DEFAULT NULL COMMENT 'Многомерная комплектация товара',
  `amount` decimal(11,3) DEFAULT NULL COMMENT 'Количество',
  `phone` varchar(50) DEFAULT NULL COMMENT 'Телефон пользователя',
  `email` varchar(255) DEFAULT NULL COMMENT 'E-mail пользователя',
  `is_notify` enum('1','0') NOT NULL DEFAULT '0' COMMENT 'Уведомлять о поступлении на склад',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата заказа',
  `user_id` bigint(11) DEFAULT NULL COMMENT 'ID пользователя',
  `status` enum('open','close') NOT NULL COMMENT 'Статус',
  `comment` mediumtext COMMENT 'Комментарий администратора',
  `partner_id` int(11) DEFAULT '0' COMMENT 'Партнёрский сайт',
  `source_id` int(11) DEFAULT '0' COMMENT 'Источники прихода',
  `utm_source` varchar(50) DEFAULT NULL COMMENT 'Рекламная система UTM_SOURCE',
  `utm_medium` varchar(50) DEFAULT NULL COMMENT 'Тип трафика UTM_MEDIUM',
  `utm_campaign` varchar(50) DEFAULT NULL COMMENT 'Рекламная кампания UTM_COMPAING',
  `utm_term` varchar(50) DEFAULT NULL COMMENT 'Ключевое слово UTM_TERM',
  `utm_content` varchar(50) DEFAULT NULL COMMENT 'Различия UTM_CONTENT',
  `utm_dateof` date DEFAULT NULL COMMENT 'Дата события'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_typecost`
--

CREATE TABLE `md_product_typecost` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `xml_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор в системе 1C',
  `title` varchar(150) DEFAULT NULL COMMENT 'Название',
  `type` enum('manual','auto') DEFAULT 'manual' COMMENT 'Тип цены',
  `val_znak` varchar(1) DEFAULT NULL COMMENT 'Знак значения',
  `val` float DEFAULT NULL COMMENT 'Величина увеличения стоимости',
  `val_type` enum('sum','percent') DEFAULT NULL COMMENT 'Тип увеличения стоимости',
  `depend` int(11) DEFAULT NULL COMMENT 'Цена, от которой ведется расчет',
  `round` int(11) DEFAULT NULL COMMENT 'Округление'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_product_typecost`
--

INSERT INTO `md_product_typecost` (`id`, `site_id`, `xml_id`, `title`, `type`, `val_znak`, `val`, `val_type`, `depend`, `round`) VALUES
(1, 1, NULL, 'Розничная', 'manual', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_unit`
--

CREATE TABLE `md_product_unit` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `code` int(11) DEFAULT NULL COMMENT 'Код ОКЕИ',
  `icode` varchar(25) DEFAULT NULL COMMENT 'Международное сокращение',
  `title` varchar(70) DEFAULT NULL COMMENT 'Полное название единицы измерения',
  `stitle` varchar(25) DEFAULT NULL COMMENT 'Короткое обозначение',
  `amount_step` decimal(11,3) NOT NULL DEFAULT '1.000' COMMENT 'Шаг изменения количества товара в корзине',
  `sortn` int(11) DEFAULT NULL COMMENT 'Сорт. номер'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_x_cost`
--

CREATE TABLE `md_product_x_cost` (
  `product_id` int(11) DEFAULT NULL COMMENT 'ID товара',
  `cost_id` int(11) DEFAULT NULL COMMENT 'ID цены',
  `cost_val` decimal(20,2) NOT NULL COMMENT 'Рассчитанная цена в базовой валюте',
  `cost_original_val` decimal(20,2) NOT NULL COMMENT 'Оригинальная цена товара',
  `cost_original_currency` int(11) NOT NULL DEFAULT '0' COMMENT 'ID валюты оригинальной цены товара'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_x_dir`
--

CREATE TABLE `md_product_x_dir` (
  `product_id` int(11) DEFAULT NULL COMMENT 'ID товара',
  `dir_id` int(11) DEFAULT NULL COMMENT 'ID категории'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_product_x_stock`
--

CREATE TABLE `md_product_x_stock` (
  `product_id` int(11) DEFAULT NULL COMMENT 'ID товара',
  `offer_id` int(11) DEFAULT NULL COMMENT 'ID комплектации',
  `warehouse_id` int(11) DEFAULT NULL COMMENT 'ID склада',
  `stock` decimal(11,3) DEFAULT '0.000' COMMENT 'Доступно',
  `reserve` decimal(11,3) DEFAULT '0.000' COMMENT 'Резерв',
  `waiting` decimal(11,3) DEFAULT '0.000' COMMENT 'Ожидание',
  `remains` decimal(11,3) DEFAULT '0.000' COMMENT 'Остаток'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_pushsender_push_lock`
--

CREATE TABLE `md_pushsender_push_lock` (
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `user_id` int(11) DEFAULT NULL COMMENT 'Пользователь',
  `app` varchar(100) DEFAULT NULL COMMENT 'Приложение',
  `push_class` varchar(100) DEFAULT NULL COMMENT 'Класс уведомлений, all - запретить все'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_pushsender_user_token`
--

CREATE TABLE `md_pushsender_user_token` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `user_id` int(11) DEFAULT NULL COMMENT 'ID пользователя',
  `push_token` varchar(300) DEFAULT NULL COMMENT 'Токен пользователя в Firebase',
  `dateofcreate` datetime DEFAULT NULL COMMENT 'Дата создания',
  `app` varchar(50) DEFAULT NULL COMMENT 'Приложение, для которого выписан token',
  `uuid` varchar(255) DEFAULT NULL COMMENT 'Уникальный идентификатор устройства',
  `model` varchar(80) DEFAULT NULL COMMENT 'Модель устройства',
  `manufacturer` varchar(80) DEFAULT NULL COMMENT 'Производитель',
  `platform` varchar(50) DEFAULT NULL COMMENT 'Платформа на устройстве',
  `version` varchar(255) DEFAULT NULL COMMENT 'Версия платформы на устройстве',
  `cordova` varchar(255) DEFAULT NULL COMMENT 'Версия cordova js',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP адрес'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_readed_item`
--

CREATE TABLE `md_readed_item` (
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `user_id` bigint(11) DEFAULT NULL COMMENT 'Пользователь',
  `entity` varchar(50) DEFAULT NULL COMMENT 'Тип прочитанного объекта',
  `entity_id` int(11) DEFAULT NULL COMMENT 'ID прочитанного объекта',
  `last_id` int(11) DEFAULT NULL COMMENT 'ID последнего прочитанного объекта'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_receipt`
--

CREATE TABLE `md_receipt` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `sign` varchar(255) DEFAULT NULL COMMENT 'Подпись чека',
  `uniq_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор транзакции от провайдера',
  `type` enum('sell','sell_refund','sell_correction') NOT NULL COMMENT 'Тип чека',
  `provider` varchar(50) DEFAULT NULL COMMENT 'Провайдер',
  `url` varchar(255) DEFAULT NULL COMMENT 'Ссылка на чек покупателю',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата транзакции',
  `transaction_id` int(11) DEFAULT NULL COMMENT 'ID связанной транзакции',
  `total` decimal(20,2) DEFAULT NULL COMMENT 'Сумма в чеке',
  `status` enum('success','fail','wait') NOT NULL COMMENT 'Статус чека',
  `error` mediumtext COMMENT 'Ошибка',
  `extra` mediumtext COMMENT 'Дополнительное поле для данных'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_search_index`
--

CREATE TABLE `md_search_index` (
  `result_class` varchar(100) NOT NULL COMMENT 'Класс результата',
  `entity_id` int(11) NOT NULL COMMENT 'id сущности',
  `title` varchar(255) DEFAULT NULL COMMENT 'Заголовок результата',
  `indextext` mediumtext COMMENT 'Описание сущности (индексируемый)',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата добавления в индекс'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_sections`
--

CREATE TABLE `md_sections` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `page_id` varchar(255) DEFAULT NULL COMMENT 'Страница',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Родительская секция',
  `alias` varchar(255) DEFAULT NULL COMMENT 'Название секции для автоматической вставки модулей',
  `width_xs` int(5) DEFAULT NULL COMMENT 'Ширина (XS)',
  `width_sm` int(5) DEFAULT NULL COMMENT 'Ширина (SM)',
  `width` int(5) DEFAULT NULL COMMENT 'Ширина',
  `width_lg` int(5) DEFAULT NULL COMMENT 'Ширина',
  `width_xl` int(5) DEFAULT NULL COMMENT 'Ширина',
  `inset_align_xs` varchar(255) DEFAULT NULL COMMENT 'Горизонтальное выравнивание',
  `inset_align_sm` varchar(255) DEFAULT NULL COMMENT 'Горизонтальное выравнивание',
  `inset_align` varchar(255) DEFAULT NULL COMMENT 'Горизонтальное выравнивание',
  `inset_align_lg` varchar(255) DEFAULT NULL COMMENT 'Горизонтальное выравнивание',
  `inset_align_xl` varchar(255) DEFAULT NULL COMMENT 'Горизонтальное выравнивание',
  `align_items_xs` varchar(255) DEFAULT NULL COMMENT 'Вертикальное выравнивание',
  `align_items_sm` varchar(255) DEFAULT NULL COMMENT 'Вертикальное выравнивание',
  `align_items` varchar(255) DEFAULT NULL COMMENT 'Вертикальное выравнивание',
  `align_items_lg` varchar(255) DEFAULT NULL COMMENT 'Вертикальное выравнивание',
  `align_items_xl` varchar(255) DEFAULT NULL COMMENT 'Вертикальное выравнивание',
  `prefix_xs` int(11) DEFAULT NULL COMMENT 'Отступ слева (XS)',
  `prefix_sm` int(11) DEFAULT NULL COMMENT 'Отступ слева (SM)',
  `prefix` int(11) DEFAULT NULL COMMENT 'Отступ слева (prefix)',
  `prefix_lg` int(11) DEFAULT NULL COMMENT 'Остступ слева (offset)',
  `prefix_xl` int(11) DEFAULT NULL COMMENT 'Остступ слева (offset)',
  `suffix` int(11) DEFAULT NULL COMMENT 'Отступ справа (suffix)',
  `pull_xs` int(11) DEFAULT NULL COMMENT 'Сдвиг влево (xs)',
  `pull_sm` int(11) DEFAULT NULL COMMENT 'Сдвиг влево (sm)',
  `pull` int(11) DEFAULT NULL COMMENT 'Сдвиг влево (pull)',
  `pull_lg` int(11) DEFAULT NULL COMMENT 'Сдвиг влево (pull)',
  `pull_xl` int(11) DEFAULT NULL COMMENT 'Сдвиг влево (pull)',
  `push_xs` int(11) DEFAULT NULL COMMENT 'Сдвиг вправо (xs)',
  `push_sm` int(11) DEFAULT NULL COMMENT 'Сдвиг вправо (sm)',
  `push` int(11) DEFAULT NULL COMMENT 'Сдвиг вправо (push)',
  `push_lg` int(11) DEFAULT NULL COMMENT 'Сдвиг вправо (push)',
  `push_xl` int(11) DEFAULT NULL COMMENT 'Сдвиг вправо (push)',
  `order_xs` int(5) DEFAULT NULL COMMENT 'Порядок',
  `order_sm` int(5) DEFAULT NULL COMMENT 'Порядок',
  `order` int(5) DEFAULT NULL COMMENT 'Порядок',
  `order_lg` int(5) DEFAULT NULL COMMENT 'Порядок',
  `order_xl` int(5) DEFAULT NULL COMMENT 'Порядок',
  `css_class` varchar(255) DEFAULT NULL COMMENT 'Пользовательский CSS класс',
  `is_clearfix_after` int(1) DEFAULT NULL COMMENT 'Очистка после элемента(clearfix)',
  `clearfix_after_css` varchar(150) DEFAULT NULL COMMENT 'Пользовательский CSS класс для clearfix',
  `inset_template` varchar(255) DEFAULT NULL COMMENT 'Внутренний шаблон',
  `outside_template` varchar(255) DEFAULT NULL COMMENT 'Внешний шаблон',
  `element_type` enum('col','row') NOT NULL COMMENT 'Тип элемента',
  `sortn` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_sections`
--

INSERT INTO `md_sections` (`id`, `page_id`, `parent_id`, `alias`, `width_xs`, `width_sm`, `width`, `width_lg`, `width_xl`, `inset_align_xs`, `inset_align_sm`, `inset_align`, `inset_align_lg`, `inset_align_xl`, `align_items_xs`, `align_items_sm`, `align_items`, `align_items_lg`, `align_items_xl`, `prefix_xs`, `prefix_sm`, `prefix`, `prefix_lg`, `prefix_xl`, `suffix`, `pull_xs`, `pull_sm`, `pull`, `pull_lg`, `pull_xl`, `push_xs`, `push_sm`, `push`, `push_lg`, `push_xl`, `order_xs`, `order_sm`, `order`, `order_lg`, `order_xl`, `css_class`, `is_clearfix_after`, `clearfix_after_css`, `inset_template`, `outside_template`, `element_type`, `sortn`) VALUES
(1, '2', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(2, '2', 1, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sec sec-breadcrumb', 0, '', '', '', 'col', 0),
(3, '2', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 1),
(4, '2', 3, '', 12, 12, 3, 3, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 0),
(5, '2', 3, '', 12, 12, 9, 9, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 1),
(6, '3', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(7, '3', 6, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sec sec-breadcrumb', 0, '', '', '', 'col', 0),
(8, '3', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 1),
(9, '3', 8, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sec sec-page-product', 1, '', '', '', 'col', 0),
(10, '3', 8, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', '', '', 'col', 1),
(11, '3', 8, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 3),
(12, '4', -1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(13, '4', 12, '', 12, 6, 6, 8, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 0),
(14, '4', 12, '', 12, 6, 6, 4, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'text-right', 0, '', '', '', 'col', 1),
(15, '4', -2, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(16, '4', 15, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'visible-xs hidden', 0, '', '', '', 'col', 0),
(17, '4', 15, '', 12, 3, 3, 2, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 1),
(18, '4', 15, '', 12, 6, 6, 7, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hidden-xs', 0, '', '', '', 'col', 2),
(19, '4', 15, '', 12, 3, 3, 3, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '%THEME%/helpers/layout/gridblock_wrapper.tpl', '', 'col', 3),
(20, '4', -3, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(21, '4', 20, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hidden-xs', 0, '', '', '', 'col', 0),
(22, '4', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(23, '4', 22, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sec sec-breadcrumb', 0, '', '', '', 'col', 0),
(24, '4', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 1),
(25, '4', 24, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 0),
(26, '4', -5, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(27, '4', 26, '', 12, 3, 3, 2, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'text-center', 0, '', '', '', 'col', 0),
(28, '4', 26, '', 12, 3, 2, 2, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 1),
(29, '4', 26, '', 12, 6, 3, 3, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 2),
(30, '4', 26, '', 12, 6, 2, 3, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 3),
(31, '4', 26, '', 12, 6, 2, 2, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 4),
(32, '4', -5, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'line-before', 0, '', '', '', 'row', 1),
(33, '4', 32, '', 12, 8, 9, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 0),
(34, '4', 32, '', 12, 4, 3, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 1),
(35, '5', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(36, '5', 35, '', 12, NULL, 12, 6, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 0),
(37, '5', 35, '', 12, 4, 4, 3, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 1),
(38, '5', 35, '', 12, 4, 4, 3, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 2),
(39, '5', 35, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'clearfix', 0, '', '', '', 'col', 3),
(40, '5', 35, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'clearfix', 0, '', '', '', 'col', 4),
(41, '6', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(42, '6', 41, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sec sec-breadcrumb', 0, '', '', '', 'col', 0),
(43, '6', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 1),
(44, '6', 43, '', 12, 12, 3, 3, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 0),
(45, '6', 43, '', 12, 12, 9, 9, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 1),
(46, '7', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(47, '7', 46, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sec sec-breadcrumb', 0, '', '', '', 'col', 0),
(48, '7', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 1),
(49, '7', 48, '', 12, 12, 3, 3, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 0),
(50, '7', 48, '', 12, 12, 9, 9, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 1),
(51, '8', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(52, '8', 51, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sec sec-breadcrumb', 0, '', '', '', 'col', 0),
(53, '8', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 1),
(54, '8', 53, '', 12, 12, 3, 3, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 0),
(55, '8', 53, '', 12, 12, 9, 9, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 1),
(56, '9', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(57, '9', 56, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sec sec-breadcrumb', 0, '', '', '', 'col', 0),
(58, '9', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 1),
(59, '9', 58, '', 12, 12, 3, 3, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 0),
(60, '9', 58, '', 12, 12, 9, 9, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 1),
(61, '10', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(62, '10', 61, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sec sec-breadcrumb', 0, '', '', '', 'col', 0),
(63, '10', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 1),
(64, '10', 63, '', 12, 12, 3, 3, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 0),
(65, '10', 63, '', 12, 12, 9, 9, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 1),
(66, '11', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(67, '11', 66, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sec sec-breadcrumb', 0, '', '', '', 'col', 0),
(68, '11', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 1),
(69, '11', 68, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '%THEME%/helpers/layout/auth_wrapper.tpl', '', 'col', 0),
(70, '11', 69, '', 12, NULL, 6, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 0),
(71, '12', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(72, '12', 71, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sec sec-breadcrumb', 0, '', '', '', 'col', 0),
(73, '12', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 1),
(74, '12', 73, '', 12, 12, 3, 3, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 0),
(75, '12', 73, '', 12, 12, 9, 9, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 1),
(76, '13', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 0),
(77, '13', 76, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sec sec-breadcrumb', 0, '', '', '', 'col', 0),
(78, '13', -4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'row', 1),
(79, '13', 78, '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '%THEME%/helpers/layout/register_wrapped.tpl', '', 'col', 0),
(80, '13', 79, '', 12, NULL, 6, NULL, NULL, NULL, NULL, 'wide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', 'col', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `md_section_containers`
--

CREATE TABLE `md_section_containers` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `page_id` int(11) DEFAULT NULL,
  `columns` int(11) DEFAULT NULL COMMENT 'Ширина',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `css_class` varchar(255) DEFAULT NULL COMMENT 'CSS класс',
  `is_fluid` int(1) NOT NULL COMMENT 'Резиновый контейнер(fluid)',
  `wrap_element` varchar(255) DEFAULT NULL COMMENT 'Внешний элемент',
  `wrap_css_class` varchar(255) DEFAULT NULL COMMENT 'CSS-класс оборачивающего блока',
  `outside_template` varchar(255) DEFAULT NULL COMMENT 'Внешний шаблон',
  `inside_template` varchar(255) DEFAULT NULL COMMENT 'Внутренний шаблон',
  `type` int(5) DEFAULT NULL COMMENT 'Порядковый номер контейнера на странице'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_section_containers`
--

INSERT INTO `md_section_containers` (`id`, `page_id`, `columns`, `title`, `css_class`, `is_fluid`, `wrap_element`, `wrap_css_class`, `outside_template`, `inside_template`, `type`) VALUES
(1, 2, 12, 'Контент', '', 1, '', '', '', '', 4),
(2, 3, 12, 'Контент', '', 1, '', '', '', '', 4),
(3, 4, 12, 'Навигация', '', 1, 'div', 'header-top navbar-theme', '', '', 1),
(4, 4, 12, 'шапка', '', 1, 'div', 'header-middle', '', '', 2),
(5, 4, 12, 'Категории', '', 1, 'div', 'navbar navbar-inverse hidden-xs', '', '', 3),
(6, 4, 12, 'Контент', '', 1, '', '', '', '', 4),
(7, 4, 12, 'Подвал', '', 1, 'footer', '', '', '', 5),
(8, 5, 12, 'Контент', '', 1, '', '', '', '', 4),
(9, 6, 12, 'Контент', '', 1, '', '', '', '', 4),
(10, 7, 12, 'Контент', '', 1, '', '', '', '', 4),
(11, 8, 12, 'Контент', '', 1, '', '', '', '', 4),
(12, 9, 12, 'Контент', '', 1, '', '', '', '', 4),
(13, 10, 12, 'Контент', '', 1, '', '', '', '', 4),
(14, 11, 12, 'Контент', '', 1, '', '', '', '', 4),
(15, 12, 12, 'Контент', '', 1, '', '', '', '', 4),
(16, 13, 12, 'Контент', '', 1, '', '', '', '', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `md_section_context`
--

CREATE TABLE `md_section_context` (
  `site_id` int(11) NOT NULL COMMENT 'ID сайта',
  `context` varchar(50) NOT NULL COMMENT 'Контекст темы оформления',
  `grid_system` enum('none','gs960','bootstrap','bootstrap4') NOT NULL COMMENT 'Тип сеточного фреймворка',
  `options` mediumtext COMMENT 'Настройки темы в сериализованном виде'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_section_context`
--

INSERT INTO `md_section_context` (`site_id`, `context`, `grid_system`, `options`) VALUES
(1, 'theme', 'bootstrap', 'a:4:{s:21:\"enable_one_click_cart\";s:1:\"1\";s:15:\"enable_favorite\";s:1:\"1\";s:14:\"enable_compare\";s:1:\"1\";s:22:\"cat_description_bottom\";s:1:\"0\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `md_section_modules`
--

CREATE TABLE `md_section_modules` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `page_id` int(11) DEFAULT NULL COMMENT 'Страница',
  `section_id` int(11) DEFAULT NULL COMMENT 'ID секции',
  `module_controller` varchar(150) DEFAULT NULL COMMENT 'Модуль',
  `public` int(1) DEFAULT '1' COMMENT 'Публичный',
  `sortn` int(11) DEFAULT NULL,
  `params` mediumtext COMMENT 'Параметры'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_section_modules`
--

INSERT INTO `md_section_modules` (`id`, `page_id`, `section_id`, `module_controller`, `public`, `sortn`, `params`) VALUES
(1, 2, 2, 'main\\controller\\block\\breadcrumbs', 1, 0, 'a:2:{s:4:\"name\";s:39:\"Main-Controller-Block-BreadCrumbs-index\";s:13:\"indexTemplate\";s:34:\"blocks/breadcrumbs/breadcrumbs.tpl\";}'),
(2, 2, 4, 'catalog\\controller\\block\\sidefilters', 1, 0, 'a:7:{s:4:\"name\";s:42:\"Catalog-Controller-Block-SideFilters-index\";s:13:\"indexTemplate\";s:30:\"blocks/sidefilters/filters.tpl\";s:18:\"use_allowed_values\";i:1;s:16:\"show_cost_filter\";i:1;s:17:\"show_brand_filter\";i:1;s:16:\"show_only_public\";i:1;s:11:\"show_is_num\";i:1;}'),
(3, 2, 5, 'main\\controller\\block\\maincontent', 1, 0, 'a:0:{}'),
(4, 3, 7, 'main\\controller\\block\\breadcrumbs', 1, 0, 'a:2:{s:4:\"name\";s:39:\"Main-Controller-Block-BreadCrumbs-index\";s:13:\"indexTemplate\";s:34:\"blocks/breadcrumbs/breadcrumbs.tpl\";}'),
(5, 3, 9, 'main\\controller\\block\\maincontent', 1, 1, 'a:0:{}'),
(6, 3, 10, 'catalog\\controller\\block\\recommended', 1, 0, 'a:4:{s:4:\"name\";s:42:\"Catalog-Controller-Block-Recommended-index\";s:13:\"indexTemplate\";s:34:\"blocks/recommended/recommended.tpl\";s:6:\"random\";i:0;s:8:\"in_stock\";i:0;}'),
(7, 3, 11, 'catalog\\controller\\block\\lastviewed', 1, 0, 'a:3:{s:4:\"name\";s:41:\"Catalog-Controller-Block-LastViewed-index\";s:13:\"indexTemplate\";s:0:\"\";s:8:\"pageSize\";i:16;}'),
(8, 4, 13, 'menu\\controller\\block\\menu', 1, 0, 'a:3:{s:4:\"name\";s:32:\"Menu-Controller-Block-Menu-index\";s:13:\"indexTemplate\";s:24:\"blocks/menu/hor_menu.tpl\";s:4:\"root\";s:1:\"0\";}'),
(9, 4, 14, 'affiliate\\controller\\block\\selectaffiliate', 1, 0, 'a:2:{s:4:\"name\";s:48:\"Affiliate-Controller-Block-SelectAffiliate-index\";s:13:\"indexTemplate\";s:43:\"blocks/selectaffiliate/select_affiliate.tpl\";}'),
(10, 4, 14, 'affiliate\\controller\\block\\shortinfo', 1, 1, 'a:2:{s:4:\"name\";s:42:\"Affiliate-Controller-Block-ShortInfo-index\";s:13:\"indexTemplate\";s:0:\"\";}'),
(11, 4, 16, 'main\\controller\\block\\usertemplate', 1, 0, 'a:2:{s:4:\"name\";s:40:\"Main-Controller-Block-UserTemplate-index\";s:13:\"indexTemplate\";s:53:\"%THEME%/helpers/tpl/header/responsive_menu_button.tpl\";}'),
(12, 4, 17, 'main\\controller\\block\\logo', 1, 0, 'a:5:{s:4:\"name\";s:32:\"Main-Controller-Block-Logo-index\";s:13:\"indexTemplate\";s:20:\"blocks/logo/logo.tpl\";s:5:\"width\";i:155;s:6:\"height\";i:42;s:4:\"link\";s:0:\"\";}'),
(13, 4, 18, 'catalog\\controller\\block\\searchline', 1, 0, 'a:9:{s:4:\"name\";s:41:\"Catalog-Controller-Block-SearchLine-index\";s:11:\"searchLimit\";i:5;s:16:\"hideAutoComplete\";i:0;s:13:\"indexTemplate\";s:32:\"blocks/searchline/searchform.tpl\";s:10:\"imageWidth\";i:62;s:11:\"imageHeight\";i:62;s:15:\"imageResizeType\";s:2:\"xy\";s:11:\"order_field\";s:8:\"relevant\";s:15:\"order_direction\";s:3:\"asc\";}'),
(14, 4, 19, 'shop\\controller\\block\\cart', 1, 0, 'a:2:{s:4:\"name\";s:32:\"Shop-Controller-Block-Cart-index\";s:13:\"indexTemplate\";s:20:\"blocks/cart/cart.tpl\";}'),
(15, 4, 19, 'users\\controller\\block\\authblock', 1, 1, 'a:2:{s:4:\"name\";s:38:\"Users-Controller-Block-AuthBlock-index\";s:13:\"indexTemplate\";s:30:\"blocks/authblock/authblock.tpl\";}'),
(16, 4, 19, 'catalog\\controller\\block\\favorite', 1, 2, 'a:2:{s:4:\"name\";s:39:\"Catalog-Controller-Block-Favorite-index\";s:13:\"indexTemplate\";s:28:\"blocks/favorite/favorite.tpl\";}'),
(17, 4, 19, 'catalog\\controller\\block\\compare', 1, 3, 'a:3:{s:4:\"name\";s:38:\"Catalog-Controller-Block-Compare-index\";s:13:\"indexTemplate\";s:0:\"\";s:12:\"listTemplate\";s:0:\"\";}'),
(18, 4, 21, 'catalog\\controller\\block\\category', 1, 0, 'a:3:{s:4:\"name\";s:39:\"Catalog-Controller-Block-Category-index\";s:13:\"indexTemplate\";s:28:\"blocks/category/category.tpl\";s:4:\"root\";s:1:\"0\";}'),
(19, 4, 23, 'main\\controller\\block\\breadcrumbs', 1, 0, 'a:2:{s:4:\"name\";s:39:\"Main-Controller-Block-BreadCrumbs-index\";s:13:\"indexTemplate\";s:34:\"blocks/breadcrumbs/breadcrumbs.tpl\";}'),
(20, 4, 25, 'main\\controller\\block\\maincontent', 1, 0, 'a:0:{}'),
(21, 4, 27, 'main\\controller\\block\\logo', 1, 0, 'a:5:{s:4:\"name\";s:32:\"Main-Controller-Block-Logo-index\";s:13:\"indexTemplate\";s:27:\"blocks/logo/footer_logo.tpl\";s:5:\"width\";i:155;s:6:\"height\";i:42;s:4:\"link\";s:0:\"\";}'),
(22, 4, 28, 'menu\\controller\\block\\menu', 1, 0, 'a:3:{s:4:\"name\";s:32:\"Menu-Controller-Block-Menu-index\";s:13:\"indexTemplate\";s:27:\"blocks/menu/footer_menu.tpl\";s:4:\"root\";s:1:\"0\";}'),
(23, 4, 29, 'main\\controller\\block\\usertemplate', 1, 0, 'a:2:{s:4:\"name\";s:40:\"Main-Controller-Block-UserTemplate-index\";s:13:\"indexTemplate\";s:38:\"%THEME%/helpers/tpl/footer/payment.tpl\";}'),
(24, 4, 30, 'main\\controller\\block\\usertemplate', 1, 0, 'a:2:{s:4:\"name\";s:40:\"Main-Controller-Block-UserTemplate-index\";s:13:\"indexTemplate\";s:37:\"%THEME%/helpers/tpl/footer/phones.tpl\";}'),
(25, 4, 31, 'main\\controller\\block\\usertemplate', 1, 0, 'a:2:{s:4:\"name\";s:40:\"Main-Controller-Block-UserTemplate-index\";s:13:\"indexTemplate\";s:37:\"%THEME%/helpers/tpl/footer/social.tpl\";}'),
(26, 4, 33, 'main\\controller\\block\\usertemplate', 1, 0, 'a:2:{s:4:\"name\";s:40:\"Main-Controller-Block-UserTemplate-index\";s:13:\"indexTemplate\";s:40:\"%THEME%/helpers/tpl/footer/copyright.tpl\";}'),
(27, 4, 34, 'main\\controller\\block\\usertemplate', 1, 0, 'a:2:{s:4:\"name\";s:40:\"Main-Controller-Block-UserTemplate-index\";s:13:\"indexTemplate\";s:41:\"%THEME%/helpers/tpl/footer/developers.tpl\";}'),
(28, 5, 36, 'banners\\controller\\block\\slider', 1, 0, 'a:3:{s:4:\"name\";s:37:\"Banners-Controller-Block-Slider-index\";s:13:\"indexTemplate\";s:24:\"blocks/slider/slider.tpl\";s:4:\"zone\";i:2;}'),
(29, 5, 37, 'catalog\\controller\\block\\topcategories', 1, 0, 'a:3:{s:4:\"name\";s:44:\"Catalog-Controller-Block-TopCategories-index\";s:13:\"indexTemplate\";s:76:\"theme:flatlines/moduleview/catalog/blocks/topcategories/top_one_category.tpl\";s:12:\"category_ids\";a:1:{i:0;s:1:\"1\";}}'),
(30, 5, 38, 'catalog\\controller\\block\\topcategories', 1, 0, 'a:3:{s:4:\"name\";s:44:\"Catalog-Controller-Block-TopCategories-index\";s:13:\"indexTemplate\";s:76:\"theme:flatlines/moduleview/catalog/blocks/topcategories/top_one_category.tpl\";s:12:\"category_ids\";a:1:{i:0;s:2:\"49\";}}'),
(31, 5, 39, 'catalog\\controller\\block\\topcategories', 1, 1, 'a:3:{s:4:\"name\";s:44:\"Catalog-Controller-Block-TopCategories-index\";s:13:\"indexTemplate\";s:0:\"\";s:12:\"category_ids\";a:7:{i:0;s:2:\"20\";i:1;s:2:\"15\";i:2;s:1:\"4\";i:3;s:2:\"18\";i:4;s:2:\"32\";i:5;s:2:\"43\";i:6;s:2:\"44\";}}'),
(32, 5, 40, 'catalog\\controller\\block\\topproducts', 1, 1, 'a:6:{s:4:\"name\";s:42:\"Catalog-Controller-Block-TopProducts-index\";s:13:\"indexTemplate\";s:35:\"blocks/topproducts/top_products.tpl\";s:8:\"pageSize\";i:4;s:4:\"dirs\";s:2:\"31\";s:5:\"order\";s:2:\"id\";s:13:\"only_in_stock\";i:0;}'),
(33, 5, 40, 'catalog\\controller\\block\\topproducts', 1, 2, 'a:6:{s:4:\"name\";s:42:\"Catalog-Controller-Block-TopProducts-index\";s:13:\"indexTemplate\";s:35:\"blocks/topproducts/top_products.tpl\";s:8:\"pageSize\";i:8;s:4:\"dirs\";s:2:\"42\";s:5:\"order\";s:2:\"id\";s:13:\"only_in_stock\";i:0;}'),
(34, 5, 40, 'banners\\controller\\block\\bannerzone', 1, 2, 'a:4:{s:4:\"name\";s:41:\"Banners-Controller-Block-BannerZone-index\";s:13:\"indexTemplate\";s:31:\"blocks/bannerzone/main_zone.tpl\";s:4:\"zone\";i:4;s:6:\"rotate\";i:0;}'),
(35, 5, 40, 'catalog\\controller\\block\\lastviewed', 1, 3, 'a:3:{s:4:\"name\";s:41:\"Catalog-Controller-Block-LastViewed-index\";s:13:\"indexTemplate\";s:0:\"\";s:8:\"pageSize\";i:16;}'),
(36, 5, 40, 'article\\controller\\block\\lastnews', 1, 4, 'a:5:{s:4:\"name\";s:39:\"Article-Controller-Block-LastNews-index\";s:13:\"indexTemplate\";s:28:\"blocks/lastnews/lastnews.tpl\";s:8:\"pageSize\";i:4;s:5:\"order\";s:7:\"id DESC\";s:8:\"category\";s:1:\"1\";}'),
(37, 5, 40, 'catalog\\controller\\block\\brandlist', 1, 5, 'a:3:{s:4:\"name\";s:40:\"Catalog-Controller-Block-BrandList-index\";s:13:\"indexTemplate\";s:24:\"blocks/brands/brands.tpl\";s:8:\"pageSize\";i:20;}'),
(38, 5, 40, 'emailsubscribe\\controller\\block\\subscribebutton', 1, 6, 'a:2:{s:4:\"name\";s:53:\"EmailSubscribe-Controller-Block-SubscribeButton-index\";s:13:\"indexTemplate\";s:24:\"blocks/button/button.tpl\";}'),
(39, 6, 42, 'main\\controller\\block\\breadcrumbs', 1, 0, 'a:2:{s:4:\"name\";s:39:\"Main-Controller-Block-BreadCrumbs-index\";s:13:\"indexTemplate\";s:34:\"blocks/breadcrumbs/breadcrumbs.tpl\";}'),
(40, 6, 44, 'main\\controller\\block\\usertemplate', 1, 0, 'a:2:{s:4:\"name\";s:40:\"Main-Controller-Block-UserTemplate-index\";s:13:\"indexTemplate\";s:41:\"%THEME%/helpers/tpl/account/side_menu.tpl\";}'),
(41, 6, 45, 'main\\controller\\block\\maincontent', 1, 0, 'a:0:{}'),
(42, 7, 47, 'main\\controller\\block\\breadcrumbs', 1, 0, 'a:2:{s:4:\"name\";s:39:\"Main-Controller-Block-BreadCrumbs-index\";s:13:\"indexTemplate\";s:34:\"blocks/breadcrumbs/breadcrumbs.tpl\";}'),
(43, 7, 49, 'main\\controller\\block\\usertemplate', 1, 0, 'a:2:{s:4:\"name\";s:40:\"Main-Controller-Block-UserTemplate-index\";s:13:\"indexTemplate\";s:41:\"%THEME%/helpers/tpl/account/side_menu.tpl\";}'),
(44, 7, 50, 'main\\controller\\block\\maincontent', 1, 0, 'a:0:{}'),
(45, 8, 52, 'main\\controller\\block\\breadcrumbs', 1, 0, 'a:2:{s:4:\"name\";s:39:\"Main-Controller-Block-BreadCrumbs-index\";s:13:\"indexTemplate\";s:34:\"blocks/breadcrumbs/breadcrumbs.tpl\";}'),
(46, 8, 54, 'main\\controller\\block\\usertemplate', 1, 0, 'a:2:{s:4:\"name\";s:40:\"Main-Controller-Block-UserTemplate-index\";s:13:\"indexTemplate\";s:41:\"%THEME%/helpers/tpl/account/side_menu.tpl\";}'),
(47, 8, 55, 'main\\controller\\block\\maincontent', 1, 0, 'a:0:{}'),
(48, 9, 57, 'main\\controller\\block\\breadcrumbs', 1, 0, 'a:2:{s:4:\"name\";s:39:\"Main-Controller-Block-BreadCrumbs-index\";s:13:\"indexTemplate\";s:34:\"blocks/breadcrumbs/breadcrumbs.tpl\";}'),
(49, 9, 59, 'main\\controller\\block\\usertemplate', 1, 0, 'a:2:{s:4:\"name\";s:40:\"Main-Controller-Block-UserTemplate-index\";s:13:\"indexTemplate\";s:41:\"%THEME%/helpers/tpl/account/side_menu.tpl\";}'),
(50, 9, 60, 'main\\controller\\block\\maincontent', 1, 0, 'a:0:{}'),
(51, 10, 62, 'main\\controller\\block\\breadcrumbs', 1, 0, 'a:2:{s:4:\"name\";s:39:\"Main-Controller-Block-BreadCrumbs-index\";s:13:\"indexTemplate\";s:34:\"blocks/breadcrumbs/breadcrumbs.tpl\";}'),
(52, 10, 64, 'main\\controller\\block\\usertemplate', 1, 0, 'a:2:{s:4:\"name\";s:40:\"Main-Controller-Block-UserTemplate-index\";s:13:\"indexTemplate\";s:41:\"%THEME%/helpers/tpl/account/side_menu.tpl\";}'),
(53, 10, 65, 'main\\controller\\block\\maincontent', 1, 0, 'a:0:{}'),
(54, 11, 67, 'main\\controller\\block\\breadcrumbs', 1, 0, 'a:2:{s:4:\"name\";s:39:\"Main-Controller-Block-BreadCrumbs-index\";s:13:\"indexTemplate\";s:34:\"blocks/breadcrumbs/breadcrumbs.tpl\";}'),
(55, 11, 70, 'main\\controller\\block\\maincontent', 1, 0, 'a:0:{}'),
(56, 12, 72, 'main\\controller\\block\\breadcrumbs', 1, 0, 'a:2:{s:4:\"name\";s:39:\"Main-Controller-Block-BreadCrumbs-index\";s:13:\"indexTemplate\";s:34:\"blocks/breadcrumbs/breadcrumbs.tpl\";}'),
(57, 12, 74, 'main\\controller\\block\\usertemplate', 1, 0, 'a:2:{s:4:\"name\";s:40:\"Main-Controller-Block-UserTemplate-index\";s:13:\"indexTemplate\";s:41:\"%THEME%/helpers/tpl/account/side_menu.tpl\";}'),
(58, 12, 75, 'main\\controller\\block\\maincontent', 1, 0, 'a:0:{}'),
(59, 13, 77, 'main\\controller\\block\\breadcrumbs', 1, 0, 'a:2:{s:4:\"name\";s:39:\"Main-Controller-Block-BreadCrumbs-index\";s:13:\"indexTemplate\";s:34:\"blocks/breadcrumbs/breadcrumbs.tpl\";}'),
(60, 13, 80, 'main\\controller\\block\\maincontent', 1, 0, 'a:0:{}');

-- --------------------------------------------------------

--
-- Структура таблицы `md_section_page`
--

CREATE TABLE `md_section_page` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `route_id` varchar(255) NOT NULL COMMENT 'Маршрут',
  `context` varchar(32) DEFAULT NULL COMMENT 'Дополнительный идентификатор темы',
  `template` varchar(255) DEFAULT NULL COMMENT 'Шаблон',
  `inherit` int(1) DEFAULT '1' COMMENT 'Наследовать шаблон по-умолчанию?'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_section_page`
--

INSERT INTO `md_section_page` (`id`, `site_id`, `route_id`, `context`, `template`, `inherit`) VALUES
(1, 1, 'catalog-front-compare', 'theme', '%THEME%/fullscreen.tpl', 1),
(2, 1, 'catalog-front-listproducts', 'theme', '', 1),
(3, 1, 'catalog-front-product', 'theme', '', 1),
(4, 1, 'default', 'theme', '', 1),
(5, 1, 'main.index', 'theme', '', 1),
(6, 1, 'shop-front-mybalance', 'theme', '', 1),
(7, 1, 'shop-front-myorders', 'theme', '', 1),
(8, 1, 'shop-front-myorderview', 'theme', '', 1),
(9, 1, 'shop-front-myproductsreturn', 'theme', '', 1),
(10, 1, 'support-front-support', 'theme', '', 1),
(11, 1, 'users-front-auth', 'theme', '', 1),
(12, 1, 'users-front-profile', 'theme', '', 1),
(13, 1, 'users-front-register', 'theme', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `md_sites`
--

CREATE TABLE `md_sites` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `title` varchar(255) DEFAULT NULL COMMENT 'Краткое название сайта',
  `full_title` varchar(255) DEFAULT NULL COMMENT 'Полное название сайта',
  `domains` mediumtext COMMENT 'Доменные имена (через запятую)',
  `folder` varchar(255) DEFAULT NULL COMMENT 'Папка сайта',
  `language` varchar(255) DEFAULT NULL COMMENT 'Язык',
  `default` int(11) DEFAULT NULL COMMENT 'По умолчанию',
  `redirect_to_main_domain` int(11) NOT NULL COMMENT 'Перенаправлять на основной домен',
  `redirect_to_https` int(11) NOT NULL COMMENT 'Перенаправлять на https',
  `sortn` int(11) DEFAULT NULL COMMENT 'Сортировка',
  `is_closed` int(11) DEFAULT NULL COMMENT 'Закрыть доступ к сайту',
  `close_message` varchar(255) DEFAULT NULL COMMENT 'Причина закрытия сайта',
  `rating` decimal(3,1) DEFAULT '0.0' COMMENT 'Средний балл(рейтинг)',
  `comments` int(11) DEFAULT '0' COMMENT 'Кол-во комментариев к сайту'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_sites`
--

INSERT INTO `md_sites` (`id`, `title`, `full_title`, `domains`, `folder`, `language`, `default`, `redirect_to_main_domain`, `redirect_to_https`, `sortn`, `is_closed`, `close_message`, `rating`, `comments`) VALUES
(1, 'Сайт readyscripttest', 'Сайт readyscripttest', 'readyscripttest', NULL, 'ru', 1, 0, 0, 1, NULL, NULL, '0.0', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `md_site_options`
--

CREATE TABLE `md_site_options` (
  `site_id` int(11) NOT NULL COMMENT 'ID сайта',
  `admin_email` varchar(150) DEFAULT NULL COMMENT 'E-mail администратора(ов)',
  `admin_phone` varchar(150) DEFAULT NULL COMMENT 'Телефон администратора',
  `theme` varchar(150) DEFAULT NULL COMMENT 'Тема',
  `favicon` varchar(255) DEFAULT NULL COMMENT 'Иконка сайта 16x16 (PNG, ICO)',
  `logo` varchar(200) DEFAULT NULL COMMENT 'Логотип',
  `slogan` varchar(255) DEFAULT NULL COMMENT 'Лозунг',
  `firm_name` varchar(255) DEFAULT NULL COMMENT 'Наименование организации',
  `firm_inn` varchar(12) DEFAULT NULL COMMENT 'ИНН организации',
  `firm_kpp` varchar(12) DEFAULT NULL COMMENT 'КПП организации',
  `firm_bank` varchar(255) DEFAULT NULL COMMENT 'Наименование банка',
  `firm_bik` varchar(10) DEFAULT NULL COMMENT 'БИК',
  `firm_rs` varchar(20) DEFAULT NULL COMMENT 'Расчетный счет',
  `firm_ks` varchar(20) DEFAULT NULL COMMENT 'Корреспондентский счет',
  `firm_director` varchar(70) DEFAULT NULL COMMENT 'Фамилия, инициалы руководителя',
  `firm_accountant` varchar(70) DEFAULT NULL COMMENT 'Фамилия, инициалы главного бухгалтера',
  `firm_v_lice` varchar(255) DEFAULT NULL COMMENT 'Компания представлена в лице ...',
  `firm_deistvuet` varchar(255) DEFAULT NULL COMMENT 'действует на основании ...',
  `firm_address` varchar(255) DEFAULT NULL COMMENT 'Фактический адрес компании',
  `firm_legal_address` varchar(255) DEFAULT NULL COMMENT 'Юридический адрес компании',
  `firm_email` varchar(255) DEFAULT NULL COMMENT 'Официальный Email компании',
  `notice_from` varchar(255) DEFAULT NULL COMMENT 'Будет указано в письме в поле  ''От''',
  `notice_reply` varchar(255) DEFAULT NULL COMMENT 'Куда присылать ответные письма? (поле Reply)',
  `smtp_is_use` int(11) DEFAULT NULL COMMENT 'Использовать SMTP для отправки писем',
  `smtp_host` varchar(255) DEFAULT NULL COMMENT 'SMTP сервер',
  `smtp_port` varchar(10) DEFAULT NULL COMMENT 'SMTP порт',
  `smtp_secure` varchar(255) DEFAULT NULL COMMENT 'Тип шифрования',
  `smtp_auth` int(11) DEFAULT NULL COMMENT 'Требуется авторизация на SMTP сервере',
  `smtp_username` varchar(100) DEFAULT NULL COMMENT 'Имя пользователя SMTP',
  `smtp_password` varchar(100) DEFAULT NULL COMMENT 'Пароль SMTP',
  `facebook_group` varchar(255) DEFAULT NULL COMMENT 'Ссылка на группу в Facebook',
  `vkontakte_group` varchar(255) DEFAULT NULL COMMENT 'Ссылка на группу ВКонтакте',
  `twitter_group` varchar(255) DEFAULT NULL COMMENT 'Ссылка на страницу в Twitter',
  `instagram_group` varchar(255) DEFAULT NULL COMMENT 'Ссылка на страницу в Instagram',
  `youtube_group` varchar(255) DEFAULT NULL COMMENT 'Ссылка на страницу в YouTube',
  `policy_personal_data` mediumtext COMMENT 'Политика обработки персональных данных (ссылка /policy/)',
  `agreement_personal_data` mediumtext COMMENT 'Соглашение на обработку персональных данных (ссылка /policy-agreement/)',
  `enable_agreement_personal_data` int(11) DEFAULT NULL COMMENT 'Включить отображение соглашения на обработку персональных данных в формах',
  `firm_name_for_notice` varchar(255) DEFAULT NULL COMMENT 'Наименование организации в письмах'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_site_options`
--

INSERT INTO `md_site_options` (`site_id`, `admin_email`, `admin_phone`, `theme`, `favicon`, `logo`, `slogan`, `firm_name`, `firm_inn`, `firm_kpp`, `firm_bank`, `firm_bik`, `firm_rs`, `firm_ks`, `firm_director`, `firm_accountant`, `firm_v_lice`, `firm_deistvuet`, `firm_address`, `firm_legal_address`, `firm_email`, `notice_from`, `notice_reply`, `smtp_is_use`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_username`, `smtp_password`, `facebook_group`, `vkontakte_group`, `twitter_group`, `instagram_group`, `youtube_group`, `policy_personal_data`, `agreement_personal_data`, `enable_agreement_personal_data`, `firm_name_for_notice`) VALUES
(1, NULL, NULL, 'flatlines(blue)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `md_statistic_events`
--

CREATE TABLE `md_statistic_events` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `dateof` date DEFAULT NULL COMMENT 'Дата события',
  `type` varchar(255) DEFAULT NULL COMMENT 'Тип события',
  `details` mediumtext COMMENT 'Детали события',
  `count` int(11) NOT NULL DEFAULT '1' COMMENT 'Количество событий за данный день'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_statistic_source`
--

CREATE TABLE `md_statistic_source` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `partner_id` int(11) DEFAULT NULL COMMENT 'Партнёрский сайт',
  `source_type` int(11) DEFAULT NULL COMMENT 'Идентификатор типа источника на сайте',
  `referer_site` varchar(255) DEFAULT NULL COMMENT 'Сайт источник из поля реферер',
  `referer_source` mediumtext COMMENT 'Полный источник из поля реферер',
  `landing_page` varchar(255) DEFAULT NULL COMMENT 'Страница первого посещения',
  `utm_source` varchar(255) DEFAULT NULL COMMENT 'Рекламная система UTM_SOURCE',
  `utm_medium` varchar(255) DEFAULT NULL COMMENT 'Тип трафика UTM_MEDIUM',
  `utm_campaign` varchar(255) DEFAULT NULL COMMENT 'Рекламная кампания UTM_COMPAING',
  `utm_term` varchar(255) DEFAULT NULL COMMENT 'Ключевое слово UTM_TERM',
  `utm_content` varchar(255) DEFAULT NULL COMMENT 'Различия UTM_CONTENT',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата события'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_statistic_user_source_type`
--

CREATE TABLE `md_statistic_user_source_type` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Категория',
  `referer_site` varchar(255) DEFAULT NULL COMMENT 'Домен источника перехода',
  `referer_request_uri_regular` int(1) DEFAULT '0' COMMENT 'Использовать регулярное выражения для части адреса источника',
  `referer_request_uri` varchar(255) DEFAULT NULL COMMENT 'Часть адреса источника до знака ?',
  `params` mediumtext COMMENT 'Массив параметров адреса источника после знака ? в сериализованном виде',
  `sortn` int(11) DEFAULT '10' COMMENT 'Приоритет'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_statistic_user_source_type_dir`
--

CREATE TABLE `md_statistic_user_source_type_dir` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Название источника'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_subscribe_email`
--

CREATE TABLE `md_subscribe_email` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `email` varchar(250) DEFAULT NULL COMMENT 'E-mail',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата подписки',
  `confirm` int(1) DEFAULT '0' COMMENT 'Подтверждён?',
  `signature` varchar(250) DEFAULT NULL COMMENT 'Подпись для E-mail'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_support`
--

CREATE TABLE `md_support` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `topic` varchar(255) DEFAULT NULL COMMENT 'Тема',
  `user_id` int(11) DEFAULT NULL COMMENT 'Пользователь',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата отправки',
  `message` mediumtext COMMENT 'Сообщение',
  `processed` int(1) DEFAULT NULL COMMENT 'Флаг прочтения',
  `is_admin` int(1) DEFAULT NULL COMMENT 'Это администратор',
  `topic_id` int(11) DEFAULT NULL COMMENT 'ID темы'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_support_topic`
--

CREATE TABLE `md_support_topic` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Тема',
  `user_id` bigint(11) DEFAULT NULL COMMENT 'Пользователь',
  `updated` datetime DEFAULT NULL COMMENT 'Дата обновления',
  `msgcount` int(11) DEFAULT NULL COMMENT 'Всего сообщений',
  `newcount` int(11) DEFAULT NULL COMMENT 'Новых сообщений',
  `newadmcount` int(11) DEFAULT NULL COMMENT 'Новых для администратора'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_tags_links`
--

CREATE TABLE `md_tags_links` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `word_id` bigint(11) DEFAULT NULL COMMENT 'ID тега',
  `type` varchar(20) DEFAULT NULL COMMENT 'Тип связи',
  `link_id` int(11) DEFAULT NULL COMMENT 'ID объекта, с которым связан тег'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_tags_words`
--

CREATE TABLE `md_tags_words` (
  `id` bigint(11) NOT NULL,
  `stemmed` varchar(255) DEFAULT NULL COMMENT 'Тег без окончания',
  `word` varchar(255) DEFAULT NULL COMMENT 'Тег',
  `alias` varchar(255) DEFAULT NULL COMMENT 'Английское название тега'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_tpl_hook_sort`
--

CREATE TABLE `md_tpl_hook_sort` (
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `context` varchar(100) DEFAULT NULL COMMENT 'Контекст темы оформления',
  `hook_name` varchar(100) DEFAULT NULL COMMENT 'Идентификатор хука',
  `module` varchar(50) DEFAULT NULL COMMENT 'Идентификатор модуля',
  `sortn` varchar(255) DEFAULT NULL COMMENT 'Порядковый номер'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_transaction`
--

CREATE TABLE `md_transaction` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата транзакции',
  `user_id` bigint(11) DEFAULT NULL COMMENT 'Пользователь',
  `order_id` int(11) DEFAULT NULL COMMENT 'ID заказа',
  `personal_account` int(1) DEFAULT NULL COMMENT 'Транзакция изменяющая баланс лицевого счета',
  `cost` decimal(15,2) DEFAULT NULL COMMENT 'Сумма',
  `comission` decimal(15,2) DEFAULT NULL COMMENT 'Сумма комиссии платежной системы',
  `payment` int(11) DEFAULT NULL COMMENT 'Тип оплаты',
  `reason` mediumtext COMMENT 'Назначение платежа',
  `error` varchar(255) DEFAULT NULL COMMENT 'Ошибка',
  `status` enum('new','success','fail') NOT NULL COMMENT 'Статус транзакции',
  `receipt` enum('no_receipt','receipt_in_progress','receipt_success','refund_success','fail') NOT NULL DEFAULT 'no_receipt' COMMENT 'Последний статус получения чека',
  `refunded` int(1) DEFAULT '0' COMMENT 'Дополнительное поле для данных',
  `sign` varchar(255) DEFAULT NULL COMMENT 'Подпись транзакции',
  `entity` varchar(50) DEFAULT NULL COMMENT 'Сущность к которой привязана транзакция',
  `entity_id` bigint(11) DEFAULT NULL COMMENT 'ID сущности, к которой привязана транзакция',
  `extra` varchar(4096) DEFAULT NULL COMMENT 'Дополнительное поле для данных',
  `cashregister_last_operation_uuid` varchar(255) DEFAULT NULL COMMENT 'Последний уникальный идентификатор полученный в ответ от кассы',
  `partner_id` int(11) DEFAULT '0' COMMENT 'Партнёрский сайт'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_try_auth`
--

CREATE TABLE `md_try_auth` (
  `ip` varchar(255) NOT NULL COMMENT 'IP-адрес',
  `total` int(11) DEFAULT NULL COMMENT 'Количество попыток авторизации',
  `last_try_dateof` datetime DEFAULT NULL COMMENT 'Дата последней попытки авторизации',
  `try_login` varchar(255) DEFAULT NULL COMMENT 'Логин, последней попытки авторизации'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `md_users`
--

CREATE TABLE `md_users` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `name` varchar(100) DEFAULT NULL COMMENT 'Имя',
  `surname` varchar(100) DEFAULT NULL COMMENT 'Фамилия',
  `midname` varchar(100) DEFAULT NULL COMMENT 'Отчество',
  `e_mail` varchar(150) DEFAULT NULL COMMENT 'E-mail',
  `login` varchar(64) DEFAULT NULL COMMENT 'Логин',
  `pass` varchar(32) DEFAULT NULL COMMENT 'Пароль',
  `phone` varchar(50) DEFAULT NULL COMMENT 'Телефон',
  `sex` varchar(1) DEFAULT NULL COMMENT 'Пол',
  `hash` varchar(64) DEFAULT NULL COMMENT 'Ключ',
  `subscribe_on` int(1) DEFAULT NULL COMMENT 'Получать рассылку',
  `dateofreg` datetime DEFAULT NULL COMMENT 'Дата регистрации',
  `balance` decimal(15,2) NOT NULL COMMENT 'Баланс',
  `balance_sign` varchar(255) DEFAULT NULL COMMENT 'Подпись баланса',
  `ban_expire` datetime DEFAULT NULL COMMENT 'Заблокировать до ...',
  `ban_reason` varchar(255) DEFAULT NULL COMMENT 'Причина блокировки',
  `last_visit` datetime DEFAULT NULL COMMENT 'Последний визит',
  `last_ip` varchar(100) DEFAULT NULL COMMENT 'Последний IP, который использовался',
  `registration_ip` varchar(100) DEFAULT NULL COMMENT 'IP пользователя при регистрации',
  `is_company` int(1) DEFAULT NULL COMMENT 'Это юридическое лицо?',
  `company` varchar(255) DEFAULT NULL COMMENT 'Название организации',
  `company_inn` varchar(12) DEFAULT NULL COMMENT 'ИНН организации',
  `_serialized` mediumtext,
  `cost_id` varchar(1000) DEFAULT NULL COMMENT 'Персональная цена (сериализованная)',
  `manager_user_id` int(11) NOT NULL COMMENT 'Менеджер пользователя',
  `source_id` int(11) DEFAULT '0' COMMENT 'Источник перехода',
  `date_arrive` datetime DEFAULT NULL COMMENT 'Дата первого посещения'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_users`
--

INSERT INTO `md_users` (`id`, `name`, `surname`, `midname`, `e_mail`, `login`, `pass`, `phone`, `sex`, `hash`, `subscribe_on`, `dateofreg`, `balance`, `balance_sign`, `ban_expire`, `ban_reason`, `last_visit`, `last_ip`, `registration_ip`, `is_company`, `company`, `company_inn`, `_serialized`, `cost_id`, `manager_user_id`, `source_id`, `date_arrive`) VALUES
(1, 'Супервизор', ' ', ' ', 'prog@2-br.ru', 'prog@2-br.ru', 'bc3cc484268b73d6c41263acf07fec7b', NULL, NULL, '72b92a8a9e6e4488da2f07bc500d12cd608ccae9246dc6f7333a752a9580cb36', NULL, '2019-02-11 09:32:01', '0.00', NULL, NULL, NULL, '2019-02-11 09:33:18', '127.0.0.1', '127.0.0.1', NULL, NULL, NULL, 'N;', NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `md_users_group`
--

CREATE TABLE `md_users_group` (
  `alias` varchar(50) NOT NULL COMMENT 'Псевдоним(англ.яз)',
  `name` varchar(100) DEFAULT NULL COMMENT 'Название группы',
  `description` mediumtext COMMENT 'Описание',
  `is_admin` int(1) DEFAULT NULL COMMENT 'Администратор',
  `sortn` int(11) DEFAULT NULL COMMENT 'Сортировочный индекс',
  `cost_id` varchar(1000) DEFAULT NULL COMMENT 'Персональная цена (сериализованная)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_users_group`
--

INSERT INTO `md_users_group` (`alias`, `name`, `description`, `is_admin`, `sortn`, `cost_id`) VALUES
('supervisor', 'Супервизоры', 'Пользователь имеющий доступ абсолютно всегда ко всем  модулям и сайтам', 1, 1, NULL),
('admins', 'Администраторы', 'Пользователи, имеющие права на удаление, добавление, изменение контента', 1, 2, NULL),
('clients', 'Клиенты', 'Авторизованные пользователи', 0, 3, NULL),
('guest', 'Гости', 'Неавторизованные пользователи', 0, 4, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `md_users_in_group`
--

CREATE TABLE `md_users_in_group` (
  `user` int(11) NOT NULL COMMENT 'ID пользователя',
  `group` varchar(255) NOT NULL COMMENT 'ID группы пользователей'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_users_in_group`
--

INSERT INTO `md_users_in_group` (`user`, `group`) VALUES
(1, 'supervisor');

-- --------------------------------------------------------

--
-- Структура таблицы `md_users_log`
--

CREATE TABLE `md_users_log` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `dateof` datetime DEFAULT NULL COMMENT 'Дата',
  `class` varchar(255) DEFAULT NULL COMMENT 'Класс события',
  `oid` int(11) DEFAULT NULL COMMENT 'ID объекта над которым произошло событие',
  `group` int(11) DEFAULT NULL COMMENT 'ID Группы (перезаписывается, если событие происходит в рамках одной группы)',
  `user_id` bigint(11) DEFAULT NULL COMMENT 'ID Пользователя',
  `_serialized` varchar(4000) DEFAULT NULL COMMENT 'Дополнительные данные (скрыто)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_users_log`
--

INSERT INTO `md_users_log` (`id`, `site_id`, `dateof`, `class`, `oid`, `group`, `user_id`, `_serialized`) VALUES
(1, 1, '2019-02-11 09:33:17', 'Users\\Model\\Logtype\\AdminAuth', 1, NULL, -2887947692, 'a:1:{s:2:\"ip\";s:9:\"127.0.0.1\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `md_warehouse`
--

CREATE TABLE `md_warehouse` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `title` varchar(255) DEFAULT NULL COMMENT 'Короткое название',
  `alias` varchar(150) DEFAULT NULL COMMENT 'URL имя',
  `image` varchar(255) DEFAULT NULL COMMENT 'Картинка',
  `description` mediumtext COMMENT 'Описание',
  `adress` varchar(255) DEFAULT NULL COMMENT 'Адрес',
  `phone` varchar(255) DEFAULT NULL COMMENT 'Телефон',
  `work_time` varchar(255) DEFAULT NULL COMMENT 'Время работы',
  `coor_x` float DEFAULT '55.7533' COMMENT 'Координата X магазина',
  `coor_y` float DEFAULT '37.6226' COMMENT 'Координата Y магазина',
  `default_house` int(1) DEFAULT NULL COMMENT 'Склад по умолчанию',
  `public` int(1) DEFAULT NULL COMMENT 'Показывать склад в карточке товара',
  `checkout_public` int(1) DEFAULT NULL COMMENT 'Показывать склад как пункт самовывоза',
  `use_in_sitemap` int(11) DEFAULT '0' COMMENT 'Добавлять в sitemap',
  `xml_id` varchar(255) DEFAULT NULL COMMENT 'Идентификатор в системе 1C',
  `sortn` int(11) DEFAULT NULL COMMENT 'Индекс сортировки',
  `meta_title` varchar(1000) DEFAULT NULL COMMENT 'Заголовок',
  `meta_keywords` varchar(1000) DEFAULT NULL COMMENT 'Ключевые слова',
  `meta_description` varchar(1000) DEFAULT NULL COMMENT 'Описание',
  `affiliate_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Филиал',
  `yandex_market_point_id` varchar(255) DEFAULT NULL COMMENT 'ID точки продаж в Яндекс.Маркет'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_warehouse`
--

INSERT INTO `md_warehouse` (`id`, `site_id`, `title`, `alias`, `image`, `description`, `adress`, `phone`, `work_time`, `coor_x`, `coor_y`, `default_house`, `public`, `checkout_public`, `use_in_sitemap`, `xml_id`, `sortn`, `meta_title`, `meta_keywords`, `meta_description`, `affiliate_id`, `yandex_market_point_id`) VALUES
(1, 1, 'Основной склад', 'sklad', NULL, '<p>Наш склад находится в центре города. Предусмотрена удобная парковка для автомобилей и велосипедов. </p>', 'г. Краснодар, улица Красных Партизан, 246', '+7(123)456-78-90', 'с 9:00 до 18:00', 45.0483, 38.9745, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `md_widgets`
--

CREATE TABLE `md_widgets` (
  `id` int(11) NOT NULL COMMENT 'Уникальный идентификатор (ID)',
  `site_id` int(11) DEFAULT NULL COMMENT 'ID сайта',
  `user_id` int(11) DEFAULT NULL,
  `mode2_column` int(5) DEFAULT NULL COMMENT 'Колонка виджета в двухколоночной сетке',
  `mode3_column` int(5) DEFAULT NULL COMMENT 'Колонка виджета в трехколоночной сетке',
  `mode1_position` int(5) DEFAULT NULL COMMENT 'Позиция виджета в одноколоночной сетке',
  `mode2_position` int(5) DEFAULT NULL COMMENT 'Позиция виджета в двухколоночной сетке',
  `mode3_position` int(5) DEFAULT NULL COMMENT 'Позиция виджета в трехколоночной сетке',
  `class` varchar(255) DEFAULT NULL,
  `vars` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `md_widgets`
--

INSERT INTO `md_widgets` (`id`, `site_id`, `user_id`, `mode2_column`, `mode3_column`, `mode1_position`, `mode2_position`, `mode3_position`, `class`, `vars`) VALUES
(1, 1, 1, 2, 2, 0, 0, 2, 'comments-widget-newlist', NULL),
(2, 1, 1, 1, 3, 1, 0, 0, 'users-widget-authlog', NULL),
(3, 1, 1, 2, 2, 2, 1, 1, 'main-widget-bestsellers', NULL),
(4, 1, 1, 1, 3, 3, 1, 1, 'antivirus-widget-stateinfo', NULL),
(5, 1, 1, 2, 2, 4, 2, 3, 'crm-widget-task', NULL),
(6, 1, 1, 2, 2, 5, 3, 0, 'marketplace-widget-newmodules', NULL),
(7, 1, 1, 1, 1, 6, 2, 1, 'notes-widget-notes', NULL),
(8, 1, 1, 2, 2, 7, 4, 4, 'statistic-widget-keyindicators', NULL),
(9, 1, 1, 2, 2, 8, 5, 5, 'statistic-widget-bestsellers', NULL),
(10, 1, 1, 1, 3, 9, 3, 2, 'statistic-widget-salesfunnel', NULL),
(11, 1, 1, 1, 1, 10, 4, 0, 'catalog-widget-watchnow', NULL),
(12, 1, 1, 1, 3, 11, 5, 3, 'catalog-widget-oneclick', NULL),
(13, 1, 1, 2, 2, 12, 6, 6, 'shop-widget-sellchart', NULL),
(14, 1, 1, 1, 1, 13, 6, 2, 'shop-widget-lastorders', NULL),
(15, 1, 1, 1, 1, 14, 7, 3, 'shop-widget-orderstatuses', NULL),
(16, 1, 1, 1, 3, 15, 8, 4, 'shop-widget-reservation', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `md_access_menu`
--
ALTER TABLE `md_access_menu`
  ADD KEY `site_id_menu_type` (`site_id`,`menu_type`);

--
-- Индексы таблицы `md_access_module`
--
ALTER TABLE `md_access_module`
  ADD UNIQUE KEY `site_id_module_user_id_group_alias` (`site_id`,`module`,`user_id`,`group_alias`);

--
-- Индексы таблицы `md_access_module_right`
--
ALTER TABLE `md_access_module_right`
  ADD UNIQUE KEY `site_id_group_alias_module_right` (`site_id`,`group_alias`,`module`,`right`);

--
-- Индексы таблицы `md_access_site`
--
ALTER TABLE `md_access_site`
  ADD UNIQUE KEY `site_id_group_alias` (`site_id`,`group_alias`),
  ADD UNIQUE KEY `site_id_user_id` (`site_id`,`user_id`);

--
-- Индексы таблицы `md_affiliate`
--
ALTER TABLE `md_affiliate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_alias` (`site_id`,`alias`),
  ADD KEY `title` (`title`);

--
-- Индексы таблицы `md_antivirus_events`
--
ALTER TABLE `md_antivirus_events`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_antivirus_excluded_files`
--
ALTER TABLE `md_antivirus_excluded_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file` (`file`(333));

--
-- Индексы таблицы `md_antivirus_request_count`
--
ALTER TABLE `md_antivirus_request_count`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ip` (`ip`);

--
-- Индексы таблицы `md_article`
--
ALTER TABLE `md_article`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_parent_alias` (`site_id`,`parent`,`alias`),
  ADD KEY `site_id_parent` (`site_id`,`parent`),
  ADD KEY `alias` (`alias`),
  ADD KEY `parent` (`parent`),
  ADD KEY `dateof` (`dateof`);

--
-- Индексы таблицы `md_article_category`
--
ALTER TABLE `md_article_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parent_site_id_alias` (`parent`,`site_id`,`alias`);

--
-- Индексы таблицы `md_banner`
--
ALTER TABLE `md_banner`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_banner_x_zone`
--
ALTER TABLE `md_banner_x_zone`
  ADD UNIQUE KEY `zone_id_banner_id` (`zone_id`,`banner_id`);

--
-- Индексы таблицы `md_banner_zone`
--
ALTER TABLE `md_banner_zone`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_blocked_ip`
--
ALTER TABLE `md_blocked_ip`
  ADD PRIMARY KEY (`ip`);

--
-- Индексы таблицы `md_brand`
--
ALTER TABLE `md_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_alias` (`site_id`,`alias`),
  ADD KEY `public` (`public`),
  ADD KEY `sortn` (`sortn`);

--
-- Индексы таблицы `md_cart`
--
ALTER TABLE `md_cart`
  ADD PRIMARY KEY (`site_id`,`session_id`,`uniq`);

--
-- Индексы таблицы `md_comments`
--
ALTER TABLE `md_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `md_comments_votes`
--
ALTER TABLE `md_comments_votes`
  ADD UNIQUE KEY `ip_comment_id` (`ip`,`comment_id`);

--
-- Индексы таблицы `md_connect_form`
--
ALTER TABLE `md_connect_form`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_connect_form_field`
--
ALTER TABLE `md_connect_form_field`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_connect_form_result`
--
ALTER TABLE `md_connect_form_result`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_crm_autotaskrule`
--
ALTER TABLE `md_crm_autotaskrule`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_crm_custom_data`
--
ALTER TABLE `md_crm_custom_data`
  ADD PRIMARY KEY (`object_type_alias`,`object_id`,`field`),
  ADD KEY `object_type_alias_object_id_value_float` (`object_type_alias`,`object_id`,`value_float`),
  ADD KEY `object_type_alias_object_id_value_string` (`object_type_alias`,`object_id`,`value_string`);

--
-- Индексы таблицы `md_crm_deal`
--
ALTER TABLE `md_crm_deal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deal_num` (`deal_num`);

--
-- Индексы таблицы `md_crm_interaction`
--
ALTER TABLE `md_crm_interaction`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_crm_link`
--
ALTER TABLE `md_crm_link`
  ADD UNIQUE KEY `source_type_source_id_link_type_link_id` (`source_type`,`source_id`,`link_type`,`link_id`);

--
-- Индексы таблицы `md_crm_statuses`
--
ALTER TABLE `md_crm_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_type_alias_alias` (`object_type_alias`,`alias`),
  ADD KEY `object_type_alias` (`object_type_alias`);

--
-- Индексы таблицы `md_crm_task`
--
ALTER TABLE `md_crm_task`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `task_num` (`task_num`),
  ADD KEY `expiration_notice_is_send_date_of_planned_end_status_id` (`expiration_notice_is_send`,`date_of_planned_end`,`status_id`);

--
-- Индексы таблицы `md_crm_task_filter`
--
ALTER TABLE `md_crm_task_filter`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_csv_map`
--
ALTER TABLE `md_csv_map`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_currency`
--
ALTER TABLE `md_currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_site_id` (`title`,`site_id`);

--
-- Индексы таблицы `md_document_inventorization`
--
ALTER TABLE `md_document_inventorization`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_document_inventory`
--
ALTER TABLE `md_document_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_document_inventory_products`
--
ALTER TABLE `md_document_inventory_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_document_movement`
--
ALTER TABLE `md_document_movement`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_document_movement_products`
--
ALTER TABLE `md_document_movement_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_document_products`
--
ALTER TABLE `md_document_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_offer_id_warehouse` (`product_id`,`offer_id`,`warehouse`),
  ADD KEY `document_id` (`document_id`);

--
-- Индексы таблицы `md_document_products_archive`
--
ALTER TABLE `md_document_products_archive`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_offer_id_warehouse` (`product_id`,`offer_id`,`warehouse`),
  ADD KEY `document_id` (`document_id`);

--
-- Индексы таблицы `md_document_products_start_num`
--
ALTER TABLE `md_document_products_start_num`
  ADD UNIQUE KEY `product_id_offer_id_warehouse_id` (`product_id`,`offer_id`,`warehouse_id`),
  ADD KEY `offer_id` (`offer_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Индексы таблицы `md_exchange_history`
--
ALTER TABLE `md_exchange_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dateof` (`dateof`);

--
-- Индексы таблицы `md_export_profile`
--
ALTER TABLE `md_export_profile`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_external_api_log`
--
ALTER TABLE `md_external_api_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dateof` (`dateof`);

--
-- Индексы таблицы `md_fast_link`
--
ALTER TABLE `md_fast_link`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_files`
--
ALTER TABLE `md_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `servername_link_type_class_link_id` (`servername`,`link_type_class`,`link_id`),
  ADD UNIQUE KEY `xml_id` (`xml_id`),
  ADD UNIQUE KEY `uniq` (`uniq`),
  ADD UNIQUE KEY `uniq_name` (`uniq_name`),
  ADD KEY `access` (`access`);

--
-- Индексы таблицы `md_hash_store`
--
ALTER TABLE `md_hash_store`
  ADD PRIMARY KEY (`hash`);

--
-- Индексы таблицы `md_images`
--
ALTER TABLE `md_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `servername_type_linkid` (`servername`,`type`,`linkid`),
  ADD KEY `linkid_type` (`linkid`,`type`),
  ADD KEY `linkid_sortn` (`linkid`,`sortn`),
  ADD KEY `servername` (`servername`);

--
-- Индексы таблицы `md_license`
--
ALTER TABLE `md_license`
  ADD PRIMARY KEY (`license`);

--
-- Индексы таблицы `md_menu`
--
ALTER TABLE `md_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_alias_parent` (`site_id`,`alias`,`parent`),
  ADD KEY `parent_sortn` (`parent`,`sortn`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `md_module_config`
--
ALTER TABLE `md_module_config`
  ADD PRIMARY KEY (`site_id`,`module`);

--
-- Индексы таблицы `md_notes_note`
--
ALTER TABLE `md_notes_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `creator_user_id` (`creator_user_id`);

--
-- Индексы таблицы `md_notice_config`
--
ALTER TABLE `md_notice_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_class` (`site_id`,`class`);

--
-- Индексы таблицы `md_notice_item`
--
ALTER TABLE `md_notice_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destination_user_id_notice_type` (`destination_user_id`,`notice_type`);

--
-- Индексы таблицы `md_notice_lock`
--
ALTER TABLE `md_notice_lock`
  ADD UNIQUE KEY `site_id_user_id_notice_type` (`site_id`,`user_id`,`notice_type`);

--
-- Индексы таблицы `md_one_click`
--
ALTER TABLE `md_one_click`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_order`
--
ALTER TABLE `md_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_order_num` (`site_id`,`order_num`),
  ADD KEY `dateof_profit` (`dateof`,`profit`),
  ADD KEY `dateof_totalcost` (`dateof`,`totalcost`),
  ADD KEY `manager_user_id` (`manager_user_id`),
  ADD KEY `status` (`status`);

--
-- Индексы таблицы `md_order_action_template`
--
ALTER TABLE `md_order_action_template`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_order_address`
--
ALTER TABLE `md_order_address`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_order_delivery`
--
ALTER TABLE `md_order_delivery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_order_delivery_dir`
--
ALTER TABLE `md_order_delivery_dir`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_order_delivery_x_zone`
--
ALTER TABLE `md_order_delivery_x_zone`
  ADD UNIQUE KEY `delivery_id_zone_id` (`delivery_id`,`zone_id`);

--
-- Индексы таблицы `md_order_discount`
--
ALTER TABLE `md_order_discount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_code` (`site_id`,`code`);

--
-- Индексы таблицы `md_order_items`
--
ALTER TABLE `md_order_items`
  ADD PRIMARY KEY (`order_id`,`uniq`),
  ADD KEY `type_entity_id` (`type`,`entity_id`),
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `md_order_payment`
--
ALTER TABLE `md_order_payment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_order_products_return`
--
ALTER TABLE `md_order_products_return`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `return_num` (`return_num`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `dateof` (`dateof`);

--
-- Индексы таблицы `md_order_products_return_item`
--
ALTER TABLE `md_order_products_return_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`);

--
-- Индексы таблицы `md_order_regions`
--
ALTER TABLE `md_order_regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id_parent_id_is_city` (`site_id`,`parent_id`,`is_city`);

--
-- Индексы таблицы `md_order_substatus`
--
ALTER TABLE `md_order_substatus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_alias` (`site_id`,`alias`);

--
-- Индексы таблицы `md_order_tax`
--
ALTER TABLE `md_order_tax`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_order_tax_rate`
--
ALTER TABLE `md_order_tax_rate`
  ADD UNIQUE KEY `tax_id_region_id` (`tax_id`,`region_id`);

--
-- Индексы таблицы `md_order_userstatus`
--
ALTER TABLE `md_order_userstatus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_type` (`site_id`,`type`);

--
-- Индексы таблицы `md_order_x_region`
--
ALTER TABLE `md_order_x_region`
  ADD UNIQUE KEY `zone_id_region_id` (`zone_id`,`region_id`);

--
-- Индексы таблицы `md_order_zone`
--
ALTER TABLE `md_order_zone`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_page_seo`
--
ALTER TABLE `md_page_seo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_route_id` (`site_id`,`route_id`);

--
-- Индексы таблицы `md_partnership`
--
ALTER TABLE `md_partnership`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_product`
--
ALTER TABLE `md_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_xml_id` (`site_id`,`xml_id`),
  ADD UNIQUE KEY `site_id_alias` (`site_id`,`alias`),
  ADD KEY `site_id_public_num` (`site_id`,`public`,`num`),
  ADD KEY `site_id_public_dateof` (`site_id`,`public`,`dateof`),
  ADD KEY `site_id_public_sortn` (`site_id`,`public`,`sortn`),
  ADD KEY `site_id_group_id` (`site_id`,`group_id`),
  ADD KEY `barcode` (`barcode`),
  ADD KEY `dateof` (`dateof`),
  ADD KEY `public` (`public`),
  ADD KEY `maindir` (`maindir`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `format` (`format`);

--
-- Индексы таблицы `md_product_dir`
--
ALTER TABLE `md_product_dir`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_xml_id` (`site_id`,`xml_id`),
  ADD UNIQUE KEY `site_id_alias` (`site_id`,`alias`),
  ADD KEY `site_id_parent` (`site_id`,`parent`),
  ADD KEY `site_id_name_parent` (`site_id`,`name`,`parent`),
  ADD KEY `level` (`level`);

--
-- Индексы таблицы `md_product_favorite`
--
ALTER TABLE `md_product_favorite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guest_id_user_id_product_id` (`guest_id`,`user_id`,`product_id`);

--
-- Индексы таблицы `md_product_multioffer`
--
ALTER TABLE `md_product_multioffer`
  ADD UNIQUE KEY `product_id_prop_id` (`product_id`,`prop_id`);

--
-- Индексы таблицы `md_product_offer`
--
ALTER TABLE `md_product_offer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_xml_id` (`site_id`,`xml_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `barcode` (`barcode`);

--
-- Индексы таблицы `md_product_prop`
--
ALTER TABLE `md_product_prop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_alias` (`site_id`,`alias`),
  ADD UNIQUE KEY `site_id_xml_id` (`site_id`,`xml_id`),
  ADD KEY `title` (`title`);

--
-- Индексы таблицы `md_product_prop_dir`
--
ALTER TABLE `md_product_prop_dir`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_product_prop_link`
--
ALTER TABLE `md_product_prop_link`
  ADD UNIQUE KEY `site_id_product_id_group_id` (`site_id`,`product_id`,`group_id`),
  ADD KEY `site_id_prop_id` (`site_id`,`prop_id`),
  ADD KEY `product_id_prop_id_val_str_available` (`product_id`,`prop_id`,`val_str`,`available`),
  ADD KEY `product_id_prop_id_val_int_available` (`product_id`,`prop_id`,`val_int`,`available`),
  ADD KEY `product_id_prop_id_val_list_id_available` (`product_id`,`prop_id`,`val_list_id`,`available`),
  ADD KEY `prop_id_val_list_id` (`prop_id`,`val_list_id`),
  ADD KEY `group_id_public` (`group_id`,`public`);

--
-- Индексы таблицы `md_product_prop_value`
--
ALTER TABLE `md_product_prop_value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prop_id_value` (`prop_id`,`value`),
  ADD UNIQUE KEY `site_id_xml_id` (`site_id`,`xml_id`),
  ADD UNIQUE KEY `site_id_alias_prop_id` (`site_id`,`alias`,`prop_id`);

--
-- Индексы таблицы `md_product_reservation`
--
ALTER TABLE `md_product_reservation`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_product_typecost`
--
ALTER TABLE `md_product_typecost`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_xml_id` (`site_id`,`xml_id`);

--
-- Индексы таблицы `md_product_unit`
--
ALTER TABLE `md_product_unit`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_product_x_cost`
--
ALTER TABLE `md_product_x_cost`
  ADD UNIQUE KEY `product_id_cost_id` (`product_id`,`cost_id`);

--
-- Индексы таблицы `md_product_x_dir`
--
ALTER TABLE `md_product_x_dir`
  ADD UNIQUE KEY `dir_id_product_id` (`dir_id`,`product_id`);

--
-- Индексы таблицы `md_product_x_stock`
--
ALTER TABLE `md_product_x_stock`
  ADD UNIQUE KEY `product_id_offer_id_warehouse_id` (`product_id`,`offer_id`,`warehouse_id`),
  ADD KEY `offer_id` (`offer_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Индексы таблицы `md_pushsender_push_lock`
--
ALTER TABLE `md_pushsender_push_lock`
  ADD UNIQUE KEY `site_id_user_id_app_push_class` (`site_id`,`user_id`,`app`,`push_class`);

--
-- Индексы таблицы `md_pushsender_user_token`
--
ALTER TABLE `md_pushsender_user_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_push_token` (`user_id`,`push_token`),
  ADD UNIQUE KEY `app_uuid` (`app`,`uuid`),
  ADD KEY `model_platform` (`model`,`platform`);

--
-- Индексы таблицы `md_readed_item`
--
ALTER TABLE `md_readed_item`
  ADD UNIQUE KEY `site_id_user_id_entity_entity_id` (`site_id`,`user_id`,`entity`,`entity_id`);

--
-- Индексы таблицы `md_receipt`
--
ALTER TABLE `md_receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id_provider` (`transaction_id`,`provider`),
  ADD KEY `sign` (`sign`),
  ADD KEY `uniq_id` (`uniq_id`);

--
-- Индексы таблицы `md_search_index`
--
ALTER TABLE `md_search_index`
  ADD PRIMARY KEY (`result_class`,`entity_id`);
ALTER TABLE `md_search_index` ADD FULLTEXT KEY `title_indextext` (`title`,`indextext`);

--
-- Индексы таблицы `md_sections`
--
ALTER TABLE `md_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `md_section_containers`
--
ALTER TABLE `md_section_containers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`);

--
-- Индексы таблицы `md_section_context`
--
ALTER TABLE `md_section_context`
  ADD PRIMARY KEY (`site_id`,`context`);

--
-- Индексы таблицы `md_section_modules`
--
ALTER TABLE `md_section_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`);

--
-- Индексы таблицы `md_section_page`
--
ALTER TABLE `md_section_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_route_id_context` (`site_id`,`route_id`,`context`);

--
-- Индексы таблицы `md_sites`
--
ALTER TABLE `md_sites`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_site_options`
--
ALTER TABLE `md_site_options`
  ADD PRIMARY KEY (`site_id`);

--
-- Индексы таблицы `md_statistic_events`
--
ALTER TABLE `md_statistic_events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_dateof_type` (`site_id`,`dateof`,`type`),
  ADD KEY `dateof` (`dateof`);

--
-- Индексы таблицы `md_statistic_source`
--
ALTER TABLE `md_statistic_source`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_id` (`partner_id`),
  ADD KEY `dateof` (`dateof`);

--
-- Индексы таблицы `md_statistic_user_source_type`
--
ALTER TABLE `md_statistic_user_source_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_statistic_user_source_type_dir`
--
ALTER TABLE `md_statistic_user_source_type_dir`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_subscribe_email`
--
ALTER TABLE `md_subscribe_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_confirm` (`email`,`confirm`),
  ADD KEY `signature` (`signature`);

--
-- Индексы таблицы `md_support`
--
ALTER TABLE `md_support`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_support_topic`
--
ALTER TABLE `md_support_topic`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `md_tags_links`
--
ALTER TABLE `md_tags_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `word_id_type_link_id` (`word_id`,`type`,`link_id`);

--
-- Индексы таблицы `md_tags_words`
--
ALTER TABLE `md_tags_words`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`),
  ADD KEY `stemmed` (`stemmed`);

--
-- Индексы таблицы `md_tpl_hook_sort`
--
ALTER TABLE `md_tpl_hook_sort`
  ADD UNIQUE KEY `site_id_context_hook_name_module` (`site_id`,`context`,`hook_name`,`module`),
  ADD KEY `sortn` (`sortn`);

--
-- Индексы таблицы `md_transaction`
--
ALTER TABLE `md_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entity_entity_id` (`entity`,`entity_id`);

--
-- Индексы таблицы `md_try_auth`
--
ALTER TABLE `md_try_auth`
  ADD PRIMARY KEY (`ip`);

--
-- Индексы таблицы `md_users`
--
ALTER TABLE `md_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `e_mail` (`e_mail`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `hash` (`hash`),
  ADD KEY `manager_user_id` (`manager_user_id`);

--
-- Индексы таблицы `md_users_group`
--
ALTER TABLE `md_users_group`
  ADD PRIMARY KEY (`alias`),
  ADD KEY `sortn` (`sortn`);

--
-- Индексы таблицы `md_users_in_group`
--
ALTER TABLE `md_users_in_group`
  ADD PRIMARY KEY (`user`,`group`);

--
-- Индексы таблицы `md_users_log`
--
ALTER TABLE `md_users_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_user_id_group` (`class`,`user_id`,`group`),
  ADD KEY `site_id_class` (`site_id`,`class`);

--
-- Индексы таблицы `md_warehouse`
--
ALTER TABLE `md_warehouse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_xml_id` (`site_id`,`xml_id`),
  ADD UNIQUE KEY `site_id_alias` (`site_id`,`alias`),
  ADD KEY `coor_x_coor_y` (`coor_x`,`coor_y`),
  ADD KEY `alias` (`alias`),
  ADD KEY `public` (`public`);

--
-- Индексы таблицы `md_widgets`
--
ALTER TABLE `md_widgets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_id_user_id_class` (`site_id`,`user_id`,`class`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `md_affiliate`
--
ALTER TABLE `md_affiliate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_antivirus_events`
--
ALTER TABLE `md_antivirus_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_antivirus_excluded_files`
--
ALTER TABLE `md_antivirus_excluded_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_antivirus_request_count`
--
ALTER TABLE `md_antivirus_request_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `md_article`
--
ALTER TABLE `md_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_article_category`
--
ALTER TABLE `md_article_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_banner`
--
ALTER TABLE `md_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_banner_zone`
--
ALTER TABLE `md_banner_zone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_brand`
--
ALTER TABLE `md_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_comments`
--
ALTER TABLE `md_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_connect_form`
--
ALTER TABLE `md_connect_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `md_connect_form_field`
--
ALTER TABLE `md_connect_form_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `md_connect_form_result`
--
ALTER TABLE `md_connect_form_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_crm_autotaskrule`
--
ALTER TABLE `md_crm_autotaskrule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_crm_deal`
--
ALTER TABLE `md_crm_deal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_crm_interaction`
--
ALTER TABLE `md_crm_interaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_crm_statuses`
--
ALTER TABLE `md_crm_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `md_crm_task`
--
ALTER TABLE `md_crm_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_crm_task_filter`
--
ALTER TABLE `md_crm_task_filter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_csv_map`
--
ALTER TABLE `md_csv_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_currency`
--
ALTER TABLE `md_currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `md_document_inventorization`
--
ALTER TABLE `md_document_inventorization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_document_inventory`
--
ALTER TABLE `md_document_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_document_inventory_products`
--
ALTER TABLE `md_document_inventory_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_document_movement`
--
ALTER TABLE `md_document_movement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_document_movement_products`
--
ALTER TABLE `md_document_movement_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_document_products`
--
ALTER TABLE `md_document_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_document_products_archive`
--
ALTER TABLE `md_document_products_archive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_exchange_history`
--
ALTER TABLE `md_exchange_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_export_profile`
--
ALTER TABLE `md_export_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_external_api_log`
--
ALTER TABLE `md_external_api_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_fast_link`
--
ALTER TABLE `md_fast_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_files`
--
ALTER TABLE `md_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_images`
--
ALTER TABLE `md_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_menu`
--
ALTER TABLE `md_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `md_notes_note`
--
ALTER TABLE `md_notes_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_notice_config`
--
ALTER TABLE `md_notice_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `md_notice_item`
--
ALTER TABLE `md_notice_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_one_click`
--
ALTER TABLE `md_one_click`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_order`
--
ALTER TABLE `md_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_order_action_template`
--
ALTER TABLE `md_order_action_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_order_address`
--
ALTER TABLE `md_order_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_order_delivery`
--
ALTER TABLE `md_order_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_order_delivery_dir`
--
ALTER TABLE `md_order_delivery_dir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_order_discount`
--
ALTER TABLE `md_order_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_order_payment`
--
ALTER TABLE `md_order_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `md_order_products_return`
--
ALTER TABLE `md_order_products_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_order_products_return_item`
--
ALTER TABLE `md_order_products_return_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_order_regions`
--
ALTER TABLE `md_order_regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=1208;
--
-- AUTO_INCREMENT для таблицы `md_order_substatus`
--
ALTER TABLE `md_order_substatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `md_order_tax`
--
ALTER TABLE `md_order_tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_order_userstatus`
--
ALTER TABLE `md_order_userstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `md_order_zone`
--
ALTER TABLE `md_order_zone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `md_page_seo`
--
ALTER TABLE `md_page_seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_partnership`
--
ALTER TABLE `md_partnership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_product`
--
ALTER TABLE `md_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_product_dir`
--
ALTER TABLE `md_product_dir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_product_favorite`
--
ALTER TABLE `md_product_favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_product_offer`
--
ALTER TABLE `md_product_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_product_prop`
--
ALTER TABLE `md_product_prop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_product_prop_dir`
--
ALTER TABLE `md_product_prop_dir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_product_prop_value`
--
ALTER TABLE `md_product_prop_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_product_reservation`
--
ALTER TABLE `md_product_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_product_typecost`
--
ALTER TABLE `md_product_typecost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `md_product_unit`
--
ALTER TABLE `md_product_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_pushsender_user_token`
--
ALTER TABLE `md_pushsender_user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_receipt`
--
ALTER TABLE `md_receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_sections`
--
ALTER TABLE `md_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT для таблицы `md_section_containers`
--
ALTER TABLE `md_section_containers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `md_section_modules`
--
ALTER TABLE `md_section_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT для таблицы `md_section_page`
--
ALTER TABLE `md_section_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT для таблицы `md_sites`
--
ALTER TABLE `md_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `md_statistic_events`
--
ALTER TABLE `md_statistic_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_statistic_source`
--
ALTER TABLE `md_statistic_source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_statistic_user_source_type`
--
ALTER TABLE `md_statistic_user_source_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_statistic_user_source_type_dir`
--
ALTER TABLE `md_statistic_user_source_type_dir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_subscribe_email`
--
ALTER TABLE `md_subscribe_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_support`
--
ALTER TABLE `md_support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_support_topic`
--
ALTER TABLE `md_support_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_tags_links`
--
ALTER TABLE `md_tags_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_tags_words`
--
ALTER TABLE `md_tags_words`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `md_transaction`
--
ALTER TABLE `md_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)';
--
-- AUTO_INCREMENT для таблицы `md_users`
--
ALTER TABLE `md_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `md_users_log`
--
ALTER TABLE `md_users_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `md_warehouse`
--
ALTER TABLE `md_warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `md_widgets`
--
ALTER TABLE `md_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор (ID)', AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
