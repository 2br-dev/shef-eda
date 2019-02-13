{addjs file="jcarousel/jquery.jcarousel.min.js"}
{addjs file="jquery.changeoffer.js?v=2"}
{addjs file="jquery.zoom.min.js"}
{addjs file="product.js"}
{assign var=shop_config value=ConfigLoader::byModule('shop')}
{assign var=check_quantity value=$shop_config.check_quantity}
{assign var=catalog_config value=$this_controller->getModuleConfig()} 
{if $product->isVirtualMultiOffersUse()} {* Если используются виртуальные многомерные комплектации *}
    {addjs file="jquery.virtualmultioffers.js"}
{/if} 
{$product->fillOffersStockStars()} {* Загружаем сведения по остаткам на складах *}

{moduleinsert indexTemplate="blocks/category/line.tpl" name="\Catalog\Controller\Block\Category"}

<div id="updateProduct" itemscope itemtype="http://schema.org/Product" class="item container product{if !$product->isAvailable()} notAvaliable{/if}{if $product->canBeReserved()} canBeReserved{/if}{if $product.reservation == 'forced'} forcedReserve{/if}" data-id="{$product.id}">
    
    <h1>{$product->title}</h1>
    <hr>
    <div class="item container item-container">
      <div class='item-navigation'>
        {moduleinsert indexTemplate="blocks/category/side.tpl" name="\Catalog\Controller\Block\Category"}
      </div>

    <div class="productImages item-photos">
        {hook name="catalog-product:images" title="{t}Карточка товара:изображения{/t}"}
            <div class="main">
                {$images=$product->getImages()}
                {if !$product->hasImage()} 
                    {$main_image=$product->getMainImage()}       
                    <span class="item"><img src="{$main_image->getUrl(350,486,'xy')}" alt="{$main_image.title|default:"{$product.title}"}"/></span>
                {else}               
                    {* Главное фото *} 
                    {if $product->isOffersUse()}
                       {* Назначенные фото у первой комлектации *}
                       {$offer_images=$product.offers.items[0].photos_arr}  
                    {/if}
                    {foreach $images as $key => $image}
                       <a href="{$image->getUrl(800,600,'xy')}" data-id="{$image.id}" class="item mainPicture {if ($offer_images && ($image.id!=$offer_images.0)) || (!$offer_images && !$image@first)} hidden{/if} zoom" {if ($offer_images && in_array($image.id, $offer_images)) || (!$offer_images)}rel="bigphotos"{/if} data-n="{$key}" target="_blank" data-zoom-src="{$image->getUrl(947, 1300)}"><img class="winImage" src="{$image->getUrl(350,486,'xy')}" alt="{$image.title|default:"{$product.title} фото {$key+1}"}"></a>
                    {/foreach}
                {/if}
            </div>
            {* Нижняя линейка фото *}
            {if count($images)>1}
            <div class="gallery">
                <div class="wrap">
                    <ul>
                        {$first = 0}
                        {foreach $images as $key => $image}
                        <li data-id="{$image.id}" class="{if $offer_images && !in_array($image.id, $offer_images)}hidden{elseif !$first++} first{/if}">
                            <a href="{$image->getUrl(800,600,'xy')}" class="preview" data-n="{$key}" target="_blank"><img src="{$image->getUrl(70, 92)}">
                            </a></li>
                        {/foreach}
                    </ul>
                </div>
                <a class="control prev"></a>
                <a class="control next"></a>
            </div>
            {/if}
        {/hook}
    </div>

<section>
    {******}
    <div class="productInfo">
        
        <h1 itemprop="name">{$product.title}</h1>                    
        
        {if $shop_config}
            {* Блок с сопутствующими товарами *}
            {moduleinsert name="\Shop\Controller\Block\Concomitant"}
        {/if}
        
        {hook name="catalog-product:price" title="{t}Карточка товара:цены{/t}"}
            {assign var=last_price value=$product->getOldCost()}
            <div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="price">
                    {if $last_price>0}<p class="lastPrice">{$last_price}</p>{/if}
                    <span itemprop="price" class="myCost" content="{$product->getCost(null, null, false)}">{$product->getCost()}</span><span class="myCurrency"> {$product->getCurrency()}</span>
                    <span itemprop="priceCurrency" class="hidden">{$product->getCurrencyCode()}</span>
                    {* Если включена опция единицы измерения в комплектациях *}
                    {if $catalog_config.use_offer_unit && $product->isOffersUse()}
                        <span class="unitBlock">/ <span class="unit">{$product.offers.items[0]->getUnit()->stitle}</span></span>
                    {/if}
            </div>
        {/hook}

        {hook name="catalog-product:rating" title="{t}Карточка товара:рейтинг{/t}"}                              
            <span class="stars" title="{t}Средняя оценка{/t}: {$product->getRatingBall()}"><i style="width:{$product->getRatingPercent()}%"></i></span>
            <a href="#comments" class="commentsCount">{t comments=$product->getCommentsNum()}%comments [plural:%comments:отзыв|отзыва|отзывов]{/t}</a>
        {/hook}
        
        {hook name="catalog-product:action-buttons" title="{t}Карточка товара:кнопки{/t}"}
            <div class="buttons">
                {if $shop_config}
                    <a data-href="{$router->getUrl('shop-front-cartpage', ["add" => $product.id])}" class="button addToCart" data-add-text="Добавлено">
                        <button>{t}В корзину{/t}</button>
                    </a>
                {/if}
                
                <div class="dotBlock">    
                    {if $THEME_SETTINGS.enable_favorite}
                    <a class="favorite{if $product->inFavorite()} inFavorite{/if}">
                        <span>{t}В избранное{/t}</span>
                        <span class="already">{t}В избранном{/t}</span>
                    </a>                    
                    {/if}
                </div>
         
            </div>
        {/hook}
        
    </div>    

    <button class='item-desc__button'>Показать подробное описание</button>

    {****}
    {$tabs=[]}
        {if $product.properties || $product->isOffersUse()} {$tabs["property"] = t('Описание')} {/if}

        {$tabs["comments"] = t('Отзывы')}
    <div class="item-desc__hidden">    
        <div class="tabs gray productTabs">
            <ul class="tabList">
                {foreach $tabs as $key=>$tab}
                {if $tab@first}{$act_tab=$key}{/if}
                <li {if $tab@first}class="act"{/if} data-href=".tab-{$key}"><a>{$tab}</a></li>
                {/foreach}
            </ul>         
            {if $tabs.property}
            <div class="tab tab-property {if $act_tab == 'property'}act{/if}">
                {hook name="catalog-product:properties" title="{t}Карточка товара:характеристики{/t}"}
                    {foreach $product.offers.items as $key=>$offer}
                    {if $offer.propsdata_arr}
                    <div class="offerProperty propertyGroup{if $key>0} hidden{/if}" data-offer="{$key}">
                        <p class="groupName">{t}Характеристики комплектации{/t}</p>
                        <table class="properties">
                            {foreach $offer.propsdata_arr as $pkey=>$pval}
                            <tr>
                                <td class="key"><span>{$pkey}</span></td>
                                <td class="value"><span>{$pval}</span></td>
                            </tr>
                            {/foreach}
                        </table>
                    </div>
                    {/if}
                    {/foreach}       
                    {foreach $product.properties as $data}
                        <div class="propertyGroup">
                            <p class="groupName">{$data.group.title|default:t("Характеристики")}</p>
                            {foreach $data.properties as $property}
                                {$prop_value = $property->textView()}
                                <div class="item-desc__info">
                                    <p class="item-desc__info-header">{$property.title}:
                                    {if $property.description}
                                        <a class="popover-button"
                                        data-toggle="popover"
                                        tabindex="0"
                                        data-trigger="manual"
                                        data-content="{$property.description}"> ? </a>
                                    {/if}
                                    </p>
                                    <hr>
                                    <p class="item-desc__info-text">{$prop_value} {$property.unit}</p>
                                </div>
                            {/foreach}
                        </div>
                    {/foreach}
                {/hook}
            </div>
            {/if}      
            {if $tabs.comments}
            <div class="tab tab-comments {if $act_tab == 'comments'}act{/if}">
                {hook name="catalog-product:comments" title="{t}Карточка товара:комментарии{/t}"}
                    <script type="text/javascript">
                        $(function() {
                            function openComments()
                            {
                                $('.product .tabs .tab').removeClass('act');
                                $('.product .tabs .tabList [data-href=".tab-comments"]').click();
                                
                            }
                            if (location.hash=='#comments') {
                                openComments();
                            }
                            $('.commentsCount').click(openComments);
                        });
                    </script>
                    {moduleinsert name="\Comments\Controller\Block\Comments" type="\Catalog\Model\CommentType\Product"}    
                {/hook}        
            </div>
            {/if}
        </div>    
       </div> 
     </div>  
</section>       
</div>

<style>
    .product {
        color: unset; 
        background: unset; 
        padding: unset; 
        -webkit-box-shadow: unset; 
        box-shadow: unset; 
        height: unset; 
    }
    .product:hover {
        box-shadow: unset;
        cursor: normal;
    }
    .productInfo {
        float: unset;
        width: unset;
    }
    section {
        display: flex;
        flex-direction: column;
        width: 35%;
        padding-left: 20px;
    }
    h1 {
        margin-bottom: 0;
    }
</style>


