<section class="navigation">
    <div class="container">
    {foreach $dirlist as $dir}
      <a href="{$dir.fields->getUrl()}" class="navigation-item">{$dir.fields.name}</a>
    {/foreach} 
    </div>
</section>
