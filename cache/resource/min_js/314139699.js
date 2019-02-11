(function(n,p,u){var w=n([]),s=n.resize=n.extend(n.resize,{}),o,l="setTimeout",m="resize",t=m+"-special-event",v="delay",r="throttleWindow";s[v]=250;s[r]=true;n.event.special[m]={setup:function(){if(!s[r]&&this[l]){return false}var a=n(this);w=w.add(a);n.data(this,t,{w:a.width(),h:a.height()});if(w.length===1){q()}},teardown:function(){if(!s[r]&&this[l]){return false}var a=n(this);w=w.not(a);a.removeData(t);if(!w.length){clearTimeout(o)}},add:function(b){if(!s[r]&&this[l]){return false}var c;function a(d,h,g){var f=n(this),e=n.data(this,t);e.w=h!==u?h:f.width();e.h=g!==u?g:f.height();c.apply(this,arguments)}if(n.isFunction(b)){c=b;return a}else{c=b.handler;b.handler=a}}};function q(){o=p[l](function(){w.each(function(){var d=n(this),a=d.width(),b=d.height(),c=n.data(this,t);if(a!==c.w||b!==c.h){d.trigger(m,[c.w=a,c.h=b])}});q()},s[v])}})(jQuery,this);(function(b){var a={};function c(f){function e(){var h=f.getPlaceholder();if(h.width()==0||h.height()==0){return}f.resize();f.setupGrid();f.draw()}function g(i,h){i.getPlaceholder().resize(e)}function d(i,h){i.getPlaceholder().unbind("resize",e)}f.hooks.bindEvents.push(g);f.hooks.shutdown.push(d)}b.plot.plugins.push({init:c,options:a,name:"resize",version:"1.0"})})(jQuery);
/**
* Plugin, активирующий виджет Динамика продаж
*/
$.widget('rs.rsSellChart', {
    options: {
        yearFilter: '.year-filter',
        yearCheckbox: '.year-filter input',
        yearCheckboxLabel: '.year-filter label',
        placeholder: '.placeholder',
        yearPlotOptions: {
            xaxis: {
                minTickSize: [1, "month"],
            }
        },
        monthPlotOptions: {
            xaxis: {
                minTickSize: [1, "day"],
            }
        },
        plotOptions: {
            xaxis: {
                mode: 'time',
                monthNames: lang.t("янв,фев,мар,апр,май,июн,июл,авг,сен,окт,ноя,дек").split(',')
            },
            yaxis: {
                tickDecimals:0
            },
            lines: { show: true },
            points: { show: true },
            legend: {
                show: true,
                noColumns: 1, // number of colums in legend table
                margin: 5, // distance from grid edge to default legend container within plot
                backgroundColor: '#fff', // null means auto-detect
                backgroundOpacity: 0.85 // set to 0 to avoid background
            },
            grid: {
                hoverable: true,
                borderWidth: 0,
                borderColor: '#e5e5e5'
            },
            hooks: {
                processRawData: function(plot, series, data, datapoints) {
                    var seriesData = [];
                    $.each(data, function(key, val) {
                        seriesData.push([val.x, val.y]);
                    });

                    series.originalData = $.extend({}, data);
                    series.data = seriesData;
                }

            }
        }
    },

    _create: function() {
        var _this = this;
        this.chart = $(this.options.placeholder, this.element);

        this.element
            .on('change', this.options.yearCheckbox, function() {
                _this.build();
            })
            .on('click', this.options.yearFilter, function(e) {e.stopPropagation();});

        this.build();
        this.chart.on("plothover", function(event, pos, item) {
            _this._plotHover(event, pos, item);
        });
    },

    build: function() {
        var _this = this,
            dataset = [],
            yearList = $(this.options.yearCheckbox + ':checked', this.element);

        if (yearList.length) {
            yearList.each(function() {
                var key = $(this).val();
                if (key && _this.chart.data('inlineData').points[key])
                    dataset.push(_this.chart.data('inlineData').points[key]);
            });
        } else {
            dataset = this.chart.data('inlineData').points;
        }

        if (dataset.length > 0) {
            $.plot(this.chart, dataset, $.extend(true, this.options.plotOptions, this.options[this.chart.data('inlineData').range+'PlotOptions']));
        }
    },

    _plotHover: function(event, pos, item) {
        if (item) {
            if (this.previousPoint != item.dataIndex) {
                this.previousPoint = item.dataIndex;
                var
                    pointData = item.series.originalData[item.dataIndex],
                    dateStr = this[('_' + this.chart.data('inlineData').range + 'Format')].call(this, pointData);

                var tooltipText = lang.t('Заказов ')+dateStr+': <strong>'+pointData.count+'</strong> <br\> ' + lang.t('На сумму') + ': <strong>'+this.numberFormat(pointData.total_cost,2,',',' ')+' '+this.chart.data('inlineData').currency+'</strong>';
                this._showTooltip(item.pageX, item.pageY, tooltipText);
            }
        }
        else {
            $("#sellChartTooltip").remove();
            this.previousPoint = null;
        }
    },

    _showTooltip: function(x, y, contents) {
        $("#sellChartTooltip").remove();
        $('<div id="sellChartTooltip" class="chart-tooltip"/>').html(contents).css( {
            top: y + 10,
            left: x + 10
        }).appendTo("body").fadeIn(200);
    },

    _yearFormat: function(pointData) {
        var
            months = lang.t("январе,феврале,марте,апреле,мае,июне,июле,августе,сентябре,октябре,ноябре,декабре").split(','),
            pointDate = new Date(pointData.pointDate);

        return lang.t('в %date', {date: months[pointDate.getMonth()] + ' ' + pointDate.getFullYear()});
    },

    _monthFormat: function(pointData) {
        var
            months = lang.t("января,февраля,марта,апреля, мая,июня,июля,августа,сентября,октября,ноября,декабря").split(','),
            pointDate = new Date(pointData.x);

        return pointDate.getDate()+' '+months[pointDate.getMonth()]+' '+pointDate.getFullYear();
    },

    numberFormat: function(number, decimals, dec_point, thousands_sep) {
        number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
        var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function(n, prec) {
                var k = Math.pow(10, prec);
                return '' + (Math.round(n * k) / k)
                        .toFixed(prec);
            };

            // Fix for IE parseFloat(0.55).toFixed(0) = 0;
        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n))
            .split('.');
        if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
        }
        if ((s[1] || '')
                .length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1)
                .join('0');
        }
        return s.join(dec);
    }
});
/**
 * Формирование вывода цен в отформтированном виде
 *
 * @param number - цифры для преобразования
 * @param decimals - количество дробных чисел
 * @param dec_point - разделитель дробных
 * @param thousands_sep - разделитель тысячных
 * @return {string}
 */
function number_format(number, decimals, dec_point, thousands_sep) {
    number = (number + '')
        .replace(/[^0-9+\-Ee.]/g, '');
    var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
        s = '',
        toFixedFix = function(n, prec) {
            var k = Math.pow(10, prec);
            return '' + (Math.round(n * k) / k)
                .toFixed(prec);
        };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n))
        .split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '')
            .length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1)
            .join('0');
    }
    return s.join(dec).replace(dec_point+'00', '');
}


/**
 * Показ круговых диаграмм
 *
 * @param target - блок где будет показываться график
 * @param data - данные круговой диаграммы
 * @param unit - единица измерения
 */
function statisticShowPlot(target, data, unit)
{
    $.plot(target + ' .graph', data, {
        series: {
            pie: {
                show: true,
                label: {
                    show: false,
                    radius: 3/4,
                    formatter: function(label, series) {
                        if(label === null) return "NULL";
                        var title = label;
                        if(label.length > 20){ label = label.substring(0,20) + '..'; }
                        var unit = ' '+series.pie.unit;
                        var out = '<div title="'+title+' : '+number_format(series.data[0][1], 2, ',', ' ')+unit+'" style=";text-align:center;padding:2px;color:white;">';
                        out += label;
                        out += '<br/>';
                        out += Math.round(series.percent)+'%';
                        //out += series.data[0][1];
                        out += '</div>';
                        return out;
                    },
                    background: {
                        opacity: 0.5,
                        color: '#000'
                    }
                },
                unit: unit
            }
        },
        grid: {
            hoverable: true,
            clickable: true
        },
        legend: {
            container: target + ' .flc-plot',
            backgroundOpacity: 0.5,
            noColumns: 2,
            backgroundColor: "white",
            lineWidth: 0
        },
        tooltip: true,
        tooltipOpts: {
            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
            shifts: {
                x: 20,
                y: 0
            },
            defaultTheme: false,
            cssClass: 'chart-tooltip'
        },
        xaxis:{ labelWidth:5 }
    });
}

/**
 * Показ графика ключевых показателей в виде столбиков
 *
 * @param target - блок где будет показываться график
 * @param json_bars - json с панелями графика (список справа с заголовками линий)
 * @param json_values - json значения для посотроения графика
 * @param json_ticks - json подписи к столбикам
 */
function statisticShowKeyIndicator(target, json_bars, json_values, json_ticks)
{
    // Диаграмма в виде столбиков
    $(function () {
        $.plot(target, json_bars, {
            series: {
                bars: {
                    show: true,
                    barWidth: 0.15,
                    align: "center",
                    order: 1
                },
                absoluteValues: json_values
            },
            xaxis: {
                mode: "categories",
                ticks: json_ticks,
                tickLength: 1
            },
            grid: {
                hoverable: true,
                borderWidth:0
            },
            yaxis: {
                allowDecimals: false
            }
        });
    });

    var previousPoint;
    var showTooltip = function(x, y, contents) {
        $("#sellChartTooltip").remove();
        $('<div id="sellChartTooltip" class="chart-tooltip"/>').html(contents).css( {
            top: y + 10,
            left: x + 10
        }).appendTo("body").fadeIn(200);
    };

    /**
     * Наведение на подсказки на графике
     */
    $(".graph").bind("plothover", function(e, pos, item) {
        if (item) {
            if (previousPoint != item.dataIndex) {
                previousPoint = item.dataIndex;                        
                var
                    pointData = item.series.absoluteValues[item.seriesIndex][item.dataIndex];
                    
                var tooltipText = pointData;
                showTooltip(item.pageX, item.pageY, tooltipText);
            }
        }
        else {
            $("#sellChartTooltip").remove();
            previousPoint = null;            
        }
    });
}

/**
 * Показ статистики в виде волн
 *
 * @param target - блок где будет показываться график
 * @param wrapper - блок с отображаением
 * @param json_values - json значения для построения графика
 */
function statisticShowWaves(target, wrapper, json_values)
{
    var currentWave = $("#presetWaves a.act", $(wrapper)).data('value');
    //Определим нужные данные
    var current_data = json_values[currentWave];

    $(function() {

        //Данные по X
        var x_data = [];
        $.each(current_data['data']['ticks'], function(i, v){
            x_data.push([i, v]);
        });
        //Данные по Y
        var y_data = [];
        $.each(current_data['data']['values'], function(i, v){
            y_data.push([i, v]);
        });

        var plot = $.plot(target, [
            {
                data: y_data,
                label: current_data['label'],
                color: 'rgb(203,75,75)'
            }
        ], {
            series: {
                lines: {
                    show: true
                },
                points: {
                    show: true
                }
            },
            xaxis: {
                ticks: x_data,
                tickLength: 1
            },
            grid: {
                hoverable: true,
                clickable: true,
                borderWidth: 0
            }
        });

        var previousPoint;
        var showTooltip = function(x, y, contents) {
            $("#sellChartTooltip").remove();
            $('<div id="sellChartTooltip" class="chart-tooltip"/>').html(contents).css( {
                top: y + 10,
                left: x + 10
            }).appendTo("body").fadeIn(200);
        };

        /**
         * Наведение на подсказки на графике
         */
        $(".graph", $(wrapper)).on("plothover", function(e, pos, item) {
            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;
                    var tooltipText = current_data['data']['values'][item.datapoint[0]] + " " + current_data['y_unit'] + "<br/>" + current_data['data']['ticks'][item.datapoint[0]];
                    showTooltip(item.pageX, item.pageY, tooltipText);
                }
            }
            else {
                $("#sellChartTooltip").remove();
                previousPoint = null;
            }
        });
    });
}
$(function() {
    /**
     * Инициализация фильтров в графике статистики
     *
     */
    var initDateSelector = function() {
        /**
         * Инициализация селектора дат
         */
        $('.stat-date-range input[datefilter]', this).dateselector();

        /**
         * Переключение заранее заготовленных пресетов фильтров
         */
        $(".stat-date-range .date-presets a", this).off('click.date-range').on('click.date-range', function(){
            var context = $(this).closest('.stat-date-range');
            var from    = $(this).data('from');
            var to      = $(this).data('to');
            
            var input_from = $("input.from", context);
            var input_to   = $("input.to", context);
            
            $('input.hidden', context).remove();
            input_from.clone().attr('type', 'hidden').val(from).addClass('.hidden').appendTo(context);
            input_from.clone().attr('type', 'hidden').val(to).addClass('.hidden').appendTo(context);
            
            input_from.attr('disabled', true);
            input_to.attr('disabled', true);
            $("input[type=submit]", context).click();
        });

        /**
         * Переключение типа группировки
         */
        $(".stat-date-range .date-presets-groups a", this).off('click.date-groups').on('click.date-groups', function(){
            var context = $(this).closest('.stat-date-range');
            var wrapper = $(this).closest('.dropdown');
            var block_wrapper = $(this).closest('.updatable');
            var value   = $(this).data('value');

            if (value == 'week'){
                $('.graph', block_wrapper).addClass('weekly');
            }else{
                $('.graph', block_wrapper).removeClass('weekly');
            }

            $('input[type="hidden"]', wrapper).val(value);
            $("input[type=submit]", context).click();
        });
    };
    
    $.contentReady(initDateSelector);
});
/*
 * Flot plugin to order bars side by side.
 * 
 * Released under the MIT license by Benjamin BUFFET, 20-Sep-2010.
 *
 * This plugin is an alpha version.
 *
 * To activate the plugin you must specify the parameter "order" for the specific serie :
 *
 *  $.plot($("#placeholder"), [{ data: [ ... ], bars :{ order = null or integer }])
 *
 * If 2 series have the same order param, they are ordered by the position in the array;
 *
 * The plugin adjust the point by adding a value depanding of the barwidth
 * Exemple for 3 series (barwidth : 0.1) :
 *
 *          first bar décalage : -0.15
 *          second bar décalage : -0.05
 *          third bar décalage : 0.05
 *
 */

(function($){
    function init(plot){
        var orderedBarSeries;
        var nbOfBarsToOrder;
        var borderWidth;
        var borderWidthInXabsWidth;
        var pixelInXWidthEquivalent = 1;
        var isHorizontal = false;

        /*
         * This method add shift to x values
         */
        function reOrderBars(plot, serie, datapoints){
            var shiftedPoints = null;
            
            if(serieNeedToBeReordered(serie)){                
                checkIfGraphIsHorizontal(serie);
                calculPixel2XWidthConvert(plot);
                retrieveBarSeries(plot);
                calculBorderAndBarWidth(serie);
                
                if(nbOfBarsToOrder >= 2){  
                    var position = findPosition(serie);
                    var decallage = 0;
                    
                    var centerBarShift = calculCenterBarShift();

                    if (isBarAtLeftOfCenter(position)){
                        decallage = -1*(sumWidth(orderedBarSeries,position-1,Math.floor(nbOfBarsToOrder / 2)-1)) - centerBarShift;
                    }else{
                        decallage = sumWidth(orderedBarSeries,Math.ceil(nbOfBarsToOrder / 2),position-2) + centerBarShift + borderWidthInXabsWidth*2;
                    }

                    shiftedPoints = shiftPoints(datapoints,serie,decallage);
                    datapoints.points = shiftedPoints;
               }
           }
           return shiftedPoints;
        }

        function serieNeedToBeReordered(serie){
            return serie.bars != null
                && serie.bars.show
                && serie.bars.order != null;
        }

        function calculPixel2XWidthConvert(plot){
            var gridDimSize = isHorizontal ? plot.getPlaceholder().innerHeight() : plot.getPlaceholder().innerWidth();
            var minMaxValues = isHorizontal ? getAxeMinMaxValues(plot.getData(),1) : getAxeMinMaxValues(plot.getData(),0);
            var AxeSize = minMaxValues[1] - minMaxValues[0];
            pixelInXWidthEquivalent = AxeSize / gridDimSize;
        }

        function getAxeMinMaxValues(series,AxeIdx){
            var minMaxValues = new Array();
            for(var i = 0; i < series.length; i++){
                minMaxValues[0] = series[i].data[0][AxeIdx];
                minMaxValues[1] = series[i].data[series[i].data.length - 1][AxeIdx];
            }
            return minMaxValues;
        }

        function retrieveBarSeries(plot){
            orderedBarSeries = findOthersBarsToReOrders(plot.getData());
            nbOfBarsToOrder = orderedBarSeries.length;
        }

        function findOthersBarsToReOrders(series){
            var retSeries = new Array();

            for(var i = 0; i < series.length; i++){
                if(series[i].bars.order != null && series[i].bars.show){
                    retSeries.push(series[i]);
                }
            }

            return retSeries.sort(sortByOrder);
        }

        function sortByOrder(serie1,serie2){
            var x = serie1.bars.order;
            var y = serie2.bars.order;
            return ((x < y) ? -1 : ((x > y) ? 1 : 0));
        }

        function  calculBorderAndBarWidth(serie){
            borderWidth = serie.bars.lineWidth ? serie.bars.lineWidth  : 2;
            borderWidthInXabsWidth = borderWidth * pixelInXWidthEquivalent;
        }
        
        function checkIfGraphIsHorizontal(serie){
            if(serie.bars.horizontal){
                isHorizontal = true;
            }
        }

        function findPosition(serie){
            var pos = 0
            for (var i = 0; i < orderedBarSeries.length; ++i) {
                if (serie == orderedBarSeries[i]){
                    pos = i;
                    break;
                }
            }

            return pos+1;
        }

        function calculCenterBarShift(){
            var width = 0;

            if(nbOfBarsToOrder%2 != 0)
                width = (orderedBarSeries[Math.ceil(nbOfBarsToOrder / 2)].bars.barWidth)/2;

            return width;
        }

        function isBarAtLeftOfCenter(position){
            return position <= Math.ceil(nbOfBarsToOrder / 2);
        }

        function sumWidth(series,start,end){
            var totalWidth = 0;

            for(var i = start; i <= end; i++){
                totalWidth += series[i].bars.barWidth+borderWidthInXabsWidth*2;
            }

            return totalWidth;
        }

        function shiftPoints(datapoints,serie,dx){
            var ps = datapoints.pointsize;
            var points = datapoints.points;
            var j = 0;           
            for(var i = isHorizontal ? 1 : 0;i < points.length; i += ps){
                points[i] += dx;
                //Adding the new x value in the serie to be abble to display the right tooltip value,
                //using the index 3 to not overide the third index.
                serie.data[j][3] = points[i];
                j++;
            }

            return points;
        }

        plot.hooks.processDatapoints.push(reOrderBars);

    }

    var options = {
        series : {
            bars: {order: null} // or number/string
        }
    };

    $.plot.plugins.push({
        init: init,
        options: options,
        name: "orderBars",
        version: "0.2"
    });

})(jQuery);


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
/**
 * Плагин обеспечивает отображение всплывающих сообщений в адмнистративной панели.
 *
 * @author ReadyScript lab.
 */
(function($) {
    $.messenger = function(method) {
        var defaults = {
            offsetY: 70, //Стартовое смещение по Y
            msg: {
                timer: null,
                theme: '', //Класс сообщений
                distance: 10, //Расстояние между сообщениями
                expire: 20, //В секундах время отображения сообщения
                stopExpireOnClick: true
            }
        }, 
        args = arguments,
        
        $this = $('#messages-container');
        if (!$this.length) {
            $this = $('<div id="messages-container"></div>').appendTo('body');
        }
        var data = $this.data('messenger');
        if (!data) { //Инициализация
            data = {
                options: defaults
            }; 
            $this.data('messenger', data);
        }
        
        var methods = {
            
            show: function(parameters) {
                var $box = getMessageBox(parameters);
                var local_params = $.extend({}, data.options.msg, parameters);
                $box.data('messenger', local_params);
                
                var offset = +(defaults.offsetY);
                var messages = $('.message-box', $this);
                for( var i=messages.length-1; i>=0; i-- ) {
                    offset = offset + $(messages[i]).height() + (local_params.distance);
                }
                
                $box.css({
                    bottom: offset+'px'
                })
                $box
                    .hover(function() {
                        local_params.pause = true;
                    }, function() {
                        local_params.pause = false;
                    })
                    .on('messenger.close', closeBox)
                    .on('click.messenger', '.close', function() {
                        $(this).closest('.message-box').trigger('messenger.close');
                    })
                    .appendTo($this).fadeIn();
                    
                if (local_params.stopExpireOnClick) {
                    $box.on('mousedown.messenger', stopExpire);
                }
                
                if (local_params.expire) {                    
                    local_params.timer = setTimeout(function() {
                        $box.trigger('messenger.close');
                        if (!local_params.pause) {
                            $box.trigger('messenger.close');
                        } else {
                            $box.one('mouseleave.messengerOne', function() {
                                $box.trigger('messenger.close');
                            });
                        }
                    }, local_params.expire * 1000);
                }
            },
            
            update: function() {
                
                var messages = $('.message-box', $this);
                var newOffset = {};
                
                var offset = +(defaults.offsetY);
                newOffset["0"] = offset;
                for( var i=0; i<messages.length; i++ ) {
                    offset = offset + $(messages[i]).height() + ($(messages[i]).data('messenger').distance);
                    newOffset[i+1] = offset;
                }
                
                messages.each(function(i) {
                    $(this).animate({
                        bottom: newOffset[i]+'px'
                    }, 'fast');
                });
            },
            
            hideAll: function() {
                $('.message-box', $this).trigger('messenger.close');
            },
            
            setOptions: function(options) {
                data.options = $.extend(data.options, options);
            }
        }
        
        //private 
        var getMessageBox = function(parameters) {
            return $('<div class="message-box"></div>')
                    .append('<a class="close"></a>')
                    .append($('<div class="msg"></div>').html(parameters.text))
                    .addClass(parameters.theme)
                    .hide();
        },
        
        stopExpire = function() {
            var box = $(this);
            clearTimeout(box.data('messenger').timer);
            box.unbind('.messengerOne');
        },

        closeBox = function() {
            var box = $(this);
            clearTimeout(box.data('messenger').timer);
            box.fadeOut('fast', function() {
                box.remove();
                methods.update();
            });
        };
        
        
        if ( methods[method] ) {
            methods[ method ].apply( this, Array.prototype.slice.call( args, 1 ));
        } else if ( typeof method === 'object') {
            return methods.init.apply( this, args );
        } else {
            var params = Array.prototype.slice.call( args, 1 );
            var extend = {text: method};
            if (!params[0]) params[0] = {};
            params[0] = $.extend(params[0], extend);
            methods['show'].apply( this, params );
        }
    }

})(jQuery);
/**
 * Plugin позволяет проводить виртуальные обучающие туры по админ. панели ReadyScript
 *
 * @author ReadyScript lab.
 */
(function($) {
    $.tour = function(method) {
        var
            defaults = {
                startTourButton: '.start-tour',
                baseUrl: '/',
                folder: '',
                adminSection: global.adminSection,
                tipInfoCorrectionY:20,
            },
            args = arguments,
            timeoutHandler;

        var data = $('body').data('tour');
        if (!data) { //Инициализация
            data = {
                options: defaults
            };
            $('body').data('tour', data);
        }

        //public
        var
            methods = {
                init: function(tours, localOptions) {
                    data.tours = tours;
                    data.options = $.extend({}, data.options, localOptions);

                    $(data.options.startTourButton).click(function() {
                        methods.start($(this).data('tourId'), 'index', true);
                    });
                    //Если тур был запущен раннее, то пытаем определить действие
                    var tourId = $.cookie('tourId');
                    if (tourId) methods.start(tourId);

                },
                start: function(tour_id, startStep, force) {
                    if (!data.tours[tour_id]) {
                        console.log('Tour '+tour_id+' not found');
                        return;
                    };
                    $.cookie('tourId', tour_id, {path:'/'});
                    data.tour = data.tours[tour_id];
                    data.tourTotalSteps = getTotalSteps();
                    data.tourStepIndex = [];
                    $.each(data.tour, function(i, val) {
                        data.tourStepIndex.push(i);
                    });

                    var
                        step = findStep(data.tour, startStep, force);

                    //Проверка: если step = false, то значит стартовая страница не соответствует туру.
                    if (step) {
                        runStep(step);
                    } else {
                        if (step !== null) {
                            methods.stop();
                        }
                    }

                    $('body').bind('keypress.tour', function(e){
                        if (e.keyCode == 27) methods.stop();
                    });
                },
                stop: function() {
                    $.cookie('tourId', null, {path:'/'});
                    $.cookie('tourStep', null, {path:'/'});
                    hideStep();
                },
            }

        //private
        var
            /**
             * Выполняет поиск текущего шага в туре по принципу:
             * текущий URL должен совпадать с URL, заявленным в шаге
             *
             * @param tour
             */
            findStep = function(tour, step, force) {
                if (!step) step = $.cookie('tourStep');
                if (!step && !$('#debug-top-block').is('.debug-mobile')) {
                    step = 'index';
                }
                if (!data.tour[step]) return false;

                //Проверяем соответствует ли шаг тура текущей странице
                var a = $('<a />').attr('href', location.href).get(0);
                var relpath = ('/'+a.pathname.replace(/^([/])/gi, '')) + a.search;
                var relpath_mask = relpath.replace(data.options.adminSection, '%admin%').replace(/([/])$/gi, '');

                var steppath;
                if (step) {
                    steppath = data.options.folder + data.tour[step].url.replace(/([/])$/gi, '');
                }

                if (relpath_mask != steppath && !force) {
                    foundStep = false;
                    //Пытаемся найти шаг, по URL.
                    var before, found;
                    for(var key in data.tour) {
                        if (data.options.folder + data.tour[key].url.replace(/([/])$/gi, '') == relpath_mask) {
                            if (!before || before == step) { //Этот шаг идет вслед за предыдущим отображенным
                                //Мы нашли шаг по URL, возвращаем его
                                foundStep = key;
                                break;
                            }
                        }
                        before = key;
                    }

                    //Если не нашли, то выводим сообщение о прерывании тура
                    if (!foundStep) {
                        showDialog({
                            type: 'dialog',
                            message: lang.t('Вы перешли на страницу, не предусмотренную интерактивным курсом. <br>Вернуться и продолжить обучение?'),
                            buttons: {
                                yes: step,
                                no: false
                            }
                        });
                        return null;
                    }
                    step = foundStep;
                }

                return step;
            },

            getStepIndex = function(step) {
                var i = 1;
                for(var key in data.tour) {
                    if (key == step) return i;
                    i++;
                }
                return false;
            },

            getTotalSteps = function() {
                var i = 0;
                for(var key in data.tour) i++;
                return i;
            },

            runStep = function(step, noRedirect) {
                var tourStep = data.tour[step];
                hideStep();

                data.curStep = step;
                data.curStepIndex = getStepIndex(step);
                $.cookie('tourStep', step, {path:'/'});

                //Проверим, соответствует ли текущая страница шагу step
                var a = $('<a />').attr('href', location.href).get(0);
                var relpath = ('/'+a.pathname.replace(/^([/])/gi, '')) + a.search;
                var relpath_mask = relpath.replace(data.options.adminSection, '%admin%').replace(/([/])$/gi, '');
                if (relpath_mask != data.options.folder + tourStep.url.replace(/([/])$/gi, '') && !noRedirect) {
                    //Необходим переход на другую страницу
                    $.rs.loading.show();
                    location.href = data.options.folder + tourStep.url.replace('%admin%', data.options.adminSection);
                    return;
                }

                //Выполняет один шаг обучения
                var type = (tourStep.type) ? tourStep.type : 'tip';
                if (tourStep.onStart) tourStep.onStart();
                switch (type) {
                    case 'dialog': showDialog(tourStep); break;
                    case 'tip': showTip(step); break;
                    case 'info': showInfo(step); break;
                    case 'form': showForm(step); break;
                }

                //Выполняем watch
                if (tourStep.watch) {
                    $('body').on(tourStep.watch.event + '.tour', tourStep.watch.element, function() {
                        runAction(tourStep.watch.next, true);
                    });
                }

                $('a[data-step]').click(function() {
                    runAction( $(this).data('step') );
                });
            },

            overlayShow = function(blur) {
                if (blur) {
                    $('body > *').addClass('filterBlur');
                }
                $('<div id="tourOverlay"></div>').appendTo('body');

            },

            overlayHide = function() {
                $('#tourOverlay').remove();
                $('body > *').removeClass('filterBlur');
            },

            showDialog = function(tourStep) {
                overlayShow(true);
                var dialog = $('<div id="tipDialog" />').addClass('tipDialog').append('<a class="tipDialogClose" />')
                var content = $('<div class="tipContent" />').html(tourStep.message);
                var buttons = $('<div class="tipButtons" />');

                $.each(tourStep.buttons, function(key, val) {
                    var button = $('<a class="tipButton"/>');
                    var buttonText = (typeof(val) == 'object' && val.text) ? val.text : false;

                    switch(key) {
                        case 'no': {
                            button.text(buttonText ? buttonText : lang.t('Нет')).addClass('tipNo');
                            break;
                        }
                        case 'yes': {
                            button.text(buttonText ? buttonText : lang.t('Да')).addClass('tipYes');
                            break;
                        }
                        case 'finish': {
                            button.text(buttonText ? buttonText : lang.t('Завершить')).addClass('tipYes');
                            break;
                        }
                        default: {
                            button.text(buttonText).attr(val.attr);
                        }
                    }
                    button.click(hideDialog);

                    //Переход на следующий шаг
                    if (typeof(val) == 'string' || typeof(val) == 'boolean' || typeof(val) == 'object') {
                        button.click(function() {
                            var next = (typeof(val) == 'object') ? val.step : val;
                            runAction(next);
                        });
                    }

                    $('.tipDialogClose', dialog).click(methods.stop);
                    $('#tourOverlay').click(methods.stop);

                    button.appendTo(buttons);
                });

                dialog
                    .append(content)
                    .append(buttons)
                    .appendTo('body')
                    .addClass('flipInX animated');

                dialog.css({
                    marginLeft: -parseInt(dialog.width()/2),
                    marginTop:-parseInt(dialog.height()/2),
                });

            },

            showTip = function(step)
            {
                var
                    tourStep = data.tour[step];

                tourStep.tip = $.extend(true, {
                    correctionX: 0,
                    correctionY: 0,
                    animation: 'fadeInDown',
                    css: {
                        'minWidth': 280
                    }
                }, tourStep.tip);


                if (tourStep.tip.fixed) {
                    tourStep.tip.css['position'] = 'fixed';
                }

                var element = [];

                if (typeof(tourStep.tip.element) == 'object') {

                    for(var i=0; i<tourStep.tip.element.length; i++) {
                        var currentElement = tourStep.tip.element[i];

                        if (typeof(currentElement) == 'string') {
                            var selector = currentElement;
                        } else {
                            var selector = currentElement.selector;
                        }

                        element = $(selector).first();

                        if (currentElement.whenUse && currentElement.whenUse(element)) {
                            break;
                        } else if (!currentElement.whenUse && element.is(':visible')) {
                            break;
                        }
                    }

                    if (typeof(currentElement) == 'object') {
                        //Объединяем параметры конкретного элемента с общими
                        tourStep.tip = $.extend(tourStep.tip, currentElement);
                    }
                } else {
                    element = $(tourStep.tip.element).first();
                }

                if (!element.length) {
                    if (tourStep.tip.notFound) {
                        runAction(tourStep.tip.notFound);
                    }
                    return;
                }

                var tip = $('<div class="tipTour" />')
                tip.html('<div class="tipContent">'+tourStep.tip.tipText+'</div>')
                    .append(getStatusLine())
                    .append('<i class="corner"/>')
                    .css(tourStep.tip.css)
                    .appendTo('body')
                    .data('originalWidth', tip.width())
                    .width(tip.width())
                    .draggable();

                getTipPosition(element, tourStep.tip, tip);

                scrollWindow(tip);

                $(window).bind('resize.tour', function() {
                    getTipPosition(element, tourStep.tip, tip);
                });

                if (tourStep.tip.animation) {
                    tip.addClass(tourStep.tip.animation + ' animated');
                }

                if (tourStep.whileTrue) {
                    var whileTrue = function() {
                        if (!tourStep.whileTrue()) {
                            goNext();
                        } else {
                            timeoutHandler = setTimeout(whileTrue, 2000);
                        }
                    }();

                    timeoutHandler = setTimeout(whileTrue, 2000);
                }

                if (tourStep.checkTimeout) {
                    timeoutHandler = setTimeout(goNext, tourStep.checkTimeout);
                }
            },

            getTipPosition = function(element, tipData, tip)
            {

                var position = {
                        top: element.offset().top + element.innerHeight() + 10,
                        left: element.offset().left + element.width()/2,
                    },
                    bodyWidth = $('body').width();

                if (tipData.bottom) {
                    //Выноска находится внизу экрана
                    position.top = element.offset().top - getHeight(tip);
                    tip.addClass('bottom');
                }

                if (tipData.left) {
                    //Выноска находится внизу экрана
                    position.top = element.offset().top;
                    position.left = element.offset().left - getWidth(tip) - 10;
                    tip.addClass('left');
                }

                var tipWidth = getWidth(tip);

                if (tipWidth > bodyWidth-20) {
                    tip.width( bodyWidth-40 );
                    tipWidth = bodyWidth-20;
                }

                if (position.left + tipWidth > bodyWidth) {
                    position.marginLeft = -(position.left + tipWidth - bodyWidth + 10);
                } else {
                    position.marginLeft = 0;
                }
                position.left = position.left + tipData.correctionX;
                position.top = position.top + tipData.correctionY;

                if (position.left < 0) {
                    tip.width( tip.width() + position.left );
                    position.left = 0;
                }

                tip.css(position);

                //Устанавливаем смещение выноски
                tip.find('.corner').css('marginLeft', -position.marginLeft);


            },

            runAction = function(action, noRedirect) {

                switch(typeof(action)) {

                    case 'boolean': if (!action) {
                        methods.stop();
                    }; break;
                    case 'string': runStep(action, noRedirect); break;
                    case 'function': {
                        var result = action();
                        if (result) runStep(result, noRedirect);
                        if (result === false) return false;
                    }
                    default: return false;
                }
                return true;
            },

            closeFormDialog = function() {
                if (data.curStep && data.tour[data.curStep].type == 'form') {
                    //Пытаемся закрыть окно, если текущий шаг связан с формой
                    $('body').off('dialogBeforeDestroy.tour');
                    $('.dialog-window').dialog('close');
                }
            },

            goNext = function() {
                if (data.curStepIndex < data.tourTotalSteps) {
                    closeFormDialog();
                    runStep(data.tourStepIndex[data.curStepIndex]);
                }
            },

            goPrev = function() {
                if (data.curStepIndex > 1) {
                    closeFormDialog();
                    runStep(data.tourStepIndex[data.curStepIndex-2]);
                }
            },

            scrollWindow = function(oneTip) {

                if (oneTip.closest('.dialog-window').length) {
                    var $window = oneTip.closest('.contentbox');
                    var $windowHeight = $window.height() - 55;
                    var $scrollElement = $window;

                    var tipOffsetTop = oneTip.offset().top - 90 + $scrollElement.scrollTop();

                } else {
                    var $window = $(window);
                    var $windowHeight = $window.height();
                    var $scrollElement = $('html, body');

                    var tipOffsetTop = oneTip.offset().top - 90;
                }

                //Если tip не помещается на экран, то перемещаем scroll
                if ( tipOffsetTop < $window.scrollTop()
                    || tipOffsetTop > $window.scrollTop() + $windowHeight
                ) {
                    $scrollElement.animate({
                        scrollTop: tipOffsetTop - 50
                    });
                }
            },

            showForm = function(step)
            {
                var tourStep = data.tour[step],
                    checkTimeout,
                    tipMap = {};

                data.curSubStep = 0;
                data.totalSubSteps = 0;

                //Создаем массив tip.label => index, для быстрого нахождения index по label.
                $.each(tourStep.tips, function(i, tip) {
                    if (tip.label) {
                        tipMap[tip.label] = i;
                    }
                    data.totalSubSteps++;
                });

                //Запускает подшаги по событию
                $('body').on('new-content.tour', function() {
                    if (tourStep.tips[data.curSubStep].waitNewContent || data.curSubStep == 0) {
                        setTimeout(function() {
                            showSubTip(true);
                        }, 50);
                    }
                });

                //Возвращаемся на предыдущий шаг, если закрывается окно диалога
                $('body').on('dialogBeforeDestroy.tour', function() {
                    goPrev();
                });

                var showSubTip = function(skipCheckWait) {

                    $('.tipForm').each(function() {
                        if (tourStep.tips[ $(this).data('substep') ].onStop) {
                            tourStep.tips[ $(this).data('substep') ].onStop();
                        }
                        $(this).remove();
                        clearTimeout(checkTimeout);
                    });

                    tip = tourStep.tips[data.curSubStep];

                    if (!tip) return;

                    //Устанавливаем значения по умолчанию
                    tip = $.extend({
                        tipText: '',
                        css: {},
                        animation: null,
                        correctionX: 0,
                        correctionY: 0,
                        onStart: null,
                        onStop: null
                    }, tip);

                    var element = $(tip.element).first();

                    if ( (!skipCheckWait && tip.waitNewContent) ) return;

                    //Проверяем условие для отображения
                    if (typeof(tip.ifTrue) == 'function' ) {
                        if (!tip.ifTrue()) {
                            //Если отображать tip не следует, то перекидываем на другой tip
                            data.curSubStep = (tip.elseStep !== undefined) ? tipMap[tip.elseStep] : data.curSubStep + 1;
                            showSubTip();
                            return;
                        }
                    }

                    var goToNextSubStep = function() {
                        data.curSubStep = (tip.next) ? tipMap[tip.next] : data.curSubStep + 1;
                        showSubTip();
                    }

                    if ( !element.length  ) {
                        //Пытаемся перейти на следующий элемент
                        if (data.curSubStep>0) goToNextSubStep();
                        return;
                    }

                    var oneTip = $('<div class="tipTour tipForm" />')
                    oneTip.html('<div class="tipContent">'+tip.tipText+'</div>')
                        .data('substep', data.curSubStep)
                        .append('<i class="corner"></i>')
                        .append(getStatusLine())
                        .css(tip.css);

                    if (tip.correctionX) {
                        oneTip
                            .css('marginLeft', tip.correctionX);

                        if (tip.correctionX<0) {
                            oneTip.find('.corner').css({
                                left: -tip.correctionX
                            });
                        }
                    }

                    if (tip.correctionY) {
                        oneTip.css('marginTop', tip.correctionY);
                    }

                    if (tip.bottom) {
                        oneTip
                            .addClass('bottom')
                            .appendTo('body');

                        updateTipFormPosition(element, tip, oneTip);
                        $(window).on('resize.tour', function() {
                            updateTipFormPosition(element, tip, oneTip);
                        });

                    } else {
                        if (tip.insertAfter) {
                            oneTip
                                .insertAfter(element);
                        } else {
                            oneTip
                                .appendTo(element.parent());
                        }
                    }

                    if (tip.onStart) tip.onStart();

                    scrollWindow(oneTip);

                    if (tip.checkPattern) {
                        if ( (element.is('input') && element.attr('type') == 'text')
                            || element.is('textarea')) {

                            var checkText = function() {
                                if (tip.checkPattern.test( $(element).val() )) {
                                    goToNextSubStep();
                                } else {
                                    checkTimeout = setTimeout(checkText, 1500);
                                }
                            }
                            checkTimeout = setTimeout(checkText, 1500);
                        }
                        if (element.is('input') && element.attr('type') == 'checkbox') {
                            element.off('.tour').on('change.tour', function(e) {
                                if ($(this).is(':checked') ==  tip.checkPattern) {
                                    element.off('.tour');
                                    goToNextSubStep();
                                }
                            });
                        }

                        if (element.is('select')) {
                            element.off('.tour').on('change.tour', function(e) {
                                if (tip.checkPattern.test( $(this).val() )) {
                                    element.off('.tour');
                                    goToNextSubStep();
                                }
                            });
                        }
                    }

                    if (tip.checkSelectValue) {
                        element.on('change.tour', function(e) {
                            if (tip.checkSelectValue.test( $('option:selected', e.currentTarget).html() )) {
                                element.off('.tour');
                                goToNextSubStep();
                            }

                        });
                    }

                    if (tip.watch) {
                        var watchElement = tip.watch.element ? $(tip.watch.element) : element;

                        watchElement.one(tip.watch.event+'.tour', function() {
                            if (tip.watch.next) {
                                runAction(tip.watch.next);
                            } else {
                                goToNextSubStep();
                            }
                        });
                    }

                    if (tip.tinymceTextarea) {
                        var textarea = $(tip.tinymceTextarea);

                        var checkText = function() {
                            if (tip.checkPattern.test( textarea.html() )) {
                                goToNextSubStep();
                            } else {
                                setTimeout(checkText, 1000);
                            }
                        };
                        setTimeout(checkText, 1000);
                    }

                    if (tip.checkTimeout) {
                        checkTimeout = setTimeout(function() {
                            goToNextSubStep();
                        }, tip.checkTimeout);
                    }
                }

                showSubTip();
            },

            updateTipFormPosition = function(element, tipData, oneTip)
            {
                var position = {
                    top: element.offset().top + getHeight(element),
                    left: element.offset().left
                }

                if (tipData.bottom) {
                    position.top = element.offset().top - getHeight(oneTip);
                }

                if (oneTip.css('position') == 'fixed') {
                    position.top = position.top - $(window).scrollTop();
                }

                oneTip.css(position);

                //Выставляем смещение выноски
                if (tipData.correctionX) {
                    oneTip.find('.corner').css({
                        left: tipData.correctionX
                    });
                }
            },

            showInfo = function(step)
            {
                var tourStep = data.tour[step];
                overlayShow();

                if (tourStep.tips)
                    $.each(tourStep.tips, function(i, tip) {

                        //Устанавливаем значения по умолчанию
                        tip = $.extend({
                            tipText: '',
                            css: {},
                            animation: null,
                            position:['left', 'bottom'],
                            correctionX: 0,
                            correctionY: 0
                        }, tip);

                        var element = $(tip.element).first();

                        var canShow = element.length && (!tip.whenUse || tip.whenUse(element));

                        if (canShow) {
                            var oneTip = $('<div class="tipInfoTour" />')
                            oneTip.html('<div class="tipInfoTourContent">'+tip.tipText+'</div>')
                                .append('<i class="corner"><span class="line"><span class="arrow"></span></span></i>')
                                .addClass( tip.position[0]+tip.position[1][0].toUpperCase()+tip.position[1].substring(1) )
                                .css(tip.css)
                                .appendTo('body');

                            updateTipInfoPosition(tip.element, tip, oneTip);

                            $(window).on('resize.tour', function() {
                                updateTipInfoPosition(tip.element, tip, oneTip);
                            });

                            if (tip.animation) {
                                oneTip.addClass(tip.animation + ' animated');
                            }
                        }
                    });
                var
                    text = $('<div class="contentTour">').html(tourStep.message);

                $('<div class="infoTour" />')
                    .append('<div class="infoBack"/>')
                    .append('<h2>'+lang.t('Информация')+'</h2>')
                    .append(text)
                    .append(getStatusLine())
                    .appendTo('body')
                    .css('marginTop', -$('.infoTour').height()/2)
                    .draggable({handle: 'h2'});

                $('.goNext').addClass('pulse animated infinite');
            },

            getWidth = function(element) {
                return element.width() + parseInt(element.css('paddingLeft')) + parseInt(element.css('paddingRight'));
            },

            getHeight = function(element) {
                return element.height() + parseInt(element.css('paddingTop')) + parseInt(element.css('paddingBottom'));
            },

            updateTipInfoPosition = function(elementString, tipData, oneTip) {
                var
                    element = $(elementString),
                    horiz = tipData.position[0],
                    vert = tipData.position[1],
                    cornerSourceY,
                    css = {};

                if (!element.is(':visible')) {
                    oneTip.css('visibility', 'hidden');
                    return false;
                } else {
                    oneTip.css('visibility', 'visible');
                }

                switch(horiz) {
                    case 'left': css.left = element.offset().left + getWidth(element) - getWidth(oneTip);
                        if (vert == 'middle') {
                            css.left = css.left - getWidth(element);
                        }
                        break;
                    case 'center': css.left = element.offset().left + getWidth(element)/2 - getWidth(oneTip)/2; break;
                    case 'right': css.left = element.offset().left;
                        if (vert == 'middle') {
                            css.left = css.left + getWidth(element);
                        }
                        break;
                }

                switch(vert) {
                    case 'top': css.top = element.offset().top - getHeight(oneTip) - data.options.tipInfoCorrectionY; cornerSourceY = element.offset().top; break;
                    case 'middle': css.top = element.offset().top + getHeight(element)/2 - getHeight(oneTip)/2; cornerSourceY = element.offset().top + getHeight(element)/2; break;
                    case 'bottom': css.top = element.offset().top + getHeight(element) + data.options.tipInfoCorrectionY; cornerSourceY = element.offset().top + getHeight(element);  break;
                }

                css.marginTop = tipData.correctionY;
                css.marginLeft = tipData.correctionX;

                if (tipData.fixed) {
                    oneTip.css('position', 'fixed');
                }

                oneTip.css(css);

                //Устанавливаем высоту выноски
                var cornerCss = {
                    left: 'auto',
                    right: 'auto',
                    top: 'auto',
                    bottom: 'auto',
                    width: 10,
                    height: 1,
                }
                if (vert == 'middle') {

                    //Выноска горизонтальная
                    cornerCss.top = cornerSourceY-css.top;

                    if (horiz == 'right') {
                        cornerCss.width = (css.left + tipData.correctionX) - (element.offset().left + getWidth(element));
                        cornerCss.left = -cornerCss.width;
                    }
                    if (horiz == 'left') {
                        cornerCss.width = element.offset().left - (css.left + getWidth(oneTip) + tipData.correctionX);
                        cornerCss.right = -cornerCss.width;
                    }

                } else {
                    //Выноска вертикальная
                    cornerCss.left = element.offset().left + getWidth(element)/2 - css.left;
                    if (vert == 'bottom') {
                        cornerCss.height = Math.abs(cornerSourceY - css.top) + css.marginTop;
                        cornerCss.top = -cornerCss.height;
                    }
                    if (vert == 'top') {
                        cornerCss.height = Math.abs(cornerSourceY - (css.top + getHeight(oneTip))) - css.marginTop;
                        cornerCss.bottom = -cornerCss.height;
                    }
                }

                oneTip.find('.corner').css(cornerCss);
            },

            getStatusLine = function()
            {
                var
                    tourStep = data.tour[data.curStep],
                    curSubStep = '',
                    showNext = false;

                if (tourStep.type == 'form') {
                    var
                        curSubStep = '<span class="tourSubStep">.'+(data.curSubStep)+'</span>',
                        showNext = curSubStep < data.totalSubSteps;
                }

                var infoline = $('<div class="infoLineTour">').html(
                    '<span class="infoLineStep">'+lang.t('шаг')+' <strong>'+data.curStepIndex+'</strong>'+curSubStep+' '+lang.t('из')+' '+data.tourTotalSteps+'</span>'
                );

                if (data.curStepIndex>1) {
                    infoline.prepend( $('<a class="goPrev"><i class="zmdi zmdi-arrow-left"></i><span>'+lang.t('назад')+'</span></a>').on('click', goPrev) );
                    $('body').on('keydown.tour', function(e) {
                        if (e.ctrlKey && e.keyCode == 37) goPrev();
                    });
                }
                if (data.curStepIndex < data.tourTotalSteps || showNext) {
                    infoline.append( $('<a class="goNext"><span>'+lang.t('далее')+'</span><i class="zmdi zmdi-arrow-right"></i></a>').on('click', goNext) );
                    $('body').on('keydown.tour', function(e) {
                        if (e.ctrlKey && e.keyCode == 39) goNext();
                    });
                }

                infoline.append( $('<a class="tourClose zmdi zmdi-close"></a>').on('click', methods.stop) );

                return infoline;
            },

            hideStep = function()
            {
                overlayHide();
                hideDialog();
                $('body').off('dialogBeforeDestroy.tour');
                $('.infoTour, .tipTour, .tipInfoTour').remove();
                $(window).off('.tour');
                $('*').off('.tour');
                clearTimeout(timeoutHandler);

                if (data.curStep && typeof(data.tour[data.curStep].onStop) == 'function') data.tour[data.curStep].onStop();
            },

            hideDialog = function()
            {
                overlayHide();
                $('#tipDialog').remove();
            };

        if ( methods[method] ) {
            methods[ method ].apply( this, Array.prototype.slice.call( args, 1 ));
        } else if ( typeof method === 'object') {
            return methods.init.apply( this, args );
        }
    };
})(jQuery);
/**
 * Файл с описанием схемы интерактивного тура по административной панели ReadyScript
 *
 * @author RedyScript lab.
 */
$(function() {

    var isCategoryExpanded = function(element) {
        return (!element.closest('.left-up').length
        && window.matchMedia('(min-width: 992px)').matches)
    }

    /**
    * Тур по первичной настройке сайта
    */
    var tourTopics = {
        'base': lang.t('Базовые настройки'),
        'products': lang.t('Категории и Товары'),
        'menu': lang.t('Меню'),
        'article': lang.t('Новости'),
        'delivery': lang.t('Способы доставки'),
        'payment': lang.t('Способы оплаты'),
        'debug': lang.t('Правка информации на сайте')
    }

    var welcomeTour = {}

    welcomeTour.commonStart =  {
        'index': {
                url: '/',
                topic: tourTopics.base,
                type: 'dialog',
                message: lang.t(
                '<div class="tourIndexWelcome">Рады приветствовать Вас!</div>\
                    <div class="tourIndexBlock">\
                        <div class="tourBorder"></div>\
                        <p class="tourHello">Хотели бы Вы пройти<br> интерактивный курс обучения?</p>\
                        <div class="tourLegend">\
                            <a class="tourTop first indexTipToAdmin" data-step="index-tip-toadmin">Базовые настройки</a>\
                            <a class="adminCatalogAddInfo" data-step="admin-catalog-add-info">Категории<br> и Товары</a>\
                            <a class="tourTop menuCtrl" data-step="menu-ctrl">Текстовые<br> страницы<br> (Меню)</a>\
                            <a class="articleCtrl" data-step="article-ctrl">Новости</a>'+
                            (global.scriptType != 'Shop.Base' ? '<a class="tourTop shopDeliveryCtrl" data-step="shop-deliveryctrl">Способы доставки</a>\
                            <a class="shopPaymentCtrl" data-step="shop-paymentctrl">Способы оплаты</a>' : '') +
                            '<a class="tourTop debugIndex" data-step="debug-index">Правка информации на сайте</a>\
                        </div>\
                    </div>\
                </div>', null, 'tourWelcome'),
                buttons: {
                    yes: {
                        text: lang.t('Да, пройти курс с начала'),
                        step: 'index-tip-toadmin'
                    },
                    no: false
                }
            },
            
            'index-tip-toadmin': {
                url: '/',
                topic: tourTopics.base,            
                tip: {
                    element: '.header-panel .to-admin',
                    tipText: lang.t('Все настройки интернет-магазина располагаются в административной панели. Нажмите на кнопку быстрого перехода в панель администрирования.')
                }
            },
            
            'admin-index': {
                url: '%admin%/',
                topic: tourTopics.base,            
                type: 'info',
                message: lang.t('Это главный экран панели управления магазином. Здесь могут размещаться информационные виджеты с самой актуальной информацией по ключевым показателям магазина.'),
                tips: [
                    {
                        element: '.addwidget',
                        tipText: lang.t('Кнопка "Добавить виджет" откроет список имеющихся в системе виджетов'),
                        position: ['center', 'bottom'],  //Положение относительно element - [(left|center|right),(top|middle|bottom)]
                        fixed:true,
                        animation: 'bounceInDown'
                    },
                    {
                        element: '.action-zone .action.to-site',
                        tipText: lang.t('Быстрый переход на сайт'),
                        position: ['left', 'bottom'],
                        animation: 'slideInLeft'
                    },
                    {
                        element: '.action-zone .action.clean-cache',
                        tipText: lang.t('Кнопка для очистки кэша системы'),
                        position: ['left', 'bottom'],
                        correctionY: 50,
                        animation: 'slideInDown'
                    },
                    {
                        element: '.panel-menu .current',
                        tipText: lang.t('Показан текущий сайт. Если управление ведется несколькими сайтами, то при наведении будет показан список сайтов.'),
                        position: ['left', 'bottom'],
                        correctionY: 100,
                        css: {
                            width: 300
                        },
                        animation: 'bounceInDown'
                    }
                ]
            },
            
            'admin-index-to-siteoptions': {
                url: '%admin%/',
                topic: tourTopics.base,
                tip: {
                    element: ['a[data-url$="/menu-ctrl/"]', '#menu-trigger'],
                    tipText: lang.t('Перейдите в раздел <i>Веб-сайт &rarr; Настройка сайта</i>'),
                    correctionX: 40,
                    fixed: true
                },
                onStart: function() {
                    $('a[href$="/site-options/"]').addClass('menuTipHover');
                },
                onStop: function() {
                    $('a[href$="/site-options/"]').removeClass('menuTipHover');
                }
            },
            
            'admin-siteoptions': {
                url: '%admin%/site-options/',
                topic: tourTopics.base,            
                type: 'info',
                message: lang.t('В этом разделе необходимо настроить основные параметры текущего сайта, к которым относятся: '+
                '<ul><li>контактные данные администратора магазина (будут использоваться для уведомлений обо всех событиях в интернет-магазине);</li>'+
                '<li>реквизиты организации продавца (будут использоваться для формирования документов покупателям);</li>'+
                '<li>логотип интернет-магазина;</li>'+
                '<li>тема оформления сайта;</li>'+
                '<li>параметры писем, отправляемых интернет-магазином.</li></ul>', null, 'tourAdminSiteOptions'),
                tips:[
                    {
                        element: '.tab-nav li:eq(3)',
                        tipText: lang.t('Заполните сведения во всех вкладках. При наведении мыши на символ вопроса, расположенный справа от поля, отобразится подсказка по нзначению и заполнению поля.'),
                        position: ['center', 'bottom'],
                        correctionX:50,
                        css: {
                            width:300
                        },
                        animation: 'slideInDown'
                    }
                ],
                buttons: {
                    next: 'admin-siteoptions-save'
                }
            },
            
            'admin-siteoptions-save': {
                url: '%admin%/site-options/',
                topic: tourTopics.base,            
                tip: {
                    element: '.btn.crud-form-apply',
                    tipText: lang.t('Заполните сведения во всех вкладках, расположенных выше. Далее, нажмите на зеленую кнопку, чтобы сохранить изменения.'),
                    correctionY: -15,
                    bottom: true,
                    css: {
                        position: 'fixed'
                    }
                },
                watch: {
                    element: '.btn.crud-form-apply',
                    event: 'click',
                    next:'admin-siteoptions-to-products'
                }
            },
            
            'admin-siteoptions-to-products': {
                url: '%admin%/site-options/',
                topic: tourTopics.base,
                tip: {
                    element: ['a[data-url$="/catalog-ctrl/"]', '#menu-trigger'],
                    tipText: lang.t('Теперь необходимо добавить товары, для этого перейдите в раздел <i>Товары &rarr; Каталог товаров</i>'),
                    correctionX: 40,
                    css: {
                        zIndex: 50
                    }
                },
                onStart: function() {
                    $('.side-menu ul a[href$="/catalog-ctrl/"]').addClass('menuTipHover');
                },
                onStop: function() {
                    $('.side-menu ul a[href$="/catalog-ctrl/"]').removeClass('menuTipHover');
                }
            },
            
            'admin-catalog-add-info': {
                url: '%admin%/catalog-ctrl/',
                topic: tourTopics.products,
                type: 'info',
                message: lang.t('В этом разделе происходит управление товарами и категориями товаров. \
                            Обратите внимание на расположение кнопок создания объектов.\
                            <p>На следующем шаге мы попробуем создать, для примера, одну категорию и один товар. \
                            По аналогии вы сможете наполнить каталог собственными категориями и товарами.', null, 'tourAdminCatalogAddInfo'),
                tips: [
                    {
                        element: '.treehead .addspec',
                        tipText: lang.t('Создать спец.категорию <br>(например: новинки, лидеры продаж,...)'),
                        position:['left', 'bottom'],
                        whenUse: isCategoryExpanded,
                        animation: 'slideInLeft'
                    },
                    {
                        element: '.treehead .add',
                        tipText: lang.t('Создать категорию товаров'),
                        whenUse: isCategoryExpanded,
                        position:['left', 'bottom'],
                        correctionY:60,
                        animation: 'slideInDown'
                    },
                    {
                        element: '.c-head .btn-group:contains("'+lang.t("добавить товар")+'")',
                        tipText: lang.t('Создать товар'),
                        position:['left', 'middle'],
                        correctionX:-30,
                        animation: 'fadeInLeft'
                    },
                    {
                        element: lang.t('.c-head .btn-group:contains("'+lang.t("Импорт/Экспорт")+'")'),
                        tipText: lang.t('Через эти инструменты можно массово загрузить товары, <br>категории в систему через CSV файлы. Подробности в <a target="_blank" href="http://readyscript.ru/manual/catalog_csv_import_export.html">документации</a>.'),
                        animation: 'slideInDown'
                        
                    }
                ],
                buttons: {
                    next: 'admin-siteoptions-save'
                }
            },
            
            'admin-catalog-add-dir': {
                url: '%admin%/catalog-ctrl/',
                topic: tourTopics.products,
                tip: {
                    element: [
                        {
                            selector: '.treehead .add',
                            whenUse: isCategoryExpanded
                        },
                        {
                            selector: '.c-head .btn.btn-success',
                            left: true,
                            correctionX:-20
                        }],
                    tipText: lang.t('Перед добавлением товара нужно создать его категорию. Для примера, создадим тестовую категорию "<b>Холодильники</b>". Нажмите на кнопку <i>создать категорию</i> или найдите это действие в выпадающем списке зеленой кнопки вверху-справа.'),
                },
                watch: {
                    element: '.treehead .add, .c-head a:contains("добавить категорию")',
                    event: 'click',
                    next: 'admin-catalog-add-dir-form'
                }
            },
            
            //Шаги, связанные с добавлением категории
            
            'admin-catalog-add-dir-form': {
                url: '%admin%/catalog-ctrl/?pid=0&do=add_dir',
                topic: tourTopics.products,
                type: 'form',
                tips: [
                    {
                        element: '.crud-form [name="name"]',
                        tipText: lang.t('Укажите название - <b>Холодильники</b>'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.crud-form [name="alias"]',
                        tipText: lang.t('Укажите Псевдоним - это имя на английском языке, которое будет использоваться для построения URL-адреса страницы'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.formbox .tab-nav',
                        tipText: lang.t('Перейдите на вкладку <i>Характеристики</i>. Для примера создадим 1 характеристику (мощность), <br>\
                                  которая обязательно будет присутствовать у всех товаров создаваемой категории.'),
                        insertAfter:true,
                        correctionX:100,
                        watch: {
                            element: '.formbox .tab-nav li > a:contains("'+lang.t('Характеристики')+'")',
                            event: 'click'
                        }
                    },
                    {
                        element: '.property-actions .add-property',
                        tipText: lang.t('Нажмите добавить характеристику'),
                        watch: {
                            event: 'click',
                        },
                        onStart: function() {
                            $('.frame[data-name="tab2"]').append('<div style="height:110px" id="tourPlaceholder1"></div>');
                        }
                    },
                    {
                        element: '.property-form .p-title',
                        tipText: lang.t('Укажите название - <b>Мощность</b>'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.property-form .p-type',
                        tipText: lang.t('Укажите тип - <b>Список</b>, чтобы в дальнейшем включить фильтр по данной харктеристике'),
                        checkPattern: /^(list)$/gi
                    },
                    {
                        element: '.property-form .p-unit',
                        tipText: lang.t('Укажите единицу измерения - <b>Вт</b>'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.property-form .p-new-value',
                        tipText: lang.t('Укажите возможное значение мощности - <b>1000</b> и нажмите справа <b>добавить</b>'),
                        watch: {
                            element: '.p-add-new-value',
                            event: 'click'
                        }
                    },
                    {
                        element: '.property-form .p-new-value',
                        tipText: lang.t('Укажите еще одно возможное значение мощности - <b>2000</b> и нажмите справа <b>добавить</b>'),
                        watch: {
                            element: '.p-add-new-value',
                            event: 'click'
                        }
                    },
                    {
                        element: '.property-form .add',
                        tipText: lang.t('<i>Добавьте</i> характеристику к категории'),
                        css: {
                            marginTop:46
                        },
                        watch: {
                            event: 'click',
                        }
                    },
                    {
                        waitNewContent: true,
                        element: '.property-container .property-item .h-public',
                        tipText: lang.t('Установите флажок <i>Отображать в поиске на сайте</i>, чтобы по данной характеристике можно было отфильтровать товары на сайте. Подробности в <a href="http://readyscript.ru/manual/catalog_categories.html#cat_tab_characteristics" target="_blank">документации</a>.'),
                        checkPattern: true,
                        correctionX: -230,
                        css: {
                            width:300
                        }
                    },
                    {
                        element: '.bottom-toolbar .crud-form-save',
                        tipText: lang.t('Нажмите на кнопку <i>Сохранить</i>, чтобы создать категорию'),
                        bottom: true,
                        css: {
                            position: 'fixed'
                        },
                        correctionY: -20,
                        watch: {
                            element: 'body',
                            event: 'crudSaveSuccess',
                            next: 'admin-catalog-add-product'
                        }
                    }
                ]
            },        
            
            'admin-catalog-add-product': {
                url: '%admin%/catalog-ctrl/',
                topic: tourTopics.products,
                tip: {
                    element: '.c-head .btn.btn-success:contains("'+lang.t('добавить товар')+'")',
                    tipText: lang.t('Чтобы добавить товар, нажмите на зеленую кнопку <i>Добавить товар</i>'),
                },
                watch: {
                    element: '.c-head .btn.btn-success:contains("'+lang.t('добавить товар')+'")',
                    event: 'click',
                    next: 'admin-catalog-add-product-form'
                }
            },
            
            'admin-catalog-add-product-form': {
                url: '%admin%/catalog-ctrl/?dir=0&do=add',
                topic: tourTopics.products,
                type: 'form',
                tips: [
                    {
                        element: '.crud-form [name="title"]',
                        tipText: lang.t('Укажите название товара - <b>Холодильник ТОМАС</b>'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.crud-form [name="alias"]',
                        tipText: lang.t('Укажите любое URL имя на англ.языке. <br>Будет использовано для создания адреса страницы товара'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '#tinymce-description_parent',
                        tinymceTextarea: '#tinymce-description',
                        tipText: lang.t('Укажите описание товара'),
                        bottom:true,
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.crud-form [name="barcode"]',
                        tipText: lang.t('Укажите артикул товара'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.crud-form [name^="excost"]:first',
                        tipText: lang.t('Укажите стоимость товара'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.crud-form [name^="xdir[]"]',
                        tipText: lang.t('Выберите категорию - <b>Холодильники</b>'),
                        checkSelectValue: /^.*$/gi,
                        correctionX:150,
                    },
                    {
                        element: '.formbox .tab-nav',
                        tipText: lang.t('Теперь добавим характеристику товару, для этого перейдите на вкладку <i>Характеристики</i>'),
                        insertAfter:true,
                        correctionX:100,
                        watch: {
                            element: '.formbox .tab-nav li > a:contains('+lang.t('Характеристики')+')',
                            event: 'click',
                        }
                    },
                    {
                        ifTrue: function() {
                            return !$(lang.t('.item-title:contains("Мощность")')).length>0;
                        },
                        elseStep: 'myval_noajax',
                        element: '.property-actions .add-property',
                        tipText: lang.t('Нажмите <i>Добавить характеристику</i>'),
                        watch: {
                            event: 'click',
                        }
                    },
                    {
                        element: '.property-form .p-proplist',
                        tipText: lang.t('Выберите характеристику - <b>Мощность</b>'),
                        checkPattern: /^\d+$/gi
                    },
                    
                    {
                        element: '.property-form .add',
                        tipText: lang.t('<i>Добавьте</i> характеристику к товару'),
                        css: {
                            marginTop:46
                        },
                        watch: {
                            event: 'click',
                        }
                    },
                    {
                        label: 'myval_ajax',
                        waitNewContent: true,
                        ifTrue: function() {
                            //Если есть флажок - "задать персональное значение"
                            return $(lang.t('.property-item:contains("Мощность") .h-useval')).length>0;
                        },
                        element: lang.t('.property-item:contains("Мощность") .h-useval'),
                        tipText: lang.t('Отметьте флажок, чтобы задать индивидуальное значение характеристики для товара'),
                        checkPattern: true,
                        next: 'propval'
                    },
                                    
                    {
                        label: 'myval_noajax',
                        ifTrue: function() {
                            //Если есть флажок - "задать персональное значение"
                            return $('.property-item:contains("Мощность") .h-useval').length>0;
                        },
                        element: '.property-item:contains("Мощность") .h-useval',
                        tipText: lang.t('Отметьте флажок, чтобы задать индивидуальное значение характеристики для товара'),
                        checkPattern: true
                    },
                    {
                        label: 'propval',
                        element: '.property-item:contains("Мощность") .inline-item:contains("1000") input',
                        tipText: lang.t('Укажите, что мощность холодильника - 1000 Вт'),
                        checkPattern: true
                    },
                    {
                        element: '.formbox .tab-nav',
                        tipText: lang.t('На закладке <i>Комплектации</i> можно задать остатки, а также <a href="http://readyscript.ru/manual/catalog_products.html#catalog_products_tab_offers">вариации(комплектации)</a> товара.'),
                        insertAfter:true,
                        correctionX:100,
                        watch: {
                            element: '.formbox .tab-nav li > a:contains('+lang.t("Комплектации")+')',
                            event: 'click',
                        }
                    },
                    {
                        element: '.crud-form [name^="offers[main][stock_num]"]:first',
                        tipText: lang.t('Укажите остаток товара на всех складах - <i>10</i>'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.formbox .tab-nav',
                        tipText: lang.t('Загрузите фотографии на вкладке <i>Фото</i>'),
                        insertAfter:true,
                        correctionX:100,
                        watch: {
                            element: '.formbox .tab-nav li > a:contains(' + lang.t("Фото") + ')',
                            event: 'click',
                        }
                    },
                    {
                        element: '.bottom-toolbar .crud-form-save',
                        tipText: lang.t('При желании вы можете заполнить сведения на оставшихся вкладках товара.<br>'+
                                 'Затем нажмите на кнопку <i>Сохранить</i>, чтобы создать товар'),
                        bottom: true,
                        css: {
                            position: 'fixed'
                        },
                        correctionY: -20,
                        watch: {
                            element: 'body',
                            event: 'crudSaveSuccess',
                            next: 'admin-catalog'
                        },
                        
                    }
                ],
            },
            
            'admin-catalog': {
                url: '%admin%/catalog-ctrl/',
                topic: tourTopics.products,
                type: 'info',
                message: lang.t('Товар и категория добавлены. \
                          В дальнейшем Вы часто будете пользоваться данным разделом, чтобы корректировать описания товаров, цены, количество товаров, и т.д. \
                          Предлагаем ознакомиться с основными элементами управления, присутствующими на данной странице.'),
                tips: [
                    {
                        element: '.rs-table .options',
                        tipText: lang.t('Настройка состава колонок <br>таблицы и сортировки по-умолчанию'),
                        animation: 'slideInDown'
                    },
                    {
                        element: '.rs-table thead th:eq(4)',
                        tipText: lang.t('При нажатии на заголовок колонки <br>можно изменять сортировку данных в таблице'),
                        correctionY:70,
                        correctionX:40,
                        animation: 'slideInDown'
                    },
                    {
                        element: '.right-column .bottom-toolbar .crud-multiedit',
                        tipText: lang.t('В нижней панели представлены действия (редактировать, удалить), <br>которые можно применить ко всем <br>отмеченным элементам (товарам или категориям).'),
                        position: ['right', 'top'],
                        animation: 'bounceInDown',
                        css: {
                            position:'fixed'
                        }
                    },
                    {
                        element: '.treehead .showchilds-on, .showchilds-off',
                        tipText: lang.t('Включить/выключить показ товаров из вложенных категорий'),
                        whenUse:isCategoryExpanded,
                        position:['right', 'top'],
                        correctionY:-20,
                        animation: 'rotateIn'
                    },                
                    {
                        element: '.rs-table .chk',
                        tipText: lang.t('Можно отметить товары как на одной,<br> так и на всех страницах'),
                        position:['right', 'bottom'],
                        animation: 'slideInLeft'
                    },
                    {
                        element: '.treebody > li:eq(1) .move',
                        tipText: lang.t('Сортируйте категории с помощью перетаскивания'),
                        whenUse:isCategoryExpanded,
                        position:['right', 'bottom'],
                        animation: 'slideInDown'
                    }
                ],
                onStart: function() {
                    var act = function() {
                        $('.rs-table .chk').addClass('chk-over');
                        $('.treebody > li:eq(3)').addClass('over');
                        $('.treebody > li:eq(1)').addClass('drag');
                        $('.rs-table tbody tr:eq(7)').addClass('over');
                    }
                    
                    $('body').on('new-content.tour', act);
                    act();
                },
                onStop: function() {
                    $('.rs-table .chk').removeClass('chk-over');
                    $('.treebody > li:eq(3)').removeClass('over');
                    $('.treebody > li:eq(1)').removeClass('drag');
                    $('.rs-table tbody tr:eq(7)').removeClass('over');
                }
            },
            
            'to-menu-ctrl': {
                url: '%admin%/catalog-ctrl/',
                topic: tourTopics.products,
                tip: {
                    element: 'a[data-url$="/menu-ctrl/"]',
                    tipText: lang.t('Перейдите в раздел <i>Веб-сайт &rarr; Меню</i>'),
                    correctionX: 40,
                    css: {
                        zIndex:50
                    }
                },
                onStart: function() {
                    $('.side-menu ul a[href$="/menu-ctrl/"]').addClass('menuTipHover');
                },
                onStop: function() {
                    $('.side-menu ul a[href$="/menu-ctrl/"]').removeClass('menuTipHover');
                }
            },
            
            'menu-ctrl': {
                url: '%admin%/menu-ctrl/',
                topic: tourTopics.menu,
                type: 'info',
                message: lang.t('В данном разделе можно создавать иерархию страниц сайта разных типов, которые могут быть доступны пользователям через меню. Каждой странице будет присвоен определенный URL адрес, по которому она будет доступна из браузера. \
                         <p>Например, если вы желаете: <ul>\
                         <li>создать страницу с какой-либо текстовой информацией, то необходимо создать пункт меню с типом "<b>Статья</b>".</li>\
                         <li>создать страницу, на которой должны быть представлены функциональные блоки с каким-либо более сложным поведением (например, форма обратной связи), то необходимо создать пункт меню с типом "<b>Страница</b>". \
                         Далее эту страницу можно будет настроить в разделе Веб-сайт &rarr; Конструктор сайта.</li>\
                         <li>создать простую ссылку в меню, то используйте тип "<b>Ссылка</b>" для такого пункта меню.</li>\
                         </ul><p>Ознакомьтесь с основными функциональными кнопками на данной странице. \
                         На следующем шаге, мы создадим для примера пункт меню с информацией о рекламной акции в интернет-магазине.', null, 'tourMenuCtrlInfo'),
                tips: [
                    {
                        element: lang.t('.c-head .btn:contains("добавить пункт меню")'),
                        tipText: lang.t('Создать новый пункт меню'),
                        animation: 'bounceInDown'
                    },
                    {
                        element: lang.t('.c-head .btn:contains("Импорт/Экспорт")'),
                        tipText: lang.t('Через эти инструменты можно массово <br>загрузить пункты меню в систему через CSV файлы.'),
                        animation: 'slideInDown',
                        correctionY:60
                    },
                    {
                        element: '.activetree  .allplus',
                        tipText: lang.t('Развернуть отображение дерева пунктов меню'),
                        position:['right', 'bottom'],
                        animation: 'slideInLeft'
                        
                    },
                    {
                        element: '.activetree  .allminus',
                        tipText: lang.t('Свернуть отображение дерева пунктов меню'),
                        position:['right', 'middle'],
                        correctionX:40,
                        animation: 'slideInDown'
                    }
                ]
            },
            
            'menu-ctrl-add': {
                url: '%admin%/menu-ctrl/',
                topic: tourTopics.menu,
                tip: {
                    element: '.c-head .btn:contains("' + lang.t("добавить пункт меню") + '")',
                    tipText: lang.t('Добавим на сайте раздел <b>Акция</b>, в котором будет представлена текстовая информация. \
                              Нажмите на кнопку <i>Добавить пункт меню</i>')
                },
                watch: {
                    element: '.c-head .btn:contains("' + lang.t("добавить пункт меню") + '")',
                    event: 'click',
                    next: 'menu-ctrl-add-form'
                }
            },
            
            'menu-ctrl-add-form': {
                url: '%admin%/menu-ctrl/?do=add',
                topic: tourTopics.menu,
                type: 'form',
                tips: [
                    {
                        element: '.crud-form [name="title"]',
                        tipText: lang.t('Укажите название пункта меню - <b>Акция</b>'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.crud-form [name="alias"]',
                        tipText: lang.t('Укажите любое название пункта меню на Англ. языке. <br>Оно будет использоваться для построения URL адреса раздела.'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.crud-form #tinymce-content_ifr',
                        tinymceTextarea: '#tinymce-content',
                        tipText: lang.t('Укажите информацию об акции'),
                        bottom:true,
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.mce-ico.mce-i-image',
                        tipText: lang.t('Используйте кнопку с лупой, чтобы добавить изображения к тексту'),
                        correctionY:10,
                        correctionX:-50,
                        checkTimeout: 5000
                    },
                    {
                        element: '.bottom-toolbar .crud-form-save',
                        tipText: lang.t('После ввода всей необходимой текстовой информации, нажмите \
                                 <br>на кнопку <i>Сохранить</i>, чтобы создать раздел на сайте, который отобразится в меню'),
                        bottom: true,
                        css: {
                            position: 'fixed'
                        },
                        correctionY: -20,
                        watch: {
                            element: 'body',
                            event: 'crudSaveSuccess',
                            next: 'to-article-ctrl'
                        },
                        
                    }
                ]
            },
            
            'to-article-ctrl': {
                url: '%admin%/menu-ctrl/',
                topic: tourTopics.article,
                tip: {
                    element: '.side-menu a:contains("'+lang.t('Веб-сайт')+'")',
                    tipText: lang.t('Перейдите в раздел <i>Веб-сайт &rarr; Контент</i>'),
                    correctionX: 50,
                    css: {
                        zIndex: 50
                    }
                },
                onStart: function() {
                    $('.side-menu ul a[href$="/article-ctrl/"]').addClass('menuTipHover');
                },
                onStop: function() {
                    $('.side-menu ul a[href$="/article-ctrl/"]').removeClass('menuTipHover');
                }
            },
            
            'article-ctrl': {
                url: '%admin%/article-ctrl/',
                topic: tourTopics.article,
                type: 'info',
                message: lang.t('На этой странице происходит управление списками текстовых материалов, например новостями.\
                         <p>Для добавления новости на сайте, достаточно создать статью в соответствующей категории.\
                         <p>Также в этом разделе административной панели могут размещаться статьи, используемые темой оформления на различных страницах.'),
                tips: [
                    {
                        element: '.treehead .add',
                        tipText: lang.t('Создать категорию статей'),
                        position:['right', 'top'],
                        whenUse: isCategoryExpanded,
                        animation: 'slideInDown'
                    },
                    {
                        element: '.c-head .btn:contains("' + lang.t('добавить статью') + '")',
                        tipText: lang.t('Создать статью'),
                        animation: 'slideInDown'
                    },
                    {
                        element: '.treebody > li:eq(0)',
                        tipText: lang.t('Категория статей'),
                        whenUse: isCategoryExpanded,
                        position:['right', 'middle'],
                        animation: 'slideInLeft',
                        correctionX:40
                    }
                ]
            }
    }

    welcomeTour.commonEnd = {
            'to-index': {
                url: global.scriptType != 'Shop.Base' ? '%admin%/shop-paymentctrl/' : '%admin%/article-ctrl/',
                topic: tourTopics.payment,
                tip: {
                    element: '.header-panel .to-site',
                    tipText: lang.t('Основные настройки в административной панели произведены. Желаете добавлять товары, категории, новости, и т.д., не заходя в панель администрирования? Нажмите на кнопку <i>Перейти на сайт</i>, чтобы узнать как.')
                },
                watch: {
                    element: '.header-panel .to-site',
                    event: 'click',
                    next: 'debug-index'
                }
            },
            
            'debug-index': {
                url: '/',
                topic: tourTopics.debug,
                tip: {
                    element: '.debug-mode-switcher .rs-switch',
                    tipText: lang.t('Включите режим отладки, чтобы редактировать элементы прямо на странице'),
                    correctionY:40
                },
                whileTrue: function() {
                    return $('.debug-mode-switcher .rs-switch:not(.on)').length;
                }            
            },
            
            'debug-text': {
                url: '/',
                topic: tourTopics.debug,
                tip: {
                    element: '.module-wrapper:has([data-debug-contextmenu]):first',
                    tipText: lang.t('Любой товар, категорию, пункт меню, и т.д. на данной странице можно отредактировать, удалить или создать, кликнув над ним правой кнопкой мыши и выбрав необходимое действие.'),
                    correctionY:10,
                    css: {
                        zIndex:3
                    },
                    notFound: 'finish'
                },
                watch: {
                    element: '',
                    event: 'showContextMenu',
                    next: 'debug-block-text'
                },
                checkTimeout: 15000
            },
            
            'debug-block-text': {
                url: '/',
                topic: tourTopics.debug,
                tip: {
                    element: '.module-wrapper:eq(0) .debug-icon-blockoptions',
                    tipText: lang.t('Любой блок можно настроить, нажав на иконку с изображением гаечного ключа.'),
                    correctionY:10,
                    notFound: 'finish',
                    css: {
                        zIndex:3
                    }
                },
                onStart: function() {
                    $('.module-wrapper:eq(0)').addClass('over');
                },                
                onStop:  function() {
                    $('.module-wrapper:eq(0)').removeClass('over');
                },      
                watch: {
                    element: '.debug-icon-blockoptions',
                    event: 'click',
                    next: 'finish'
                },
                checkTimeout: 15000
            },
            
            'finish': {
                url: '/',
                topic: tourTopics.debug,
                type:'dialog',
                message: lang.t('<span class="finishText">Интерактивный курс по базовым настройкам<br> интернет-магазина успешно завершен.</span> <br>Более подробную информацию по возможностям платформы ReadyScript можно найти в <a href="http://readyscript.ru/manual/" target="_blank"><u>документации</u></a>.'),
                buttons: {
                    finish: {
                        text: lang.t('Закрыть окно'),
                        step: false                        
                    },
                    docs: {
                        text: lang.t('Документация'),
                        attr: {
                            href: 'http://readyscript.ru/manual/',
                            target: '_blank'
                        },
                        step:false
                    }
                }
            }
    }

    welcomeTour.shop = {
        'to-shop-deliveryctrl': {
                url: '%admin%/article-ctrl/',
                topic: tourTopics.article,            
                tip: {
                    element: '.side-menu > li > a[data-url$="/shop-orderctrl/"]',
                    tipText: lang.t('Теперь перейдем к настройке параметров, связанных с заказами. Перейдите в раздел <i>Магазин &rarr; Доставка &rarr; Способы доставки</i>'),
                    position:['right', 'top'],
                    bottom:true,
                    css: {
                        zIndex:50
                    }
                },
                onStart: function() {
                    $('.side-menu a[href$="/shop-regionctrl/"]:first').addClass('menuTipHover');
                    $('.side-menu a[href$="/shop-deliveryctrl/"]').addClass('menuTipHover');
                },
                onStop: function() {
                    $('.side-menu a[href$="/shop-regionctrl/"]:first').removeClass('menuTipHover');
                    $('.side-menu a[href$="/shop-deliveryctrl/"]').removeClass('menuTipHover');
                }
            },
            
            'shop-deliveryctrl': {
                url: '%admin%/shop-deliveryctrl/',
                topic: tourTopics.delivery,
                type:'info',
                message: lang.t('В этом разделе необходимо произвести настройку способов доставок, которые будут\
                         предложены пользователю во время оформления заказа. \
                         <p>До настройки данного раздела, необходимо иметь представление о том, как вы будете доставлять товары вашим покупателям и по каким ценам.\
                         <p>Ознакомьтесь с основными инструментами представленными на данной странице.\
                         <p>На следующем шаге, создадим для примера, "доставку по городу", которая будет стоить 500 руб.', null, 'tourShopDeliveryCtrlInfo'),
                tips: [
                    {
                        element: '.c-head .btn.btn-success',
                        tipText: lang.t('Добавить способ доставки'),
                        position:['center', 'top'],
                        animation: 'slideInLeft'
                    },
                    {
                        element: lang.t('.c-head .btn:contains("Импорт/Экспорт")'),
                        tipText: lang.t('Через эти инструменты можно массово загрузить способы доставок через CSV файлы.'),
                        animation: 'slideInDown',
                        correctionY:60
                    },
                    {
                        element: '.rs-table .sortdot',
                        tipText: lang.t('Сортировать способы доставок можно с помощью перетаскивания'),
                        position: ['right', 'top'],
                        animation: 'slideInLeft'
                    }
                ]
            },
            
            'shop-deliveryctrl-add': {
                url: '%admin%/shop-deliveryctrl/',
                topic: tourTopics.delivery,
                tip: {
                    element: '.c-head .btn.btn-success',
                    tipText: lang.t('Добавим, для примера, способ доставки <b>по городу</b>. Нажмите на кнопку <i>Добавить способ доставки</i>')
                },
                watch: {
                    element: '.c-head .btn.btn-success',
                    event: 'click',
                    next: 'shop-deliveryctrl-add-form'
                }            
            },
            
            'shop-deliveryctrl-add-form': {
                url: '%admin%/shop-deliveryctrl/?do=add',
                topic: tourTopics.delivery,
                type: 'form',
                tips: [
                    {
                        element: '.crud-form [name="title"]',
                        tipText: lang.t('Укажите название доставки - <b>по городу</b>. Будет отображено во время оформления заказа в списке возможных способов доставки.'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.crud-form [name="description"]',
                        tipText: lang.t('Укажите условия или подробности доставки, которые будут отображаться под названием'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.crud-form [name="xzone[]"]',
                        tipText: lang.t('Выберите географические зоны или пункт <b>- все -</b>, <br>чтобы определить регионы пользователей, для которых <br>будет отображен данный способ доставки'),
                        checkPattern: /^(0)$/gi
                    },
                    {
                        element: '.crud-form [name="user_type"]',
                        tipText: lang.t('Выберите категорию пользователей, <br>для которых будет доступна доставка.'),
                        watch: {
                            event: 'click'
                        }
                    },
                    {
                        element: '.crud-form [name="class"]',
                        tipText: lang.t('Расчетный класс отвечает за то, какой модуль <br>будет расчитывать стоимость и обрабатывать доставку. \
                                  Выберите <b>Фиксированная цена</b>. Подробнее о других расчетных классах можно узнать <a href="http://readyscript.ru/manual/shop_delivery.html#shop_delivery_add" target="_blank">в документации</a>'),
                        watch: {
                            event: 'click'
                        }
                    },
                    {
                        element: '.crud-form [name="data[cost]"]',
                        tipText: lang.t('Укажите стоимость доставки по городу'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.bottom-toolbar .crud-form-save',
                        tipText: lang.t('После ввода всех необходимых параметров доставки, нажмите \
                                 <br>на кнопку <i>Сохранить</i>'),
                        bottom: true,
                        css: {
                            position: 'fixed'
                        },
                        correctionY: -20,
                        watch: {
                            element: 'body',
                            event: 'crudSaveSuccess',
                            next: 'to-shop-paymentctrl'
                        },
                        
                    }
                ]
            },
            
            'to-shop-paymentctrl': {
                url: '%admin%/shop-deliveryctrl/',
                topic: tourTopics.delivery,
                tip: {
                    element: '.side-menu > li > a[data-url$="/shop-orderctrl/"]',
                    tipText: lang.t('Перейдите в раздел <i>Магазин &rarr; Способы оплаты</i>'),
                    bottom:true,
                    css: {
                        zIndex:50
                    }
                },
                onStart: function() {
                    $('.side-menu a[href$="/shop-paymentctrl/"]').addClass('menuTipHover');
                },
                onStop: function() {
                    $('.side-menu a[href$="/shop-paymentctrl/"]').removeClass('menuTipHover');
                }
            },
            
            'shop-paymentctrl': {
                url: '%admin%/shop-paymentctrl/',
                topic: tourTopics.payment,
                type: 'info',
                message: lang.t('Перед началом продаж следует настроить способы оплат, которые будут предложены пользователю во время оформления заказа.\
                          <p>Если Вы желаете добавить возможность оплачивать заказы с помощью электроных денег или карт Visa, Mastercard, и т.д., то\
                            Вам необходимо предварительно создать аккаунт магазина на одном из сервисов-агрегаторов платежей - Yandex.Касса, Robokassa, Assist, PayPal, ...\
                          <p>На следующем шаге, добавим для примера, способ оплаты "Безналичный расчет". Это будет означать, что покупатель сможет получить счет сразу после оформления заказа.', null, 'tourShopPaymentCtrlInfo'),
                tips: [
                    {
                        element: '.c-head .btn.btn-success',
                        tipText: lang.t('Добавить способ оплаты'),
                        position:['center', 'top'],
                        animation: 'slideInDown'
                    },
                    {
                        element: '.rs-table .sortdot',
                        tipText: lang.t('Сортировать способы оплаты можно с помощью перетаскивания'),
                        position: ['right', 'top'],
                        animation: 'slideInLeft'
                    }
                ]
            },
            
            'shop-paymentctrl-add': {
                url: '%admin%/shop-paymentctrl/',
                topic: tourTopics.payment,
                tip: {
                    element: '.c-head .btn.btn-success',
                    tipText: lang.t('Добавим, для примера, способ оплаты <b>Безналичный расчет</b>. Нажмите на кнопку <i>Добавить способ оплаты</i>')
                },
                watch: {
                    element: '.c-head .btn.btn-success',
                    event: 'click',
                    next: 'shop-paymentctrl-add-form'
                }  
            },
            
            'shop-paymentctrl-add-form': {
                url: '%admin%/shop-paymentctrl/?do=add',
                topic: tourTopics.payment,
                type:'form',
                tips: [
                    {
                        element: '.crud-form [name="title"]',
                        tipText: lang.t('Укажите название способа оплаты - <b>Безналичный расчет</b>. Будет отображено во время оформления заказа в списке возможных способов оплаты.'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.crud-form [name="description"]',
                        tipText: lang.t('Укажите условия или подробности оплаты. Будут отображены под названием'),
                        checkPattern: /^(.+)$/gi
                    },
                    {
                        element: '.crud-form [name="first_status"]',
                        tipText: lang.t('Счет будет доступен пользователю только если заказ находится в статусе <i>Ожидает оплату</i>, поэтому выберите стартовый статус <b>Ожидает оплату</b>'),
                        checkSelectValue: /^(Ожидает оплату)$/gi
                    },
                    {
                        element: '.crud-form [name="class"]',
                        tipText: lang.t('Расчетный класс отвечает за то, какой модуль будет обрабатывать платежи <br>или предоставлять документы на оплату пользователю. Выберите <b>Безналичный расчет</b>'),
                        checkPattern: /^(bill)$/gi
                    },
                    {
                        waitNewContent: true,
                        element: '.crud-form [name="data[use_site_company]"]',
                        tipText: lang.t('Установите флажок, чтобы использовать реквизиты, которые были заполнены раннее в разделе <i>Веб-сайт &rarr; Настройка сайта</i>.'),
                        checkPattern: true
                    },
                    {
                        element: '.bottom-toolbar .crud-form-save',
                        tipText: lang.t('После ввода всех необходимых параметров оплаты, нажмите \
                                 <br>на кнопку <i>Сохранить</i>'),
                        bottom: true,
                        css: {
                            position: 'fixed'
                        },
                        correctionY: -20,
                        watch: {
                            element: 'body',
                            event: 'crudSaveSuccess',
                            next: 'to-index'
                        },
                    }
                    
                ]
            }
     }

    var tours = 
    {
        'welcome': $.extend({}, 
                            welcomeTour.commonStart, 
                            global.scriptType != 'Shop.Base' ? welcomeTour.shop : {},
                            welcomeTour.commonEnd)
    };
    
    $.tour(tours, {
        baseUrl: global.folder+'/',
        folder: global.folder,
        adminSection: global.adminSection
    });
    
});
/**
 * Plugin, активирующий отображение новостей в боковой панели
 */
$.widget("rs.newsShow", {
    options: {
        elementTitle: '.side-news__title',
        elementItem: '.side-news__item',
        elementAllViewed: '.all-viewed',
        elementNewClass: 'new',
        elementDisabledClass: 'disabled',
        elementViewCircle: '.view-circle'
    },
    _create: function() {
        var _this = this;
        this.element.on('click', function() {
            _this.open();
        });
    },

    /**
     * Открывает SideBar со списком новостей
     */
    open: function() {
        if ($.rs.loading.inProgress) return;

        var _this = this;
        this.panel = $('<div>').sidePanel({
            position: 'right',
            ajaxQuery: {
                url: this.element.data('urls').newsList
            },
            onLoad: function(e, data) {
                $(data.element)
                    .on('click', _this.options.elementItem, function(e) {
                        return _this._markAsViewed(e);
                    });
            },
            onShow: function(e, data) {
                $(data.panel)
                    .on('click', _this.options.elementAllViewed, function(e) {
                            return _this._markAllAsViewed(e, data.panel);
                    });
            }
        });
    },

    /**
     * Сообщает серверу о прочтении новости
     *
     * @private
     */
    _markAsViewed: function(e) {
        var item = $(e.target).closest(this.options.elementItem);
        if (item.hasClass(this.options.elementNewClass)) {
            $.ajaxQuery({
                url: this.element.data('urls').markAsViewed,
                data: {
                    id: $(e.target).closest(this.options.elementItem).data('id')
                },
                success: function (response) {
                    if (response.success) {
                        $.rsMeters('update', response.meters);
                    }
                }
            });
            this._setItemViewed( item );
        }
    },

    /**
     * Помечает все новости как просмотренные
     *
     * @param e
     * @private
     */
    _markAllAsViewed: function(e, panel) {
        if (!$(e.target).hasClass(this.options.elementDisabledClass)) {
            $.ajaxQuery({
                url: this.element.data('urls').markAllAsViewed,
                success: function (response) {
                    if (response.success) {
                        $.rsMeters('update', response.meters);
                    }
                }
            });

            this._setItemViewed( $(this.options.elementItem, panel) );
            $(this.options.elementAllViewed, panel).addClass(this.options.elementDisabledClass);
        }
    },

    _setItemViewed: function(item) {
        item.removeClass(this.options.elementNewClass)
            .find(this.options.elementViewCircle)
            .attr('data-original-title', lang.t('Прочитано'));
    }

});

$(function() {
    $('.rs-news-show').newsShow();
});
/*
 * jQuery UI dialogOptions v1.0
 * @desc extending jQuery Ui Dialog - Responsive, click outside, class handling
 * @author Jason Day
 *
 * Dependencies:
 *		jQuery: http://jquery.com/
 *		jQuery UI: http://jqueryui.com/
 *		Modernizr: http://modernizr.com/
 *
 * MIT license:
 *              http://www.opensource.org/licenses/mit-license.php
 *
 * (c) Jason Day 2014
 *
 * New Options:
 *  clickOut: true          // closes dialog when clicked outside
 *  responsive: true        // fluid width & height based on viewport
 *                          // true: always responsive
 *                          // false: never responsive
 *                          // "touch": only responsive on touch device
 *  scaleH: 0.8             // responsive scale height percentage, 0.8 = 80% of viewport
 *  scaleW: 0.8             // responsive scale width percentage, 0.8 = 80% of viewport
 *  showTitleBar: true      // false: hide titlebar
 *  showCloseButton: true   // false: hide close button
 *
 * Added functionality:
 *  add & remove dialogClass to .ui-widget-overlay for scoping styles
 *	patch for: http://bugs.jqueryui.com/ticket/4671
 *	recenter dialog - ajax loaded content
 *
 */

// add new options with default values
$.ui.dialog.prototype.options.clickOut = false;
$.ui.dialog.prototype.options.responsive = true;
$.ui.dialog.prototype.options.scaleH = 0.95;
$.ui.dialog.prototype.options.scaleW = 0.95;
$.ui.dialog.prototype.options.showTitleBar = true;
$.ui.dialog.prototype.options.showCloseButton = true;
$.ui.dialog.prototype.options.beforeDestroy = function() {};
$.ui.dialog.prototype.options.afterDestroy = function() {};


// extend _init
var _init = $.ui.dialog.prototype._init;
$.ui.dialog.prototype._init = function () {
    var self = this;

    // apply original arguments
    _init.apply(this, arguments);

    //patch
    if ($.ui && $.ui.dialog && $.ui.dialog.overlay) {
        $.ui.dialog.overlay.events = $.map('focus,keydown,keypress'.split(','), function (event) {
           return event + '.dialog-overlay';
       }).join(' ');
    }
};
// end _init


// extend open function
var _open = $.ui.dialog.prototype.open;
$.ui.dialog.prototype.open = function () {
    var self = this;


    if ($.rs) {
        $.rs.lockBody();
    }

    //Если ширина задана в процентах
    self.optionWidth = self.element.dialog('option', 'width') + "";
    self.oParentWidth = self.element.parent().outerWidth();
    self.isPercentWidth = self.optionWidth.indexOf('%') > -1;

    // get dialog original size on open
    self.oHeight = Math.max(parseInt(self.element.dialog('option', 'height')), self.element.parent().outerHeight());
    self.isTouch = $("html").hasClass("touch");

    // responsive width & height
    var resize = function () {
        // check if responsive
        // dependent on modernizr for device detection / html.touch
        if (self.options.responsive === true || (self.options.responsive === "touch" && self.isTouch)) {

            //Перерасчитываем максимально возможную ширину экрана
            if (self.isPercentWidth ) {
                var calculatedWidth = parseInt(self.optionWidth)/100 * $(window).width();
            } else {
                var calculatedWidth = self.optionWidth;
            }
            self.oWidth = Math.max(parseInt( calculatedWidth ), self.oParentWidth);

            var elem = self.element,
                wHeight = $(window).height(),
                wWidth = $(window).width(),
                dHeight = elem.parent().outerHeight(),
                dWidth = elem.parent().outerWidth(),
                setHeight = Math.min(wHeight * self.options.scaleH, self.oHeight),
                setWidth = Math.min(wWidth * self.options.scaleW, self.oWidth);

            // check & set height
            if ((self.oHeight + 100) > wHeight || elem.hasClass("resizedH")) {
                elem.dialog("option", "height", setHeight).parent().css("max-height", setHeight);
                elem.addClass("resizedH");
            }

            // check & set width
            if ((self.oWidth + 100) > wWidth || elem.hasClass("resizedW")) {
                elem.dialog("option", "width", setWidth).parent().css("max-width", setWidth);
                elem.addClass("resizedW");
            }

            // only recenter & add overflow if dialog has been resized
            if (elem.hasClass("resizedH") || elem.hasClass("resizedW")) {
                elem.dialog("option", "position", {my: "center", at: "center", of: window});
                elem.css("overflow", "auto");
            }
        }

        // add webkit scrolling to all dialogs for touch devices
        if (self.isTouch) {
            elem.css("-webkit-overflow-scrolling", "touch");
        }
    };

    // call resize()
    resize();

    // resize on window resize
    $(window).on("resize", resize);

    self.element.on('dialogclose', function() {
        $(window).off("resize", resize);
    });

    // resize on orientation change
     if (window.addEventListener) {  // Add extra condition because IE8 doesn't support addEventListener (or orientationchange)
        window.addEventListener("orientationchange", function () {
            resize();
        });
    }

    // hide titlebar
    if (!self.options.showTitleBar) {
        self.uiDialogTitlebar.css({
            "height": 0,
            "padding": 0,
            "background": "none",
            "border": 0
        });
        self.uiDialogTitlebar.find(".ui-dialog-title").css("display", "none");
    }

    //hide close button
    if (!self.options.showCloseButton) {
        self.uiDialogTitlebar.find(".ui-dialog-titlebar-close").css("display", "none");
    }

    // close on clickOut
    if (self.options.clickOut && !self.options.modal) {
        // use transparent div - simplest approach (rework)
        $('<div id="dialog-overlay"></div>').insertBefore(self.element.parent());
        $('#dialog-overlay').css({
            "position": "fixed",
            "top": 0,
            "right": 0,
            "bottom": 0,
            "left": 0,
            "background-color": "transparent"
        });
        $('#dialog-overlay').click(function (e) {
            e.preventDefault();
            e.stopPropagation();
            self.close();
        });
        // else close on modal click
    } else if (self.options.clickOut && self.options.modal) {
        $('.ui-widget-overlay').click(function (e) {
            self.close();
        });
    }

    // add dialogClass to overlay
    if (self.options.dialogClass) {
        $('.ui-widget-overlay').addClass(self.options.dialogClass);
    }

    // apply original arguments
    _open.apply(this, arguments);
};
//end open


// extend close function
var _close = $.ui.dialog.prototype.close;
$.ui.dialog.prototype.close = function () {
    var self = this;

    // apply original arguments
    _close.apply(this, arguments);

    if ($.rs && $('.ui-widget-overlay').length == 0) {
        $.rs.unlockBody();
    }

    // remove dialogClass to overlay
    if (self.options.dialogClass) {
        $('.ui-widget-overlay').removeClass(self.options.dialogClass);
    }
    //remove clickOut overlay
    if ($("#dialog-overlay").length) {
        $("#dialog-overlay").remove();
    }
};
//end close

var _destroy = $.ui.dialog.prototype._destroy;
$.ui.dialog.prototype._destroy = function () {
    var element = this.element;
    this.options.beforeDestroy.apply(element);
    _destroy.apply(this, arguments);
    this.options.afterDestroy.apply(element);
};

var _setOption = $.ui.dialog.prototype._setOption;
$.ui.dialog.prototype._setOption = function (key, value) {
    if (key == 'originalWidth') {
        this.oWidth = parseInt(value);
    }
    if (key == 'originalHeight') {
        this.oHeight = parseInt(value);
    }
    _setOption.apply(this, arguments);
};

//Fix для TinyMCE
var _allowInteraction = $.ui.dialog.prototype._allowInteraction;
$.ui.dialog.prototype._allowInteraction = function( event ) {
    if ($(event.target).closest(".mce-window").length) {
        event.stopPropagation();
        return true;
    } else {
        return _allowInteraction.apply(this, arguments);
    }
};

//Разрешаем использовать html в title диалоговых окон
$.ui.dialog.prototype._title = function(title) {
    if (!this.options.title ) {
        title.html("&#160;");
    } else {
        title.html(this.options.title);
    }
};
/*!
 * Bootstrap v3.3.5 (http://getbootstrap.com)
 * Copyright 2011-2015 Twitter, Inc.
 * Licensed under the MIT license
 */
if("undefined"==typeof jQuery)throw new Error("Bootstrap's JavaScript requires jQuery");+function(a){"use strict";var b=a.fn.jquery.split(" ")[0].split(".");if(b[0]<2&&b[1]<9||1==b[0]&&9==b[1]&&b[2]<1)throw new Error("Bootstrap's JavaScript requires jQuery version 1.9.1 or higher")}(jQuery),+function(a){"use strict";function b(){var a=document.createElement("bootstrap"),b={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(var c in b)if(void 0!==a.style[c])return{end:b[c]};return!1}a.fn.emulateTransitionEnd=function(b){var c=!1,d=this;a(this).one("bsTransitionEnd",function(){c=!0});var e=function(){c||a(d).trigger(a.support.transition.end)};return setTimeout(e,b),this},a(function(){a.support.transition=b(),a.support.transition&&(a.event.special.bsTransitionEnd={bindType:a.support.transition.end,delegateType:a.support.transition.end,handle:function(b){return a(b.target).is(this)?b.handleObj.handler.apply(this,arguments):void 0}})})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var c=a(this),e=c.data("bs.alert");e||c.data("bs.alert",e=new d(this)),"string"==typeof b&&e[b].call(c)})}var c='[data-dismiss="alert"]',d=function(b){a(b).on("click",c,this.close)};d.VERSION="3.3.5",d.TRANSITION_DURATION=150,d.prototype.close=function(b){function c(){g.detach().trigger("closed.bs.alert").remove()}var e=a(this),f=e.attr("data-target");f||(f=e.attr("href"),f=f&&f.replace(/.*(?=#[^\s]*$)/,""));var g=a(f);b&&b.preventDefault(),g.length||(g=e.closest(".alert")),g.trigger(b=a.Event("close.bs.alert")),b.isDefaultPrevented()||(g.removeClass("in"),a.support.transition&&g.hasClass("fade")?g.one("bsTransitionEnd",c).emulateTransitionEnd(d.TRANSITION_DURATION):c())};var e=a.fn.alert;a.fn.alert=b,a.fn.alert.Constructor=d,a.fn.alert.noConflict=function(){return a.fn.alert=e,this},a(document).on("click.bs.alert.data-api",c,d.prototype.close)}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.button"),f="object"==typeof b&&b;e||d.data("bs.button",e=new c(this,f)),"toggle"==b?e.toggle():b&&e.setState(b)})}var c=function(b,d){this.$element=a(b),this.options=a.extend({},c.DEFAULTS,d),this.isLoading=!1};c.VERSION="3.3.5",c.DEFAULTS={loadingText:"loading..."},c.prototype.setState=function(b){var c="disabled",d=this.$element,e=d.is("input")?"val":"html",f=d.data();b+="Text",null==f.resetText&&d.data("resetText",d[e]()),setTimeout(a.proxy(function(){d[e](null==f[b]?this.options[b]:f[b]),"loadingText"==b?(this.isLoading=!0,d.addClass(c).attr(c,c)):this.isLoading&&(this.isLoading=!1,d.removeClass(c).removeAttr(c))},this),0)},c.prototype.toggle=function(){var a=!0,b=this.$element.closest('[data-toggle="buttons"]');if(b.length){var c=this.$element.find("input");"radio"==c.prop("type")?(c.prop("checked")&&(a=!1),b.find(".active").removeClass("active"),this.$element.addClass("active")):"checkbox"==c.prop("type")&&(c.prop("checked")!==this.$element.hasClass("active")&&(a=!1),this.$element.toggleClass("active")),c.prop("checked",this.$element.hasClass("active")),a&&c.trigger("change")}else this.$element.attr("aria-pressed",!this.$element.hasClass("active")),this.$element.toggleClass("active")};var d=a.fn.button;a.fn.button=b,a.fn.button.Constructor=c,a.fn.button.noConflict=function(){return a.fn.button=d,this},a(document).on("click.bs.button.data-api",'[data-toggle^="button"]',function(c){var d=a(c.target);d.hasClass("btn")||(d=d.closest(".btn")),b.call(d,"toggle"),a(c.target).is('input[type="radio"]')||a(c.target).is('input[type="checkbox"]')||c.preventDefault()}).on("focus.bs.button.data-api blur.bs.button.data-api",'[data-toggle^="button"]',function(b){a(b.target).closest(".btn").toggleClass("focus",/^focus(in)?$/.test(b.type))})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.carousel"),f=a.extend({},c.DEFAULTS,d.data(),"object"==typeof b&&b),g="string"==typeof b?b:f.slide;e||d.data("bs.carousel",e=new c(this,f)),"number"==typeof b?e.to(b):g?e[g]():f.interval&&e.pause().cycle()})}var c=function(b,c){this.$element=a(b),this.$indicators=this.$element.find(".carousel-indicators"),this.options=c,this.paused=null,this.sliding=null,this.interval=null,this.$active=null,this.$items=null,this.options.keyboard&&this.$element.on("keydown.bs.carousel",a.proxy(this.keydown,this)),"hover"==this.options.pause&&!("ontouchstart"in document.documentElement)&&this.$element.on("mouseenter.bs.carousel",a.proxy(this.pause,this)).on("mouseleave.bs.carousel",a.proxy(this.cycle,this))};c.VERSION="3.3.5",c.TRANSITION_DURATION=600,c.DEFAULTS={interval:5e3,pause:"hover",wrap:!0,keyboard:!0},c.prototype.keydown=function(a){if(!/input|textarea/i.test(a.target.tagName)){switch(a.which){case 37:this.prev();break;case 39:this.next();break;default:return}a.preventDefault()}},c.prototype.cycle=function(b){return b||(this.paused=!1),this.interval&&clearInterval(this.interval),this.options.interval&&!this.paused&&(this.interval=setInterval(a.proxy(this.next,this),this.options.interval)),this},c.prototype.getItemIndex=function(a){return this.$items=a.parent().children(".item"),this.$items.index(a||this.$active)},c.prototype.getItemForDirection=function(a,b){var c=this.getItemIndex(b),d="prev"==a&&0===c||"next"==a&&c==this.$items.length-1;if(d&&!this.options.wrap)return b;var e="prev"==a?-1:1,f=(c+e)%this.$items.length;return this.$items.eq(f)},c.prototype.to=function(a){var b=this,c=this.getItemIndex(this.$active=this.$element.find(".item.active"));return a>this.$items.length-1||0>a?void 0:this.sliding?this.$element.one("slid.bs.carousel",function(){b.to(a)}):c==a?this.pause().cycle():this.slide(a>c?"next":"prev",this.$items.eq(a))},c.prototype.pause=function(b){return b||(this.paused=!0),this.$element.find(".next, .prev").length&&a.support.transition&&(this.$element.trigger(a.support.transition.end),this.cycle(!0)),this.interval=clearInterval(this.interval),this},c.prototype.next=function(){return this.sliding?void 0:this.slide("next")},c.prototype.prev=function(){return this.sliding?void 0:this.slide("prev")},c.prototype.slide=function(b,d){var e=this.$element.find(".item.active"),f=d||this.getItemForDirection(b,e),g=this.interval,h="next"==b?"left":"right",i=this;if(f.hasClass("active"))return this.sliding=!1;var j=f[0],k=a.Event("slide.bs.carousel",{relatedTarget:j,direction:h});if(this.$element.trigger(k),!k.isDefaultPrevented()){if(this.sliding=!0,g&&this.pause(),this.$indicators.length){this.$indicators.find(".active").removeClass("active");var l=a(this.$indicators.children()[this.getItemIndex(f)]);l&&l.addClass("active")}var m=a.Event("slid.bs.carousel",{relatedTarget:j,direction:h});return a.support.transition&&this.$element.hasClass("slide")?(f.addClass(b),f[0].offsetWidth,e.addClass(h),f.addClass(h),e.one("bsTransitionEnd",function(){f.removeClass([b,h].join(" ")).addClass("active"),e.removeClass(["active",h].join(" ")),i.sliding=!1,setTimeout(function(){i.$element.trigger(m)},0)}).emulateTransitionEnd(c.TRANSITION_DURATION)):(e.removeClass("active"),f.addClass("active"),this.sliding=!1,this.$element.trigger(m)),g&&this.cycle(),this}};var d=a.fn.carousel;a.fn.carousel=b,a.fn.carousel.Constructor=c,a.fn.carousel.noConflict=function(){return a.fn.carousel=d,this};var e=function(c){var d,e=a(this),f=a(e.attr("data-target")||(d=e.attr("href"))&&d.replace(/.*(?=#[^\s]+$)/,""));if(f.hasClass("carousel")){var g=a.extend({},f.data(),e.data()),h=e.attr("data-slide-to");h&&(g.interval=!1),b.call(f,g),h&&f.data("bs.carousel").to(h),c.preventDefault()}};a(document).on("click.bs.carousel.data-api","[data-slide]",e).on("click.bs.carousel.data-api","[data-slide-to]",e),a(window).on("load",function(){a('[data-ride="carousel"]').each(function(){var c=a(this);b.call(c,c.data())})})}(jQuery),+function(a){"use strict";function b(b){var c,d=b.attr("data-target")||(c=b.attr("href"))&&c.replace(/.*(?=#[^\s]+$)/,"");return a(d)}function c(b){return this.each(function(){var c=a(this),e=c.data("bs.collapse"),f=a.extend({},d.DEFAULTS,c.data(),"object"==typeof b&&b);!e&&f.toggle&&/show|hide/.test(b)&&(f.toggle=!1),e||c.data("bs.collapse",e=new d(this,f)),"string"==typeof b&&e[b]()})}var d=function(b,c){this.$element=a(b),this.options=a.extend({},d.DEFAULTS,c),this.$trigger=a('[data-toggle="collapse"][href="#'+b.id+'"],[data-toggle="collapse"][data-target="#'+b.id+'"]'),this.transitioning=null,this.options.parent?this.$parent=this.getParent():this.addAriaAndCollapsedClass(this.$element,this.$trigger),this.options.toggle&&this.toggle()};d.VERSION="3.3.5",d.TRANSITION_DURATION=350,d.DEFAULTS={toggle:!0},d.prototype.dimension=function(){var a=this.$element.hasClass("width");return a?"width":"height"},d.prototype.show=function(){if(!this.transitioning&&!this.$element.hasClass("in")){var b,e=this.$parent&&this.$parent.children(".panel").children(".in, .collapsing");if(!(e&&e.length&&(b=e.data("bs.collapse"),b&&b.transitioning))){var f=a.Event("show.bs.collapse");if(this.$element.trigger(f),!f.isDefaultPrevented()){e&&e.length&&(c.call(e,"hide"),b||e.data("bs.collapse",null));var g=this.dimension();this.$element.removeClass("collapse").addClass("collapsing")[g](0).attr("aria-expanded",!0),this.$trigger.removeClass("collapsed").attr("aria-expanded",!0),this.transitioning=1;var h=function(){this.$element.removeClass("collapsing").addClass("collapse in")[g](""),this.transitioning=0,this.$element.trigger("shown.bs.collapse")};if(!a.support.transition)return h.call(this);var i=a.camelCase(["scroll",g].join("-"));this.$element.one("bsTransitionEnd",a.proxy(h,this)).emulateTransitionEnd(d.TRANSITION_DURATION)[g](this.$element[0][i])}}}},d.prototype.hide=function(){if(!this.transitioning&&this.$element.hasClass("in")){var b=a.Event("hide.bs.collapse");if(this.$element.trigger(b),!b.isDefaultPrevented()){var c=this.dimension();this.$element[c](this.$element[c]())[0].offsetHeight,this.$element.addClass("collapsing").removeClass("collapse in").attr("aria-expanded",!1),this.$trigger.addClass("collapsed").attr("aria-expanded",!1),this.transitioning=1;var e=function(){this.transitioning=0,this.$element.removeClass("collapsing").addClass("collapse").trigger("hidden.bs.collapse")};return a.support.transition?void this.$element[c](0).one("bsTransitionEnd",a.proxy(e,this)).emulateTransitionEnd(d.TRANSITION_DURATION):e.call(this)}}},d.prototype.toggle=function(){this[this.$element.hasClass("in")?"hide":"show"]()},d.prototype.getParent=function(){return a(this.options.parent).find('[data-toggle="collapse"][data-parent="'+this.options.parent+'"]').each(a.proxy(function(c,d){var e=a(d);this.addAriaAndCollapsedClass(b(e),e)},this)).end()},d.prototype.addAriaAndCollapsedClass=function(a,b){var c=a.hasClass("in");a.attr("aria-expanded",c),b.toggleClass("collapsed",!c).attr("aria-expanded",c)};var e=a.fn.collapse;a.fn.collapse=c,a.fn.collapse.Constructor=d,a.fn.collapse.noConflict=function(){return a.fn.collapse=e,this},a(document).on("click.bs.collapse.data-api",'[data-toggle="collapse"]',function(d){var e=a(this);e.attr("data-target")||d.preventDefault();var f=b(e),g=f.data("bs.collapse"),h=g?"toggle":e.data();c.call(f,h)})}(jQuery),+function(a){"use strict";function b(b){var c=b.attr("data-target");c||(c=b.attr("href"),c=c&&/#[A-Za-z]/.test(c)&&c.replace(/.*(?=#[^\s]*$)/,""));var d=c&&a(c);return d&&d.length?d:b.parent()}function c(c){c&&3===c.which||(a(e).remove(),a(f).each(function(){var d=a(this),e=b(d),f={relatedTarget:this};e.hasClass("open")&&(c&&"click"==c.type&&/input|textarea/i.test(c.target.tagName)&&a.contains(e[0],c.target)||(e.trigger(c=a.Event("hide.bs.dropdown",f)),c.isDefaultPrevented()||(d.attr("aria-expanded","false"),e.removeClass("open").trigger("hidden.bs.dropdown",f))))}))}function d(b){return this.each(function(){var c=a(this),d=c.data("bs.dropdown");d||c.data("bs.dropdown",d=new g(this)),"string"==typeof b&&d[b].call(c)})}var e=".dropdown-backdrop",f='[data-toggle="dropdown"]',g=function(b){a(b).on("click.bs.dropdown",this.toggle)};g.VERSION="3.3.5",g.prototype.toggle=function(d){var e=a(this);if(!e.is(".disabled, :disabled")){var f=b(e),g=f.hasClass("open");if(c(),!g){"ontouchstart"in document.documentElement&&!f.closest(".navbar-nav").length&&a(document.createElement("div")).addClass("dropdown-backdrop").insertAfter(a(this)).on("click",c);var h={relatedTarget:this};if(f.trigger(d=a.Event("show.bs.dropdown",h)),d.isDefaultPrevented())return;e.trigger("focus").attr("aria-expanded","true"),f.toggleClass("open").trigger("shown.bs.dropdown",h)}return!1}},g.prototype.keydown=function(c){if(/(38|40|27|32)/.test(c.which)&&!/input|textarea/i.test(c.target.tagName)){var d=a(this);if(c.preventDefault(),c.stopPropagation(),!d.is(".disabled, :disabled")){var e=b(d),g=e.hasClass("open");if(!g&&27!=c.which||g&&27==c.which)return 27==c.which&&e.find(f).trigger("focus"),d.trigger("click");var h=" li:not(.disabled):visible a",i=e.find(".dropdown-menu"+h);if(i.length){var j=i.index(c.target);38==c.which&&j>0&&j--,40==c.which&&j<i.length-1&&j++,~j||(j=0),i.eq(j).trigger("focus")}}}};var h=a.fn.dropdown;a.fn.dropdown=d,a.fn.dropdown.Constructor=g,a.fn.dropdown.noConflict=function(){return a.fn.dropdown=h,this},a(document).on("click.bs.dropdown.data-api",c).on("click.bs.dropdown.data-api",".dropdown form",function(a){a.stopPropagation()}).on("click.bs.dropdown.data-api",f,g.prototype.toggle).on("keydown.bs.dropdown.data-api",f,g.prototype.keydown).on("keydown.bs.dropdown.data-api",".dropdown-menu",g.prototype.keydown)}(jQuery),+function(a){"use strict";function b(b,d){return this.each(function(){var e=a(this),f=e.data("bs.modal"),g=a.extend({},c.DEFAULTS,e.data(),"object"==typeof b&&b);f||e.data("bs.modal",f=new c(this,g)),"string"==typeof b?f[b](d):g.show&&f.show(d)})}var c=function(b,c){this.options=c,this.$body=a(document.body),this.$element=a(b),this.$dialog=this.$element.find(".modal-dialog"),this.$backdrop=null,this.isShown=null,this.originalBodyPad=null,this.scrollbarWidth=0,this.ignoreBackdropClick=!1,this.options.remote&&this.$element.find(".modal-content").load(this.options.remote,a.proxy(function(){this.$element.trigger("loaded.bs.modal")},this))};c.VERSION="3.3.5",c.TRANSITION_DURATION=300,c.BACKDROP_TRANSITION_DURATION=150,c.DEFAULTS={backdrop:!0,keyboard:!0,show:!0},c.prototype.toggle=function(a){return this.isShown?this.hide():this.show(a)},c.prototype.show=function(b){var d=this,e=a.Event("show.bs.modal",{relatedTarget:b});this.$element.trigger(e),this.isShown||e.isDefaultPrevented()||(this.isShown=!0,this.checkScrollbar(),this.setScrollbar(),this.$body.addClass("modal-open"),this.escape(),this.resize(),this.$element.on("click.dismiss.bs.modal",'[data-dismiss="modal"]',a.proxy(this.hide,this)),this.$dialog.on("mousedown.dismiss.bs.modal",function(){d.$element.one("mouseup.dismiss.bs.modal",function(b){a(b.target).is(d.$element)&&(d.ignoreBackdropClick=!0)})}),this.backdrop(function(){var e=a.support.transition&&d.$element.hasClass("fade");d.$element.parent().length||d.$element.appendTo(d.$body),d.$element.show().scrollTop(0),d.adjustDialog(),e&&d.$element[0].offsetWidth,d.$element.addClass("in"),d.enforceFocus();var f=a.Event("shown.bs.modal",{relatedTarget:b});e?d.$dialog.one("bsTransitionEnd",function(){d.$element.trigger("focus").trigger(f)}).emulateTransitionEnd(c.TRANSITION_DURATION):d.$element.trigger("focus").trigger(f)}))},c.prototype.hide=function(b){b&&b.preventDefault(),b=a.Event("hide.bs.modal"),this.$element.trigger(b),this.isShown&&!b.isDefaultPrevented()&&(this.isShown=!1,this.escape(),this.resize(),a(document).off("focusin.bs.modal"),this.$element.removeClass("in").off("click.dismiss.bs.modal").off("mouseup.dismiss.bs.modal"),this.$dialog.off("mousedown.dismiss.bs.modal"),a.support.transition&&this.$element.hasClass("fade")?this.$element.one("bsTransitionEnd",a.proxy(this.hideModal,this)).emulateTransitionEnd(c.TRANSITION_DURATION):this.hideModal())},c.prototype.enforceFocus=function(){a(document).off("focusin.bs.modal").on("focusin.bs.modal",a.proxy(function(a){this.$element[0]===a.target||this.$element.has(a.target).length||this.$element.trigger("focus")},this))},c.prototype.escape=function(){this.isShown&&this.options.keyboard?this.$element.on("keydown.dismiss.bs.modal",a.proxy(function(a){27==a.which&&this.hide()},this)):this.isShown||this.$element.off("keydown.dismiss.bs.modal")},c.prototype.resize=function(){this.isShown?a(window).on("resize.bs.modal",a.proxy(this.handleUpdate,this)):a(window).off("resize.bs.modal")},c.prototype.hideModal=function(){var a=this;this.$element.hide(),this.backdrop(function(){a.$body.removeClass("modal-open"),a.resetAdjustments(),a.resetScrollbar(),a.$element.trigger("hidden.bs.modal")})},c.prototype.removeBackdrop=function(){this.$backdrop&&this.$backdrop.remove(),this.$backdrop=null},c.prototype.backdrop=function(b){var d=this,e=this.$element.hasClass("fade")?"fade":"";if(this.isShown&&this.options.backdrop){var f=a.support.transition&&e;if(this.$backdrop=a(document.createElement("div")).addClass("modal-backdrop "+e).appendTo(this.$body),this.$element.on("click.dismiss.bs.modal",a.proxy(function(a){return this.ignoreBackdropClick?void(this.ignoreBackdropClick=!1):void(a.target===a.currentTarget&&("static"==this.options.backdrop?this.$element[0].focus():this.hide()))},this)),f&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in"),!b)return;f?this.$backdrop.one("bsTransitionEnd",b).emulateTransitionEnd(c.BACKDROP_TRANSITION_DURATION):b()}else if(!this.isShown&&this.$backdrop){this.$backdrop.removeClass("in");var g=function(){d.removeBackdrop(),b&&b()};a.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one("bsTransitionEnd",g).emulateTransitionEnd(c.BACKDROP_TRANSITION_DURATION):g()}else b&&b()},c.prototype.handleUpdate=function(){this.adjustDialog()},c.prototype.adjustDialog=function(){var a=this.$element[0].scrollHeight>document.documentElement.clientHeight;this.$element.css({paddingLeft:!this.bodyIsOverflowing&&a?this.scrollbarWidth:"",paddingRight:this.bodyIsOverflowing&&!a?this.scrollbarWidth:""})},c.prototype.resetAdjustments=function(){this.$element.css({paddingLeft:"",paddingRight:""})},c.prototype.checkScrollbar=function(){var a=window.innerWidth;if(!a){var b=document.documentElement.getBoundingClientRect();a=b.right-Math.abs(b.left)}this.bodyIsOverflowing=document.body.clientWidth<a,this.scrollbarWidth=this.measureScrollbar()},c.prototype.setScrollbar=function(){var a=parseInt(this.$body.css("padding-right")||0,10);this.originalBodyPad=document.body.style.paddingRight||"",this.bodyIsOverflowing&&this.$body.css("padding-right",a+this.scrollbarWidth)},c.prototype.resetScrollbar=function(){this.$body.css("padding-right",this.originalBodyPad)},c.prototype.measureScrollbar=function(){var a=document.createElement("div");a.className="modal-scrollbar-measure",this.$body.append(a);var b=a.offsetWidth-a.clientWidth;return this.$body[0].removeChild(a),b};var d=a.fn.modal;a.fn.modal=b,a.fn.modal.Constructor=c,a.fn.modal.noConflict=function(){return a.fn.modal=d,this},a(document).on("click.bs.modal.data-api",'[data-toggle="modal"]',function(c){var d=a(this),e=d.attr("href"),f=a(d.attr("data-target")||e&&e.replace(/.*(?=#[^\s]+$)/,"")),g=f.data("bs.modal")?"toggle":a.extend({remote:!/#/.test(e)&&e},f.data(),d.data());d.is("a")&&c.preventDefault(),f.one("show.bs.modal",function(a){a.isDefaultPrevented()||f.one("hidden.bs.modal",function(){d.is(":visible")&&d.trigger("focus")})}),b.call(f,g,this)})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.tooltip"),f="object"==typeof b&&b;(e||!/destroy|hide/.test(b))&&(e||d.data("bs.tooltip",e=new c(this,f)),"string"==typeof b&&e[b]())})}var c=function(a,b){this.type=null,this.options=null,this.enabled=null,this.timeout=null,this.hoverState=null,this.$element=null,this.inState=null,this.init("tooltip",a,b)};c.VERSION="3.3.5",c.TRANSITION_DURATION=150,c.DEFAULTS={animation:!0,placement:"top",selector:!1,template:'<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',trigger:"hover focus",title:"",delay:0,html:!1,container:!1,viewport:{selector:"body",padding:0}},c.prototype.init=function(b,c,d){if(this.enabled=!0,this.type=b,this.$element=a(c),this.options=this.getOptions(d),this.$viewport=this.options.viewport&&a(a.isFunction(this.options.viewport)?this.options.viewport.call(this,this.$element):this.options.viewport.selector||this.options.viewport),this.inState={click:!1,hover:!1,focus:!1},this.$element[0]instanceof document.constructor&&!this.options.selector)throw new Error("`selector` option must be specified when initializing "+this.type+" on the window.document object!");for(var e=this.options.trigger.split(" "),f=e.length;f--;){var g=e[f];if("click"==g)this.$element.on("click."+this.type,this.options.selector,a.proxy(this.toggle,this));else if("manual"!=g){var h="hover"==g?"mouseenter":"focusin",i="hover"==g?"mouseleave":"focusout";this.$element.on(h+"."+this.type,this.options.selector,a.proxy(this.enter,this)),this.$element.on(i+"."+this.type,this.options.selector,a.proxy(this.leave,this))}}this.options.selector?this._options=a.extend({},this.options,{trigger:"manual",selector:""}):this.fixTitle()},c.prototype.getDefaults=function(){return c.DEFAULTS},c.prototype.getOptions=function(b){return b=a.extend({},this.getDefaults(),this.$element.data(),b),b.delay&&"number"==typeof b.delay&&(b.delay={show:b.delay,hide:b.delay}),b},c.prototype.getDelegateOptions=function(){var b={},c=this.getDefaults();return this._options&&a.each(this._options,function(a,d){c[a]!=d&&(b[a]=d)}),b},c.prototype.enter=function(b){var c=b instanceof this.constructor?b:a(b.currentTarget).data("bs."+this.type);return c||(c=new this.constructor(b.currentTarget,this.getDelegateOptions()),a(b.currentTarget).data("bs."+this.type,c)),b instanceof a.Event&&(c.inState["focusin"==b.type?"focus":"hover"]=!0),c.tip().hasClass("in")||"in"==c.hoverState?void(c.hoverState="in"):(clearTimeout(c.timeout),c.hoverState="in",c.options.delay&&c.options.delay.show?void(c.timeout=setTimeout(function(){"in"==c.hoverState&&c.show()},c.options.delay.show)):c.show())},c.prototype.isInStateTrue=function(){for(var a in this.inState)if(this.inState[a])return!0;return!1},c.prototype.leave=function(b){var c=b instanceof this.constructor?b:a(b.currentTarget).data("bs."+this.type);return c||(c=new this.constructor(b.currentTarget,this.getDelegateOptions()),a(b.currentTarget).data("bs."+this.type,c)),b instanceof a.Event&&(c.inState["focusout"==b.type?"focus":"hover"]=!1),c.isInStateTrue()?void 0:(clearTimeout(c.timeout),c.hoverState="out",c.options.delay&&c.options.delay.hide?void(c.timeout=setTimeout(function(){"out"==c.hoverState&&c.hide()},c.options.delay.hide)):c.hide())},c.prototype.show=function(){var b=a.Event("show.bs."+this.type);if(this.hasContent()&&this.enabled){this.$element.trigger(b);var d=a.contains(this.$element[0].ownerDocument.documentElement,this.$element[0]);if(b.isDefaultPrevented()||!d)return;var e=this,f=this.tip(),g=this.getUID(this.type);this.setContent(),f.attr("id",g),this.$element.attr("aria-describedby",g),this.options.animation&&f.addClass("fade");var h="function"==typeof this.options.placement?this.options.placement.call(this,f[0],this.$element[0]):this.options.placement,i=/\s?auto?\s?/i,j=i.test(h);j&&(h=h.replace(i,"")||"top"),f.detach().css({top:0,left:0,display:"block"}).addClass(h).data("bs."+this.type,this),this.options.container?f.appendTo(this.options.container):f.insertAfter(this.$element),this.$element.trigger("inserted.bs."+this.type);var k=this.getPosition(),l=f[0].offsetWidth,m=f[0].offsetHeight;if(j){var n=h,o=this.getPosition(this.$viewport);h="bottom"==h&&k.bottom+m>o.bottom?"top":"top"==h&&k.top-m<o.top?"bottom":"right"==h&&k.right+l>o.width?"left":"left"==h&&k.left-l<o.left?"right":h,f.removeClass(n).addClass(h)}var p=this.getCalculatedOffset(h,k,l,m);this.applyPlacement(p,h);var q=function(){var a=e.hoverState;e.$element.trigger("shown.bs."+e.type),e.hoverState=null,"out"==a&&e.leave(e)};a.support.transition&&this.$tip.hasClass("fade")?f.one("bsTransitionEnd",q).emulateTransitionEnd(c.TRANSITION_DURATION):q()}},c.prototype.applyPlacement=function(b,c){var d=this.tip(),e=d[0].offsetWidth,f=d[0].offsetHeight,g=parseInt(d.css("margin-top"),10),h=parseInt(d.css("margin-left"),10);isNaN(g)&&(g=0),isNaN(h)&&(h=0),b.top+=g,b.left+=h,a.offset.setOffset(d[0],a.extend({using:function(a){d.css({top:Math.round(a.top),left:Math.round(a.left)})}},b),0),d.addClass("in");var i=d[0].offsetWidth,j=d[0].offsetHeight;"top"==c&&j!=f&&(b.top=b.top+f-j);var k=this.getViewportAdjustedDelta(c,b,i,j);k.left?b.left+=k.left:b.top+=k.top;var l=/top|bottom/.test(c),m=l?2*k.left-e+i:2*k.top-f+j,n=l?"offsetWidth":"offsetHeight";d.offset(b),this.replaceArrow(m,d[0][n],l)},c.prototype.replaceArrow=function(a,b,c){this.arrow().css(c?"left":"top",50*(1-a/b)+"%").css(c?"top":"left","")},c.prototype.setContent=function(){var a=this.tip(),b=this.getTitle();a.find(".tooltip-inner")[this.options.html?"html":"text"](b),a.removeClass("fade in top bottom left right")},c.prototype.hide=function(b){function d(){"in"!=e.hoverState&&f.detach(),e.$element.removeAttr("aria-describedby").trigger("hidden.bs."+e.type),b&&b()}var e=this,f=a(this.$tip),g=a.Event("hide.bs."+this.type);return this.$element.trigger(g),g.isDefaultPrevented()?void 0:(f.removeClass("in"),a.support.transition&&f.hasClass("fade")?f.one("bsTransitionEnd",d).emulateTransitionEnd(c.TRANSITION_DURATION):d(),this.hoverState=null,this)},c.prototype.fixTitle=function(){var a=this.$element;(a.attr("title")||"string"!=typeof a.attr("data-original-title"))&&a.attr("data-original-title",a.attr("title")||"").attr("title","")},c.prototype.hasContent=function(){return this.getTitle()},c.prototype.getPosition=function(b){b=b||this.$element;var c=b[0],d="BODY"==c.tagName,e=c.getBoundingClientRect();null==e.width&&(e=a.extend({},e,{width:e.right-e.left,height:e.bottom-e.top}));var f=d?{top:0,left:0}:b.offset(),g={scroll:d?document.documentElement.scrollTop||document.body.scrollTop:b.scrollTop()},h=d?{width:a(window).width(),height:a(window).height()}:null;return a.extend({},e,g,h,f)},c.prototype.getCalculatedOffset=function(a,b,c,d){return"bottom"==a?{top:b.top+b.height,left:b.left+b.width/2-c/2}:"top"==a?{top:b.top-d,left:b.left+b.width/2-c/2}:"left"==a?{top:b.top+b.height/2-d/2,left:b.left-c}:{top:b.top+b.height/2-d/2,left:b.left+b.width}},c.prototype.getViewportAdjustedDelta=function(a,b,c,d){var e={top:0,left:0};if(!this.$viewport)return e;var f=this.options.viewport&&this.options.viewport.padding||0,g=this.getPosition(this.$viewport);if(/right|left/.test(a)){var h=b.top-f-g.scroll,i=b.top+f-g.scroll+d;h<g.top?e.top=g.top-h:i>g.top+g.height&&(e.top=g.top+g.height-i)}else{var j=b.left-f,k=b.left+f+c;j<g.left?e.left=g.left-j:k>g.right&&(e.left=g.left+g.width-k)}return e},c.prototype.getTitle=function(){var a,b=this.$element,c=this.options;return a=b.attr("data-original-title")||("function"==typeof c.title?c.title.call(b[0]):c.title)},c.prototype.getUID=function(a){do a+=~~(1e6*Math.random());while(document.getElementById(a));return a},c.prototype.tip=function(){if(!this.$tip&&(this.$tip=a(this.options.template),1!=this.$tip.length))throw new Error(this.type+" `template` option must consist of exactly 1 top-level element!");return this.$tip},c.prototype.arrow=function(){return this.$arrow=this.$arrow||this.tip().find(".tooltip-arrow")},c.prototype.enable=function(){this.enabled=!0},c.prototype.disable=function(){this.enabled=!1},c.prototype.toggleEnabled=function(){this.enabled=!this.enabled},c.prototype.toggle=function(b){var c=this;b&&(c=a(b.currentTarget).data("bs."+this.type),c||(c=new this.constructor(b.currentTarget,this.getDelegateOptions()),a(b.currentTarget).data("bs."+this.type,c))),b?(c.inState.click=!c.inState.click,c.isInStateTrue()?c.enter(c):c.leave(c)):c.tip().hasClass("in")?c.leave(c):c.enter(c)},c.prototype.destroy=function(){var a=this;clearTimeout(this.timeout),this.hide(function(){a.$element.off("."+a.type).removeData("bs."+a.type),a.$tip&&a.$tip.detach(),a.$tip=null,a.$arrow=null,a.$viewport=null})};var d=a.fn.tooltip;a.fn.tooltip=b,a.fn.tooltip.Constructor=c,a.fn.tooltip.noConflict=function(){return a.fn.tooltip=d,this}}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.popover"),f="object"==typeof b&&b;(e||!/destroy|hide/.test(b))&&(e||d.data("bs.popover",e=new c(this,f)),"string"==typeof b&&e[b]())})}var c=function(a,b){this.init("popover",a,b)};if(!a.fn.tooltip)throw new Error("Popover requires tooltip.js");c.VERSION="3.3.5",c.DEFAULTS=a.extend({},a.fn.tooltip.Constructor.DEFAULTS,{placement:"right",trigger:"click",content:"",template:'<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'}),c.prototype=a.extend({},a.fn.tooltip.Constructor.prototype),c.prototype.constructor=c,c.prototype.getDefaults=function(){return c.DEFAULTS},c.prototype.setContent=function(){var a=this.tip(),b=this.getTitle(),c=this.getContent();a.find(".popover-title")[this.options.html?"html":"text"](b),a.find(".popover-content").children().detach().end()[this.options.html?"string"==typeof c?"html":"append":"text"](c),a.removeClass("fade top bottom left right in"),a.find(".popover-title").html()||a.find(".popover-title").hide()},c.prototype.hasContent=function(){return this.getTitle()||this.getContent()},c.prototype.getContent=function(){var a=this.$element,b=this.options;return a.attr("data-content")||("function"==typeof b.content?b.content.call(a[0]):b.content)},c.prototype.arrow=function(){return this.$arrow=this.$arrow||this.tip().find(".arrow")};var d=a.fn.popover;a.fn.popover=b,a.fn.popover.Constructor=c,a.fn.popover.noConflict=function(){return a.fn.popover=d,this}}(jQuery),+function(a){"use strict";function b(c,d){this.$body=a(document.body),this.$scrollElement=a(a(c).is(document.body)?window:c),this.options=a.extend({},b.DEFAULTS,d),this.selector=(this.options.target||"")+" .nav li > a",this.offsets=[],this.targets=[],this.activeTarget=null,this.scrollHeight=0,this.$scrollElement.on("scroll.bs.scrollspy",a.proxy(this.process,this)),this.refresh(),this.process()}function c(c){return this.each(function(){var d=a(this),e=d.data("bs.scrollspy"),f="object"==typeof c&&c;e||d.data("bs.scrollspy",e=new b(this,f)),"string"==typeof c&&e[c]()})}b.VERSION="3.3.5",b.DEFAULTS={offset:10},b.prototype.getScrollHeight=function(){return this.$scrollElement[0].scrollHeight||Math.max(this.$body[0].scrollHeight,document.documentElement.scrollHeight)},b.prototype.refresh=function(){var b=this,c="offset",d=0;this.offsets=[],this.targets=[],this.scrollHeight=this.getScrollHeight(),a.isWindow(this.$scrollElement[0])||(c="position",d=this.$scrollElement.scrollTop()),this.$body.find(this.selector).map(function(){var b=a(this),e=b.data("target")||b.attr("href"),f=/^#./.test(e)&&a(e);return f&&f.length&&f.is(":visible")&&[[f[c]().top+d,e]]||null}).sort(function(a,b){return a[0]-b[0]}).each(function(){b.offsets.push(this[0]),b.targets.push(this[1])})},b.prototype.process=function(){var a,b=this.$scrollElement.scrollTop()+this.options.offset,c=this.getScrollHeight(),d=this.options.offset+c-this.$scrollElement.height(),e=this.offsets,f=this.targets,g=this.activeTarget;if(this.scrollHeight!=c&&this.refresh(),b>=d)return g!=(a=f[f.length-1])&&this.activate(a);if(g&&b<e[0])return this.activeTarget=null,this.clear();for(a=e.length;a--;)g!=f[a]&&b>=e[a]&&(void 0===e[a+1]||b<e[a+1])&&this.activate(f[a])},b.prototype.activate=function(b){this.activeTarget=b,this.clear();var c=this.selector+'[data-target="'+b+'"],'+this.selector+'[href="'+b+'"]',d=a(c).parents("li").addClass("active");d.parent(".dropdown-menu").length&&(d=d.closest("li.dropdown").addClass("active")),
d.trigger("activate.bs.scrollspy")},b.prototype.clear=function(){a(this.selector).parentsUntil(this.options.target,".active").removeClass("active")};var d=a.fn.scrollspy;a.fn.scrollspy=c,a.fn.scrollspy.Constructor=b,a.fn.scrollspy.noConflict=function(){return a.fn.scrollspy=d,this},a(window).on("load.bs.scrollspy.data-api",function(){a('[data-spy="scroll"]').each(function(){var b=a(this);c.call(b,b.data())})})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.tab");e||d.data("bs.tab",e=new c(this)),"string"==typeof b&&e[b]()})}var c=function(b){this.element=a(b)};c.VERSION="3.3.5",c.TRANSITION_DURATION=150,c.prototype.show=function(){var b=this.element,c=b.closest("ul:not(.dropdown-menu)"),d=b.data("target");if(d||(d=b.attr("href"),d=d&&d.replace(/.*(?=#[^\s]*$)/,"")),!b.parent("li").hasClass("active")){var e=c.find(".active:last a"),f=a.Event("hide.bs.tab",{relatedTarget:b[0]}),g=a.Event("show.bs.tab",{relatedTarget:e[0]});if(e.trigger(f),b.trigger(g),!g.isDefaultPrevented()&&!f.isDefaultPrevented()){var h=a(d);this.activate(b.closest("li"),c),this.activate(h,h.parent(),function(){e.trigger({type:"hidden.bs.tab",relatedTarget:b[0]}),b.trigger({type:"shown.bs.tab",relatedTarget:e[0]})})}}},c.prototype.activate=function(b,d,e){function f(){g.removeClass("active").find("> .dropdown-menu > .active").removeClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded",!1),b.addClass("active").find('[data-toggle="tab"]').attr("aria-expanded",!0),h?(b[0].offsetWidth,b.addClass("in")):b.removeClass("fade"),b.parent(".dropdown-menu").length&&b.closest("li.dropdown").addClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded",!0),e&&e()}var g=d.find("> .active"),h=e&&a.support.transition&&(g.length&&g.hasClass("fade")||!!d.find("> .fade").length);g.length&&h?g.one("bsTransitionEnd",f).emulateTransitionEnd(c.TRANSITION_DURATION):f(),g.removeClass("in")};var d=a.fn.tab;a.fn.tab=b,a.fn.tab.Constructor=c,a.fn.tab.noConflict=function(){return a.fn.tab=d,this};var e=function(c){c.preventDefault(),b.call(a(this),"show")};a(document).on("click.bs.tab.data-api",'[data-toggle="tab"]',e).on("click.bs.tab.data-api",'[data-toggle="pill"]',e)}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.affix"),f="object"==typeof b&&b;e||d.data("bs.affix",e=new c(this,f)),"string"==typeof b&&e[b]()})}var c=function(b,d){this.options=a.extend({},c.DEFAULTS,d),this.$target=a(this.options.target).on("scroll.bs.affix.data-api",a.proxy(this.checkPosition,this)).on("click.bs.affix.data-api",a.proxy(this.checkPositionWithEventLoop,this)),this.$element=a(b),this.affixed=null,this.unpin=null,this.pinnedOffset=null,this.checkPosition()};c.VERSION="3.3.5",c.RESET="affix affix-top affix-bottom",c.DEFAULTS={offset:0,target:window},c.prototype.getState=function(a,b,c,d){var e=this.$target.scrollTop(),f=this.$element.offset(),g=this.$target.height();if(null!=c&&"top"==this.affixed)return c>e?"top":!1;if("bottom"==this.affixed)return null!=c?e+this.unpin<=f.top?!1:"bottom":a-d>=e+g?!1:"bottom";var h=null==this.affixed,i=h?e:f.top,j=h?g:b;return null!=c&&c>=e?"top":null!=d&&i+j>=a-d?"bottom":!1},c.prototype.getPinnedOffset=function(){if(this.pinnedOffset)return this.pinnedOffset;this.$element.removeClass(c.RESET).addClass("affix");var a=this.$target.scrollTop(),b=this.$element.offset();return this.pinnedOffset=b.top-a},c.prototype.checkPositionWithEventLoop=function(){setTimeout(a.proxy(this.checkPosition,this),1)},c.prototype.checkPosition=function(){if(this.$element.is(":visible")){var b=this.$element.height(),d=this.options.offset,e=d.top,f=d.bottom,g=Math.max(a(document).height(),a(document.body).height());"object"!=typeof d&&(f=e=d),"function"==typeof e&&(e=d.top(this.$element)),"function"==typeof f&&(f=d.bottom(this.$element));var h=this.getState(g,b,e,f);if(this.affixed!=h){null!=this.unpin&&this.$element.css("top","");var i="affix"+(h?"-"+h:""),j=a.Event(i+".bs.affix");if(this.$element.trigger(j),j.isDefaultPrevented())return;this.affixed=h,this.unpin="bottom"==h?this.getPinnedOffset():null,this.$element.removeClass(c.RESET).addClass(i).trigger(i.replace("affix","affixed")+".bs.affix")}"bottom"==h&&this.$element.offset({top:g-b-f})}};var d=a.fn.affix;a.fn.affix=b,a.fn.affix.Constructor=c,a.fn.affix.noConflict=function(){return a.fn.affix=d,this},a(window).on("load",function(){a('[data-spy="affix"]').each(function(){var c=a(this),d=c.data();d.offset=d.offset||{},null!=d.offsetBottom&&(d.offset.bottom=d.offsetBottom),null!=d.offsetTop&&(d.offset.top=d.offsetTop),b.call(c,d)})})}(jQuery);
/* == jquery mousewheel plugin == Version: 3.1.12, License: MIT License (MIT) */
!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):"object"==typeof exports?module.exports=a:a(jQuery)}(function(a){function b(b){var g=b||window.event,h=i.call(arguments,1),j=0,l=0,m=0,n=0,o=0,p=0;if(b=a.event.fix(g),b.type="mousewheel","detail"in g&&(m=-1*g.detail),"wheelDelta"in g&&(m=g.wheelDelta),"wheelDeltaY"in g&&(m=g.wheelDeltaY),"wheelDeltaX"in g&&(l=-1*g.wheelDeltaX),"axis"in g&&g.axis===g.HORIZONTAL_AXIS&&(l=-1*m,m=0),j=0===m?l:m,"deltaY"in g&&(m=-1*g.deltaY,j=m),"deltaX"in g&&(l=g.deltaX,0===m&&(j=-1*l)),0!==m||0!==l){if(1===g.deltaMode){var q=a.data(this,"mousewheel-line-height");j*=q,m*=q,l*=q}else if(2===g.deltaMode){var r=a.data(this,"mousewheel-page-height");j*=r,m*=r,l*=r}if(n=Math.max(Math.abs(m),Math.abs(l)),(!f||f>n)&&(f=n,d(g,n)&&(f/=40)),d(g,n)&&(j/=40,l/=40,m/=40),j=Math[j>=1?"floor":"ceil"](j/f),l=Math[l>=1?"floor":"ceil"](l/f),m=Math[m>=1?"floor":"ceil"](m/f),k.settings.normalizeOffset&&this.getBoundingClientRect){var s=this.getBoundingClientRect();o=b.clientX-s.left,p=b.clientY-s.top}return b.deltaX=l,b.deltaY=m,b.deltaFactor=f,b.offsetX=o,b.offsetY=p,b.deltaMode=0,h.unshift(b,j,l,m),e&&clearTimeout(e),e=setTimeout(c,200),(a.event.dispatch||a.event.handle).apply(this,h)}}function c(){f=null}function d(a,b){return k.settings.adjustOldDeltas&&"mousewheel"===a.type&&b%120===0}var e,f,g=["wheel","mousewheel","DOMMouseScroll","MozMousePixelScroll"],h="onwheel"in document||document.documentMode>=9?["wheel"]:["mousewheel","DomMouseScroll","MozMousePixelScroll"],i=Array.prototype.slice;if(a.event.fixHooks)for(var j=g.length;j;)a.event.fixHooks[g[--j]]=a.event.mouseHooks;var k=a.event.special.mousewheel={version:"3.1.12",setup:function(){if(this.addEventListener)for(var c=h.length;c;)this.addEventListener(h[--c],b,!1);else this.onmousewheel=b;a.data(this,"mousewheel-line-height",k.getLineHeight(this)),a.data(this,"mousewheel-page-height",k.getPageHeight(this))},teardown:function(){if(this.removeEventListener)for(var c=h.length;c;)this.removeEventListener(h[--c],b,!1);else this.onmousewheel=null;a.removeData(this,"mousewheel-line-height"),a.removeData(this,"mousewheel-page-height")},getLineHeight:function(b){var c=a(b),d=c["offsetParent"in a.fn?"offsetParent":"parent"]();return d.length||(d=a("body")),parseInt(d.css("fontSize"),10)||parseInt(c.css("fontSize"),10)||16},getPageHeight:function(b){return a(b).height()},settings:{adjustOldDeltas:!0,normalizeOffset:!0}};a.fn.extend({mousewheel:function(a){return a?this.bind("mousewheel",a):this.trigger("mousewheel")},unmousewheel:function(a){return this.unbind("mousewheel",a)}})});
/* == malihu jquery custom scrollbar plugin == Version: 3.0.9, License: MIT License (MIT) */
!function(e){"undefined"!=typeof module&&module.exports?module.exports=e:e(jQuery,window,document)}(function(e){!function(t){var o="function"==typeof define&&define.amd,a="undefined"!=typeof module&&module.exports,n="https:"==document.location.protocol?"https:":"http:",i="cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.12/jquery.mousewheel.min.js";o||(a?require("jquery-mousewheel")(e):e.event.special.mousewheel||e("head").append(decodeURI("%3Cscript src="+n+"//"+i+"%3E%3C/script%3E"))),t()}(function(){var t,o="mCustomScrollbar",a="mCS",n=".mCustomScrollbar",i={setTop:0,setLeft:0,axis:"y",scrollbarPosition:"inside",scrollInertia:950,autoDraggerLength:!0,alwaysShowScrollbar:0,snapOffset:0,mouseWheel:{enable:!0,scrollAmount:"auto",axis:"y",deltaFactor:"auto",disableOver:["select","option","keygen","datalist","textarea"]},scrollButtons:{scrollType:"stepless",scrollAmount:"auto"},keyboard:{enable:!0,scrollType:"stepless",scrollAmount:"auto"},contentTouchScroll:25,advanced:{autoScrollOnFocus:"input,textarea,select,button,datalist,keygen,a[tabindex],area,object,[contenteditable='true']",updateOnContentResize:!0,updateOnImageLoad:!0,autoUpdateTimeout:60},theme:"light",callbacks:{onTotalScrollOffset:0,onTotalScrollBackOffset:0,alwaysTriggerOffsets:!0}},r=0,l={},s=window.attachEvent&&!window.addEventListener?1:0,c=!1,d=["mCSB_dragger_onDrag","mCSB_scrollTools_onDrag","mCS_img_loaded","mCS_disabled","mCS_destroyed","mCS_no_scrollbar","mCS-autoHide","mCS-dir-rtl","mCS_no_scrollbar_y","mCS_no_scrollbar_x","mCS_y_hidden","mCS_x_hidden","mCSB_draggerContainer","mCSB_buttonUp","mCSB_buttonDown","mCSB_buttonLeft","mCSB_buttonRight"],u={init:function(t){var t=e.extend(!0,{},i,t),o=f.call(this);if(t.live){var s=t.liveSelector||this.selector||n,c=e(s);if("off"===t.live)return void m(s);l[s]=setTimeout(function(){c.mCustomScrollbar(t),"once"===t.live&&c.length&&m(s)},500)}else m(s);return t.setWidth=t.set_width?t.set_width:t.setWidth,t.setHeight=t.set_height?t.set_height:t.setHeight,t.axis=t.horizontalScroll?"x":p(t.axis),t.scrollInertia=t.scrollInertia>0&&t.scrollInertia<17?17:t.scrollInertia,"object"!=typeof t.mouseWheel&&1==t.mouseWheel&&(t.mouseWheel={enable:!0,scrollAmount:"auto",axis:"y",preventDefault:!1,deltaFactor:"auto",normalizeDelta:!1,invert:!1}),t.mouseWheel.scrollAmount=t.mouseWheelPixels?t.mouseWheelPixels:t.mouseWheel.scrollAmount,t.mouseWheel.normalizeDelta=t.advanced.normalizeMouseWheelDelta?t.advanced.normalizeMouseWheelDelta:t.mouseWheel.normalizeDelta,t.scrollButtons.scrollType=g(t.scrollButtons.scrollType),h(t),e(o).each(function(){var o=e(this);if(!o.data(a)){o.data(a,{idx:++r,opt:t,scrollRatio:{y:null,x:null},overflowed:null,contentReset:{y:null,x:null},bindEvents:!1,tweenRunning:!1,sequential:{},langDir:o.css("direction"),cbOffsets:null,trigger:null});var n=o.data(a),i=n.opt,l=o.data("mcs-axis"),s=o.data("mcs-scrollbar-position"),c=o.data("mcs-theme");l&&(i.axis=l),s&&(i.scrollbarPosition=s),c&&(i.theme=c,h(i)),v.call(this),e("#mCSB_"+n.idx+"_container img:not(."+d[2]+")").addClass(d[2]),u.update.call(null,o)}})},update:function(t,o){var n=t||f.call(this);return e(n).each(function(){var t=e(this);if(t.data(a)){var n=t.data(a),i=n.opt,r=e("#mCSB_"+n.idx+"_container"),l=[e("#mCSB_"+n.idx+"_dragger_vertical"),e("#mCSB_"+n.idx+"_dragger_horizontal")];if(!r.length)return;n.tweenRunning&&V(t),t.hasClass(d[3])&&t.removeClass(d[3]),t.hasClass(d[4])&&t.removeClass(d[4]),S.call(this),_.call(this),"y"===i.axis||i.advanced.autoExpandHorizontalScroll||r.css("width",x(r.children())),n.overflowed=B.call(this),O.call(this),i.autoDraggerLength&&b.call(this),C.call(this),k.call(this);var s=[Math.abs(r[0].offsetTop),Math.abs(r[0].offsetLeft)];"x"!==i.axis&&(n.overflowed[0]?l[0].height()>l[0].parent().height()?T.call(this):(Q(t,s[0].toString(),{dir:"y",dur:0,overwrite:"none"}),n.contentReset.y=null):(T.call(this),"y"===i.axis?M.call(this):"yx"===i.axis&&n.overflowed[1]&&Q(t,s[1].toString(),{dir:"x",dur:0,overwrite:"none"}))),"y"!==i.axis&&(n.overflowed[1]?l[1].width()>l[1].parent().width()?T.call(this):(Q(t,s[1].toString(),{dir:"x",dur:0,overwrite:"none"}),n.contentReset.x=null):(T.call(this),"x"===i.axis?M.call(this):"yx"===i.axis&&n.overflowed[0]&&Q(t,s[0].toString(),{dir:"y",dur:0,overwrite:"none"}))),o&&n&&(2===o&&i.callbacks.onImageLoad&&"function"==typeof i.callbacks.onImageLoad?i.callbacks.onImageLoad.call(this):3===o&&i.callbacks.onSelectorChange&&"function"==typeof i.callbacks.onSelectorChange?i.callbacks.onSelectorChange.call(this):i.callbacks.onUpdate&&"function"==typeof i.callbacks.onUpdate&&i.callbacks.onUpdate.call(this)),X.call(this)}})},scrollTo:function(t,o){if("undefined"!=typeof t&&null!=t){var n=f.call(this);return e(n).each(function(){var n=e(this);if(n.data(a)){var i=n.data(a),r=i.opt,l={trigger:"external",scrollInertia:r.scrollInertia,scrollEasing:"mcsEaseInOut",moveDragger:!1,timeout:60,callbacks:!0,onStart:!0,onUpdate:!0,onComplete:!0},s=e.extend(!0,{},l,o),c=Y.call(this,t),d=s.scrollInertia>0&&s.scrollInertia<17?17:s.scrollInertia;c[0]=j.call(this,c[0],"y"),c[1]=j.call(this,c[1],"x"),s.moveDragger&&(c[0]*=i.scrollRatio.y,c[1]*=i.scrollRatio.x),s.dur=d,setTimeout(function(){null!==c[0]&&"undefined"!=typeof c[0]&&"x"!==r.axis&&i.overflowed[0]&&(s.dir="y",s.overwrite="all",Q(n,c[0].toString(),s)),null!==c[1]&&"undefined"!=typeof c[1]&&"y"!==r.axis&&i.overflowed[1]&&(s.dir="x",s.overwrite="none",Q(n,c[1].toString(),s))},s.timeout)}})}},stop:function(){var t=f.call(this);return e(t).each(function(){var t=e(this);t.data(a)&&V(t)})},disable:function(t){var o=f.call(this);return e(o).each(function(){var o=e(this);if(o.data(a)){{o.data(a)}X.call(this,"remove"),M.call(this),t&&T.call(this),O.call(this,!0),o.addClass(d[3])}})},destroy:function(){var t=f.call(this);return e(t).each(function(){var n=e(this);if(n.data(a)){var i=n.data(a),r=i.opt,l=e("#mCSB_"+i.idx),s=e("#mCSB_"+i.idx+"_container"),c=e(".mCSB_"+i.idx+"_scrollbar");r.live&&m(r.liveSelector||e(t).selector),X.call(this,"remove"),M.call(this),T.call(this),n.removeData(a),Z(this,"mcs"),c.remove(),s.find("img."+d[2]).removeClass(d[2]),l.replaceWith(s.contents()),n.removeClass(o+" _"+a+"_"+i.idx+" "+d[6]+" "+d[7]+" "+d[5]+" "+d[3]).addClass(d[4])}})}},f=function(){return"object"!=typeof e(this)||e(this).length<1?n:this},h=function(t){var o=["rounded","rounded-dark","rounded-dots","rounded-dots-dark"],a=["rounded-dots","rounded-dots-dark","3d","3d-dark","3d-thick","3d-thick-dark","inset","inset-dark","inset-2","inset-2-dark","inset-3","inset-3-dark"],n=["minimal","minimal-dark"],i=["minimal","minimal-dark"],r=["minimal","minimal-dark"];t.autoDraggerLength=e.inArray(t.theme,o)>-1?!1:t.autoDraggerLength,t.autoExpandScrollbar=e.inArray(t.theme,a)>-1?!1:t.autoExpandScrollbar,t.scrollButtons.enable=e.inArray(t.theme,n)>-1?!1:t.scrollButtons.enable,t.autoHideScrollbar=e.inArray(t.theme,i)>-1?!0:t.autoHideScrollbar,t.scrollbarPosition=e.inArray(t.theme,r)>-1?"outside":t.scrollbarPosition},m=function(e){l[e]&&(clearTimeout(l[e]),Z(l,e))},p=function(e){return"yx"===e||"xy"===e||"auto"===e?"yx":"x"===e||"horizontal"===e?"x":"y"},g=function(e){return"stepped"===e||"pixels"===e||"step"===e||"click"===e?"stepped":"stepless"},v=function(){var t=e(this),n=t.data(a),i=n.opt,r=i.autoExpandScrollbar?" "+d[1]+"_expand":"",l=["<div id='mCSB_"+n.idx+"_scrollbar_vertical' class='mCSB_scrollTools mCSB_"+n.idx+"_scrollbar mCS-"+i.theme+" mCSB_scrollTools_vertical"+r+"'><div class='"+d[12]+"'><div id='mCSB_"+n.idx+"_dragger_vertical' class='mCSB_dragger' style='position:absolute;' oncontextmenu='return false;'><div class='mCSB_dragger_bar' /></div><div class='mCSB_draggerRail' /></div></div>","<div id='mCSB_"+n.idx+"_scrollbar_horizontal' class='mCSB_scrollTools mCSB_"+n.idx+"_scrollbar mCS-"+i.theme+" mCSB_scrollTools_horizontal"+r+"'><div class='"+d[12]+"'><div id='mCSB_"+n.idx+"_dragger_horizontal' class='mCSB_dragger' style='position:absolute;' oncontextmenu='return false;'><div class='mCSB_dragger_bar' /></div><div class='mCSB_draggerRail' /></div></div>"],s="yx"===i.axis?"mCSB_vertical_horizontal":"x"===i.axis?"mCSB_horizontal":"mCSB_vertical",c="yx"===i.axis?l[0]+l[1]:"x"===i.axis?l[1]:l[0],u="yx"===i.axis?"<div id='mCSB_"+n.idx+"_container_wrapper' class='mCSB_container_wrapper' />":"",f=i.autoHideScrollbar?" "+d[6]:"",h="x"!==i.axis&&"rtl"===n.langDir?" "+d[7]:"";i.setWidth&&t.css("width",i.setWidth),i.setHeight&&t.css("height",i.setHeight),i.setLeft="y"!==i.axis&&"rtl"===n.langDir?"989999px":i.setLeft,t.addClass(o+" _"+a+"_"+n.idx+f+h).wrapInner("<div id='mCSB_"+n.idx+"' class='mCustomScrollBox mCS-"+i.theme+" "+s+"'><div id='mCSB_"+n.idx+"_container' class='mCSB_container' style='position:relative; top:"+i.setTop+"; left:"+i.setLeft+";' dir="+n.langDir+" /></div>");var m=e("#mCSB_"+n.idx),p=e("#mCSB_"+n.idx+"_container");"y"===i.axis||i.advanced.autoExpandHorizontalScroll||p.css("width",x(p.children())),"outside"===i.scrollbarPosition?("static"===t.css("position")&&t.css("position","relative"),t.css("overflow","visible"),m.addClass("mCSB_outside").after(c)):(m.addClass("mCSB_inside").append(c),p.wrap(u)),w.call(this);var g=[e("#mCSB_"+n.idx+"_dragger_vertical"),e("#mCSB_"+n.idx+"_dragger_horizontal")];g[0].css("min-height",g[0].height()),g[1].css("min-width",g[1].width())},x=function(t){return Math.max.apply(Math,t.map(function(){return e(this).outerWidth(!0)}).get())},_=function(){var t=e(this),o=t.data(a),n=o.opt,i=e("#mCSB_"+o.idx+"_container");n.advanced.autoExpandHorizontalScroll&&"y"!==n.axis&&i.css({position:"absolute",width:"auto"}).wrap("<div class='mCSB_h_wrapper' style='position:relative; left:0; width:999999px;' />").css({width:Math.ceil(i[0].getBoundingClientRect().right+.4)-Math.floor(i[0].getBoundingClientRect().left),position:"relative"}).unwrap()},w=function(){var t=e(this),o=t.data(a),n=o.opt,i=e(".mCSB_"+o.idx+"_scrollbar:first"),r=te(n.scrollButtons.tabindex)?"tabindex='"+n.scrollButtons.tabindex+"'":"",l=["<a href='#' class='"+d[13]+"' oncontextmenu='return false;' "+r+" />","<a href='#' class='"+d[14]+"' oncontextmenu='return false;' "+r+" />","<a href='#' class='"+d[15]+"' oncontextmenu='return false;' "+r+" />","<a href='#' class='"+d[16]+"' oncontextmenu='return false;' "+r+" />"],s=["x"===n.axis?l[2]:l[0],"x"===n.axis?l[3]:l[1],l[2],l[3]];n.scrollButtons.enable&&i.prepend(s[0]).append(s[1]).next(".mCSB_scrollTools").prepend(s[2]).append(s[3])},S=function(){var t=e(this),o=t.data(a),n=e("#mCSB_"+o.idx),i=t.css("max-height")||"none",r=-1!==i.indexOf("%"),l=t.css("box-sizing");if("none"!==i){var s=r?t.parent().height()*parseInt(i)/100:parseInt(i);"border-box"===l&&(s-=t.innerHeight()-t.height()+(t.outerHeight()-t.innerHeight())),n.css("max-height",Math.round(s))}},b=function(){var t=e(this),o=t.data(a),n=e("#mCSB_"+o.idx),i=e("#mCSB_"+o.idx+"_container"),r=[e("#mCSB_"+o.idx+"_dragger_vertical"),e("#mCSB_"+o.idx+"_dragger_horizontal")],l=[n.height()/i.outerHeight(!1),n.width()/i.outerWidth(!1)],c=[parseInt(r[0].css("min-height")),Math.round(l[0]*r[0].parent().height()),parseInt(r[1].css("min-width")),Math.round(l[1]*r[1].parent().width())],d=s&&c[1]<c[0]?c[0]:c[1],u=s&&c[3]<c[2]?c[2]:c[3];r[0].css({height:d,"max-height":r[0].parent().height()-10}).find(".mCSB_dragger_bar").css({"line-height":c[0]+"px"}),r[1].css({width:u,"max-width":r[1].parent().width()-10})},C=function(){var t=e(this),o=t.data(a),n=e("#mCSB_"+o.idx),i=e("#mCSB_"+o.idx+"_container"),r=[e("#mCSB_"+o.idx+"_dragger_vertical"),e("#mCSB_"+o.idx+"_dragger_horizontal")],l=[i.outerHeight(!1)-n.height(),i.outerWidth(!1)-n.width()],s=[l[0]/(r[0].parent().height()-r[0].height()),l[1]/(r[1].parent().width()-r[1].width())];o.scrollRatio={y:s[0],x:s[1]}},y=function(e,t,o){var a=o?d[0]+"_expanded":"",n=e.closest(".mCSB_scrollTools");"active"===t?(e.toggleClass(d[0]+" "+a),n.toggleClass(d[1]),e[0]._draggable=e[0]._draggable?0:1):e[0]._draggable||("hide"===t?(e.removeClass(d[0]),n.removeClass(d[1])):(e.addClass(d[0]),n.addClass(d[1])))},B=function(){var t=e(this),o=t.data(a),n=e("#mCSB_"+o.idx),i=e("#mCSB_"+o.idx+"_container"),r=null==o.overflowed?i.height():i.outerHeight(!1),l=null==o.overflowed?i.width():i.outerWidth(!1);return[r>n.height(),l>n.width()]},T=function(){var t=e(this),o=t.data(a),n=o.opt,i=e("#mCSB_"+o.idx),r=e("#mCSB_"+o.idx+"_container"),l=[e("#mCSB_"+o.idx+"_dragger_vertical"),e("#mCSB_"+o.idx+"_dragger_horizontal")];if(V(t),("x"!==n.axis&&!o.overflowed[0]||"y"===n.axis&&o.overflowed[0])&&(l[0].add(r).css("top",0),Q(t,"_resetY")),"y"!==n.axis&&!o.overflowed[1]||"x"===n.axis&&o.overflowed[1]){var s=dx=0;"rtl"===o.langDir&&(s=i.width()-r.outerWidth(!1),dx=Math.abs(s/o.scrollRatio.x)),r.css("left",s),l[1].css("left",dx),Q(t,"_resetX")}},k=function(){function t(){r=setTimeout(function(){e.event.special.mousewheel?(clearTimeout(r),W.call(o[0])):t()},100)}var o=e(this),n=o.data(a),i=n.opt;if(!n.bindEvents){if(R.call(this),i.contentTouchScroll&&D.call(this),E.call(this),i.mouseWheel.enable){var r;t()}P.call(this),H.call(this),i.advanced.autoScrollOnFocus&&z.call(this),i.scrollButtons.enable&&U.call(this),i.keyboard.enable&&F.call(this),n.bindEvents=!0}},M=function(){var t=e(this),o=t.data(a),n=o.opt,i=a+"_"+o.idx,r=".mCSB_"+o.idx+"_scrollbar",l=e("#mCSB_"+o.idx+",#mCSB_"+o.idx+"_container,#mCSB_"+o.idx+"_container_wrapper,"+r+" ."+d[12]+",#mCSB_"+o.idx+"_dragger_vertical,#mCSB_"+o.idx+"_dragger_horizontal,"+r+">a"),s=e("#mCSB_"+o.idx+"_container");n.advanced.releaseDraggableSelectors&&l.add(e(n.advanced.releaseDraggableSelectors)),o.bindEvents&&(e(document).unbind("."+i),l.each(function(){e(this).unbind("."+i)}),clearTimeout(t[0]._focusTimeout),Z(t[0],"_focusTimeout"),clearTimeout(o.sequential.step),Z(o.sequential,"step"),clearTimeout(s[0].onCompleteTimeout),Z(s[0],"onCompleteTimeout"),o.bindEvents=!1)},O=function(t){var o=e(this),n=o.data(a),i=n.opt,r=e("#mCSB_"+n.idx+"_container_wrapper"),l=r.length?r:e("#mCSB_"+n.idx+"_container"),s=[e("#mCSB_"+n.idx+"_scrollbar_vertical"),e("#mCSB_"+n.idx+"_scrollbar_horizontal")],c=[s[0].find(".mCSB_dragger"),s[1].find(".mCSB_dragger")];"x"!==i.axis&&(n.overflowed[0]&&!t?(s[0].add(c[0]).add(s[0].children("a")).css("display","block"),l.removeClass(d[8]+" "+d[10])):(i.alwaysShowScrollbar?(2!==i.alwaysShowScrollbar&&c[0].css("display","none"),l.removeClass(d[10])):(s[0].css("display","none"),l.addClass(d[10])),l.addClass(d[8]))),"y"!==i.axis&&(n.overflowed[1]&&!t?(s[1].add(c[1]).add(s[1].children("a")).css("display","block"),l.removeClass(d[9]+" "+d[11])):(i.alwaysShowScrollbar?(2!==i.alwaysShowScrollbar&&c[1].css("display","none"),l.removeClass(d[11])):(s[1].css("display","none"),l.addClass(d[11])),l.addClass(d[9]))),n.overflowed[0]||n.overflowed[1]?o.removeClass(d[5]):o.addClass(d[5])},I=function(e){var t=e.type;switch(t){case"pointerdown":case"MSPointerDown":case"pointermove":case"MSPointerMove":case"pointerup":case"MSPointerUp":return e.target.ownerDocument!==document?[e.originalEvent.screenY,e.originalEvent.screenX,!1]:[e.originalEvent.pageY,e.originalEvent.pageX,!1];case"touchstart":case"touchmove":case"touchend":var o=e.originalEvent.touches[0]||e.originalEvent.changedTouches[0],a=e.originalEvent.touches.length||e.originalEvent.changedTouches.length;return e.target.ownerDocument!==document?[o.screenY,o.screenX,a>1]:[o.pageY,o.pageX,a>1];default:return[e.pageY,e.pageX,!1]}},R=function(){function t(e){var t=m.find("iframe");if(t.length){var o=e?"auto":"none";t.css("pointer-events",o)}}function o(e,t,o,a){if(m[0].idleTimer=u.scrollInertia<233?250:0,n.attr("id")===h[1])var i="x",r=(n[0].offsetLeft-t+a)*d.scrollRatio.x;else var i="y",r=(n[0].offsetTop-e+o)*d.scrollRatio.y;Q(l,r.toString(),{dir:i,drag:!0})}var n,i,r,l=e(this),d=l.data(a),u=d.opt,f=a+"_"+d.idx,h=["mCSB_"+d.idx+"_dragger_vertical","mCSB_"+d.idx+"_dragger_horizontal"],m=e("#mCSB_"+d.idx+"_container"),p=e("#"+h[0]+",#"+h[1]),g=u.advanced.releaseDraggableSelectors?p.add(e(u.advanced.releaseDraggableSelectors)):p;p.bind("mousedown."+f+" touchstart."+f+" pointerdown."+f+" MSPointerDown."+f,function(o){if(o.stopImmediatePropagation(),o.preventDefault(),$(o)){c=!0,s&&(document.onselectstart=function(){return!1}),t(!1),V(l),n=e(this);var a=n.offset(),d=I(o)[0]-a.top,f=I(o)[1]-a.left,h=n.height()+a.top,m=n.width()+a.left;h>d&&d>0&&m>f&&f>0&&(i=d,r=f),y(n,"active",u.autoExpandScrollbar)}}).bind("touchmove."+f,function(e){e.stopImmediatePropagation(),e.preventDefault();var t=n.offset(),a=I(e)[0]-t.top,l=I(e)[1]-t.left;o(i,r,a,l)}),e(document).bind("mousemove."+f+" pointermove."+f+" MSPointerMove."+f,function(e){if(n){var t=n.offset(),a=I(e)[0]-t.top,l=I(e)[1]-t.left;if(i===a)return;o(i,r,a,l)}}).add(g).bind("mouseup."+f+" touchend."+f+" pointerup."+f+" MSPointerUp."+f,function(e){n&&(y(n,"active",u.autoExpandScrollbar),n=null),c=!1,s&&(document.onselectstart=null),t(!0)})},D=function(){function o(e){if(!ee(e)||c||I(e)[2])return void(t=0);t=1,S=0,b=0,C.removeClass("mCS_touch_action");var o=M.offset();d=I(e)[0]-o.top,u=I(e)[1]-o.left,A=[I(e)[0],I(e)[1]]}function n(e){if(ee(e)&&!c&&!I(e)[2]&&(e.stopImmediatePropagation(),!b||S)){p=J();var t=k.offset(),o=I(e)[0]-t.top,a=I(e)[1]-t.left,n="mcsLinearOut";if(R.push(o),D.push(a),A[2]=Math.abs(I(e)[0]-A[0]),A[3]=Math.abs(I(e)[1]-A[1]),y.overflowed[0])var i=O[0].parent().height()-O[0].height(),r=d-o>0&&o-d>-(i*y.scrollRatio.y)&&(2*A[3]<A[2]||"yx"===B.axis);if(y.overflowed[1])var l=O[1].parent().width()-O[1].width(),f=u-a>0&&a-u>-(l*y.scrollRatio.x)&&(2*A[2]<A[3]||"yx"===B.axis);r||f?(e.preventDefault(),S=1):(b=1,C.addClass("mCS_touch_action")),_="yx"===B.axis?[d-o,u-a]:"x"===B.axis?[null,u-a]:[d-o,null],M[0].idleTimer=250,y.overflowed[0]&&s(_[0],E,n,"y","all",!0),y.overflowed[1]&&s(_[1],E,n,"x",W,!0)}}function i(e){if(!ee(e)||c||I(e)[2])return void(t=0);t=1,e.stopImmediatePropagation(),V(C),m=J();var o=k.offset();f=I(e)[0]-o.top,h=I(e)[1]-o.left,R=[],D=[]}function r(e){if(ee(e)&&!c&&!I(e)[2]){e.stopImmediatePropagation(),S=0,b=0,g=J();var t=k.offset(),o=I(e)[0]-t.top,a=I(e)[1]-t.left;if(!(g-p>30)){x=1e3/(g-m);var n="mcsEaseOut",i=2.5>x,r=i?[R[R.length-2],D[D.length-2]]:[0,0];v=i?[o-r[0],a-r[1]]:[o-f,a-h];var d=[Math.abs(v[0]),Math.abs(v[1])];x=i?[Math.abs(v[0]/4),Math.abs(v[1]/4)]:[x,x];var u=[Math.abs(M[0].offsetTop)-v[0]*l(d[0]/x[0],x[0]),Math.abs(M[0].offsetLeft)-v[1]*l(d[1]/x[1],x[1])];_="yx"===B.axis?[u[0],u[1]]:"x"===B.axis?[null,u[1]]:[u[0],null],w=[4*d[0]+B.scrollInertia,4*d[1]+B.scrollInertia];var C=parseInt(B.contentTouchScroll)||0;_[0]=d[0]>C?_[0]:0,_[1]=d[1]>C?_[1]:0,y.overflowed[0]&&s(_[0],w[0],n,"y",W,!1),y.overflowed[1]&&s(_[1],w[1],n,"x",W,!1)}}}function l(e,t){var o=[1.5*t,2*t,t/1.5,t/2];return e>90?t>4?o[0]:o[3]:e>60?t>3?o[3]:o[2]:e>30?t>8?o[1]:t>6?o[0]:t>4?t:o[2]:t>8?t:o[3]}function s(e,t,o,a,n,i){e&&Q(C,e.toString(),{dur:t,scrollEasing:o,dir:a,overwrite:n,drag:i})}var d,u,f,h,m,p,g,v,x,_,w,S,b,C=e(this),y=C.data(a),B=y.opt,T=a+"_"+y.idx,k=e("#mCSB_"+y.idx),M=e("#mCSB_"+y.idx+"_container"),O=[e("#mCSB_"+y.idx+"_dragger_vertical"),e("#mCSB_"+y.idx+"_dragger_horizontal")],R=[],D=[],E=0,W="yx"===B.axis?"none":"all",A=[],P=M.find("iframe"),z=["touchstart."+T+" pointerdown."+T+" MSPointerDown."+T,"touchmove."+T+" pointermove."+T+" MSPointerMove."+T,"touchend."+T+" pointerup."+T+" MSPointerUp."+T];M.bind(z[0],function(e){o(e)}).bind(z[1],function(e){n(e)}),k.bind(z[0],function(e){i(e)}).bind(z[2],function(e){r(e)}),P.length&&P.each(function(){e(this).load(function(){L(this)&&e(this.contentDocument||this.contentWindow.document).bind(z[0],function(e){o(e),i(e)}).bind(z[1],function(e){n(e)}).bind(z[2],function(e){r(e)})})})},E=function(){function o(){return window.getSelection?window.getSelection().toString():document.selection&&"Control"!=document.selection.type?document.selection.createRange().text:0}function n(e,t,o){d.type=o&&i?"stepped":"stepless",d.scrollAmount=10,q(r,e,t,"mcsLinearOut",o?60:null)}var i,r=e(this),l=r.data(a),s=l.opt,d=l.sequential,u=a+"_"+l.idx,f=e("#mCSB_"+l.idx+"_container"),h=f.parent();f.bind("mousedown."+u,function(e){t||i||(i=1,c=!0)}).add(document).bind("mousemove."+u,function(e){if(!t&&i&&o()){var a=f.offset(),r=I(e)[0]-a.top+f[0].offsetTop,c=I(e)[1]-a.left+f[0].offsetLeft;r>0&&r<h.height()&&c>0&&c<h.width()?d.step&&n("off",null,"stepped"):("x"!==s.axis&&l.overflowed[0]&&(0>r?n("on",38):r>h.height()&&n("on",40)),"y"!==s.axis&&l.overflowed[1]&&(0>c?n("on",37):c>h.width()&&n("on",39)))}}).bind("mouseup."+u,function(e){t||(i&&(i=0,n("off",null)),c=!1)})},W=function(){function t(t,a){if(V(o),!A(o,t.target)){var r="auto"!==i.mouseWheel.deltaFactor?parseInt(i.mouseWheel.deltaFactor):s&&t.deltaFactor<100?100:t.deltaFactor||100;if("x"===i.axis||"x"===i.mouseWheel.axis)var d="x",u=[Math.round(r*n.scrollRatio.x),parseInt(i.mouseWheel.scrollAmount)],f="auto"!==i.mouseWheel.scrollAmount?u[1]:u[0]>=l.width()?.9*l.width():u[0],h=Math.abs(e("#mCSB_"+n.idx+"_container")[0].offsetLeft),m=c[1][0].offsetLeft,p=c[1].parent().width()-c[1].width(),g=t.deltaX||t.deltaY||a;else var d="y",u=[Math.round(r*n.scrollRatio.y),parseInt(i.mouseWheel.scrollAmount)],f="auto"!==i.mouseWheel.scrollAmount?u[1]:u[0]>=l.height()?.9*l.height():u[0],h=Math.abs(e("#mCSB_"+n.idx+"_container")[0].offsetTop),m=c[0][0].offsetTop,p=c[0].parent().height()-c[0].height(),g=t.deltaY||a;"y"===d&&!n.overflowed[0]||"x"===d&&!n.overflowed[1]||((i.mouseWheel.invert||t.webkitDirectionInvertedFromDevice)&&(g=-g),i.mouseWheel.normalizeDelta&&(g=0>g?-1:1),(g>0&&0!==m||0>g&&m!==p||i.mouseWheel.preventDefault)&&(t.stopImmediatePropagation(),t.preventDefault()),Q(o,(h-g*f).toString(),{dir:d}))}}if(e(this).data(a)){var o=e(this),n=o.data(a),i=n.opt,r=a+"_"+n.idx,l=e("#mCSB_"+n.idx),c=[e("#mCSB_"+n.idx+"_dragger_vertical"),e("#mCSB_"+n.idx+"_dragger_horizontal")],d=e("#mCSB_"+n.idx+"_container").find("iframe");d.length&&d.each(function(){e(this).load(function(){L(this)&&e(this.contentDocument||this.contentWindow.document).bind("mousewheel."+r,function(e,o){t(e,o)})})}),l.bind("mousewheel."+r,function(e,o){t(e,o)})}},L=function(e){var t=null;try{var o=e.contentDocument||e.contentWindow.document;t=o.body.innerHTML}catch(a){}return null!==t},A=function(t,o){var n=o.nodeName.toLowerCase(),i=t.data(a).opt.mouseWheel.disableOver,r=["select","textarea"];return e.inArray(n,i)>-1&&!(e.inArray(n,r)>-1&&!e(o).is(":focus"))},P=function(){var t=e(this),o=t.data(a),n=a+"_"+o.idx,i=e("#mCSB_"+o.idx+"_container"),r=i.parent(),l=e(".mCSB_"+o.idx+"_scrollbar ."+d[12]);l.bind("touchstart."+n+" pointerdown."+n+" MSPointerDown."+n,function(e){c=!0}).bind("touchend."+n+" pointerup."+n+" MSPointerUp."+n,function(e){c=!1}).bind("click."+n,function(a){if(e(a.target).hasClass(d[12])||e(a.target).hasClass("mCSB_draggerRail")){V(t);var n=e(this),l=n.find(".mCSB_dragger");if(n.parent(".mCSB_scrollTools_horizontal").length>0){if(!o.overflowed[1])return;var s="x",c=a.pageX>l.offset().left?-1:1,u=Math.abs(i[0].offsetLeft)-.9*c*r.width()}else{if(!o.overflowed[0])return;var s="y",c=a.pageY>l.offset().top?-1:1,u=Math.abs(i[0].offsetTop)-.9*c*r.height()}Q(t,u.toString(),{dir:s,scrollEasing:"mcsEaseInOut"})}})},z=function(){var t=e(this),o=t.data(a),n=o.opt,i=a+"_"+o.idx,r=e("#mCSB_"+o.idx+"_container"),l=r.parent();r.bind("focusin."+i,function(o){var a=e(document.activeElement),i=r.find(".mCustomScrollBox").length,s=0;a.is(n.advanced.autoScrollOnFocus)&&(V(t),clearTimeout(t[0]._focusTimeout),t[0]._focusTimer=i?(s+17)*i:0,t[0]._focusTimeout=setTimeout(function(){var e=[oe(a)[0],oe(a)[1]],o=[r[0].offsetTop,r[0].offsetLeft],i=[o[0]+e[0]>=0&&o[0]+e[0]<l.height()-a.outerHeight(!1),o[1]+e[1]>=0&&o[0]+e[1]<l.width()-a.outerWidth(!1)],c="yx"!==n.axis||i[0]||i[1]?"all":"none";"x"===n.axis||i[0]||Q(t,e[0].toString(),{dir:"y",scrollEasing:"mcsEaseInOut",overwrite:c,dur:s}),"y"===n.axis||i[1]||Q(t,e[1].toString(),{dir:"x",scrollEasing:"mcsEaseInOut",overwrite:c,dur:s})},t[0]._focusTimer))})},H=function(){var t=e(this),o=t.data(a),n=a+"_"+o.idx,i=e("#mCSB_"+o.idx+"_container").parent();i.bind("scroll."+n,function(t){(0!==i.scrollTop()||0!==i.scrollLeft())&&e(".mCSB_"+o.idx+"_scrollbar").css("visibility","hidden")})},U=function(){var t=e(this),o=t.data(a),n=o.opt,i=o.sequential,r=a+"_"+o.idx,l=".mCSB_"+o.idx+"_scrollbar",s=e(l+">a");s.bind("mousedown."+r+" touchstart."+r+" pointerdown."+r+" MSPointerDown."+r+" mouseup."+r+" touchend."+r+" pointerup."+r+" MSPointerUp."+r+" mouseout."+r+" pointerout."+r+" MSPointerOut."+r+" click."+r,function(a){function r(e,o){i.scrollAmount=n.snapAmount||n.scrollButtons.scrollAmount,q(t,e,o)}if(a.preventDefault(),$(a)){var l=e(this).attr("class");switch(i.type=n.scrollButtons.scrollType,a.type){case"mousedown":case"touchstart":case"pointerdown":case"MSPointerDown":if("stepped"===i.type)return;c=!0,o.tweenRunning=!1,r("on",l);break;case"mouseup":case"touchend":case"pointerup":case"MSPointerUp":case"mouseout":case"pointerout":case"MSPointerOut":if("stepped"===i.type)return;c=!1,i.dir&&r("off",l);break;case"click":if("stepped"!==i.type||o.tweenRunning)return;r("on",l)}}})},F=function(){function t(t){function a(e,t){r.type=i.keyboard.scrollType,r.scrollAmount=i.snapAmount||i.keyboard.scrollAmount,"stepped"===r.type&&n.tweenRunning||q(o,e,t)}switch(t.type){case"blur":n.tweenRunning&&r.dir&&a("off",null);break;case"keydown":case"keyup":var l=t.keyCode?t.keyCode:t.which,s="on";if("x"!==i.axis&&(38===l||40===l)||"y"!==i.axis&&(37===l||39===l)){if((38===l||40===l)&&!n.overflowed[0]||(37===l||39===l)&&!n.overflowed[1])return;"keyup"===t.type&&(s="off"),e(document.activeElement).is(u)||(t.preventDefault(),t.stopImmediatePropagation(),a(s,l))}else if(33===l||34===l){if((n.overflowed[0]||n.overflowed[1])&&(t.preventDefault(),t.stopImmediatePropagation()),"keyup"===t.type){V(o);var f=34===l?-1:1;if("x"===i.axis||"yx"===i.axis&&n.overflowed[1]&&!n.overflowed[0])var h="x",m=Math.abs(c[0].offsetLeft)-.9*f*d.width();else var h="y",m=Math.abs(c[0].offsetTop)-.9*f*d.height();Q(o,m.toString(),{dir:h,scrollEasing:"mcsEaseInOut"})}}else if((35===l||36===l)&&!e(document.activeElement).is(u)&&((n.overflowed[0]||n.overflowed[1])&&(t.preventDefault(),t.stopImmediatePropagation()),"keyup"===t.type)){if("x"===i.axis||"yx"===i.axis&&n.overflowed[1]&&!n.overflowed[0])var h="x",m=35===l?Math.abs(d.width()-c.outerWidth(!1)):0;else var h="y",m=35===l?Math.abs(d.height()-c.outerHeight(!1)):0;Q(o,m.toString(),{dir:h,scrollEasing:"mcsEaseInOut"})}}}var o=e(this),n=o.data(a),i=n.opt,r=n.sequential,l=a+"_"+n.idx,s=e("#mCSB_"+n.idx),c=e("#mCSB_"+n.idx+"_container"),d=c.parent(),u="input,textarea,select,datalist,keygen,[contenteditable='true']",f=c.find("iframe"),h=["blur."+l+" keydown."+l+" keyup."+l];f.length&&f.each(function(){e(this).load(function(){L(this)&&e(this.contentDocument||this.contentWindow.document).bind(h[0],function(e){t(e)})})}),s.attr("tabindex","0").bind(h[0],function(e){t(e)})},q=function(t,o,n,i,r){function l(e){var o="stepped"!==f.type,a=r?r:e?o?p/1.5:g:1e3/60,n=e?o?7.5:40:2.5,s=[Math.abs(h[0].offsetTop),Math.abs(h[0].offsetLeft)],d=[c.scrollRatio.y>10?10:c.scrollRatio.y,c.scrollRatio.x>10?10:c.scrollRatio.x],u="x"===f.dir[0]?s[1]+f.dir[1]*d[1]*n:s[0]+f.dir[1]*d[0]*n,m="x"===f.dir[0]?s[1]+f.dir[1]*parseInt(f.scrollAmount):s[0]+f.dir[1]*parseInt(f.scrollAmount),v="auto"!==f.scrollAmount?m:u,x=i?i:e?o?"mcsLinearOut":"mcsEaseInOut":"mcsLinear",_=e?!0:!1;return e&&17>a&&(v="x"===f.dir[0]?s[1]:s[0]),Q(t,v.toString(),{dir:f.dir[0],scrollEasing:x,dur:a,onComplete:_}),e?void(f.dir=!1):(clearTimeout(f.step),void(f.step=setTimeout(function(){l()},a)))}function s(){clearTimeout(f.step),Z(f,"step"),V(t)}var c=t.data(a),u=c.opt,f=c.sequential,h=e("#mCSB_"+c.idx+"_container"),m="stepped"===f.type?!0:!1,p=u.scrollInertia<26?26:u.scrollInertia,g=u.scrollInertia<1?17:u.scrollInertia;switch(o){case"on":if(f.dir=[n===d[16]||n===d[15]||39===n||37===n?"x":"y",n===d[13]||n===d[15]||38===n||37===n?-1:1],V(t),te(n)&&"stepped"===f.type)return;l(m);break;case"off":s(),(m||c.tweenRunning&&f.dir)&&l(!0)}},Y=function(t){var o=e(this).data(a).opt,n=[];return"function"==typeof t&&(t=t()),t instanceof Array?n=t.length>1?[t[0],t[1]]:"x"===o.axis?[null,t[0]]:[t[0],null]:(n[0]=t.y?t.y:t.x||"x"===o.axis?null:t,n[1]=t.x?t.x:t.y||"y"===o.axis?null:t),"function"==typeof n[0]&&(n[0]=n[0]()),"function"==typeof n[1]&&(n[1]=n[1]()),n},j=function(t,o){if(null!=t&&"undefined"!=typeof t){var n=e(this),i=n.data(a),r=i.opt,l=e("#mCSB_"+i.idx+"_container"),s=l.parent(),c=typeof t;o||(o="x"===r.axis?"x":"y");var d="x"===o?l.outerWidth(!1):l.outerHeight(!1),f="x"===o?l[0].offsetLeft:l[0].offsetTop,h="x"===o?"left":"top";switch(c){case"function":return t();case"object":var m=t.jquery?t:e(t);if(!m.length)return;return"x"===o?oe(m)[1]:oe(m)[0];case"string":case"number":if(te(t))return Math.abs(t);if(-1!==t.indexOf("%"))return Math.abs(d*parseInt(t)/100);if(-1!==t.indexOf("-="))return Math.abs(f-parseInt(t.split("-=")[1]));if(-1!==t.indexOf("+=")){var p=f+parseInt(t.split("+=")[1]);return p>=0?0:Math.abs(p)}if(-1!==t.indexOf("px")&&te(t.split("px")[0]))return Math.abs(t.split("px")[0]);if("top"===t||"left"===t)return 0;if("bottom"===t)return Math.abs(s.height()-l.outerHeight(!1));if("right"===t)return Math.abs(s.width()-l.outerWidth(!1));if("first"===t||"last"===t){var m=l.find(":"+t);return"x"===o?oe(m)[1]:oe(m)[0]}return e(t).length?"x"===o?oe(e(t))[1]:oe(e(t))[0]:(l.css(h,t),void u.update.call(null,n[0]))}}},X=function(t){function o(){return clearTimeout(h[0].autoUpdate),0===s.parents("html").length?void(s=null):void(h[0].autoUpdate=setTimeout(function(){return f.advanced.updateOnSelectorChange&&(m=r(),m!==w)?(l(3),void(w=m)):(f.advanced.updateOnContentResize&&(p=[h.outerHeight(!1),h.outerWidth(!1),v.height(),v.width(),_()[0],_()[1]],(p[0]!==S[0]||p[1]!==S[1]||p[2]!==S[2]||p[3]!==S[3]||p[4]!==S[4]||p[5]!==S[5])&&(l(p[0]!==S[0]||p[1]!==S[1]),S=p)),f.advanced.updateOnImageLoad&&(g=n(),g!==b&&(h.find("img").each(function(){i(this)}),b=g)),void((f.advanced.updateOnSelectorChange||f.advanced.updateOnContentResize||f.advanced.updateOnImageLoad)&&o()))},f.advanced.autoUpdateTimeout))}function n(){var e=0;return f.advanced.updateOnImageLoad&&(e=h.find("img").length),e}function i(t){function o(e,t){return function(){return t.apply(e,arguments)}}function a(){this.onload=null,e(t).addClass(d[2]),l(2)}if(e(t).hasClass(d[2]))return void l();var n=new Image;n.onload=o(n,a),n.src=t.src}function r(){f.advanced.updateOnSelectorChange===!0&&(f.advanced.updateOnSelectorChange="*");var t=0,o=h.find(f.advanced.updateOnSelectorChange);return f.advanced.updateOnSelectorChange&&o.length>0&&o.each(function(){t+=e(this).height()+e(this).width()}),t}function l(e){clearTimeout(h[0].autoUpdate),u.update.call(null,s[0],e)}var s=e(this),c=s.data(a),f=c.opt,h=e("#mCSB_"+c.idx+"_container");if(t)return clearTimeout(h[0].autoUpdate),void Z(h[0],"autoUpdate");var m,p,g,v=h.parent(),x=[e("#mCSB_"+c.idx+"_scrollbar_vertical"),e("#mCSB_"+c.idx+"_scrollbar_horizontal")],_=function(){return[x[0].is(":visible")?x[0].outerHeight(!0):0,x[1].is(":visible")?x[1].outerWidth(!0):0]},w=r(),S=[h.outerHeight(!1),h.outerWidth(!1),v.height(),v.width(),_()[0],_()[1]],b=n();o()},N=function(e,t,o){return Math.round(e/t)*t-o},V=function(t){var o=t.data(a),n=e("#mCSB_"+o.idx+"_container,#mCSB_"+o.idx+"_container_wrapper,#mCSB_"+o.idx+"_dragger_vertical,#mCSB_"+o.idx+"_dragger_horizontal");n.each(function(){K.call(this)})},Q=function(t,o,n){function i(e){return s&&c.callbacks[e]&&"function"==typeof c.callbacks[e]}function r(){return[c.callbacks.alwaysTriggerOffsets||_>=w[0]+b,c.callbacks.alwaysTriggerOffsets||-C>=_]}function l(){var e=[h[0].offsetTop,h[0].offsetLeft],o=[v[0].offsetTop,v[0].offsetLeft],a=[h.outerHeight(!1),h.outerWidth(!1)],i=[f.height(),f.width()];t[0].mcs={content:h,top:e[0],left:e[1],draggerTop:o[0],draggerLeft:o[1],topPct:Math.round(100*Math.abs(e[0])/(Math.abs(a[0])-i[0])),leftPct:Math.round(100*Math.abs(e[1])/(Math.abs(a[1])-i[1])),direction:n.dir}}var s=t.data(a),c=s.opt,d={trigger:"internal",dir:"y",scrollEasing:"mcsEaseOut",drag:!1,dur:c.scrollInertia,overwrite:"all",
callbacks:!0,onStart:!0,onUpdate:!0,onComplete:!0},n=e.extend(d,n),u=[n.dur,n.drag?0:n.dur],f=e("#mCSB_"+s.idx),h=e("#mCSB_"+s.idx+"_container"),m=h.parent(),p=c.callbacks.onTotalScrollOffset?Y.call(t,c.callbacks.onTotalScrollOffset):[0,0],g=c.callbacks.onTotalScrollBackOffset?Y.call(t,c.callbacks.onTotalScrollBackOffset):[0,0];if(s.trigger=n.trigger,(0!==m.scrollTop()||0!==m.scrollLeft())&&(e(".mCSB_"+s.idx+"_scrollbar").css("visibility","visible"),m.scrollTop(0).scrollLeft(0)),"_resetY"!==o||s.contentReset.y||(i("onOverflowYNone")&&c.callbacks.onOverflowYNone.call(t[0]),s.contentReset.y=1),"_resetX"!==o||s.contentReset.x||(i("onOverflowXNone")&&c.callbacks.onOverflowXNone.call(t[0]),s.contentReset.x=1),"_resetY"!==o&&"_resetX"!==o){switch(!s.contentReset.y&&t[0].mcs||!s.overflowed[0]||(i("onOverflowY")&&c.callbacks.onOverflowY.call(t[0]),s.contentReset.x=null),!s.contentReset.x&&t[0].mcs||!s.overflowed[1]||(i("onOverflowX")&&c.callbacks.onOverflowX.call(t[0]),s.contentReset.x=null),c.snapAmount&&(o=N(o,c.snapAmount,c.snapOffset)),n.dir){case"x":var v=e("#mCSB_"+s.idx+"_dragger_horizontal"),x="left",_=h[0].offsetLeft,w=[f.width()-h.outerWidth(!1),v.parent().width()-v.width()],S=[o,0===o?0:o/s.scrollRatio.x],b=p[1],C=g[1],B=b>0?b/s.scrollRatio.x:0,T=C>0?C/s.scrollRatio.x:0;break;case"y":var v=e("#mCSB_"+s.idx+"_dragger_vertical"),x="top",_=h[0].offsetTop,w=[f.height()-h.outerHeight(!1),v.parent().height()-v.height()],S=[o,0===o?0:o/s.scrollRatio.y],b=p[0],C=g[0],B=b>0?b/s.scrollRatio.y:0,T=C>0?C/s.scrollRatio.y:0}S[1]<0||0===S[0]&&0===S[1]?S=[0,0]:S[1]>=w[1]?S=[w[0],w[1]]:S[0]=-S[0],t[0].mcs||(l(),i("onInit")&&c.callbacks.onInit.call(t[0])),clearTimeout(h[0].onCompleteTimeout),(s.tweenRunning||!(0===_&&S[0]>=0||_===w[0]&&S[0]<=w[0]))&&(G(v[0],x,Math.round(S[1]),u[1],n.scrollEasing),G(h[0],x,Math.round(S[0]),u[0],n.scrollEasing,n.overwrite,{onStart:function(){n.callbacks&&n.onStart&&!s.tweenRunning&&(i("onScrollStart")&&(l(),c.callbacks.onScrollStart.call(t[0])),s.tweenRunning=!0,y(v),s.cbOffsets=r())},onUpdate:function(){n.callbacks&&n.onUpdate&&i("whileScrolling")&&(l(),c.callbacks.whileScrolling.call(t[0]))},onComplete:function(){if(n.callbacks&&n.onComplete){"yx"===c.axis&&clearTimeout(h[0].onCompleteTimeout);var e=h[0].idleTimer||0;h[0].onCompleteTimeout=setTimeout(function(){i("onScroll")&&(l(),c.callbacks.onScroll.call(t[0])),i("onTotalScroll")&&S[1]>=w[1]-B&&s.cbOffsets[0]&&(l(),c.callbacks.onTotalScroll.call(t[0])),i("onTotalScrollBack")&&S[1]<=T&&s.cbOffsets[1]&&(l(),c.callbacks.onTotalScrollBack.call(t[0])),s.tweenRunning=!1,h[0].idleTimer=0,y(v,"hide")},e)}}}))}},G=function(e,t,o,a,n,i,r){function l(){S.stop||(x||m.call(),x=J()-v,s(),x>=S.time&&(S.time=x>S.time?x+f-(x-S.time):x+f-1,S.time<x+1&&(S.time=x+1)),S.time<a?S.id=h(l):g.call())}function s(){a>0?(S.currVal=u(S.time,_,b,a,n),w[t]=Math.round(S.currVal)+"px"):w[t]=o+"px",p.call()}function c(){f=1e3/60,S.time=x+f,h=window.requestAnimationFrame?window.requestAnimationFrame:function(e){return s(),setTimeout(e,.01)},S.id=h(l)}function d(){null!=S.id&&(window.requestAnimationFrame?window.cancelAnimationFrame(S.id):clearTimeout(S.id),S.id=null)}function u(e,t,o,a,n){switch(n){case"linear":case"mcsLinear":return o*e/a+t;case"mcsLinearOut":return e/=a,e--,o*Math.sqrt(1-e*e)+t;case"easeInOutSmooth":return e/=a/2,1>e?o/2*e*e+t:(e--,-o/2*(e*(e-2)-1)+t);case"easeInOutStrong":return e/=a/2,1>e?o/2*Math.pow(2,10*(e-1))+t:(e--,o/2*(-Math.pow(2,-10*e)+2)+t);case"easeInOut":case"mcsEaseInOut":return e/=a/2,1>e?o/2*e*e*e+t:(e-=2,o/2*(e*e*e+2)+t);case"easeOutSmooth":return e/=a,e--,-o*(e*e*e*e-1)+t;case"easeOutStrong":return o*(-Math.pow(2,-10*e/a)+1)+t;case"easeOut":case"mcsEaseOut":default:var i=(e/=a)*e,r=i*e;return t+o*(.499999999999997*r*i+-2.5*i*i+5.5*r+-6.5*i+4*e)}}e._mTween||(e._mTween={top:{},left:{}});var f,h,r=r||{},m=r.onStart||function(){},p=r.onUpdate||function(){},g=r.onComplete||function(){},v=J(),x=0,_=e.offsetTop,w=e.style,S=e._mTween[t];"left"===t&&(_=e.offsetLeft);var b=o-_;S.stop=0,"none"!==i&&d(),c()},J=function(){return window.performance&&window.performance.now?window.performance.now():window.performance&&window.performance.webkitNow?window.performance.webkitNow():Date.now?Date.now():(new Date).getTime()},K=function(){var e=this;e._mTween||(e._mTween={top:{},left:{}});for(var t=["top","left"],o=0;o<t.length;o++){var a=t[o];e._mTween[a].id&&(window.requestAnimationFrame?window.cancelAnimationFrame(e._mTween[a].id):clearTimeout(e._mTween[a].id),e._mTween[a].id=null,e._mTween[a].stop=1)}},Z=function(e,t){try{delete e[t]}catch(o){e[t]=null}},$=function(e){return!(e.which&&1!==e.which)},ee=function(e){var t=e.originalEvent.pointerType;return!(t&&"touch"!==t&&2!==t)},te=function(e){return!isNaN(parseFloat(e))&&isFinite(e)},oe=function(e){var t=e.parents(".mCSB_container");return[e.offset().top-t.offset().top,e.offset().left-t.offset().left]};e.fn[o]=function(t){return u[t]?u[t].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof t&&t?void e.error("Method "+t+" does not exist"):u.init.apply(this,arguments)},e[o]=function(t){return u[t]?u[t].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof t&&t?void e.error("Method "+t+" does not exist"):u.init.apply(this,arguments)},e[o].defaults=i,window[o]=!0,e(window).load(function(){e(n)[o](),e.extend(e.expr[":"],{mcsInView:e.expr[":"].mcsInView||function(t){var o,a,n=e(t),i=n.parents(".mCSB_container");if(i.length)return o=i.parent(),a=[i[0].offsetTop,i[0].offsetLeft],a[0]+oe(n)[0]>=0&&a[0]+oe(n)[0]<o.height()-n.outerHeight(!1)&&a[1]+oe(n)[1]>=0&&a[1]+oe(n)[1]<o.width()-n.outerWidth(!1)},mcsOverflow:e.expr[":"].mcsOverflow||function(t){var o=e(t).data(a);if(o)return o.overflowed[0]||o.overflowed[1]}})})})});
//Инициализируем работу меню в админ. панели
$(window).load(function() {
    //Добавляем scrollbar'ы в меню
    $('.side-scroll').mCustomScrollbar({
        theme: 'minimal',
        scrollInertia: 0,
        mouseWheel:{ preventDefault: true }
    });

    $('.sm-body').mCustomScrollbar({
        theme: 'minimal-dark',
        autoHideScrollbar:true,
        scrollInertia: 0,
        mouseWheel:{ preventDefault: true }
    });

    $('body')
        .on($.rs.clickEventName, '#menu-trigger', function(e) {
            $(this).toggleClass('toggled');
            $('#sidebar').toggleClass('toggled');
            e.preventDefault();
        })
        .on($.rs.clickEventName, '.sm .sm-node > a', function(e) {
            $(this).parent().toggleClass('open');
            e.preventDefault();
        })
        .on($.rs.clickEventName, '.menu-close', function(e) {
            var self = this;
            $(this).closest('.sm-node').removeClass('open');
            $(this).closest('#sidebar').removeClass('sm-opened');
        });


        $('.side-menu > .sm-node > a')
            .on($.rs.clickEventName, function(e) {
                var parent = $(this).closest('.sm-node');
                var sidebar = $(this).closest('#sidebar');

                if (parent.is('.open')) {
                    parent.removeClass('open');
                    sidebar.removeClass('sm-opened');
                } else {
                    sidebar.find('.side-menu > .sm-node').removeClass('open');
                    parent.addClass('open');
                    sidebar.addClass('sm-opened');
                }
                e.preventDefault();
            })
            .on('dblclick', function() {
                if ($(this).data('url')) {
                    location.href = $(this).data('url');
                }
            });

        $('.side-menu-overlay').on($.rs.clickEventName, function() {
            $('.side-menu .sm-node').removeClass('open');
            $(this).closest('#sidebar').removeClass('sm-opened');
        });
});
