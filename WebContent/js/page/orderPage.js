/**
 * 
 */

var OrderPage = {
	loadTaskList:function(){
		Utils.ajax({
			url:basePath+"OrderTask/loadOrderTask.json"
		}).done(function(resp){
			if (resp.retcode == 0) {
				var jsonData = resp.dataList;
				var pageInfo = resp.pageView;
				OrderPage.initTable(jsonData,pageInfo);
			}
		});
	},
	initTable:function(jsonData,pageInfo) {
		var html = '<table id="taskTable" border=1>';
		html += '<thead><tr>';
		html += '<td>id</td>';
		html += '<td>taskNumber</td>';
		html += '<td>creatTime</td>';
		html += '<td>status</td>';
		html += '<td>money</td>';
		html += '</tr></thead>';

		for ( var j in jsonData) {
			var obj = jsonData[j];
			html += '<tr>';
			html += '<td>' + obj.id + '</td>';
			html += '<td>' + obj.orderNumber + '</td>';
			html += '<td>' + obj.creatTime + '</td>';
			html += '<td>' + obj.status + '</td>';
			html += '<td>' + obj.money + '</td>';
			html += '</tr>';
		}
		html += '</table>';
		$('#container').append(html);
		$('#taskTable').bdt({
			pageCount:pageInfo.pageTotal,
			pageRowCount:pageInfo.pageSize,
			tableFooter:'task-table',
	        showSearchForm: 0,
	        showEntriesPerPageField: 0
	    });
	}
};
$(function(){
	OrderPage.loadTaskList();
});