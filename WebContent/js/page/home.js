/**
 * 
 */

var Home = {
		orderTaskListUrl:basePath+"OrderTask/loadOrderTask.json",
		loadOrderTaskList:function(){
			Utils.ajax({
				url:Home.orderTaskListUrl,
				type:'post'
			}).done(function(resp){
				if(resp.retcode==0){
					var dataList = resp.dataList;
					new Table({
						colume:orderTaskList_colume,
						dataList:dataList,
						$el:$("#orderTaskList")
					})
				}
			});
		}
		
};

$(function(){
	Home.loadOrderTaskList();
});