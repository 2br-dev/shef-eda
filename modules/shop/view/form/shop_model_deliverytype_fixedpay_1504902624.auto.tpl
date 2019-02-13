

                                            
    


                                    
            <tr>
                <td class="otitle">{$elem.__cost->getTitle()}&nbsp;&nbsp;{if $elem.__cost->getHint() != ''}<a class="help-icon" title="{$elem.__cost->getHint()|escape}">?</a>{/if}
                </td>
                <td>{include file=$elem.__cost->getRenderTemplate() field=$elem.__cost}</td>
            </tr>
                    
    
