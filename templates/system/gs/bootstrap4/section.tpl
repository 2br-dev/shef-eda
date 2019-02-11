{$align_items = {include file="%system%/gs/{$layouts.grid_system}/attribute.tpl" field="align_items" name="align-items"} }
{$justify_content = {include file="%system%/gs/{$layouts.grid_system}/attribute.tpl" field="inset_align" name="justify-content"} }

<div class="{if $level.section.element_type == 'row'}row {else}{*
    *}{if $align_items || $justify_content} d-flex{/if}{*
    *}{include file="%system%/gs/{$layouts.grid_system}/attribute.tpl" field="width" name="col"}{*
    *}{include file="%system%/gs/{$layouts.grid_system}/attribute.tpl" field="prefix" name="offset"}{*
    *}{include file="%system%/gs/{$layouts.grid_system}/attribute.tpl" field="order" name="order"}{/if}{*
    *}{if $level.section.css_class}{$level.section.css_class}{/if}{*
    *}{$align_items}{$justify_content}">{strip}
    {if !empty($level.childs)}
        {include file="%system%/gs/{$layouts.grid_system}/sections.tpl" item=$level.childs assign=wrapped_content}
    {else}
        {include file="%system%/gs/blocks.tpl" assign=wrapped_content}
    {/if}
    
    {if $level.section.inset_template}
        {include file=$level.section.inset_template wrapped_content=$wrapped_content}
    {else}
        {$wrapped_content}
    {/if}{/strip}
</div>