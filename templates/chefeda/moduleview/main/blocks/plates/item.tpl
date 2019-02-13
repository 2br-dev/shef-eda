<div class='plate-container wow fadeInUp' data-wow-duration="3s">

  <div class="plate" style="background: url('{$THEME_IMG}/meat.jpg') no-repeat center/cover">
    <h2>Банкетное меню от шефа</h2>
    <p>Мы приготовим и засервируем блюда для вашего торжества. Вместе с нашим шеф-поваром вы заранее утвердите
      список блюд.
      И к назначенному времени мы доставим вам их по адресу.
    </p>
  </div>

  <div class="plate" style="background: url('{$THEME_IMG}/cakes.jpg') no-repeat center/cover">
    <h2>Эксклюзивные торты</h2>
    <p>Мы умеем и любим изготавливать уникальные изысканные торты. Используя только
      натуральные ингридиенты, мы создадим вкусные и красивые лакомства для вашего торжества.
    </p>
  </div>

  <div class="plate" style="background: url('{$THEME_IMG}/pizza.jpg') no-repeat center/cover">
    <h2>Горячая пицца</h2>
    <p>Текст про красоту и величие пиццы</p>
  </div>

  <div class="plate" style="background: url('{$THEME_IMG}/juices.jpg') no-repeat center/cover">
    <h2>Свежевыжатые соки</h2>
    <p>В нашем магазине на Анисовой, 36 есть отличная фреш-зона.
      Там вы сможете сами выжать сок из собственноручно выбранных вами фруктов.
      Это удобно и полезно.
    </p>
  </div>
  
</div>

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