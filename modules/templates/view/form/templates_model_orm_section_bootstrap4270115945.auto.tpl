
<div class="formbox" >
                
        <form method="POST" action="{urlmake}" enctype="multipart/form-data" class="crud-form">
            <input type="submit" value="" style="display:none">
            <div class="notabs">
                                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                    
                
                
                                    <table class="otable">
                                                                                                                    
                                <tr>
                                    <td class="otitle">{$elem.__alias->getTitle()}&nbsp;&nbsp;{if $elem.__alias->getHint() != ''}<a class="help-icon" title="{$elem.__alias->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__alias->getRenderTemplate() field=$elem.__alias}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__width_xl->getTitle()}&nbsp;&nbsp;{if $elem.__width_xl->getHint() != ''}<a class="help-icon" title="{$elem.__width_xl->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__width_xl->getRenderTemplate() field=$elem.__width_xl}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__inset_align->getTitle()}&nbsp;&nbsp;{if $elem.__inset_align->getHint() != ''}<a class="help-icon" title="{$elem.__inset_align->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__inset_align->getRenderTemplate() field=$elem.__inset_align}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__prefix_xl->getTitle()}&nbsp;&nbsp;{if $elem.__prefix_xl->getHint() != ''}<a class="help-icon" title="{$elem.__prefix_xl->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__prefix_xl->getRenderTemplate() field=$elem.__prefix_xl}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__pull_xl->getTitle()}&nbsp;&nbsp;{if $elem.__pull_xl->getHint() != ''}<a class="help-icon" title="{$elem.__pull_xl->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__pull_xl->getRenderTemplate() field=$elem.__pull_xl}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__push_xl->getTitle()}&nbsp;&nbsp;{if $elem.__push_xl->getHint() != ''}<a class="help-icon" title="{$elem.__push_xl->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__push_xl->getRenderTemplate() field=$elem.__push_xl}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__order_xl->getTitle()}&nbsp;&nbsp;{if $elem.__order_xl->getHint() != ''}<a class="help-icon" title="{$elem.__order_xl->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__order_xl->getRenderTemplate() field=$elem.__order_xl}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__css_class->getTitle()}&nbsp;&nbsp;{if $elem.__css_class->getHint() != ''}<a class="help-icon" title="{$elem.__css_class->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__css_class->getRenderTemplate() field=$elem.__css_class}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__is_clearfix_after->getTitle()}&nbsp;&nbsp;{if $elem.__is_clearfix_after->getHint() != ''}<a class="help-icon" title="{$elem.__is_clearfix_after->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__is_clearfix_after->getRenderTemplate() field=$elem.__is_clearfix_after}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__inset_template->getTitle()}&nbsp;&nbsp;{if $elem.__inset_template->getHint() != ''}<a class="help-icon" title="{$elem.__inset_template->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__inset_template->getRenderTemplate() field=$elem.__inset_template}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__outside_template->getTitle()}&nbsp;&nbsp;{if $elem.__outside_template->getHint() != ''}<a class="help-icon" title="{$elem.__outside_template->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__outside_template->getRenderTemplate() field=$elem.__outside_template}</td>
                                </tr>
                                                            
                        
                    </table>
                            </div>
        </form>
    </div>