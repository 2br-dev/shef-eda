<ul class="collapsible">
  {foreach $dirlist as $dir}
    {if $dir.child}
      <li>
        <div class="collapsible-header">
          <a href="{$dir.fields->getUrl()}">{$dir.fields.name}<i class='material-icons'>arrow_drop_down</i></a>
        </div>
        <div class="collapsible-body">
          <ul>
          {foreach $dir.child as $subdir}
            <li><a href="{$subdir.fields->getUrl()}">{$subdir.fields.name}</a></li>               
          {/foreach}
          </ul>
        </div>
      </li>
    {else}
      <div class="collapsible-header">
        <a href="{$dir.fields->getUrl()}">{$dir.fields.name}</a>
      </div>
    {/if}  
  {/foreach}  
</ul>

<script>
$(document).ready(function(){
  $('.collapsible').collapsible();
});

$('.collapsible-header').click(function(e) {
  $('.material-icons').text('arrow_drop_down');
  
  if ($(this).siblings('.collapsible-body').css('display') === 'none') {
    e.preventDefault();
    $(this).siblings('.collapsible-body').slideDown('fast');
    $(this).find('.material-icons').text('arrow_forward');
  } 
})
</script>