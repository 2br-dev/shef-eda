{if $view_as == 'blocks'}
    <ul class="products">
        {foreach $list as $product}
            <li {$product->getDebugAttributes()} data-id="{$product.id}">
                {$main_image=$product->getMainImage()}
                <p class='product-title'>{$product.title}</p>
                <a href="{$product->getUrl()}" class="image">
                    {if $product->inDir('new')}
                        <i class="new"></i>
                    {/if}
                    <img src="{$main_image->getUrl(200,200)}" alt="{$main_image.title|default:"{$product.title}"}"/>
                </a>
            <div class='product-footer'>
                <p class="product-price">{$product->getCost()} {$product->getCurrency()} 
                    {$last_price=$product->getOldCost()}</p>
                
                    
           {*      {if $THEME_SETTINGS.enable_favorite}
                <a class="favorite listStyle{if $product->inFavorite()} inFavorite{/if}" data-title="{t}В избранное{/t}" data-already-title="{t}В избранном{/t}"></a>
                {/if} *}
                
                {hook name="catalog-list_products:blockview-buttons"  product=$product title="{t}Просмотр категории продукции:кнопки, блочный вид{/t}"}
                    {if $shop_config}
                        {if $product->shouldReserve()}
                            {if $product->isOffersUse() || $product->isMultiOffersUse()}
                                <a data-href="{$router->getUrl('shop-front-multioffers', ["product_id" => $product.id])}" class="button reserve inDialog">{t}Заказать{/t}</a>
                            {else}
                                <a data-href="{$router->getUrl('shop-front-reservation', ["product_id" => $product.id])}" class="button reserve inDialog">{t}Заказать{/t}</a>
                            {/if}
                        {else}
                            {if $check_quantity && $product.num<1}
                                <span class="noAvaible">{t}Нет в наличии{/t}</span>
                            {else}
                                {if $product->isOffersUse() || $product->isMultiOffersUse()}
                                    <span data-href="{$router->getUrl('shop-front-multioffers', ["product_id" => $product.id])}" class="showMultiOffers inDialog noShowCart">{t}В корзину{/t}</span>
                                {else}
                                    <a 
                                        data-href="{$router->getUrl('shop-front-cartpage', ["add" => $product.id])}" 
                                        class="addToCart noShowCart" 
                                        data-add-text="✓ Добавлено">
                                        <img src="{$THEME_IMG}/icons/cart.png" style='position: relative; z-index: 10' />
                                        </a>
                                {/if}
                            {/if}
                        {/if}
                    {/if}
                {/hook}
              {*           {if $THEME_SETTINGS.enable_compare}
                        <a class="compare{if $product->inCompareList()} inCompare{/if}"><span>{t}К сравнению{/t}</span><span class="already">{t}Добавлено{/t}</span></a>
                        {/if} *}
            </div>
            {if $last_price>0}<p class="last">{$last_price} {$product->getCurrency()}</p>{/if}

            <div class='product-wrapper'></div> 
            </li>
        {/foreach}
    </ul>
{/if}    

<style>
.added {
    background: transparent;
    color: #21431c;
    text-transform: uppercase;
    font-size: 12px;
    font-weight: bold;
    width: unset;
    text-align: right;
    padding: 0;
    line-height: 37px;
}
</style>


{include file="%THEME%/paginator.tpl"}