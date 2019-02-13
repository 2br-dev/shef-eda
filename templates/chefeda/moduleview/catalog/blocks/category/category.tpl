<nav id='catalogue-dropdown'>
{foreach $dirlist as $dir} 
<nav class="catalogue-dropdown-sub">
	<ul>
    {if $dir.child}
        <li class='has-child'>
            <a href="{$dir.fields->getUrl()}">{$dir.fields.name}<i class='material-icons'>arrow_right</i></a>
            <ul>
            {foreach $dir.child as $subdir}
                <li><a href="{$subdir.fields->getUrl()}">{$subdir.fields.name}</a></li>               
            {/foreach}
            </ul>
        </li>

    {else}
    <li><a href="{$dir.fields->getUrl()}">{$dir.fields.name}</a></li>

    {/if}
	</ul>
</nav>
{/foreach}
</nav>     



