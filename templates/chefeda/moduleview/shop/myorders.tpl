{if count($order_list)}
<div class="gray ordersTabs">
    <div class="tab act">

        {foreach $order_list as $order}
            {$cart=$order->getCart()}
            {$products=$cart->getProductItems()}
            {$order_data=$cart->getOrderData()}    
            {$products_first=array_slice($products, 0, 5)}
            {$products_more=array_slice($products, 5)}            
        <div class='my-orders'>
            <div class="info">
                <a href="{$router->getUrl('shop-front-myorderview', ["order_id" => $order.order_num])}" class="more">№ {$order.order_num}</a>
                — <span class="date"><strong>{$order.dateof|date_format:"d.m.Y"}</strong></span>
                <span class="new badge" style='background-color: {$order->getStatus()->bgcolor}' data-badge-caption="{$order->getStatus()->title}"></span>
            </div>    
            <hr>  

            {hook name="shop-myorders:products" title="{t}Мои заказы:список товаров одного заказа{/t}"}
                <ul class='my-orders__list'>
                    {foreach $products_first as $item}
                    {$multioffer_titles=$item.cartitem->getMultiOfferTitles()}
                        <li>
                            {$main_image=$item.product->getMainImage()}
                            <div>
                            {if $item.product.id>0}
                                <a href="{$item.product->getUrl()}" class="image"><img src="{$main_image->getUrl(60, 60, 'xy')}" alt="{$main_image.title|default:"{$item.cartitem.title}"}"/></a>
                                <a href="{$item.product->getUrl()}" class="title">{$item.cartitem.title}</a>
                            {else}
                                <span class="image"><img src="{$main_image->getUrl(60, 60, 'xy')}" alt="{$main_image.title|default:"{$item.cartitem.title}"}"/></span>
                                <span class="title">{$item.cartitem.title}</span>
                            {/if}
                            </div>
                            {if $multioffer_titles || $item.cartitem.model}
                                <div class="multioffersWrap">
                                    {foreach from=$multioffer_titles item=multioffer}
                                    {$multioffer.value}{if !$multioffer@last}, {/if}
                                    {/foreach}
                                    {if !$multioffer_titles}
                                        {$item.cartitem.model}
                                    {/if}
                                </div>
                            {/if}                            
                        </li>
                    {/foreach}
                </ul>
                {if !empty($products_more)}
                    <div class="moreItems">
                        <div class="switch">
                            <label class="switch-label">
                                {t}Показать все{/t}
                                <input type="checkbox">
                                <span class="lever"></span>
                            </label>
                        </div>
                        <ul class="my-orders__list items dn">
                            {foreach $products_more as $item}
                            <li>
                                <div>
                                {if $item.product.id>0}
                                    <a href="{$item.product->getUrl()}" class="image"><img src="{$item.product->getMainImage(60, 60, 'xy')}"></a>
                                    <a href="{$item.product->getUrl()}" class="title">{$item.cartitem.title}</a>
                                {else}
                                    <span class="image"><img src="{$item.product->getMainImage(60, 60, 'xy')}"></span>
                                    <span class="title">{$item.cartitem.title}</span>
                                {/if}
                                </div>   
                            </li>
                            {/foreach}
                        </ul>
                    </div>
                {/if}
                <p class="price">Итого: {$order_data.total_cost}</p>
            {/hook}
 

            <div class="actions">
                {hook name="shop-myorders:actions" title="{t}Мои заказы:действия над одним заказом{/t}"}
                    {if $order->getPayment()->hasDocs()}
                        {assign var=type_object value=$order->getPayment()->getTypeObject()}
                        {foreach $type_object->getDocsName() as $key=>$doc}
                            <a class='btn' href="{$type_object->getDocUrl($key)}" target="_blank">{$doc.title}</a>
                        {/foreach}            
                    {/if}
                    {if $order->canOnlinePay()}
                        <a class='btn' href="{$order->getOnlinePayUrl()}">{t}оплатить{/t}</a><br>
                    {/if}
                {/hook}
                <a class='btn btn-secondary' style='margin-left: 15px' href="{$router->getUrl('shop-front-myorderview', ["order_id" => $order.order_num])}" class="more">{t}подробнее{/t}</a>
            </div>
        </div>    
        {/foreach}
    </div>
</div>
{else}
<div class="noEntity">
    {t}Еще не оформлено ни одного заказа{/t}
</div>
{/if}

<script>
    $(".switch").find("input[type=checkbox]").on("change",function() {
        $('.dn').slideToggle(); 
    });
</script>
{include file="%THEME%/paginator.tpl"}