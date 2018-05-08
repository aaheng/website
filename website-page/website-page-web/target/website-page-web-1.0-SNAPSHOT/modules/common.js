layui.define(['layer'], function(exports) {
	"use strict";

	var $ = layui.jquery,
		layer = layui.layer;

	var common = {
		/**
		 * 抛出一个异常错误信息
		 * @param {String} msg
		 */
		throwError: function(msg) {
			throw new Error(msg);
			return;
		},
		/**
		 * 弹出一个错误提示
		 * @param {String} msg
		 */
		msgError: function(msg) {
			layer.msg(msg, {
			  offset:'50%',
			  icon: 5,
			  time: 2000
			});
			return;
		},
		/**
		 * 弹出一个信息提示
		 * @param {String} msg
		 */
		msgInfo: function(msg) {
			layer.msg(msg, {
				offset:'50%',
				icon: 1,
				time: 2000
			});
			return;
		},
		/**
		 * 弹出一个输入框
		 * @param {String} msg
		 */
		msgPrompt:function(title,yesback){
			layer.prompt({
  			  formType: 2,
  			  title: title,
  			  offset:'20%'
  			},function(value, index, elem){
  			  yesback(index,value);
  			  layer.close(index);
  			});
		},
		/**
		 * 弹出一个确认框
		 * @param {String} msg
		 */
		confirmMsg:function(msg,yesback,noback,cancel){
			if(typeof(cancel)=="undefined"||cancel==""){
			layer.confirm(msg, 
				{
					btn: ['确定', '取消'],
					offset:'25%'
				}, 
				function(index, layero){
					yesback(index,layero);
					layer.close(index);
				}, 
				function(index,layero){
					noback(index,layero);
				});
			}else{
			layer.confirm(msg,
				{
					btn: ['确定', cancel],
					offset:'25%'
				}, 
				function(index, layero){
					yesback(index,layero);
					layer.close(index);
				}, 
				function(index,layero){
					noback(index,layero);
				});
			}
		},
		post:function(url,params,success,showLoad){
			var _self = this;
			var index;
			$.ajax({  
	             url: url,
	             type: 'POST',  
	             dataType: 'json',  
	             timeout: 100000,  
	             cache: false,  
	             data:params,
	             beforeSend: function(){
	            	 if("undefined" == typeof showLoad || showLoad){
	            		 index = layer.msg('努力查询中…', {icon: 16,shade: [0.5,'#f5f5f5'],scrollbar: false,offset: '50%',time:100000});
	            	 }
	             }, 
	             error: function(){
	            	 _self.msgError("请求失败");
	             }, 
	             success: function(result){
	             	console.dir(result);
	             	if(result.code == 200){
	             		success(result.result);
	             	}
	             	else{
	             		_self.msgError(result.msg);
	             	}
	             },
	             complete:function(){
	            	 if("undefined" == typeof showLoad || showLoad){
	            		 layer.close(index);
	            	 }
	             }
	        });
		},
		isImage: function (type) {	//判断是否为图片
            if ('|jpg|png|jpeg|'.indexOf(type.toLowerCase()) !== -1) {
				return true;
			} else {
				return false;
			}
        },
        getFileType: function (fileName) {	//获取文件后缀类型
            return '|' + fileName.slice(fileName.lastIndexOf('.') + 1) + '|';
        },
        compress:function(source_img_obj, quality, output_format){	//source_img_obj Image对象，quality压缩百分数，output_format base64字符串
        	var mime_type = "image/jpeg";  
			if(output_format!=undefined && output_format=="png"){  
				mime_type = "image/png";  
			}  
			var cvs = document.createElement('canvas');  
			//naturalWidth真实图片的宽度  
			//cvs.width = source_img_obj.naturalWidth;  
			//cvs.height = source_img_obj.naturalHeight; 
			//var xRate = 1;
			//var yRate = 1;
			
			
			if(source_img_obj.naturalWidth <= 1280 && source_img_obj.naturalHeight <= 1280) {
				return source_img_obj.src
			}
			
			if(source_img_obj.naturalWidth > source_img_obj.naturalHeight){
				cvs.width = 1280;  
				var xRate = cvs.width / source_img_obj.naturalWidth;  
				var yRate = xRate;
				cvs.height = source_img_obj.naturalHeight*yRate;
			}else{
			
				cvs.height = 1280;	//画布固定高度
				var yRate = cvs.height / source_img_obj.naturalHeight;  
				var xRate = yRate;
				cvs.width = source_img_obj.naturalWidth*xRate;
			}
			  
		
//			var xRate = 1;
//			var yRate = 1;
			var cvsContext = cvs.getContext('2d');  
			cvsContext.scale(xRate, yRate);  
			cvsContext.drawImage(source_img_obj, 0, 0);
			var newImageData;
			if(quality == 0){
				newImageData = cvs.toDataURL(mime_type); 
			}
			else{
				newImageData = cvs.toDataURL(mime_type, quality/100); 
			}
			
			return newImageData;
        },
        genTimestamp: function () {
            var time = new Date();
            return time.getTime();
        },
        getBaseImgUrl: function () {
            return 'http://172.18.190.166:9394';
        }
	};

	exports('common', common);
});