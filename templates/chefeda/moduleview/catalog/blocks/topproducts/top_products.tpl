{addjs file="jquery.changeoffer.js"}
{addjs file="jcarousel/jquery.jcarousel.min.js"}
{addjs file="jquery.zoom.min.js"}
{addjs file="product.js"}
{$shop_config=ConfigLoader::byModule('shop')}

{if $products}
<section>
    <div class="slider wow fadeInUp" data-wow-duration="3s">
        {foreach $products as $product}
        <div class="slider-item" {$product->getDebugAttributes()}>
            {$main_image=$product->getMainImage()}

            <div class="product">
                <a href="{$product->getUrl()}"><p class="product-header">{$product.title}</p></a>

                <div class="product-info">
                    <a href="{$product->getUrl()}">
                        <img class="product-info__img" title="{$product.title}" src="{$main_image->getUrl(160,160)}" alt="{$main_image.title|default:"{$product.title}"}"/>
                    </a>

                    <div class="product-info__price">
                        <p class="product-info__price-current">{$product->getCost()} {$product->getCurrency()}</p>
                        {$last_price=$product->getOldCost()}
                        {if $last_price>0}
                            <p class="product-info__price-old">{$last_price} {$product->getCurrency()}</p>
                        {/if}
                        <p class="product-info__price-count">за 1 шт.</p>                   

                        {hook name="catalog-product:rating" title="{t}Карточка товара:рейтинг{/t}"}                                         
                            <div class="rating">
                                <span class="stars" title="{t}Средняя оценка{/t}: {$product->getRatingBall()}"><i style="width:{$product->getRatingPercent()}%"></i></span>
                                <a href="{$product->getUrl()}#comments" class="commentsCount">{t comments=$product->getCommentsNum()}%comments [plural:%comments:отзыв|отзыва|отзывов]{/t}</a>
                            </div>
                        {/hook}

                    </div> 
                </div>

                <div class="product-controls">
                    {if $product->isOffersUse() || $product->isMultiOffersUse()}
                        <a 
                            data-href="{$router->getUrl('shop-front-multioffers', ["product_id" => $product.id])}" 
                            class="addToCart showMultiOffers inDialog noShowCart" 
                            data-add-text="✓ Добавлено">
                        <img src="{$THEME_IMG}/icons/cart.png" style='position: relative; z-index: 10; display: inline-block; margin-right: 10px' />В корзину
                        </a>
                    {else}
                        <a 
                            data-href="{$router->getUrl('shop-front-cartpage', ["add" => $product.id])}" 
                            class="addToCart noShowCart" 
                            data-add-text="✓ Добавлено">
                        <img src="{$THEME_IMG}/icons/cart.png" style='position: relative; z-index: 10; display: inline-block; margin-right: 10px' />В корзину
                        </a>
                    {/if}
                </div>     
            </div>
        </div>
        {/foreach}
    </div> 
</section>
{else}
    {include file="%THEME%/block_stub.tpl"  class="blockTopProducts" do=[
        [
            'title' => t("Добавьте категорию с товарами"),
            'href' => {adminUrl do=false mod_controller="catalog-ctrl"}
        ],
        [
            'title' => t("Настройте блок"),
            'href' => {$this_controller->getSettingUrl()},
            'class' => 'crud-add'
        ]
    ]}
{/if}