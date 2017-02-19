/**
 * 
 */

var OrderTaskAdd = {
	addTask : function(flag,subTaskFlag) {
		Utils.ajax({
			url : basePath + "OrderTask/addTask.json",
			data : flag?$("#orderTaskInfo #orderTaskForm").parseKeyValue():$("#orderTaskForm").parseKeyValue()
		}).done(function(resp) {
			//控制发布任务按钮，防止同一任务的多次提交
			this.disabled = false;
			
			
			console.log(resp);
			if (resp.retcode == 0) {
				alert(resp.msg);
				var order = resp.data,
					id = null;
				if(order.parentId && order.parentId!='-1'){
					id = order.parentId;
				}
				if(!id){
					id = order.id;
				}
				if(id){
					if(subTaskFlag){
						window.location.href = basePath + "Page/orderDetail/"+id/subTaskFlag;
					}else{
						window.location.href = basePath + "Page/orderDetail/"+id
					}
					return;
				}
				window.location.href = basePath + "Page/mainPage.do";
			}
		});
	},
	loadTaskList : function() {
		Utils.ajax({
			url : basePath + "OrderTask/loadOrderTask"
		}).done(function(resp) {
			if (resp.retcode == 0) {
				alert("添加成功");
			}
			// console.log(resp);
		});
	},
	renderTypeList : function(callback) {
		var template = "<option value='{id}'>{name}</option>";
		OemGlobal.loadOrderType(function(resp) {
			var $dom = $("#selectType");
			for (var i = 0, length = resp.length; i < length; i++) {
				var data = resp[i];
				var $div = $(Utils.complier(template, data));
				$dom.append($div);
			}
			callback && callback();
		});
	},
	taskDetailUrl : basePath + "OrderTask/orderTaskDetail.json",
	showModifyContent : function() {
		Utils.ajax({
			url : OrderTaskAdd.taskDetailUrl,
			data : {
				orderId : orderId
			},
			type : 'post'
		}).done(function(resp) {
			var data = resp.data;
			$("#icon_img").attr("src", data.fileUrl);
			$("select,input,textarea").each(function(index, item) {
				var $item = $(item), name = $item.prop("name");
				$item.val(data[name]|| "");
			});
		});
	}
}
$(function() {
	// OrderTaskAdd.loadTaskList();
	OrderTaskAdd.renderTypeList(function() {
		/*
		 * if(orderId){ OrderTaskAdd.showModifyContent(); }
		 */
	});
	$("#addTaskBtn").click(function() {
		//控制发布任务按钮，防止同一任务的多次提交
		this.disabled = true;
		OrderTaskAdd.addTask();
	});
	OemGlobal.on("TASK_ADD_EVENT",function(){
		OrderTaskAdd.addTask(true);
	},this);
});