<main class='catalogue'>
    {foreach $dirlist as $dir}
    <div class="catalogue-item">
        <h2 class="catalogue-item__header"><a style='text-decoration: none' href="{$dir.fields->getUrl()}">{$dir.fields.name}</a></h2>
        <a href="{$dir.fields->getUrl()}"><img style='width: 100%' src="{$dir.fields->getMainImage(332, 514)}" alt="{$dir.fields.name}" title='{$dir.fields.name}'></a> 
        {foreach $dir.child as $subdir}
            <a href="{$subdir.fields->getUrl()}">{$subdir.fields.name}</a>      
        {/foreach}      
    </div>
    {/foreach}    
</main>

