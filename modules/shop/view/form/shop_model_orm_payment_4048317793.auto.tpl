
<div class="formbox" >
                
        <form method="POST" action="{urlmake}" enctype="multipart/form-data" class="crud-form">
            <input type="submit" value="" style="display:none">
            <div class="notabs">
                                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                    
                
                
                                    <table class="otable">
                                                                                                                    
                                <tr>
                                    <td class="otitle">{$elem.__title->getTitle()}&nbsp;&nbsp;{if $elem.__title->getHint() != ''}<a class="help-icon" title="{$elem.__title->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__title->getRenderTemplate() field=$elem.__title}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__admin_suffix->getTitle()}&nbsp;&nbsp;{if $elem.__admin_suffix->getHint() != ''}<a class="help-icon" title="{$elem.__admin_suffix->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__admin_suffix->getRenderTemplate() field=$elem.__admin_suffix}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__description->getTitle()}&nbsp;&nbsp;{if $elem.__description->getHint() != ''}<a class="help-icon" title="{$elem.__description->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__description->getRenderTemplate() field=$elem.__description}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__picture->getTitle()}&nbsp;&nbsp;{if $elem.__picture->getHint() != ''}<a class="help-icon" title="{$elem.__picture->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__picture->getRenderTemplate() field=$elem.__picture}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__first_status->getTitle()}&nbsp;&nbsp;{if $elem.__first_status->getHint() != ''}<a class="help-icon" title="{$elem.__first_status->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__first_status->getRenderTemplate() field=$elem.__first_status}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__success_status->getTitle()}&nbsp;&nbsp;{if $elem.__success_status->getHint() != ''}<a class="help-icon" title="{$elem.__success_status->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__success_status->getRenderTemplate() field=$elem.__success_status}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__user_type->getTitle()}&nbsp;&nbsp;{if $elem.__user_type->getHint() != ''}<a class="help-icon" title="{$elem.__user_type->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__user_type->getRenderTemplate() field=$elem.__user_type}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__target->getTitle()}&nbsp;&nbsp;{if $elem.__target->getHint() != ''}<a class="help-icon" title="{$elem.__target->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__target->getRenderTemplate() field=$elem.__target}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__delivery->getTitle()}&nbsp;&nbsp;{if $elem.__delivery->getHint() != ''}<a class="help-icon" title="{$elem.__delivery->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__delivery->getRenderTemplate() field=$elem.__delivery}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__public->getTitle()}&nbsp;&nbsp;{if $elem.__public->getHint() != ''}<a class="help-icon" title="{$elem.__public->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__public->getRenderTemplate() field=$elem.__public}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__default_payment->getTitle()}&nbsp;&nbsp;{if $elem.__default_payment->getHint() != ''}<a class="help-icon" title="{$elem.__default_payment->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__default_payment->getRenderTemplate() field=$elem.__default_payment}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__commission->getTitle()}&nbsp;&nbsp;{if $elem.__commission->getHint() != ''}<a class="help-icon" title="{$elem.__commission->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__commission->getRenderTemplate() field=$elem.__commission}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__commission_include_delivery->getTitle()}&nbsp;&nbsp;{if $elem.__commission_include_delivery->getHint() != ''}<a class="help-icon" title="{$elem.__commission_include_delivery->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__commission_include_delivery->getRenderTemplate() field=$elem.__commission_include_delivery}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__commission_as_product_discount->getTitle()}&nbsp;&nbsp;{if $elem.__commission_as_product_discount->getHint() != ''}<a class="help-icon" title="{$elem.__commission_as_product_discount->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__commission_as_product_discount->getRenderTemplate() field=$elem.__commission_as_product_discount}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__create_cash_receipt->getTitle()}&nbsp;&nbsp;{if $elem.__create_cash_receipt->getHint() != ''}<a class="help-icon" title="{$elem.__create_cash_receipt->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__create_cash_receipt->getRenderTemplate() field=$elem.__create_cash_receipt}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__class->getTitle()}&nbsp;&nbsp;{if $elem.__class->getHint() != ''}<a class="help-icon" title="{$elem.__class->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__class->getRenderTemplate() field=$elem.__class}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__show_on_partners->getTitle()}&nbsp;&nbsp;{if $elem.__show_on_partners->getHint() != ''}<a class="help-icon" title="{$elem.__show_on_partners->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__show_on_partners->getRenderTemplate() field=$elem.__show_on_partners}</td>
                                </tr>
                                                            
                        
                    </table>
                            </div>
        </form>
    </div>