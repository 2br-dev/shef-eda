
<div class="formbox" >
            
    <div class="rs-tabs" role="tabpanel">
        <ul class="tab-nav" role="tablist">
                    <li class=" active"><a data-target="#shop-delivery-tab0" data-toggle="tab" role="tab">{$elem->getPropertyIterator()->getGroupName(0)}</a></li>
                    <li class=""><a data-target="#shop-delivery-tab1" data-toggle="tab" role="tab">{$elem->getPropertyIterator()->getGroupName(1)}</a></li>
                    <li class=""><a data-target="#shop-delivery-tab2" data-toggle="tab" role="tab">{$elem->getPropertyIterator()->getGroupName(2)}</a></li>
                    <li class=""><a data-target="#shop-delivery-tab3" data-toggle="tab" role="tab">{$elem->getPropertyIterator()->getGroupName(3)}</a></li>
        
        </ul>
        <form method="POST" action="{urlmake}" enctype="multipart/form-data" class="tab-content crud-form">
            <input type="submit" value="" style="display:none"/>
                        <div class="tab-pane active" id="shop-delivery-tab0" role="tabpanel">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                            <table class="otable">
                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__title->getTitle()}&nbsp;&nbsp;{if $elem.__title->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__title->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__title->getRenderTemplate() field=$elem.__title}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__admin_suffix->getTitle()}&nbsp;&nbsp;{if $elem.__admin_suffix->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__admin_suffix->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__admin_suffix->getRenderTemplate() field=$elem.__admin_suffix}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__description->getTitle()}&nbsp;&nbsp;{if $elem.__description->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__description->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__description->getRenderTemplate() field=$elem.__description}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__picture->getTitle()}&nbsp;&nbsp;{if $elem.__picture->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__picture->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__picture->getRenderTemplate() field=$elem.__picture}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__parent_id->getTitle()}&nbsp;&nbsp;{if $elem.__parent_id->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__parent_id->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__parent_id->getRenderTemplate() field=$elem.__parent_id}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__xzone->getTitle()}&nbsp;&nbsp;{if $elem.__xzone->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__xzone->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__xzone->getRenderTemplate() field=$elem.__xzone}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__min_price->getTitle()}&nbsp;&nbsp;{if $elem.__min_price->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__min_price->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__min_price->getRenderTemplate() field=$elem.__min_price}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__max_price->getTitle()}&nbsp;&nbsp;{if $elem.__max_price->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__max_price->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__max_price->getRenderTemplate() field=$elem.__max_price}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__min_weight->getTitle()}&nbsp;&nbsp;{if $elem.__min_weight->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__min_weight->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__min_weight->getRenderTemplate() field=$elem.__min_weight}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__max_weight->getTitle()}&nbsp;&nbsp;{if $elem.__max_weight->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__max_weight->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__max_weight->getRenderTemplate() field=$elem.__max_weight}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__min_cnt->getTitle()}&nbsp;&nbsp;{if $elem.__min_cnt->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__min_cnt->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__min_cnt->getRenderTemplate() field=$elem.__min_cnt}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__first_status->getTitle()}&nbsp;&nbsp;{if $elem.__first_status->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__first_status->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__first_status->getRenderTemplate() field=$elem.__first_status}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__user_type->getTitle()}&nbsp;&nbsp;{if $elem.__user_type->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__user_type->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__user_type->getRenderTemplate() field=$elem.__user_type}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__extrachange_discount->getTitle()}&nbsp;&nbsp;{if $elem.__extrachange_discount->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__extrachange_discount->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__extrachange_discount->getRenderTemplate() field=$elem.__extrachange_discount}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__extrachange_discount_implementation->getTitle()}&nbsp;&nbsp;{if $elem.__extrachange_discount_implementation->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__extrachange_discount_implementation->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__extrachange_discount_implementation->getRenderTemplate() field=$elem.__extrachange_discount_implementation}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__public->getTitle()}&nbsp;&nbsp;{if $elem.__public->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__public->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__public->getRenderTemplate() field=$elem.__public}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__default->getTitle()}&nbsp;&nbsp;{if $elem.__default->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__default->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__default->getRenderTemplate() field=$elem.__default}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__class->getTitle()}&nbsp;&nbsp;{if $elem.__class->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__class->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__class->getRenderTemplate() field=$elem.__class}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__show_on_partners->getTitle()}&nbsp;&nbsp;{if $elem.__show_on_partners->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__show_on_partners->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__show_on_partners->getRenderTemplate() field=$elem.__show_on_partners}</td>
                                </tr>
                                
                                                            
                        </table>
                                                </div>
                        <div class="tab-pane" id="shop-delivery-tab1" role="tabpanel">
                                                                                                                            
                                            <table class="otable">
                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__delivery_periods->getTitle()}&nbsp;&nbsp;{if $elem.__delivery_periods->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__delivery_periods->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__delivery_periods->getRenderTemplate() field=$elem.__delivery_periods}</td>
                                </tr>
                                
                                                            
                        </table>
                                                </div>
                        <div class="tab-pane" id="shop-delivery-tab2" role="tabpanel">
                                                                                                                            
                                            <table class="otable">
                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__tax_ids->getTitle()}&nbsp;&nbsp;{if $elem.__tax_ids->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__tax_ids->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__tax_ids->getRenderTemplate() field=$elem.__tax_ids}</td>
                                </tr>
                                
                                                            
                        </table>
                                                </div>
                        <div class="tab-pane" id="shop-delivery-tab3" role="tabpanel">
                                                                                                                                                                                                
                                            <table class="otable">
                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__is_use_yandex_market_cpa->getTitle()}&nbsp;&nbsp;{if $elem.__is_use_yandex_market_cpa->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__is_use_yandex_market_cpa->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__is_use_yandex_market_cpa->getRenderTemplate() field=$elem.__is_use_yandex_market_cpa}</td>
                                </tr>
                                
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__is_map_holiday->getTitle()}&nbsp;&nbsp;{if $elem.__is_map_holiday->getHint() != ''}<a class="help-icon" data-placement="right" title="{$elem.__is_map_holiday->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__is_map_holiday->getRenderTemplate() field=$elem.__is_map_holiday}</td>
                                </tr>
                                
                                                            
                        </table>
                                                </div>
            
        </form>
    </div>
    </div>