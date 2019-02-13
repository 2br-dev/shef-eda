
<div class="formbox" >
                
        <form method="POST" action="{urlmake}" enctype="multipart/form-data" class="crud-form">
            <input type="submit" value="" style="display:none">
            <div class="notabs">
                                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                    
                
                
                                    <table class="otable">
                                                                                                                    
                                <tr>
                                    <td class="otitle">{$elem.__columns->getTitle()}&nbsp;&nbsp;{if $elem.__columns->getHint() != ''}<a class="help-icon" title="{$elem.__columns->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__columns->getRenderTemplate() field=$elem.__columns}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__title->getTitle()}&nbsp;&nbsp;{if $elem.__title->getHint() != ''}<a class="help-icon" title="{$elem.__title->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__title->getRenderTemplate() field=$elem.__title}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__css_class->getTitle()}&nbsp;&nbsp;{if $elem.__css_class->getHint() != ''}<a class="help-icon" title="{$elem.__css_class->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__css_class->getRenderTemplate() field=$elem.__css_class}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__is_fluid->getTitle()}&nbsp;&nbsp;{if $elem.__is_fluid->getHint() != ''}<a class="help-icon" title="{$elem.__is_fluid->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__is_fluid->getRenderTemplate() field=$elem.__is_fluid}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__wrap_element->getTitle()}&nbsp;&nbsp;{if $elem.__wrap_element->getHint() != ''}<a class="help-icon" title="{$elem.__wrap_element->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__wrap_element->getRenderTemplate() field=$elem.__wrap_element}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__wrap_css_class->getTitle()}&nbsp;&nbsp;{if $elem.__wrap_css_class->getHint() != ''}<a class="help-icon" title="{$elem.__wrap_css_class->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__wrap_css_class->getRenderTemplate() field=$elem.__wrap_css_class}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__outside_template->getTitle()}&nbsp;&nbsp;{if $elem.__outside_template->getHint() != ''}<a class="help-icon" title="{$elem.__outside_template->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__outside_template->getRenderTemplate() field=$elem.__outside_template}</td>
                                </tr>
                                                                                                                            
                                <tr>
                                    <td class="otitle">{$elem.__inside_template->getTitle()}&nbsp;&nbsp;{if $elem.__inside_template->getHint() != ''}<a class="help-icon" title="{$elem.__inside_template->getHint()|escape}">?</a>{/if}
                                    </td>
                                    <td>{include file=$elem.__inside_template->getRenderTemplate() field=$elem.__inside_template}</td>
                                </tr>
                                                            
                        
                    </table>
                            </div>
        </form>
    </div>