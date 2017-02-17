
var RecomPage = {
	TYPE_TEMPLATE:'<a style="left:14px;width:300px;margin-top:10px;margin-bottom:10px;" href="javascript:void(0)" onclick="RecomPage.loadTaskList(\'{id}\');" class="list-group-item text-center">{name}</a>',
	TASK_TEMPLATE:['<div class="col-md-4">',
					'<div class="panel panel-default" style="height:180px;">',
					'<div class="panel-heading"><h4><i class="fa fa-fw fa-check"></i>{orderName}</h4></div>',
					'<h4>{introduce}</h4>',
					'<p><font color=red>{money}'+i18n('unit')+'</font></p>',
					'<a class="btn btn-default" href="'+basePath+'Page/orderDetail/{id}">详情</i></a>',
					'</div>',
					'</div>'].join(''),
	CURRENT_INDEX:0,
	renderTypeList:function(){
		OemGlobal.loadOrderType(function(resp){
			var $dom = $("#recContentDiv");
			resp.splice(0,0,{id:0,name:i18n('recomm')});
			for(var i=0,length=resp.length;i<length;i++){
				var data = resp[i];
				var $div = $(Utils.complier(RecomPage.TYPE_TEMPLATE,data));
				if(i==RecomPage.CURRENT_INDEX){
					$div.addClass("active");
				}
				$dom.append($div);
			}
		});
	},
	loadTaskList:function(type){
		var data = {
				url : basePath + "OrderTask/loadOrderTask.json",
				type:"post",
				dataType:"json"
			};
		if(type){
			var param = {taskType:type};
			data.data = param;
		}
		Utils.ajax(data).done(function(resp) {
// if (resp.retcode == 0) {
				var jsonData = resp.dataList;
				RecomPage.render(jsonData);
// }
		});
	},
	/**
	 * 渲染数据
	 */
	render:function(dataList){
		if(RecomPage.list){
			RecomPage.list.renderDataList(dataList);
		}else{
			RecomPage.list = new List({
				$el:$('#recContentDiv'),
				template:RecomPage.TASK_TEMPLATE,
				dataList:dataList
			});
		}
	},
};
$(function(){
	RecomPage.loadTaskList();
	RecomPage.renderTypeList();
});