<?php
/**
* ReadyScript (http://readyscript.ru)
*
* @copyright Copyright (c) ReadyScript lab. (http://readyscript.ru)
* @license http://readyscript.ru/licenseAgreement/
*/
namespace RS\Orm\Type;

/**
* Тип - список с произвольным набором полей.
*/
class VariableList extends ArrayList
{
    protected $form_template = '%system%/coreobject/type/form/variable_list.tpl';
    protected $table_fields = array();

    /**
     * Устанавливает список полей таблицы
     *
     * @param \RS\Orm\Type\VariableList\AbstractVariableListField[] $fields
     * return void
     */
    public function setTableFields($fields)
    {
        $this->table_fields = $fields;
    }

    /**
     * Возвращает список полей таблицы
     *
     * @return \RS\Orm\Type\VariableList\AbstractVariableListField[]
     */
    public function getTableFields()
    {
        return $this->table_fields;
    }
}
