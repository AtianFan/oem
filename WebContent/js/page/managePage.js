/**
 * 
 */

var ManagePage = {
	loadAllUser:function(){
		Utils.ajax({
			url:basePath+"SysUser/loadUserInfo.json",
			data:{pageNo:"1"}
		}).done(function(resp){
			if (resp.retcode == 0) {
				var jsonData = resp.dataList;
				var pageInfo = resp.pageView;
				ManagePage.initTable(jsonData,pageInfo);
			}
		});
	},
	initTable:function(jsonData,pageInfo) {
		var html = '<table id="userTable" class="text-center" border=1>';
		html += '<thead><tr>';
		html += '<td>id</td>';
		html += '<td>loginName</td>';
		html += '<td>nickName</td>';
		html += '<td>status</td>';
		html += '<td>type</td>';
		html += '<td colspan=3></td>';
		html += '</tr></thead>';

		for ( var j in jsonData) {
			obj = jsonData[j];
			if (obj.status == 0){
				var status = "已激活";
			} else {
				var status = "已注销";
			}
			html += '<tr>';
			html += '<td>' + obj.id + '</td>';
			html += '<td>' + obj.loginName + '</td>';
			html += '<td>' + obj.nickName + '</td>';
			html += '<td>' + status + '</td>';
			html += '<td>' + obj.type + '</td>';
			html += '<td><input type="button" id="btn_delete" value="注销" onclick="ManagePage.deleteAndActiveUserInfo(\''+obj.id+'\',\''+obj.type+'\',\''+1+'\')"/></td>';
			html += '<td><input type="button" id="btn_active" value="激活" onclick="ManagePage.deleteAndActiveUserInfo(\''+obj.id+'\',\''+obj.type+'\',\''+0+'\')"/></td>';
			html += '<td><input type="button" id="btn_detail" value="详情" onclick="ManagePage.userInfoDetail(obj)"/></td>';
			html += '</tr>';
		}
		html += '</table>';
		$('#container').append(html);
		$('#userTable').bdt({
			pageCount:pageInfo.pageTotal,
			pageRowCount:pageInfo.pageSize,
			tableFooter:'user-table',
	        showSearchForm: 0,
	        showEntriesPerPageField: 0
	    });
	},
	loadTaskList:function(){
		Utils.ajax({
			url:basePath+"OrderTask/loadOrderTask.json"
		}).done(function(resp){
			if (resp.retcode == 0) {
				var jsonData = resp.dataList;
				var pageInfo = resp.pageView;
				ManagePage.initTaskTable(jsonData,pageInfo);
			}
		});
	},
	initTaskTable:function(jsonData,pageInfo) {
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
		$('#taskContainer').append(html);
		$('#taskTable').bdt({
			pageCount:pageInfo.pageTotal,
			pageRowCount:pageInfo.pageSize,
			tableFooter:'task-table',
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
				alert("删除成功！");
				$('#container').html("");
				ManagePage.loadAllUser();
			}
		});
	},
	userInfoDetail:function(userInfo){
		window.location.href=basePath+"Page/modifyUserInfo";
//		ModifyUser.findUser(userInfo);
	},
	updataUserInfo:function(userId){
		Utils.ajax({
			url:basePath+"SysUser/deleteUserInfo.json",
			data:{id:userId,type:userType},
			type:"post",
			dataType:"json"
		}).done(function(resp){
			if (resp.retcode == 0) {
				alert("激活成功！");
				$('#container').html("");
				ManagePage.loadAllUser();
			}
		});
	}
};
$(function(){
	var obj;
	ManagePage.loadAllUser();
	ManagePage.loadTaskList();
});