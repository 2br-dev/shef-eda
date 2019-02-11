<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Main\Controller\Admin;

use RS\Application\Application;
use RS\Application\Auth as AppAuth;
use RS\Cache\Cleaner as CacheCleaner;
use Main\Model\NoticeSystem\Meter;
use RS\Controller\AbstractController;
use RS\Controller\Result\Standard as ResultStandard;
use RS\Controller\Result\Standard;
use RS\Debug\Mode as DebugMode;
use RS\Helper\Tools as HelperTools;
use RS\Language\Core as LanguageCore;
use RS\Site\Manager as SiteManager;
use Users\Model\Api as UsersApi;

/**
 * Основной контроллер администраторской панели
 * Предает управление фронт-кнтроллерам модулей
 * @ingroup Main
 */
class Index extends AbstractController
{

    public function __construct()
    {
        parent::__construct();
        $this->app->title->addSection(t('Административная панель'));
        $this->app->setJsDefaultFooterPosition(false);
        $this->app->addJsVar(array(
            'authUrl' => $this->router->getAdminUrl(false, array('Act' => 'auth'), false),
        ));
        $this->app->meta->add(array('name' => 'robots', 'content' => 'noindex, nofollow'));
    }

    /**
     * Точка входа в администраторскую панель
     *
     * @return mixed
     */
    public function actionIndex()
    {
        if ($auth = $this->needAuthorize(null, true)) {
            return $auth; //Требуется авторизация
        }

        if (SiteManager::getAdminCurrentSite() === false) {
            return $this->authPage(t('Вы не имеете прав на администрирование ни одного сайта'));
        }

        $this->app->setBaseJs(\Setup::$JS_PATH);
        $this->app->setBaseCss(\Setup::$CSS_PATH . '/admin');

        $meter = Meter::getInstance();

        if (!$this->url->isAjax()) {
            $this->app->addJsVar(array(
                'adminSection' => '/' . \Setup::$ADMIN_SECTION,
                'scriptType' => \Setup::$SCRIPT_TYPE,
                'resImgUrl' => \Setup::$IMG_PATH,
                'meterNextRecalculation' => $meter->getNextRecalculateInterval(),
                'meterRecalculationUrl' => $meter->getRecalculationUrl()
            ));

            $this->app
                ->addJs('jquery.min.js', 'jquery')
                ->addJs('jquery.ui/jquery-ui.min.js', null, BP_COMMON)
                ->addJs('jquery.ui/jquery.ui.touch-punch.min.js', null, BP_COMMON)
                ->addJs('jquery.datetimeaddon/jquery.datetimeaddon.min.js', null, BP_COMMON)
                ->addJs('lab/lab.min.js', null, BP_COMMON)
                ->addJs('jquery.form/jquery.form.js', null, BP_COMMON)
                ->addJs('jquery.cookie/jquery.cookie.js', null, BP_COMMON)
                ->addJs('jquery.rs.admindebug.js')
                ->addJs('jquery.rs.admin.js')
                ->addJs('jquery.rs.ormobject.js', null, BP_COMMON)
                ->meta
                    ->add(array('http-equiv' => 'X-UA-Compatible', 'content' => 'IE=Edge', 'unshift' => true));
        }

        $controller_name = $this->url->request('mod_controller', TYPE_STRING);

        if (preg_match('/^(.*?)-(.*)/', $controller_name, $match)) {
            //Строим полное имя фронт контроллера 
            $full_controller_name = '\\' . str_replace('-', '\\', $match[1] . '-controller-admin-' . $match[2]);

            if (class_exists($full_controller_name) && is_subclass_of($full_controller_name, '\RS\Controller\AbstractModule')) {
                /** @var \RS\Controller\AbstractModule $front_controller */
                $front_controller = new $full_controller_name();
                return $front_controller->exec();
            }
        }

        return $this->e404();
    }

    /**
     * Авторизация пользователя
     */
    function actionAuth()
    {
        $error = "";
        $referer = HelperTools::cleanOpenRedirect($this->url->request('referer', TYPE_STRING, $this->router->getUrl('main.admin')));
        $data = array(
            'login' => $this->url->request('login', TYPE_STRING, ''),
            'pass' => $this->url->request('pass', TYPE_STRING, ''),
            'remember' => $this->url->request('remember', TYPE_INTEGER),
            'do' => $this->url->request('do', TYPE_STRING)
        );

        if ($this->url->isPost()) {
            if ($data['do'] == 'recover') {
                //Восстановление пароля
                $user_api = new UsersApi();
                $this->result->setSuccess($user_api->sendRecoverEmail($data['login'], true));
                if ($this->result->isSuccess()) {
                    $data['successText'] = t('Письмо успешно отправлено. Следуйте инструкциям в письме');
                    $this->result->addSection('successText', $data['successText']);
                } else {
                    $error = $user_api->getErrorsStr();
                    $this->result->addSection('error', $error);
                }

            } else {
                //Авторизация
                AppAuth::logout();

                $auth_result = AppAuth::login($data['login'], $data['pass'], $data['remember']);
                $this->result->setSuccess($auth_result);

                if ($auth_result) {
                    return $this->result->setNoAjaxRedirect($referer);
                } else {
                    $error = AppAuth::getError();
                    $this->result->addSection('error', $error);
                }
            }

            if ($this->url->isAjax()) {
                return $this->result;
            }
        }

        return $this->authPage($error, $referer, false, $data);
    }

    /**
     * Возвращает диалог со сменой пароля пользователя
     */
    function actionChangePassword()
    {
        $hash = $this->url->get('uniq', TYPE_STRING);
        $user_api = new UsersApi();
        $error = '';
        $user = $user_api->getByHash($hash);
        if (!$user) {
            return $this->e404();
        }

        if ($this->url->isPost() && $this->url->checkCsrf('change_password')) {
            $new_pass = $this->url->post('new_pass', TYPE_STRING, '', false);
            $new_pass_confirm = $this->url->post('new_pass_confirm', TYPE_STRING, '', false);

            if ($user_api->changeUserPassword($user, $new_pass, $new_pass_confirm)) {
                //Авторизовываем пользователя
                AppAuth::setCurrentUser($user);
                Application::getInstance()->redirect($this->router->getAdminUrl(false, null, false));
            } else {
                $error = $user_api->getErrorsStr();
            }
        }

        $this->view->assign(array(
            'current_lang' => LanguageCore::getCurrentLang(),
            'locale_list' => LanguageCore::getSystemLanguages(),
            'uniq' => $hash,
            'user' => $user,
            'err' => $error
        ));
        return $this->wrapHtml($this->view->fetch('%system%/admin/change_pass.tpl'));
    }


    /**
     * Отображает страницу авторизаии
     *
     * @param string $error
     * @param string $referer
     * @param bool $js
     * @param array $data
     * @return Standard
     */
    function authPage($error = "", $referer = null, $js = true, $data = array())
    {
        $result_helper = new ResultStandard($this);
        $result_helper->setNeedAuthorize(true);

        if (!$this->url->isAjax()) {
            if ($referer === null) {
                $referer = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
            }

            if (file_exists(\Setup::$ROOT . \Setup::$BRAND_SPLASH_IMAGE)) {
                $this->view->assign(array(
                    'alternative_background_url' => \Setup::$BRAND_SPLASH_IMAGE
                ));
            }

            $this->view->assign(array(
                'data' => $data,
                'current_lang' => LanguageCore::getCurrentLang(),
                'locale_list' => LanguageCore::getSystemLanguages(),
                'js' => $js,
                'err' => $error,
                'referer' => $referer,
                'auth_url' => $this->router->getAdminUrl(false, array('Act' => 'auth'), false)
            ));

            $body = $this->view->fetch('%system%/admin/auth.tpl');
            $result_helper->setHtml($this->wrapHtml($body));
        }

        return $result_helper;
    }

    /**
     * Изменяет язык администраторчкой панели
     */
    function actionChangeLang()
    {
        $referer = $this->url->request('referer', TYPE_STRING, '/');
        $lang = $this->url->request('lang', TYPE_STRING);

        LanguageCore::setSystemLang($lang);
        Application::getInstance()->redirect($referer);
    }

    /**
     * Измняет текущий сайт в администраторской панели
     */
    function actionChangeSite()
    {
        $site = $this->url->get('site', TYPE_INTEGER, false);
        $referer = urldecode($this->url->get('referer', TYPE_BOOLEAN));

        SiteManager::setAdminCurrentSite($site);
        if ($referer) {
            Application::getInstance()->redirect($referer);
        } else {
            Application::getInstance()->redirect($this->router->getAdminUrl(false, null, false));
        }
    }

    /**
     * Сбрасывает авторизацию
     */
    function actionLogout()
    {
        AppAuth::logout();
        Application::getInstance()->redirect($this->router->getUrl('main.admin'));
    }

    function actionInDebug()
    {
        DebugMode::enable();
        Application::getInstance()->redirect(SiteManager::getSite()->getRootUrl(true));
    }

    function actionOutDebug()
    {
        DebugMode::disable();
        Application::getInstance()->redirect(SiteManager::getSite()->getRootUrl(true));
    }

    function actionAjaxToggleDebug()
    {
        DebugMode::enable(!DebugMode::isEnabled());
        return $this->result->setSuccess(true);
    }


    /**
     * Отображает страницу авторизации и прерывает выполнение скрипта, если у пользователя не хватает прав
     *
     * @param string $need_group
     * @param bool $need_admin
     * @return Standard|bool
     */
    function needAuthorize($need_group = null, $need_admin = false)
    {
        $result = AppAuth::checkUserRight($need_group, $need_admin);
        if ($result !== true) {
            return $this->authPage($result);
        }
        return false;
    }

    function actionCleanCache()
    {
        CacheCleaner::obj()->clean();
        return $this->result->setSuccess(true);
    }

    /**
     * Производит пересчет счетчиков.
     * Возвращает новые пересчитанные числа в браузер
     */
    function actionRecalculateMeters()
    {
        $meter = Meter::getInstance();
        $meter->recalculateNumbers();

        return $this->result->setSuccess(true)->addSection(array(
            'numbers' => $meter->getNumbers(),
            'nextRecalculation' => $meter->getNextRecalculateInterval()
        ));
    }
}
