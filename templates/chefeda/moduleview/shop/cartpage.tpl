{$shop_config = ConfigLoader::byModule('shop')}
{$catalog_config = ConfigLoader::byModule('catalog')}
{$product_items = $cart->getProductItems()}
{$floatCart = (int)$smarty.request.floatCart}

{if $floatCart}
    <div class="viewport" id="cartItems">
        <div class="cartFloatBlock">
            {if !empty($cart_data.items)}
            <div class="cartHeader">
                <a href="{$router->getUrl('shop-front-cartpage', ["Act" => "cleanCart", "floatCart" => $floatCart])}" class="btn btn-secondary">{t}очистить корзину{/t}</a>
                <a class='btn' href='/cart/'>ПЕРЕЙТИ В КОРЗИНУ<a>
                <a class="closeDlg"><i class='material-icons'>close</i></a>
            </div>
            <form method="POST" action="{$router->getUrl('shop-front-cartpage', ["Act" => "update", "floatCart" => $floatCart])}" id="cartForm">
                {hook name="shop-cartpage:products" title="{t}Корзина:товары{/t}" product_items=$product_items}
                    <div class="scrollBox">
                        <div class="items cartTable">
                                {foreach $cart_data.items as $index => $item}
                                    {$product = $product_items[$index].product}
                                    {$cartitem = $product_items[$index].cartitem}
                                    {if !empty($cartitem.multioffers)}
                                        {$multioffers=unserialize($cartitem.multioffers)}
                                    {/if}
                                <div data-id="{$index}" data-product-id="{$cartitem.entity_id}" class="cartitem{if $item@first} first{/if}">
                                    <div class="image"><a href="{$product->getUrl()}"><img src="{$product->getOfferMainImage($cartitem.offer, 81, 81, 'axy')}" alt="{$product.title}"/></a></div>
                                <section>    
                                    <div class="title"><a href="{$product->getUrl()}">{$cartitem.title}</a>
                                     
                                            
                                             {if $product->isMultiOffersUse()}
                                                <div class="multiOffers">
                                                    {foreach $product.multioffers.levels as $level}
                                                        {if !empty($level.values)}
                                                            <div class="multiofferTitle">{if $level.title}{$level.title}{else}{$level.prop_title}{/if}</div>
                                                            <select name="products[{$index}][multioffers][{$level.prop_id}]" data-prop-title="{if $level.title}{$level.title}{else}{$level.prop_title}{/if}">
                                                                {foreach $level.values as $value}
                                                                    <option {if $multioffers[$level.prop_id].value == $value.val_str}selected="selected"{/if} value="{$value.val_str}">{$value.val_str}</option>
                                                                {/foreach}
                                                            </select>
                                                        {/if}
                                                    {/foreach}
                                                    {if $product->isOffersUse()}
                                                        {foreach from=$product.offers.items key=key item=offer name=offers}
                                                            <input id="offer_{$key}" type="hidden" name="hidden_offers" class="hidden_offers" value="{$key}" data-info='{$offer->getPropertiesJson()}' data-num="{$offer.num}"/>
                                                            {if $cartitem.offer==$key}
                                                                <input type="hidden" name="products[{$index}][offer]" value="{$key}"/>
                                                            {/if}
                                                        {/foreach}
                                                    {/if}
                                                </div>
                                            {elseif $product->isOffersUse()}
                                                <div class="offers">
                                                    <select name="products[{$index}][offer]" class="offer">
                                                        {foreach from=$product.offers.items key=key item=offer name=offers}
                                                            <option value="{$key}" {if $cartitem.offer==$key}selected{/if}>{$offer.title}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            {/if}
                                    <div class="remove"><a href="{$router->getUrl('shop-front-cartpage', ["Act" => "removeItem", "id" => $index, "floatCart" => $floatCart])}" title="{t}Удалить товар из корзины{/t}" class="material-icons">
                                    <i class='material-icons'>delete</i></a></div>
                                    </div>
                                   
                                    <div class="price">
                                        <div class="amount">
                                            <input type="hidden" min="{$product->getAmountStep()}" step="{$product->getAmountStep()}" class="fieldAmount" value="{$cartitem.amount}" name="products[{$index}][amount]"/> 
                                            <a class="dec" data-amount-step="{$product->getAmountStep()}"><i class='material-icons'>arrow_drop_down_circle</i></a>
                                            <span class="num" title="{t}Количество{/t}">{$cartitem.amount}</span>
                                            
                                            <span class="unit">
                                            {if $catalog_config.use_offer_unit}
                                                {$product.offers.items[$cartitem.offer]->getUnit()->stitle}
                                            {else}
                                                {$product->getUnit()->stitle|default:"шт."}
                                            {/if}
                                            </span>
                                            
                                            <a class="inc" data-amount-step="{$product->getAmountStep()}"><i class='material-icons' style='transform: rotate(180deg);'>arrow_drop_down_circle</i></a>
                                        </div>
                                        <div class="cost">{$item.cost}</div>
                                     {*    <div class="discount">
                                            {if $item.discount>0}
                                                {t}скидка{/t} {$item.discount}
                                            {/if}
                                        </div>
                                        <div class="error">{$item.amount_error}</div> *}
                                    </div>
                                </section>   
                                </div>
                                    {assign var=concomitant value=$product->getConcomitant()}
                                    {foreach from=$item.sub_products key=id item=sub_product_data}
                                        {assign var=sub_product value=$concomitant[$id]}
                                        <div>
                                            <div colspan="2" class="title">
                                                <label>
                                                    <input 
                                                        class="fieldConcomitant" 
                                                        type="checkbox" 
                                                        name="products[{$index}][concomitant][]" 
                                                        value="{$sub_product->id}"
                                                        {if $sub_product_data.checked}
                                                            checked="checked"
                                                        {/if}
                                                        >
                                                    {$sub_product->title}
                                                </label>
                                            </div>
                                            <div class="price">
                                                {if $shop_config.allow_concomitant_count_edit}
                                                    <div class="amount">
                                                        <input type="hidden" min="{$sub_product->getAmountStep()}" step="{$sub_product->getAmountStep()}" class="fieldAmount concomitant" data-id="{$sub_product->id}" value="{$sub_product_data.amount}" name="products[{$index}][concomitant_amount][{$sub_product->id}]"> 
                                                        <a class="dec" data-amount-step="{$sub_product->getAmountStep()}"></a>
                                                        <span class="num" title="{t}Количество{/t}">{$sub_product_data.amount}</span> {$product->getUnit()->stitle|default:t("шт.")}
                                                        <a class="inc" data-amount-step="{$sub_product->getAmountStep()}"></a>
                                                    </div>
                                                {else}
                                                    <div class="amount" title="{t}Количество{/t}">{$sub_product_data.amount} {$sub_product->getUnit()->stitle|default:t("шт.")}</div>
                                                {/if}
                                                <div class="cost">{$sub_product_data.cost}</div>
                                                <div class="discount">
                                                    {if $sub_product_data.discount>0}
                                                        {t}скидка{/t} {$sub_product_data.discount}
                                                    {/if}
                                                </div>
                                                <div class="error">{$sub_product_data.amount_error}</div>
                                            </div>
                                            <div class="remove"></div>
                                        </div>
                                    {/foreach}
                                {/foreach}
                                {foreach from=$cart->getCouponItems() key=id item=item}
                                <div data-id="{$index}" data-product-id="{$cartitem.entity_id}" class="cartitem couponLine">
                                    <div colspan="2" class="title">{t}Купон на скидку{/t} {$item.coupon.code}</div>
                                    <div class="price"></div>
                                    <div class="remove"><a href="{$router->getUrl('shop-front-cartpage', ["Act" => "removeItem", "id" => $id, "floatCart" => $floatCart])}" title="{t}Удалить скидочный купон{/t}" class="iconRemove"></a></div>
                                </div>
                                {/foreach}
                        </div>
                    </div>
                {/hook}
             {*    {hook name="shop-cartpage:summary" title="{t}Корзина:итог{/t}"}
                    <div class="cartFooter{if $coupon_code} onPromo{/if}">
                        <a class="hasPromo" onclick="$(this).parent().toggleClass('onPromo')">{t}У меня есть промо-код{/t}</a>
                        <div class="promo">
                            Промо-код: &nbsp;<input type="text" name="coupon" value="{$coupon_code}" class="couponCode">&nbsp; 
                            <a class="applyCoupon">{t}применить{/t}</a>
                        </div>
                    </div>
                {/hook}              *}       
                {hook name="shop-cartpage:bottom" title="{t}Корзина:подвал{/t}"}
                    <div class="cartError {if empty($cart_data.errors)}hidden{/if}">
                        {foreach from=$cart_data.errors item=error}
                            {$error}<br>
                        {/foreach}
                    </div>
                {/hook}
            </form>
            {* Покупка в один клик в корзине *}
{*             {if $THEME_SETTINGS.enable_one_click_cart}            
                <a href="JavaScript:;" class="toggleOneClickCart">{t}Заказать по телефону{/t}</a>
                {moduleinsert name="\Shop\Controller\Block\OneClickCart"}
            {/if} *}
            {else}
            <div class="emptyCart">
                <a class="iconX closeDlg"></a>
                {t}В корзине нет товаров{/t}
            </div>            
            {/if}
        </div>
    </div>
{else}
    <div class="cartPage container" id="cartItems">
        
        <h1 class='cursive'>{t}Корзина{/t}</h1>
        <hr>

        {* Верхушка корзины *}
        {hook name="shop-cartpage:summary" title="{t}Корзина:итог{/t}"}
        <div>
            <p class='cart-header'>Всего товаров: <strong>{$cart_data.items_count}</strong> на общую сумму: <strong>{$cart_data.total}</strong></p>
            <div class="loader"></div>            
        </div>
        {/hook}

        <div class='cart-flex'>
            <div class='cart-flex__items'>
            {if !empty($cart_data.items)}
            <form method="POST" action="{$router->getUrl('shop-front-cartpage', ["Act" => "update"])}" id="cartForm" class="formStyle">
                <input type="submit" class="hidden">
                
                {hook name="shop-cartpage:products" title="{t}Корзина:товары{/t}"}
                {foreach $cart_data.items as $index => $item}
                {$product=$product_items[$index].product}
                {$cartitem=$product_items[$index].cartitem}
                {if !empty($cartitem.multioffers)}
                    {$multioffers=unserialize($cartitem.multioffers)} 
                {/if}    
                
                <div data-id="{$index}" data-product-id="{$cartitem.entity_id}" class="cart-item cartitem{if $smarty.foreach.items.first} first{/if}">
                    <div class="image">
                        <a href="{$product->getUrl()}"><img src="{$product->getOfferMainImage($cartitem.offer, 230, 210)}" alt="{$product.title}"/></a>
                    </div>
                    <div class='cart-item__description'>

                        <a href="{$product->getUrl()}" class="text">{$product.title}</a>

                        <div class="remove">
                            <a title="{t}Удалить товар из корзины{/t}" href="{$router->getUrl('shop-front-cartpage', ["Act" => "removeItem", "id" => $index])}">
                                <i class='material-icons'>delete</i>
                            </a>
                        </div>

                        <div class='quantity amount'>       
                            <div class="incdec">
                                <a href="#" class="inc" data-amount-step="{$product->getAmountStep()}">+</a>
                                <input type="number" min="{$product->getAmountStep()}" step="{$product->getAmountStep()}" class="inp fieldAmount" value="{$cartitem.amount}" name="products[{$index}][amount]">
                                <a href="#" class="dec" data-amount-step="{$product->getAmountStep()}">-</a>
                            </div>
                            <img class='favourite' src='{$THEME_IMG}/icons/favourite.png' alt='Добавить в избранное' title='Добавить в избранное' />
         {*                    <span class="unit">
                                {if $catalog_config.use_offer_unit}
                                    {$product.offers.items[$cartitem.offer]->getUnit()->stitle}
                                {else}
                                    {$product->getUnit()->stitle}
                                    {/if}
                                </span> *}
                        </div>

                        <div class="price">
                            {$item.cost}
                            <div class="discount">
                                {if $item.discount>0}
                                    {t}скидка{/t} {$item.discount}
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
                {/foreach}  
                {/hook} 
            </form>
            </div>

            <div class='cart-flex__delivery'>

                <h4>Итого: {$cart_data.total}</h4>

                {hook name="shop-cartpage:bottom" title="{t}Корзина:подвал{/t}"}
                    {if !empty($cart_data.errors)}
                    <div class="cartErrors">
                        {foreach $cart_data.errors as $error}
                            {$error}<br>
                        {/foreach}
                    </div>
                    {/if}
                
                    <div class="controls">
                        <a href="{$router->getUrl('shop-front-checkout')}" class="submit btn color{if $cart_data.has_error} disabled{/if}">{t}Оформить заказ{/t}</a>
                        <a href="/catalogue/" class="btn btn-yellow continue">{t}Продолжить покупки{/t}</a>
                    {*  {if $THEME_SETTINGS.enable_one_click_cart}            
                            <a href="JavaScript:;" class="button toggleOneClickCart">{t}Заказать по телефону{/t}</a>
                        {/if}  *}
                        {if !empty($cart_data.items)}
                            <a href="{$router->getUrl('shop-front-cartpage', ["Act" => "cleanCart"])}" class="clear">{t}Очистить корзину{/t}<i class='material-icons'>close</i></a>
                        {/if}
                    </div>
                {/hook}
                
            </div>
        </div>

        {* Покупка в один клик в корзине *}
        {if $THEME_SETTINGS.enable_one_click_cart}            
            {moduleinsert name="\Shop\Controller\Block\OneClickCart"}
        {/if}
        {else}
        <div class="emptyCart">
            {t}В корзине нет товаров{/t}
        </div>                    
        {/if}
    </div>
{/if}