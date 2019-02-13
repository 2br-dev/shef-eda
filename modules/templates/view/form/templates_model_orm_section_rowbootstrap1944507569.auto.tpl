
<div class="formbox" >
                
        <form method="POST" action="{urlmake}" enctype="multipart/form-data" class="crud-form">
            <input type="submit" value="" style="display:none">
            <div class="notabs">
                                                                                                            
                                                                                            
                                                                                            
                    
                
                
                                    <table class="otable">
                                                                                                                    
                                <tr>
                                    <td class="otitle">{$elem.__css_class->getTitle()}&nbsp;&nbsp;{if $elem.__css_class->getHint() != ''}<a class="help-icon" title="{$elem.__css_class->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__css_class->getRenderTemplate() field=$elem.__css_class}</td>
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