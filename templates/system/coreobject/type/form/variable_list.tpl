<style type="text/css">
    .variableList th {
        font-size: 12px;
    }

    .variableList th,
    .variableList td {
        padding: 3px;
        vertical-align: middle;
        text-align:center;
    }

    .variableList textarea {
        height: 30px;
    }
</style>
{$table_id = 'variableList_'|cat:$field->name}
{$add_row_id = 'variableList_'|cat:$field->name|cat:'_addRow'}
{$values = $elem[$field->name]}
{if !$values}
    {$values = []}
{/if}
<table id="{$table_id}" class="variableList" data-row-num="{count($values)}">
    <thead>
        {foreach $field->getTableFields() as $elem}
            <th>{$elem->getColumnTitle()}</th>
        {/foreach}
        <th></th>
    </thead>
    <tbody>
        <tr class="newLine hidden">
            {foreach $field->getTableFields() as $elem}
                <td>
                    {$elem->getElementHtml($field->name)}
                </td>
            {/foreach}
            <td><i class="variableList_deleteRow zmdi zmdi-delete f-22 c-red"></i></td>
        </tr>
        {if !empty($values)}
            {$n = 0}
            {foreach $values as $row_value}
                <tr>
                    {foreach $field->getTableFields() as $elem}
                        {$value = null}
                        {if isset($row_value[$elem->getName()])}
                            {$value = $row_value[$elem->getName()]}
                        {/if}
                        <td>
                            {$elem->getElementHtml($field->name, $n, $value)}
                        </td>
                    {/foreach}
                    <td><i class="variableList_deleteRow zmdi zmdi-delete f-22 c-red"></i></td>
                </tr>
                {$n = $n + 1}
            {/foreach}
        {/if}
    </tbody>
</table>
<div id="{$add_row_id}" class="button">{t}Добавить{/t}</div>

<script type="text/javascript">
    $('#{$table_id} .newLine [name]').attr('disabled', true);

    $('#{$table_id}').on('click', '.variableList_deleteRow', function(){
        $(this).closest('tr').remove();
    });

    $('#{$add_row_id}').on('click', function(){
        var num = $("#{$table_id}").data('rowNum');
        var new_line = $('<tr></tr>');
        new_line.append($("#{$table_id} .newLine").html().replace(/%index%/g, num).replace(/disabled="disabled"/g, ''));
        $("#{$table_id} tbody").append(new_line);
        $("#{$table_id}").data('rowNum', num + 1);
    });
</script>