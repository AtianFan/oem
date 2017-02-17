/**
 * 
 */
var Fields = [ 'name', 'orderNumber', 'description', 'introduce',
		'requirements', 'remark', 'money' ];
var OrderDetail = {
	orderTask :null,
	template : '<div style="text-align:center;"  class="info-control"><span>{name}:</span><label>{value}</label></div>',
	/*receiveTemplate : '<div class="info-control"><span>金额:{money}</span>'+
					  '<span>时间:{createDate}</span><span>留言:{remark}</span>'+
					  '<span>登录名:{loginName}</span></div><div><button type="button" data-userid="{userId}" data-receiveid="{id}" onclick="OrderDetail.receive(this);">'
					  +i18n("set_receiver")+'</button></div>',*/
    fileTemplate:['<div  class="col-lg-12">',
				'<img src="'+basePath+'newStyle/img/icon.png" style="margin-right: 10px;"/><a target="_blank" href="{url}">{originName}',
				'</a>',
				'</div>'].join(""),
	applyInfoTemplate:"<p><span>{createDate}</span>:<span>&nbsp;{onPartnerRemark}</span></p>",
	subTaskTemplate:['<table  class="table_info">',
					'<thead>',
						'<tr>',
							'<th width="70px"></th>',
							'<th width="164px">'+i18n('descriptionForInfo')+'</th>',
							'<th width="241px">'+i18n('picture')+'</th>',
							'<th width="216px">'+i18n('requirements')+'</th>',
							'<th width="60px">'+i18n('moneyNum')+'</th>',
							'<th width="60px">附件列表</th>',
							'<th width="173px">'+i18n('confirmInfo')+'</th>',
						'</tr>',
					'</thead>',
					'<tbody><tr>',
					'<td >{step}</td>',
					'<td><a href="'+basePath+'Page/orderDetail/{id}/true">{orderName}</a></td>',
					'<td><div class="chrild_img"><img width="200" height="100" src="{iconFile.fileUrl}" onerror="this.src=\''+basePath+'\/newStyle\/img\/normal.png\'"/></div></td>',
					'<td>{description}</td>',
					'<td>￥{money}</td>',
					'<td><a target="_blank" href="{attFile.fileUrl}">{attFile.originName}</td>',
					/*'<td class="col-md-2">{btnStr}',*/
					'<td>{btnStr}{@if showDetail}<span class="view_info_btn" onclick="SysConfirm.loadChildSysConfirm(\'{id}\',\'查看申请详情\',true)">'+i18n("view_apply_list")+'</span>{@/if}</td></tr></tbody>',
					'</table>',
					/*'<div class="col-md-2">{@if showConfirmInfo}{receiverStatusString}|{launcherStatusString}{@/if}{@if showConfirmInfoButton}<button type="button"  class="btn btn-primary" ',
					'onclick="OemGlobal.showConfirm(\'{id}\',\''+TaskFlowStatus.FINISH_TASK+'\',OrderDetail.subTaskConfirmSuccess,\'{sysConfirmInfo.sysConfirmId}\')">'+i18n("confirm")+'</button>',
					'{@/if}</div>',*/
					'</div>'].join(""),
    receiveTemplate:['<tr>',
/*						'<div class="panel panel-default text-center">',
						'<div class="panel-heading">',*/
						'<td class="loginName">{secPartner.loginName}</td>',
//						'</div>',
					/*	'{@if moneyFlag}<div class="panel-body">',
						'<span class="price">'+i18n("taskMoney")+':{money}元</span>',
						'</div>{@/if}',*/
//						'<ul class="list-group">',
/*//						'<li class="list-group-item">'+i18n("taskDescription")+':{secPartner.description}</li>', <br/>{@if hasIframe}附件:<a target="_blank" href="{url}">{originName}</a>{@/if}
*/						'<td>{secPartnerRemark}</td>',
						'<td>{@if result==1}<font color="rgb(0,183,150)">'+i18n("hasAgree")+'</font/>{@/if}',
						'{@if result==-1}<font color="rgb(218,29,29)">'+i18n("deAgree")+'</font/>{@/if}</td>',
						'<td>',
//						'<li class="list-group-item">',
					    /*'{@if launcherFlag&&result==0}<a data-userid="{secPartner.id}" ',
						'data-receiveid="{id}" href="javascript:void(0)" onclick="OemGlobal.showConfirm(\'{orderId}\',\''+TaskFlowStatus.WAIT_FOR_DETAIL+'\',',
						'OrderDetail.confirmCallback,\'{id}\')" class="btn btn-primary">'+i18n('confirm')+'</a>',
						'{@/if}',*/
						'{@if hasReceiver}<a data-userid="{receiver.id}" ',
						'data-receiveid="{id}" href="javascript:void(0)" class="view_info_btn">'+i18n('receiveTask')+'</a>',
						'{@/if}',
						'{btnStr}',
						'{@if moneyFlag}<span class="view_info_btn" onclick="OrderDetail.showOrderReceiveInfo(\'{id}\')">'+i18n("view_price")+'</span>',
						'{@/if}',
						'</ul></td>',
						'</tr'].join(""),	
	sysConfirmTemplate:['<td>{index}</td><td>{typeStr}</td><td>{createDate}</td><td>{secPartnerRemark}</td><td>{onPartnerRemark}</td><td>{statusString}</td>'].join(""),
	receive:function(obj){
		if(!OrderDetail.orderId){
		}
	},
	initButtons:function(data){
		if(!userType || userType=="2"){
			if(!data.receiverId){
					data.waitforReceive=true;
 			}else{
 				if(data.receiverStatus==-1){
 					data.waitforConfirm = true;
 				}
 			}
		}
		return data;
	},
	orderId:null,//任务id
	addReceiveUrl : basePath + "OrderTask/",
	loginUrl : basePath + "OrderTask/orderTaskDetail.json",
	addOrderReceiveUrl : basePath + "SysConfirm/applyForConfirm.json",
	setReceiveUrl:basePath+"OrderTask/receive.json",
	orderTask : null,
	renderReceive:function(resp,$el,data,moneyFlag){
		var dataList = resp.dataList,
			userId = resp.userId;
		for(var i=0,length=dataList.length;i<length;i++){
			var d = dataList[i];
			if(data.receiverId && userId==data.receiverId){
				d.hasReceiver = true;
			}
			d.moneyFlag = moneyFlag;
			if(	d.onePartner && data.launcherId==d.onePartner.id){
				d.launcherFlag = data.launcherFlag;
			}
			d.moneyFlag = moneyFlag;
			d.btnStr = SysConfirm.applyConfirmBtn(d,d.launcherFlag);
			if(data.isCurrentReadonly){
				d.btnStr = "";
			}
			if(moneyFlag){
				//d.hasIframe=true;
				//d.url=Utils.getFilePath(1, d.date, d.name);
			}
			$el.append(Utils.complier(OrderDetail.receiveTemplate,d));
		}
	},
	finishMoney:0,
	renderSubTaskList:function(subTaskList,$el,data){
		window.subTaskConfirmEndIndex= 0;
		window.subTaskLength = subTaskList.length;
		OemGlobal.loadCurrentUser(function(user){
			var sysConfirmMap = data.sysConfirmMap;
			for(var i=0,length=subTaskList.length;i<length;i++){
				var subTask = subTaskList[i],
					sysConfirmInfo = subTask.sysConfirmInfo;
				subTask.step = i+1;
				if((data.receiverId==user.id && !sysConfirmInfo) || (data.launcherId == user.id && sysConfirmInfo && sysConfirmInfo.secPartnerStatus && sysConfirmInfo.onePartnerStatus!=1)){
					subTask.showConfirmInfoButton = true;
				}else{
					subTask.showConfirmInfoButton = false;
				}
				if(data.receiverId == user.id || data.launcherId == user.id ){
					subTask.showConfirmInfo = true;
				}else{
					subTask.showConfirmInfo = false;
				}
				var sysConfirmInfo = subTask.sysConfirmInfo || {onePartnerStatus:0,secPartnerStatus:0};
				subTask.receiverStatusString = i18n("receiver")+(sysConfirmInfo.secPartnerStatus==1?i18n("hasConfirm"):i18n("notConfirm"));
				subTask.launcherStatusString = i18n("launcher")+(sysConfirmInfo.onePartnerStatus==1?i18n("hasConfirm"):i18n("notConfirm"));
				if(sysConfirmInfo.secPartnerStatus==1 && sysConfirmInfo.onePartnerStatus==1){
					subTaskConfirmEndIndex++;
				}
				var sysConfirmList = sysConfirmMap[subTask.id],
					sysConfirm = {},sysType=0;
				if(sysConfirmList){
					for(var key in sysConfirmList){
						var sysC= sysConfirmList[key];
						if(sysC && sysC.isCurrent && sysC.type>sysType){
							sysConfirm = sysC;
							sysType = sysC.type;
						}
					}
				}
				if(sysConfirm.result==1 && sysConfirm.type==3){
					sysConfirm = {};
					sysConfirm.type = 4;
				}
				if(sysConfirm.result==-1 && sysConfirm.type==3){
					sysConfirm = {};
					sysConfirm.type = 3;
				}
				if(sysConfirm.type>3 || (sysConfirm.type==3 && sysConfirm.result==1)){
					OrderDetail.finishMoney+=subTask.money;
				}
				sysConfirm.orderId = subTask.id;
				if((data.receiverId == user.id ) ||  (data.launcherId == user.id)){
					subTask.btnStr = SysConfirm.applyConfirmBtn(sysConfirm,data.launcherId == user.id,true);
					subTask.showDetail = true;
				}
				
/*				if(data.receiverId == user.id||data.receiverId == user.id){
				}
				su'b
*/				subTask.isCurrentReadonly = data.isCurrentReadonly;
				$el.append(Utils.complier(OrderDetail.subTaskTemplate,subTask));
			}
			if(subTaskLength==subTaskConfirmEndIndex){
				$("#applay_for_money").show();
			}
			$("#hasFinishMoney").text("￥:"+OrderDetail.finishMoney);
			var $img = $(".table_info img");
			Utils.coverImg($img);
		});
	},
	subTaskButtonRender:function(){
		
	},
	applyForMoneySuccess:function(){
		window.location.reload();
	},
	subTaskConfirmSuccess:function(){
		window.location.reload();
	},
	subTaskList:null,
	orderReceiveInfoList:null,
	loadDetail : function(orderId) {
		OrderDetail.orderId = orderId;
		Utils.ajax({url : OrderDetail.loginUrl,
					type : "post",
					data : {
						orderId : orderId
					},
					dataType : "json"
				}).done(function(resp) {
							if (resp.retcode === 0) {
								var data = resp.data, files = data.sysFileList, orderReceiveList = data.orderReceiveList,
								sysConfirmList = data.sysConfirmCollectionList,
								sysUser = resp.sysUser;
								subTaskList =data.subTaskList;
								OrderDetail.orderTask = data;
								OrderDetail.subTaskList = subTaskList;
								OrderDetail.orderReceiveInfoList = data.orderReceiveInfoList;
								data.userId=resp.userId;
								data.isCurrentReadonly = sysUser.isCurrentReadonly;
								data.canReceive = !data.receiverId && data.currentStatus==1 && (data.currentResult!=0 && data.currentResult!=1);
								for(var key in sysConfirmList){
									var sysConfirm = sysConfirmList[key];
									if(sysConfirm.isCurrent && sysConfirm.type>=TaskFlowStatus.ACCEPT_FOR_TASK && sysConfirm.result!=-1){
										data.canReceive = false;
									}
								}
								var html = Utils.complier($("#taskDetailTemplate").html(),OrderDetail.initButtons(data));
								$("#orderTaskInfo").append(html);
								for ( var key in files) {
									var file = files[key], name = file.fileName, originName = file.originName, date = file.createDate;
									if(isPic(Utils.getFilePath(1, date, name))){
										var $a = $("<li><a target='_blank' href='"+Utils.getFilePath(1, date, name)+"'><img  src='" + Utils.getFilePath(1, date, name) + "'></img></a></li>");
										$("#box").prepend($a);
									}else{
										$("#fileListDiv_class").prepend(
											OrderDetail.fileTemplate.replace(/\{url\}/g,Utils.getFilePath(1, date,name)).replace(/\{originName\}/g,originName)
										);
									}
								}
								//子任务列表
								if(subTaskList){
									OrderDetail.renderSubTaskList(subTaskList,$("#subTaskList"),data);
								}
								if(sysConfirmList){
									OrderDetail.loadHistoryApplyInfo(sysConfirmList);
								}
								if(userType=='1'){
									SysConfirm.loadApplyConfirm(orderId,function(resp){
										OrderDetail.renderReceive(resp,$("#apply_for_detail"),data,false);
									},TaskFlowStatus.WAIT_FOR_DETAIL);
									SysConfirm.loadApplyConfirm(orderId,function(resp){
										OrderDetail.renderReceive(resp,$("#apply_for_task_list"),data,true);
									},TaskFlowStatus.ACCEPT_FOR_TASK);
								}
							}
							OemGlobal.emit("TASK_DETAIL_LOAD_SUCCESS_EVENT",resp);
							OemGlobal.emit("MODIFY_STATUS_EVENT",3);
						});
	},
	showForm:function(){
		//$(".receiveForm").show();
		//$("#want_to_receiveBtn").unbind("click");
//		$("#want_to_receiveBtn").click(function() {
			var dialog = new ShowPriceDialog({
				orderList:OrderDetail.subTaskList,
				title:i18n("confirm_for_subtask_price"),
				success:function(param){
					OrderDetail.addReceive(function(resp) {
					},param);
				}
			});
			dialog.show();
//		});
	},
	addReceive : function(callback,param) {
		var data = $("#receiveTaskForm").parseKeyValue();
		data.confirmStatus = '1';
		data.type= TaskFlowStatus.ACCEPT_FOR_TASK;
		Utils.ajax({
			url : OrderDetail.addOrderReceiveUrl,
			type : "post",
			data : $.extend(data,param),
			dataType : "json"
		}).done(function(resp) {
			var retcode = resp.retcode;
			if (retcode == 0) {
				window.location.reload();
			}
		});
	},
	setReceive:function(obj){
		var orderReceiveId = $(obj).data("receiveid"),
			receiverId = $(obj).data("userid");
		Utils.ajax({
			url:OrderDetail.setReceiveUrl,
			data:{orderId:orderId,receiverId:receiverId,orderReceiveId:orderReceiveId},
			type:'post'
		}).done(function(resp){
			if(resp.retcode==0){
				alert("success");
				window.location.reload();
			}
		});
	},
	confirmUrl:basePath+"OrderTask/confirm.json",
	confirmDialog:function(id){
		OrderDetail.receiverId = id;
		$(".confirm_mask").show();
	},
	confirm:function(id){
		var id = id || OrderDetail.receiverId || OrderDetail.orderId,
			data = {userType:userType,orderId:id};
		var formValue = $("#confirmDialog").parseKeyValue();
		data = $.extend(data,formValue);
		Utils.ajax({
			url:OrderDetail.confirmUrl,
			type:'post',
			data:data
		}).done(function(resp){
			if(resp.retcode==0){
				window.location.reload();
			}
		});
	},
	relaseTaskUrl:basePath+"OrderTask/relaseTask.json",
	releaseTask:function(){
		Utils.ajax({
			url:OrderDetail.relaseTaskUrl,
			data:{orderId:orderId,status:"1"}
		}).done(function(resp){
			if(resp.retcode==0){
				alert(i18n("releaseSuccess"));
				window.location.reload();
			}
		});
	},
	delTaskUrl:basePath+"OrderTask/delOrderTask.json",
	delTask:function(){
		Utils.ajax({
			url:OrderDetail.delTaskUrl,
			data:{orderId:orderId}
		}).done(function(resp){
//			console.log
			if(resp.retcode==0){
				window.history.back();
//				var parentId = OrderDetail.orderTask && OrderDetail.orderTask.parentId;
//				if(!parentId||parentId=="-1" || parentId==null){
//					window.his;
//				}else{
//					window.
//				}
			}else{
				alert(resp.msg);
			}
		})
	},
	showConfirmDialog:function(){},
	confirmCallback:function(){
		window.location.reload();
	},
	loadHistoryApplyInfo:function(dataList,flag){
		var $applyInfoList = $("#applyInfoList"),
			html = "";
		for(var i=0,length=dataList.length;i<length;i++){
			html+="<tr>"
			var data = dataList[i];
			data.index = i+1;
			data.typeStr = i18n(TaskFlowStatus[data.type+""]);
			data.statusString = SysConfirm.statusString[data.result||0];
			html += Utils.complier(OrderDetail.sysConfirmTemplate,data)+"</tr>";
			$("#detail_apply_info_list").append(Utils.complier(OrderDetail.applyInfoTemplate, data));
		}
		if(flag){
			return html;
		}
		$applyInfoList.append(html);
	},
	OrderReceiveInfoUrl:basePath+"OrderReceiveInfo/loadOrderReceiveInfoList.json",
	showOrderReceiveInfo:function(sysConfirmId){
		var data = {pOrderId:OrderDetail.orderId};
		if(sysConfirmId){
			data.sysConfirmId = sysConfirmId;
		}
		Utils.ajax({
			url:OrderDetail.OrderReceiveInfoUrl,
			data:data
		}).done(function(resp){
			if(resp.retcode==0){
				var dataList = resp.dataList;
				new ShowPriceDialog({
					orderList:dataList,
					BodyTemplate:["<li><span>{name}</span>",
					"<span>{money}</span></li>"].join("")
				}).show();
			}
		});
	}
}
$(function() {
	OrderDetail.loadDetail(orderId);
});