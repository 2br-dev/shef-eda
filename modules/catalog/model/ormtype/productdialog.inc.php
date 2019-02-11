<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace Catalog\Model\OrmType;

use RS\Orm\Type;

class ProductDialog extends Type\ArrayList
{
    protected
        $form_template = '%catalog%/form/ormtype/product_dialog.tpl',
        $dialogParams = array();
    
    public function getProductDialog()
    {
        $hide_group_checkbox = (isset($this->dialogParams['hide_group_checkbox'])) ? $this->dialogParams['hide_group_checkbox'] : false;
        $hide_product_checkbox = (isset($this->dialogParams['hide_product_checkbox'])) ? $this->dialogParams['hide_product_checkbox'] : false;
        $plugin_options = (isset($this->dialogParams['plugin_options'])) ? $this->dialogParams['plugin_options'] : array();
        if (isset($plugin_options['additionalItemHtml_values_arr'])) {
            $plugin_options['additionalItemHtml_values'] = $this->recursiveConvertItemValues($plugin_options['additionalItemHtml_values_arr']);
        }
        $product_dialog = new \Catalog\Model\ProductDialog($this->name, $hide_group_checkbox, $this->value, $hide_product_checkbox, $plugin_options);
        
        return $product_dialog->getHtml();
    }

    /**
     * Рекурсивно строит массив "селектор" => "значение" для подмены в дополнительном Html товарной строки
     *
     * @param array $values_array - массив значений
     * @param string $prefix - префикс для селектора (технический параметр)
     * @return array
     */
    protected function recursiveConvertItemValues($values_array, $prefix = '')
    {
        $result = array();
        foreach ($values_array as $key=>$value) {
            if (is_array($value)) {
                $result += $this->recursiveConvertItemValues($value, $prefix . "[$key]");
            } else {
                $item_key = '[name="' . $this->name . $prefix . "[$key]" . '"]';
                $result[$item_key] = $value;
            }
        }
        return $result;
    }
}
