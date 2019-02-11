<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Crm\Model;

/**
 * Класс содержит различные универсальные вспомогательные функции
 */
class Utils
{
    /**
     * Приводит строку вида 1d 5h 3s к виду "1 день 5 часов 3 секунды" или "48h" к виду "2 дня", и.т.д.
     *
     * @param string $duration_string
     * @return string
     */
    public static function renderDurationString($duration_string)
    {
        $delta = self::getDurationDeltaTimestamp($duration_string);

        $days = floor($delta / 86400);
        $hours = floor(($delta - $days * 86400) / 3600);
        $minutes = floor(($delta - $days * 86400 - $hours * 3600) / 60);
        $seconds = $delta - $days * 86400 - $hours * 3600 - $minutes * 60;

        $result = array();
        if ($days > 0) {
            $result[] = t('%n [plural:%n:день|дня|дней]', array('n' => $days));
        }
        if ($hours > 0) {
            $result[] = t('%n [plural:%n:час|часа|часов]', array('n' => $hours));
        }
        if ($minutes > 0) {
            $result[] = t('%n [plural:%n:минута|минуты|минут]', array('n' => $minutes));
        }
        if ($seconds > 0) {
            $result[] = t('%n [plural:%n:секунда|секунды|секунд]', array('n' => $seconds));
        }

        return implode(' ', $result);
    }

    /**
     * @param $duration_string
     * @return false|int
     */
    public static function getDurationDeltaTimestamp($duration_string)
    {
        preg_match_all('/((\d+)(y|w|d|h|m|s|))/', $duration_string, $match);

        if ($match) {
            $replace = array(
                'y' => 'YEAR',
                'w' => 'WEEK',
                'd' => 'DAY',
                'h' => 'HOUR',
                'm' => 'MINUTE',
                's' => 'SECOND'
            );

            $str = '';
            foreach ($match[2] as $n => $number) {
                $str .= "+{$number} " . $replace[$match[3][$n]] . " ";
            }
            return strtotime($str, 0);
        }

        return 0;
    }

}