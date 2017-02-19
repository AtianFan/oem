OemGlobal.on("TASK_DETAIL_LOAD_SUCCESS_EVENT",function(resp){
	$("#form-addfile-control").click(function() {
		$("#form-file-iframe").show();
	});
	$("#addTaskBtn").click(function() {
		OemGlobal.emit("TASK_ADD_EVENT",true);
	});
	$("#cancleTaskBtn").click(function() {
		window.location.href = basePath+"Page/mainPage";
		//history.go(-1);
	});
	window.initFileList(resp.data.sysFileList);
},this);

OemGlobal.on("MODIFY_STATUS_EVENT",function(status){
	/*$("#form-addfile-control").click(function() {
		$("#form-file-iframe").show();
	});*/
	$("#selectType").val(status);
//	$("#addTaskBtn").click(function() {
//		OemGlobal.emit("TASK_ADD_EVENT");
//	});
},this);