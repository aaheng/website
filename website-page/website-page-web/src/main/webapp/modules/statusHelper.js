layui.define(['layer'], function(exports) {
	"use strict";

	var $ = layui.jquery,
		layer = layui.layer;

	var statusHelper = {
		/**
		 * 获取订单状态
		 * @param {String} payStatus	订单支付状态
		 */
		getOrderStatus: function(payStatus) {
			var cont;
			if(payStatus == 0){
		    	cont = "已取消";
		    }
		    else if(payStatus == 1){
		    	cont = "待支付";
		    }
		    else if(payStatus == 2){
		    	cont = "支付失败";
		    }
		    else if(payStatus == 3){
		    	cont = "支付成功";
		    }
		    else if(payStatus == 4){
		    	cont = "已退款";
		    }
		    else if(payStatus == -1){
		    	cont = "已删除";
		    }
		    else{
		    	cont = "其他";
		    }
			
			return cont;
		},
		/**
		 * 获取办理状态
		 * @param status
		 */
		getInspectionStatus:function(status){	//六年免检审核状态
			
			var cont;
			if(status == 0){
				cont = "待审核";
			}
			else if(status == 1){
				cont = "预审核通过";
			}
			else if(status == 2){
				cont = "预审核失败";
			}
			else if(status == 3){
				cont = "制证成功";
			}
			else if(status == 4){
				cont = "制证失败";
			}
			else if(status == 5){
				cont = "主动撤单";
			}
			else{
				cont = "其他";
			}
			
			return cont;
		},
		getMailType:function(mailType){	//六年免检邮件类型
			if(mailType == 1){
				return "自助寄件";
			}
			else if(mailType == 2){
				return "蜜蜂箱寄件";
			}
			else if(mailType == 3){
				return "顺丰上门取件";
			}
			else if(mailType == 4){
				return "EMS上门取件";
			}
			else{
				return "无需寄件";
			}
		},
		getSfExpressStatus:function(status){//顺丰上门取件单状态
			if(status == 0){
				return "待下单";
			}
			else if(status == 1){
				return "下单成功";
			}
			else if(status == 2){
				return "下单失败";
			}
			else if(status == 3){
				return "已删除";
			}
			else if(status == 4){
				return "处理中";
			}
			else{
				return "其他";
			}
		},/**
		 * 车辆绑定类型类型
		 * @param type
		 */
		getSfExpressType:function(type){	
			
			var cont;
			if(type == 1){
				cont = "顺丰";
			}
			else if(type == 2){
				cont = "EMS";
			}
			
			return cont;
		},
		/**
		 * 是否为单位车
		 * @param isworkunit
		 */
		isDanWeiCar:function(isworkunit){
			if(isworkunit == 0){
		    	return "否";
		    }
		    else if(isworkunit == 1){
		    	return "是";
		    }
		},
		/**
		 * 订单类型
		 * @param type
		 */
		getOrderType:function(type){	
			
			var cont;
			if(type == 1){
				cont = "违法缴罚";
			}
			else if(type == 2){
				cont = "加油卡";
			}
			else if(type == 3){
				cont = "车辆年检";
			}
			else if(type == 4){
				cont = "补换证";
			}
			else if(type == 5){
				cont = "机动车业务";
			}
			else if(type == 6){
				cont = "广州车展门票";
			}
			else if(type == 7){
				cont = "线上年检";
			}
			return cont;
		},/**
		 * 车辆绑定类型类型
		 * @param type
		 */
		getBindVehicleType:function(type){	
			
			var cont;
			if(type == 0){
				cont = "自动绑定";
			}
			else if(type == 1){
				cont = "主动绑定";
			}
			
			return cont;
		},
		/**
		 * 订单状态
		 * @param status
		 */
		getOrderPayStatus:function(status){	
			
			var cont;
			if(status == -1){ 
				cont = "删除";
			}
			else if(status == 0){
				cont = "取消";
			}
			else if(status == 1){
				cont = "待支付";
			}
			else if(status == 2){
				cont = "支付失败";
			}
			else if(status == 3){
				cont = "支付成功";
			}
			else if(status == 4){
				cont = "已退款";
			}		
			return cont;
		},
		/**
		 * 订单来源
		 * @param source
		 */
		getOrderSource:function(source){	
			
			var cont;
			if(source == 1){
				cont = "邮政车务";
			}
			else if(source == 2){
				cont = "建行app";
			}	
			else if(source == 3){
				cont = "车行易";
			}	
			else if(source == 4){
				cont = "小车科技";
			}
			else if(source == 5){
				cont = "小马达";
			}
			return cont;
		},
		/**
		 * viewlog来源
		 * @param source
		 */
		getViewlogSource:function(source){	
			
			var cont;
			if(source == 1){
				cont = "邮政车务";
			}
			else if(source == 2){
				cont = "支付宝交通违法查询";
			}
			else if(source == 3){
				cont = "微信公众交通违法查询";
			}
			else if(source == 4){
				cont = "微信城市服务查询";
			}
			else if(source == 5){
				cont = "微信小程序";
			}
				
			return cont;
		},
		/**
		 * viewlog类型
		 * @param type
		 */
		getViewlogType:function(type){	
			
			var cont;
			if(type == 1){
				cont = "点击";
			}
			else if(type == 2){
				cont = "打开";
			}	
			else if(type == 3){
				cont = "关闭";
			}	
				
			return cont;
		},
		/**
		 * 保险信息类型
		 * @param type
		 */
		getInsuranceType:function(type){	
			
			var cont;
			if(type == 1){
				cont = "人保";
			}
			else if(type == 2){
				cont = "车低贷";
			}
			else if(type == 3){
				cont = "宝讯";
			}else if(type == 4){
				cont = "车天车地双12活动推广";
			}else if(type == 5){
				cont = "禾丽医美";
			}else if(type == 6){
				cont = "宝盈优惠券";
			}else if(type == 7){
				cont = "人人车";
			}			
			return cont;
		},
		/**
		 * 系统配置  是否可用
		 * @param enable
		 */
		getConfigEnable:function(enable){	
			
			var cont;
			if(enable == -1){
				cont = "必须(不可删)";
			}
			else if(enable == 0){
				cont = "不可用";
			}	
			else if(enable == 1){
				cont = "可用";
			}	
			else if(enable == 2){
				cont = "可用并可点击";
			}	
				
			return cont;
		},
		/**
		 * APITOKEN  是否可用
		 * @param enable
		 */
		getToeknEnable:function(enable){	
			
			var cont;
			 if(enable == 0){
				cont = "不可用";
			}	
			else if(enable == 1){
				cont = "可用";
			}	
						
			return cont;
		},
		/**
		 * APITOKEN  业务
		 * @param enable
		 */
		getToeknBusiness:function(enable){	
			
			var cont;
			 if(enable == 1){
				cont = "订单业务";
			}	
			else if(enable == 2){
				cont = "保险信息采集";
			}	
			else if(enable == 3){
				cont = "广告栏点击记录";
			}	
						
			return cont;
		},
		/**
		 * banner类型
		 * @param type
		 */
		getBannerType:function(type){	
			
			var cont;
			if(type == 1){
				cont = "不符合人保";
			}
			else if(type == 2){
				cont = "符合人保";
			}	
			else if(type == 3){
				cont = "全局显示";
			}	
			else if(type == -1){
				cont = "其他渠道";
			}	
			return cont;
		},
		/**
		 * 系统日志类型
		 * @param type
		 */
		getSysLogType:function(type){	
			
			var cont;
			if(type == 1){
				cont = "操作日志";
			}
			else if(type == 2){
				cont = "数据导入日志";
			}	
				
			return cont;
		},
		/**
		 * 保险信息来源
		 * @param source
		 */
		getInsuranceSource:function(source){	
			
			var cont;
			if(source == 1){
				cont = "邮政车务";
			}
			else if(source == 2){
				cont = "微信小程序";
			}
				
			return cont;
		},
		/**
		 * 机动车业务种类
		 * @param type
		 */
		getVehTypes:function(type){	
			
			var cont;
			if(type == 201){
				cont = "补领号牌";
			}else if(type == 202){
				cont = "换领号牌";
			}else if(type == 204){
				cont = "补领行驶证";
			}else if(type == 205){
				cont = "换领行驶证";
			}else if(type == 206){
				cont = "换领登记证书";
			}else if(type == 207){
				cont = "补领检验合格标志";
			}else if(type == 208){
				cont = "换领检验合格标志";
			}else if(type == 209){
				cont = "委托核发检验合格标志";
			}
				
			return cont;
		},
		/**
		 * 户籍类型
		 * @param type
		 */
		getOwnerlocation:function(type){	
			var cont;
			if(type == 0){
				cont = "非本市户籍";
			}
			else if(type == 1){
				cont = "本市户籍";
			}	
				
			return cont;
		},
		/**
		 * 字典类型
		 * @param type
		 */
		getDictionaryType:function(type){	
			var cont;
			if(type == 1){
				cont = "普通字典";
			}
			else if(type == 2){
				cont = "菜单字典";
			}	
				
			return cont;
		},
		/**
		 * 车辆信息收藏夹类型
		 * @param type
		 */
		getVehinfoType:function(type){	
			var cont;
			if(type == 1){
				cont = "车辆";
			}
			else if(type == 2){
				cont = "驾驶证";
			}	
				
			return cont;
		},
		/**
		 * 推广推送目标类型
		 * @param type
		 */
		getSpreadType:function(type){	
			var cont;
			if(type == 1){
				cont = "支付宝用户id";
			}else if(type == 2){
				cont = "身份证号";
			}else if(type == 3){
				cont = "手机号";
			}	
			
			return cont;
		},
		/**
		 * 推广推送业务类型
		 * @param type
		 */
		getSpreadBusinessType:function(type){	
			var cont;
			if(type == 1){
				cont = "违章card";
			}
			else if(type == 2){
				cont = "六年免检card";
			}
				
			return cont;
		},
		/**
		 * 推广推送推送状态
		 * @param status
		 */
		getSpreadStatus:function(status){	
			var cont;
			if(status == 0){
				cont = "未推送";
			}
			else if(status == 1){
				cont = "已推送";
			}	
				
			return cont;
		},
		/**
		 * 门票类型
		 * @param status
		 */
		getTicketType:function(type){	
			var cont;
			if(type == 1){
				cont = "专业票 ";
			}
			else if(type == 2){
				cont = "公众票";
			}	
				
			return cont;
		},
		/**
		 * 门票使用状态
		 * @param status
		 */
		getTicketIsused:function(isused){	
			var cont;
			if(isused == 0){
				cont = "未使用 ";
			}
			else if(isused == 1){
				cont = "已使用";
			}	
				
			return cont;
		},
		/**
		 * 门票类型
		 * @param status
		 */
		getTicketT:function(type){	
			var cont;
			if(type == 1){
				cont = "电子票 ";
			}
			else if(type == 2){
				cont = "实体票";
			}	
				
			return cont;
		},
		/**
		 * 门票寄件状态
		 * @param status
		 */
		getTicketIssend:function(issend){	
			var cont;
			if(issend == 0){
				cont = "未寄件 ";
			}
			else if(issend == 1){
				cont = "已寄件";
			}	
			else if(issend == -1){
				cont = "无须寄件";
			}	
				
			return cont;
		},
		/**
		 * 收件状态
		 * @param status
		 */
		getMailget:function(t){	
			var cont;
			if(t == 0){
				cont = "未收到 ";
			}
			else if(t == 1){
				cont = "已收齐";
			}	
			else if(t == 2){
				cont = "未收齐";
			}	
				
			return cont;
		},
		/**
		 * 资料补充
		 * @param status
		 */
		getIssupply:function(t){	
			var cont;
			if(t == 0){
				cont = "未补充 ";
			}
			else if(t == 1){
				cont = "已补充";
			}	
			
			return cont;
		},
		/**
		 * 在线免检状态
		 * @param status
		 */
		getOLStatus:function(t){	
			var cont;
			if(t == 0){
				cont = "待审核 ";
			}
			else if(t == 1){
				cont = "上传失败";
			}
			else if(t == 2){
				cont = "下单成功";
			}
			else if(t == 3){
				cont = "等待派单";
			}
			else if(t == 4){
				cont = "派单成功";
			}
			else if(t == 5){
				cont = "代办已接单";
			}
			else if(t == 6){
				cont = "代办资料待审核";
			}
			else if(t == 7){
				cont = "代办已取消";
			}
			else if(t == 8){
				cont = "制证成功";
			}
			else if(t == 9){
				cont = "制证失败";
			}
			else if(t == 10){
				cont = "主动撤单";
			}
			return cont;
		},
		/**
		 * 线上年检服务类型
		 * @param status
		 */
		getOLType:function(t){	
			var cont;
			if(t == 1){
				cont = "自驾前往检测站 ";
			}
			else if(t == 2){
				cont = "上门取还车";
			}	
			
			return cont;
		},
		/**
		 * 保险业务是否提醒
		 * @param status
		 */
		getInsuranceRemind:function(t){	
			var cont;
			if(t == 1){
				cont = "已提醒 ";
			}
			else if(t == 0){
				cont = "未提醒";
			}else{
				cont ="";
			}	
			
			return cont;
		},
		/**
		 * 卡券
		 * @param status
		 */
		getCouponType:function(t){	
			var cont;
			if(t == 1){
				cont = "满减 ";
			}
			else{
				cont ="";		}	
			
			return cont;
		},
		getCouponProduct:function(t){	
			var cont;
			if(t == 1){
				cont = "宝盈优惠卷 ";
			}
			else{
				cont ="";
			}	
			
			return cont;
		},
		getCouponStatus:function(t){	
			var cont;
			if(t == 1){
				cont = "已启用 ";
			}
			else if(t == 0){
				cont = "未启用";
			}else{
				cont ="";
			}	
			
			return cont;
		},
		getEnableStatus:function(t){	
			var cont;
			if(t == 1){
				cont = "启用 ";
			}
			else if(t == 0){
				cont = "禁用";
			}else{
				cont ="";
			}	
			
			return cont;
		}
	};

	exports('statusHelper', statusHelper);
});