/**
* Plugin, активирующий автоматическую транслитерацию поля
* @author ReadyScript lab.
*/
(function($){
    $.fn.autoTranslit = function(method) {
        var defaults = {
            formAction: 'form[action]',
            context:'form, .virtual-form',
            virtualForm: '.virtual-form',
            addPredicate: '=add',
            targetName: null,
            showUpdateButton: true
        }, 
        args = arguments;
        
        return this.each(function() {
            var $this = $(this), 
                data = $this.data('autoTranslit');
            
            var methods = {
                init: function(initoptions) {                    
                    if (data) return;
                    data = {}; $this.data('autoTranslit', data);
                    data.options = $.extend({}, defaults, initoptions);
                    if ($this.data('autotranslit')) {
                        data.options.targetName = $this.data('autotranslit');
                    }
                    data.options.target = $('input[name="'+data.options.targetName+'"]', $(this).closest(data.options.context));
                    if (data.options.target) {
                        //Подключаем автоматическую транслитерацию, если происходит создание объекта
                        var isAdd;
                        if ($this.closest(data.options.virtualForm).length) {
                            isAdd = $this.closest(data.options.virtualForm).data('isAdd');
                            console.log($this.closest(data.options.virtualForm));
                        } else {
                            isAdd = $this.closest(data.options.formAction).attr('action').indexOf(data.options.addPredicate) > -1;
                        }
                        if (isAdd) {
                            $this.on('blur', onBlur);
                        }
                        if (data.options.showUpdateButton) {
                            var update = $('<a class="update-translit"></a>').click(onUpdateTranslit).attr('title', lang.t('Транслитерировать заново'));
                            $(data.options.target).after(update).parent().trigger('new-content');
                        }
                    }
                }
            };
            
            //private 
            var onBlur = function() {
                if (data.options.target.val() == '') {
                    onUpdateTranslit();
                }
            },
            onUpdateTranslit = function() {
                data.options.target.val( translit( $this.val() ) );
            },
            translit = function( text ) {

                var rus = ['а','б','в','г','д','е','ё','ж','з','и','й','к','л','м','н','о',
                    'п','р','с','т','у','ф','х','ц','ч','ш','щ','ь','ы','ъ','э','ю','я'];

                var eng = ['a', 'b', 'v', 'g', 'd', 'e', 'e', 'zh', 'z', 'i', 'y', 'k',
                    'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'h', 'c', 'ch', 'sh',
                    'sch', '', 'y', '', 'e', 'yu', 'ya'];

                var result = '', char;
                var hyphen = false;
                for(var i=0; i<text.length; i++) {
                    char = text.toLowerCase().charAt(i);

                    if (char.match(/[a-z0-9]/gi)) {
                        result = result + char;
                        hyphen = false;
                    } else {
                        var pos = rus.indexOf(char);
                        if (pos > -1) {
                            result = result + eng[pos];
                            hyphen = false;
                        } else if (!hyphen) {
                            result = result + '-';
                            hyphen = true;
                        }
                    }
                }

                //Вырезаем по краям знак минуса "-"
                result = result.replace(/^\-+|\-+$/g, '');

                return result;
            };
            
            
            
            if ( methods[method] ) {
                methods[ method ].apply( this, Array.prototype.slice.call( args, 1 ));
            } else if ( typeof method === 'object' || ! method ) {
                return methods.init.apply( this, args );
            }
        });
    };

    $.contentReady(function() {
        $('input[data-autotranslit]', this).autoTranslit();
    });

})(jQuery);