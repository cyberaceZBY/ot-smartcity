(function($) {
    $.fn.baiduMap = function(options) {
        var defaults = {
            width:600,
            height:478,
            mapWidth:450,
            mapHeight:320,
            confirmBtn:"",
            cancelBtn:""
        };
        var opts = $.extend(defaults, options);
        return this.each(function() {
            $this=$(this);
            var wW = $(window).height(),wH=$(window).width();
            $this.click(function(){
                var dialog = $('#map-dialog');
                if(dialog.size() != 0){
                    mapDialog.show();
                }else{
                    mapDialog.dialog = $(mapDialog.html);
                    mapDialog.init();
                }
            });

            var mapDialog = {
                config:{mapWidth:450,mapHeight:320},
                html:['<div id="map-dialog" class="map-dialog">',
                    '<div class="map-dialog-header">百度地图<span class="ke-dialog-icon-close" title="关闭"></span></div>',
                    '<div class="map-dialog-body">',
                    // left start
                    '<div class="map-dialog-action">',
                    '<div class="md-left">',
                    '地址: <input id="kindeditor_plugin_map_address" name="address" class="md-input-text" value="" style="width:200px;" /> ',
                    '<span class="md-button-common">',
                    '<input type="button" name="searchBtn" id="map-search" class="md-button" value="搜索" />',
                    '</span>',
                    '</div>',
                    // right start
                    '<div class="md-right">',
                    '<input type="checkbox" id="insert-dynamic-map" name="dynamic-map" /> <label for="insert-dynamic-map">插入动态地图</label>',
                    '</div>',
                    '</div>',
                    '<div class="md-map" style="width:' + opts.mapWidth + 'px;height:' + opts.mapHeight + 'px;">',
                    '<iframe id="map-ifr" class="map-ifr" frameborder="0" src="/Public/static/kindeditor/plugins/baidumap/map.html" style="width:' + opts.mapWidth + 'px;height:' + opts.mapHeight + 'px;"></iframe>',
                    '</div>',
                    '<div class="map-dialog-bottom"><span><input class="md-button" id="map-cancel"  type="button" value="取消"></span><span><input class="md-button" id="map-confirm" type="button" value="确定"></span></div>',
                    '</div>',
                    '</div>',
                    '<div id="layer-mask" class="map-layer-mask"></div>'].join(''),
                dialog : $(this.html),
                cover:{
                    show:function(){
                        var layer = $('#layer-mask');
                        layer.height($(document).height());
                        layer.show();
                    },
                    hide:function () {
                        $('#layer-mask').hide();
                    }
                },
                init:function(){
                    var layer = this.dialog.find('#layer-mask'),
                        iframe = this.dialog.find('#map-ifr'),search = this.dialog.find('#map-search'),
                        confirm = this.dialog.find('#map-confirm'),cancel = this.dialog.find('#map-cancel');
                    confirm.click(function(){
                        var check = $('#insert-dynamic-map')[0];
                        var map = iframe[0].contentWindow.map;
                        var centerObj = map.getCenter();
                        var center = centerObj.lng + ',' + centerObj.lat;
                        var zoom = map.getZoom();
                        var url = [check.checked ? '/Public/static/kindeditor/plugins/baidumap/index.html' : 'http://api.map.baidu.com/staticimage',
                            '?center=' + encodeURIComponent(center),
                            '&zoom=' + encodeURIComponent(zoom),
                            '&width=' + opts.mapWidth,
                            '&height=' + opts.mapHeight,
                            '&markers=' + encodeURIComponent(center),
                            '&markerStyles=' + encodeURIComponent('l,A')].join('');
                        if (check.checked) {
                            var value = '<iframe src=\'' + url + '\' frameborder=\'0\' style=\'width:' + (opts.mapWidth + 2) + 'px;height:' + (opts.mapHeight + 2) + 'px;\'></iframe>';
                            $('#map-content').val(value);
                            $('#map-content-panel').html(value);
                        } else {
                            $('#map-content').val('<img src=\''+url+'\'/>');
                            $('#map-content-panel').html('<img src=\''+url+'\'/>');
                        }
                        $('#map-dialog').hide();
                        mapDialog.cover.hide();
                    });
                    cancel.click(function(){
                        $('#map-dialog').hide();
                        mapDialog.cover.hide();
                    });
                    search.click(function(){
                        var map = iframe[0].contentWindow;
                        map.search($('#kindeditor_plugin_map_address').val());
                    });
                    $('body').append(this.dialog);
                    this.cover.show();
                },
                show:function(){
                    $('#insert-dynamic-map')[0].checked = false;
                    $('#map-dialog').show();
                    this.cover.show();
                }
            };
        });
    };
})(jQuery);


(function($) {
    $.fn.relationNews = function(options) {
        var defaults = {
            relationHidden:'relation-news-hidden'
        };
        var opts = $.extend(defaults, options);
        return this.each(function () {
            var me = $(this);
            var template = function(data, mode){
                var relation = '<div class="row"><div class="column">标题：<input type="text" class="text input-medium" value="'+data.title+'" /></div>' +
                    '<div class="column">链接：<input type="text" class="text input-medium" value="'+data.link+'" /></div>';
                if(mode == 'add'){
                    relation += '<div class="column"><a href="javascript:;" class="add">新增</a></div>'
                } else if(mode == 'delete'){
                    relation += '<div class="column"><a href="javascript:;" class="delete">删除</a></div>'
                } else {
                    relation += '<div class="column"><a href="javascript:;" class="delete">删除</a><a href="javascript:;" class="add">新增</a></div>'
                }
                return relation + '</div>';
            };
            var value = $('#'+opts.relationHidden).val(), data=[], count=0, tpl='';
            if(value != ''){
                data = JSON.parse(value);
                count = data.length;
                if(count > 1){
                    for(var i = 0; i < count; i++){
                        console.log('in');
                        if(i != count-1){
                            tpl +=template(data[i],'delete');
                        } else{
                            tpl +=template(data[i],'both');
                        }
                    }
                } else {
                    tpl = template(data[0],'add');
                }
            } else {
                tpl = template({title:'',link:''},'add');
            }
            me.delegate('a','click',function(){
                console.log('sdfds');
                var row = me.find('.row'), count = row.size(), index = $(this).parents('.row').index();
                console.log(count+":"+index);
                if($(this).hasClass('delete') ){
                    if(index == 0){
                        row.eq(index).remove();
                        if(count == 2){
                            row.last().find('a.delete').remove();
                        }
                    } else if(index == count - 1){
                        row.eq(index).remove();
                        if(count == 2){
                            row.first().find('a').after('<a href="javascript:;" class="add">新增</a></div>');
                            row.first().find('a.delete').remove();
                        } else {
                            row.eq(index-1).find('a').after('<a href="javascript:;" class="add">新增</a></div>');
                        }
                    } else {
                        row.eq(index).remove();
                    }
                } else {
                    if(index == 0){
                        $(this).after('<a href="javascript:;" class="delete">删除</a></div>');
                    }
                    $(this).remove();
                    me.append(template({title:'',link:''},'both'));
                }
            });
            me.append(tpl);
        });
    }
})(jQuery);

function setRelationNews(){
    var field = $('#relation-news-hidden'), rows = $('.relation-news-panel > .row'), data = [];
    rows.each(function(){
        var title = $.trim($(this).find('input:first').val());
        var link = $.trim($(this).find('input:last').val());
        if(title != '' && link != ''){
            //var encode = $('<div>').html(title).html();
            data.push({title : title, link : link.replace(/['|"]/g,'')});
        }
    });
    if(data.length != 0){
        field.val(JSON.stringify(data));
    } else {
        field.val('');

    }
}
