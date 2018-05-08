layui.use(['jquery','element','layer','validator','common','statusHelper','btable','laydate','laytpl'], function(){
	var $ = layui.jquery,
	element = layui.element,
	common = layui.common,
	laytpl = layui.laytpl;

	 $('#addCommentbtn').on('click', function() {
	 	alert("as");
		var content = $("#content").val();
		var questionId = $("#questionId").val();
		var params = {
			content:content,
			questionId:questionId
		};
		common.post("discuss/comment/add",params,function(data){
			if(data.code == 200){
				common.msgInfo("添加成功");
				if(typeof(parent.closeLayer)=="function"){
					parent.closeLayer();
				}

				parent.refreshData();

			}
			else{
				common.msgError("添加失败," + data.msg);
			}

			});
	  });

});

