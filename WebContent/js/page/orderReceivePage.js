/**
 * 
 */

var ReceiveOrderPage = {
	loadReveiveTaskList:function(){
		Utils.ajax({
			url:basePath+"SysUser/loadUserInfo.json",
			data:{pageNo:"1"},
			type:"post",
			dataType:"json"
		}).done(function(resp){
			if (resp.retcode == 0) {
				var jsonData = resp.dataList;
				var pageInfo = resp.pageView;
				ReceiveOrderPage.initTable(jsonData,pageInfo);
			}
		});
	},
	initTable:function(jsonData,pageInfo) {
		var html = '<table id="receiveTaskTable" border=1>';
		html += '<thead><tr>';
		html += '<td>id</td>';
		html += '<td>nickName</td>';
		html += '<td>status</td>';
		html += '<td>delFlag</td>';
		html += '<td>type</td>';
		html += '<td></td>';
		html += '</tr></thead>';

		for ( var j in jsonData) {
			var obj = jsonData[j];
			objUserInfo = obj;
			var str;
			if(obj.status=="0"){
				str = "已激活"
			}else{
				str = "未激活"
			}
			html += '<tr>';
			html += '<td>' + obj.id + '</td>';
			html += '<td>' + obj.nickName + '</td>';
			html += '<td>' + str + '</td>';
			html += '<td>' + obj.delFlag + '</td>';
			html += '<td>' + obj.type + '</td>';
			html += '<td><input type="button" id="btn_delete" value="注销" onclick="ReceiveOrderPage.deleteAndActiveUserInfo(\''+obj.id+'\',\''+obj.type+'\',\''+1+'\')"/></td>';
			html += '<td><input type="button" id="btn_active" value="激活" onclick="ReceiveOrderPage.deleteAndActiveUserInfo(\''+obj.id+'\',\''+obj.type+'\',\''+0+'\')"/></td>';
			html += '<td><input type="button" id="btn_detail" value="详情" onclick="ReceiveOrderPage.userInfoDetail(objUserInfo)"/></td>';
			html += '</tr>';
		}
		html += '</table>';
		$('#receiveContainer').append(html);
		$('#receiveTaskTable').bdt({
			pageCount:pageInfo.pageTotal,
			pageRowCount:pageInfo.pageSize,
			tableFooter:'receive-table',
	        showSearchForm: 0,
	        showEntriesPerPageField: 0
	    });
	},
	
	deleteAndActiveUserInfo:function(userId,userType,operateType){
		//operateType操作类型 0：删除 ，1：激活
		Utils.ajax({
			url:basePath+"SysUser/deleteAndActiveUserInfo.json",
			data:{id:userId,type:userType,operateType:operateType},
			type:"post",
			dataType:"json"
		}).done(function(resp){
			if (resp.retcode == 0) {
				alert("删除成功！")
				$('#receiveContainer').html("");
				ReceiveOrderPage.loadReveiveTaskList();
			}
		});
	},
	
	userInfoDetail:function(userInfo){
		var a = userInfo;
	},
	
	updataUserInfo:function(userId){
		Utils.ajax({
			url:basePath+"SysUser/deleteUserInfo.json",
			data:{id:userId,type:userType},
			type:"post",
			dataType:"json"
		}).done(function(resp){
			if (resp.retcode == 0) {
				alert("删除成功！")
				$('#receiveContainer').html("");
				ReceiveOrderPage.loadReveiveTaskList();
			}
		});
	},
};
$(function(){
	var objUserInfo;
	ReceiveOrderPage.loadReveiveTaskList();
});