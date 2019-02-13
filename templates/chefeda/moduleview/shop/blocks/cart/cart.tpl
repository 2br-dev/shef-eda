<a href="{$router->getUrl('shop-front-checkout')}" class="button checkout{if !$cart_info.has_error && $cart_info.items_count} active{/if}" id="checkout">{t}Оформить заказ{/t}</a>
<div class="cart{if $cart_info.items_count} active{/if}" id="cart">

    <a href="{$router->getUrl('shop-front-cartpage')}" class="openCart showCart">
        <i class="material-icons" style='color: #fff'>shopping_cart</i>
        <span class="text">{t}Корзина{/t}</span>
    </a>

    <span class="floatCartAmount">{$cart_info.items_count}</span>
    <span class="floatCartPrice">{$cart_info.total}</span>
</div>