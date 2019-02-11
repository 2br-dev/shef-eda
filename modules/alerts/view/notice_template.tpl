<table border="0" cellspacing="0" cellpadding="0" bgcolor="#eeeeee" style="font-family: Arial;border-collapse: collapse; width: 100%; height: 100%;line-height:22px;font-size:14px;">
    <tbody>
    <tr>
        <td>
            <table align="center" border="0" cellspacing="0" cellpadding="0" style="width:640px;padding:40px 0;">
                <tbody>
                <tr>
                    <td>
                        <table border="0" cellspacing="0" cellpadding="0" width="100%" style="border-collapse:collapse;margin-bottom: 15px; line-height: 10px;">
                            <tr>
                                <td width="40"></td>
                                <td>
                                    <a style="display: inline-block;" href="{$SITE->getRootUrl(true)}" target="_blank">
                                        <img src="{$CONFIG->__logo->getUrl(400, 50, 'xy', true)}" alt="" style="border: none;">
                                    </a>
                                </td>
                            </tr>
                        </table>
                        <table border="0" cellspacing="0" cellpadding="0" width="100%" style="padding:40px;background: #fff;">
                            <tbody>
                            <tr>
                                <td>
                                    {block name="content"}{/block}
                                    <p>
                                        {t}С наилучшими пожеланиями{/t},<br />
                                        {if $CONFIG.firm_name_for_notice}{$CONFIG.firm_name_for_notice}{else}{$SITE->getMainDomain()}{/if}
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td style="display: block; text-align: center; padding-bottom: 15px">
                                    <img src="//spacergif.org/spacer.gif" width="100%" height="1" style="background: #eeeeee;"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="display: block; text-align: center; line-height: 10px; padding: 15px 0">
                                    {if $CONFIG.facebook_group}
                                        <a style="display: inline-block; padding: 0 5px;" href="{$CONFIG.facebook_group}" target="_blank">
                                            <img src="{$SITE->getRootUrl(true)}/modules/alerts/view/img/facebook.png" width="32" style="border: none;"/>
                                        </a>
                                    {/if}
                                    {if $CONFIG.twitter_group}
                                        <a style="display: inline-block; padding: 0 5px;" href="{$CONFIG.twitter_group}" target="_blank">
                                            <img src="{$SITE->getRootUrl(true)}/modules/alerts/view/img/twitter.png" width="32" style="border: none;"/>
                                        </a>
                                    {/if}
                                    {if $CONFIG.instagram_group}
                                        <a style="display: inline-block; padding: 0 5px;" href="{$CONFIG.instagram_group}" target="_blank">
                                            <img src="{$SITE->getRootUrl(true)}/modules/alerts/view/img/instagram.png" width="32" style="border: none;"/>
                                        </a>
                                    {/if}
                                    {if $CONFIG.vkontakte_group}
                                        <a style="display: inline-block; padding: 0 5px;" href="{$CONFIG.vkontakte_group}" target="_blank">
                                            <img src="{$SITE->getRootUrl(true)}/modules/alerts/view/img/vk.png" width="32" style="border: none;"/>
                                        </a>
                                    {/if}
                                    {if $CONFIG.youtube_group}
                                        <a style="display: inline-block; padding: 0 5px;" href="{$CONFIG.youtube_group}" target="_blank">
                                            <img src="{$SITE->getRootUrl(true)}/modules/alerts/view/img/youtube.png" width="32" style="border: none;"/>
                                        </a>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td style="display: block; text-align: center;">
                                    <p style="font-size: 10px; color: #B3B3B3; margin: 0; font-family: Tahoma;">{t}Это автоматическая рассылка, на это письмо отвечать нет необходимости.{/t}</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    </tbody>
</table>