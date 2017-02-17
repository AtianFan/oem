/**
 * 
 */

$.fn.parseKeyValue = function() {
	var map = {};
	this.find("input,textarea,select").each(function(index, el) {
		var nameValue = $(el).prop("name");
		if (nameValue) {
			map[nameValue] = this.value+"";
		}
	});
	return map;
}
$.fn.showMessage = function(msg, $el) {
	var $msg = $(this).find(".ui-message");
	if ($msg.length == 0) {
		$msg = $("<div class='ui-message'></div>");
		$msg.appendTo($el || $(this) || $("body"))
	}
	$msg.text(msg).show();
}
$.showMessage = function(msg){
	
};
if(typeof HTMLElement!=="undefined")
HTMLElement.prototype.showMessage = function(msg) {
	var $msg = this.find(".ui-message");
	if (!$msg) {
		$msg = $("<div class='ui-message'></div>");
		$msg.append($(this));
	}
	$msg.text(msg).show();
}
function isPic(fileUrl){
	var extStart=fileUrl.lastIndexOf(".");
	var ext=fileUrl.substring(extStart,fileUrl.length).toUpperCase();
	return (ext==".BMP" || ext==".PNG" || ext == ".GIF" || ext==".JPG" || ext==".JPEG")
}
window.iframe_load_id = 1;
window.initFileList = function(fileList){
	if(!fileList || fileList.length<=0){
		return;
	}
	var value = $("#form-input-file").val();
	for(var i=0,len=fileList.length;i<len;i++){
		var file = fileList[i],fileId = file.id;
		if(!value){
			value = fileId;
		}else{
			value +=","+fileId;
		}
		window.initFile(file.id,file.fileUrl,file.originName);
	}
	$("#form-input-file").val(value);
	$(".delete_file").unbind("click");
	$(".delete_file").click(function(){
		var $this = $(this),
			id = $this.data("id"),
			fileIds = $("#form-input-file").val(),
			resultArray = [];
		var file_ids = fileIds.split(",");
		file_ids.forEach(function(i){
			if(id!=i){
				resultArray.push(i);
			}
		});
		$("#form-input-file").val(resultArray.join(","));
		$(".file_el_"+id).remove();
		var deleteFileIds = $("#deleteFileIds").val();
		if($("#deleteFileIds").length && deleteFileIds.indexOf(id)===-1 && id){
			$("#deleteFileIds").val(deleteFileIds+","+id);
		}
	});
}
window.initFile = function(fileId, fileUrl, fileName){
	if(isPic(fileUrl)){
		var $a = $("<li class='file_el_"+fileId+"'><img class='file_el_"+fileId+"' src='" + fileUrl + "'></img><img class='delete_file' style='position:absolute; top:0px; right:0;width:11px;height:11px;' data-id='"+fileId+"' src='"+basePath+"newStyle/img/false.png'/></li>");
		$("#box").prepend($a);
	}else{
		var $a = $("<a class='file_el_"+fileId+"' style='display:inline-block;' href='" + fileUrl + "' target='_blank'>"+ fileName + "</a><span class='file_el_"+fileId+"' style='margin-left:10px;display:inline-block;'><img class='delete_file' data-id='"+fileId+"' src='"+basePath+"newStyle/img/false.png'/></span><br class='file_el_"+fileId+"'/>");
		$("#form-file-div").prepend($a);
	}
}
window.uploadFileSuccess = function(fileId, fileUrl, fileName) {
	var value = $("#form-input-file").val();
	if(!value){
		value = fileId;
	}else{
		value +=","+fileId;
	}
	$("#form-input-file").val(value);
	$("#form-file-iframe").show();
	if(isPic(fileUrl)){
		var $a = $("<li class='file_el_"+fileId+"'><img class='file_el_"+fileId+"' src='" + fileUrl + "'></img><img class='delete_file' style='position:absolute; top:0px; right:0;width:11px;height:11px;' data-id='"+fileId+"' src='"+basePath+"newStyle/img/false.png'/></li>");
		$("#box").prepend($a);
	}else{
		var $a = $("<a class='file_el_"+fileId+"' style='display:inline-block;' href='" + fileUrl + "' target='_blank'>"+ fileName + "</a><span class='file_el_"+fileId+"' style='margin-left:10px;display:inline-block;'><img class='delete_file' data-id='"+fileId+"' src='"+basePath+"newStyle/img/false.png'/></span><br class='file_el_"+fileId+"'/>");
		$("#form-file-div").prepend($a);
	}
	window.iframe_load_id++;
	$(".delete_file").unbind("click");
	$(".delete_file").click(function(){
		var $this = $(this),
			id = $this.data("id"),
			fileIds = $("#form-input-file").val(),
			resultArray = [];
		var file_ids = fileIds.split(",");
		file_ids.forEach(function(i){
			if(id!=i){
				resultArray.push(i);
			}
		});
		$("#form-input-file").val(resultArray.join(","));
		$(".file_el_"+id).remove();
		var deleteFileIds = $("#deleteFileIds").val();
		if($("#deleteFileIds").length && deleteFileIds.indexOf(id)===-1 && id){
			$("#deleteFileIds").val(deleteFileIds+","+id);
		}
	});
}
var OemGlobal = {
	EventMap:{},
	EventContext:{},
	loadOrderTypeUrl:basePath+"OrderType/loadOrderType.json",
	loadOrderType:function(callback){
		var dataList = window.localStorage.getItem("oem_type_list"),
			dataLength = JSON.parse(dataList);
		if(dataList && typeof callback==="function" && dataLength.length!=0){
			callback(dataLength);
			return;
		}
		Utils.ajax({
			url:OemGlobal.loadOrderTypeUrl,
			type:'post'
		}).done(function(resp){
			if(resp.retcode==0){
				var dataList = resp.dataList;
				window.localStorage.setItem("oem_type_list",JSON.stringify(dataList));
				if(typeof callback==="function"){
					callback(dataList);
				}
			}
		})
	},
	loadCurrentUser:function(callback){
		Utils.ajax({
			url:basePath+"SysUser/loadCurrentUser.json",
			type:'post'
		}).done(function(resp){
			callback && callback(resp.data);
		});
	},
	on:function(name,callback,context){
		OemGlobal.EventMap[name] = callback;
		OemGlobal.EventContext[name] = context;
	},
	emit:function(name,data,context){
		var callback = OemGlobal.EventMap[name];
		context = context || (OemGlobal.EventContext[name]&&OemGlobal.EventContext[name].context) || this;
		if(typeof callback==="function"){
			callback.call(context,data);
		}
	},
	confirmType:null,
	currentOrderId:null,
	showConfirm:function(id,type,callback,sysConfirmId){
		OemGlobal.currentOrderId = id || "";
		OemGlobal.confirmType = type || "";
		OemGlobal.callback = callback || "";
		OemGlobal.sysConfirmId = sysConfirmId||"";
		$(".confirm_mask").show();
	},
	confirm:function(){
		var data = {orderId:OemGlobal.currentOrderId,type:OemGlobal.confirmType,sysConfirmId:OemGlobal.sysConfirmId};//1表示申请查看详情
		var formValue = $("#confirmDialog").parseKeyValue();
		data = $.extend(data,formValue);
		Utils.ajax({
			url:OemGlobal.confirmUrl,
			type:'post',
			data:data
		}).done(function(resp){
			if(resp.retcode==0){
//				window.location.reload();
			}
		}).always(function(resp){
			OemGlobal.callback && OemGlobal.callback(OemGlobal.currentOrderId);
			$(".confirm_mask").hide();
		});
	},
	confirmUrl:basePath+"SysConfirm/applyForConfirm.json",
	applyConfirm:function(id,type){
		var data = {orderId:id,type:'1'};//1表示申请查看详情
		var formValue = $("#confirmDialog").parseKeyValue();
		data = $.extend(data,formValue);
		Utils.ajax({
			url:OemGlobal.confirmUrl,
			type:'post',
			data:data
		}).done(function(resp){
			if(resp.retcode==0){
				window.location.reload();
			}
		});
	},
	back:function(){
		$(".confirm_mask").hide();
	}
};
$(function() {
	$("#form-addfile-control").click(function() {
		$("#form-file-iframe").show();
	});
});