/** BTable.js By Beginner Emain:zheng_jinfan@126.com HomePage:http://www.zhengjinfan.cn */
layui.define(['element', 'common', 'paging', 'form','laytpl'], function (exports) {
    "use strict";
    var $ = layui.jquery,
        layerTips = parent.layer === undefined ? layui.layer : parent.layer,
        layer = layui.layer,
        element = layui.element,
        common = layui.common,
        paging = layui.paging(),
        form = layui.form,
        laytpl = layui.laytpl;
    
    var curData;	//保存当前数据

    var BTable = function () {
		/**
		 *  默认配置 
		 */
        this.config = {
            elem: undefined, //容器
            //data: undefined, //数据源
            columns:[],
            url: undefined, //数据源地址
            type: 'POST', //读取方式
            params:{},	//附加参数
            even: false, //是否开启偶数行背景
            skin: undefined, //风格样式 ，可选参数 line/row/nob
            field: 'id',//主键属性名
            paged: false, //是否显示分页组件
            singleSelect: false, //是否只能选择一行
            checkbox: true, //显示多选
            num:true,	//显示第几行
            operate:false,	//是否添加操作按钮
            tempOpera:null, //操作模板
            operateSuc:undefined,	//按钮成功回掉
            onDataLoaded:undefined	//数据加载完成回调
        };
        this.v = '1.0.1';
    };
	/**
	 * 配置BTable
	 * @param {Object} options
	 */
    BTable.prototype.set = function (options) {
        var that = this;
        $.extend(true, that.config, options);
        return that;
    };
    
    BTable.prototype.setParams = function (options) {
    	var that = this;
    	that.config.params = options;
    	return that;
    };
    
	/**
	 * 渲染table
	 */
    BTable.prototype.render = function () {
        var that = this;
        var _config = that.config;
        
        var columns = _config.columns;
        var th = '';
        for (var i = 0; i < columns.length; i++) {
            th += '<th width="'+columns[i].width+'">' + columns[i].fieldName + '</th>';
        }
        
        if(_config.operate){
        	th += '<th width="150">操作</th>';
        }
        
        if (_config.num) {
        	th = '<th width="30">序号</th>' +th;
        }
        
        if (_config.checkbox && !_config.singleSelect) {
            th = '<th style="width:28px;"><input type="checkbox" lay-filter="allselector" lay-skin="primary" /></th>' + th;
        } else if (_config.checkbox) {
            th = '<th style="width:28px;">#</th>' + th;
        }
        
        var tpl = '<div class="btable site-table">';
        if (_config.skin !== undefined && (_config.skin === 'line' || _config.skin === 'row' || _config.skin === 'nob') && _config.even) {
            tpl += '<table class="layui-table layui-form" lay-even lay-skin="' + _config.skin + '">';
        } else if (_config.skin !== undefined && (_config.skin === 'line' || _config.skin === 'row' || _config.skin === 'nob')) {
            tpl += '<table class="layui-table layui-form" lay-skin="' + _config.skin + '">';
        } else if (_config.even) {
            tpl += '<table class="layui-table layui-form" lay-even>';
        } else {
            tpl += '<table class="layui-table layui-form">';
        }
        tpl += '<thead><tr>' + th + '</tr></thead>';
        tpl += '<tbody class="btable-content"></tbody>';
        tpl += '</table>';
        if (_config.paged) {
            tpl += '<div data-type="paged" class="btable-paged"></div>';
        }
        tpl += '</div>';

        $(_config.elem).html(tpl);
        paging.init({
            url: _config.url, //地址
            elem: '.btable-content', //内容容器
            type: _config.type,
            params:_config.params,
            openWait:true,
            paged: _config.paged,
            pageConfig: { //分页参数配置
                skip:true,
                elem: $(_config.elem).find('div[data-type=paged]'),//'#paged', //分页容器
                pageSize: _config.pageSize || 15 //分页大小
            },
            success: function (data) { //完成的回调
            	curData = data;
            	
            	//创建模板
            	var tpl = getTpl({
                    columns: _config.columns,
                    checkbox: _config.checkbox,
                    num: _config.num,
                    field: _config.field,
                    operate:_config.operate,
                    tempOpera:_config.tempOpera
                },curData);
            	
            	$(".btable-content").html(tpl);
                
            	if(_config.checkbox){
            		//重新渲染复选框
                    form.render('checkbox');
                    form.on('checkbox(allselector)', function (data) {
                        var elem = data.elem;

                        $(_config.elem).find('tbody.btable-content').children('tr').each(function () {
                            var $that = $(this);
                            //全选或反选
                            $that.children('td').eq(0).children('input[type=checkbox]')[0].checked = elem.checked;
                            form.render('checkbox');
                        });
                    });
                    
                    //绑定选择行事件
                    $(_config.elem).find('tbody.btable-content').children('tr').each(function (e) {
                        //e.preventDefault();
                        //e.stopPropagation();

                        var $that = $(this);
                        $that.on('click', function () {
                            //只允许选择一行
                            if (_config.singleSelect) {
                                $that.siblings().each(function () {
                                    $(this).children('td').eq(0).children('input[type=checkbox]')[0].checked = false;
                                });
                                $that.children('td').eq(0).children('input[type=checkbox]')[0].checked = true;
                            } else {
                                //获取当前的状态
                                var currState = $that.children('td').eq(0).children('input[type=checkbox]')[0].checked;
                                $that.children('td').eq(0).children('input[type=checkbox]')[0].checked = !currState;

                                //当前已选择的总行数
                                var cbxCount = 0;
                                $that.parent('tbody').children('tr').each(function () {
                                    var $that = $(this);
                                    if ($that.children('td:first-child').children('input')[0].checked) {
                                        cbxCount++;
                                    }
                                });
                                $(_config.elem).find('thead').children('tr').children('th:first-child').children('input[type=checkbox]')[0].checked =
                                    $that.parent('tbody').children('tr').length === cbxCount;
                            }
                            form.render('checkbox');
                        });
                    });
            	}
            	
            	if(_config.operate){
            		$(_config.elem).find('tbody.btable-content').children('tr').each(function (e) {
                        var $that = $(this);
                        var btn = $that.children('td:last-child').children('.layui-btn');
                        btn.on('click', function () {
                        	_config.operateSuc({
                    			data:curData.list[$that.data('id')],
                    			op:$(this).data('op')
                    		});
	            		});
            		});
            	}
            	
            	if(typeof(_config.onDataLoaded)!="undefined"){
            		_config.onDataLoaded(data);
            	}
            },
            fail:function(err){
            	common.msgError(err);
            }
        });
        return that;
    };
	/**
	 * 获取选择的行。
	 */
    BTable.prototype.getSelected = function (callback) {
        var that = this;
        var _config = that.config;
        if (!_config.singleSelect)
            return callback({});
        var $tbody = $(_config.elem).find('tbody.btable-content');
        $tbody.children('tr').each(function () {
        	var $that = $(this);
        	if(_config.checkbox){
                var $input = $that.children('td:first-child').children('input')
                if ($input[0].checked) {
                    callback(curData.list[$input.data('id')]);
                }
        	}
        	else{
        		callback(null);
        	}
        });
        return that;
    };
	/**
	 * 获取选择的所有行数据
	 */
    BTable.prototype.getSelections = function (callback) {
        var that = this;
        var _config = that.config;
        var $tbody = $(_config.elem).find('tbody.btable-content');
        var dom = [];
        var items = [];
        var index = 0;
        $tbody.children('tr').each(function () {
            var $that = $(this);
            var $input = $that.children('td:first-child').children('input')
            if ($input[0].checked) {
                //dom[index] = $that;
                items[index] = curData.list[$input.data('id')];
                index++;
            }
        });
        /*return callback({
            elem: dom,
            ids: ids,
            count: dom.length
        });*/
        return callback(items);
    };

	/**
	 * 获取模板
	 * @param {Object} options
	 * @param {Object} data	数据
	 */
    function getTpl(options,data) {
        var columns = options.columns;
        var tpl = '';
        if(data.list != undefined && data.list != null && data.list.length>0){
        	for(var i=0;i<data.list.length;i++){
        		var rowData = data.list[i];
        		var tds = '';
        		for (var j = 0; j < columns.length; j++) {
        			if(typeof(rowData[columns[j].field])!="undefined"){
        				if(typeof(columns[j].formatter)!="undefined"){
            				tds += '<td>'+columns[j].formatter(rowData[columns[j].field],rowData)+'</td>';
                    	}
            			else{
            				tds += '<td>'+rowData[columns[j].field]+'</td>';
            			}
    				}
        			else{
        				tds += '<td></td>';
        			}
        			
        		}
        		
        		if(options.operate){
                	if(options.tempOpera != null){
                		tds += '<td>'+options.tempOpera+'</td>';
                	}
                	else{
                		tds += '<td></td>';
                	}
                }
                
                if (options.num) {
                	tds = '<td width="25">'+(i+1)+'</td>' + tds;
                }
                
                if (options.checkbox) {
                    tds = '<td><input type="checkbox" data-id="'+i+'" lay-skin="primary" /></td>' + tds;
                } else {
                    tds = '<td style="display:none;"><input type="hidden" data-id="'+i+'" /></td>' + tds;
                }
                
                tpl += '<tr data-id="'+i+'">' + tds + '</tr>'
        	}
        	
        }
        else{
        	var colLength = options.checkbox && !options.singleSelect ? columns.length + 1 : columns.length;
            tpl += '<tr col="' + colLength + '">暂无数据.</tr>';
        }
        
        return tpl;
    }

    var btable = new BTable();

    exports('btable', function (options) {
        return btable.set(options);
    });
});