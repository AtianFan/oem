/**
 * 
 */

var SysConfirm = {
	oneConfirmTemplate:'{@if result!=0}{resultStr}{@/if}{@if !result||result==0}<span class="view_info_btn" onclick="SysConfirm.confirm(1,\'{sysConfirmId}\',\'{orderId}\',\'{type}\',null,\'{name0}\');">'
		+'{name0}</span>{@/if}{@if name2}<span class="view_info_btn" onclick="SysConfirm.confirm(1,\'{sysConfirmId}\',\'{orderId}\',\'{type}\',\'true\',\'{name2}\');">{name2}</span>{@/if}'
		+'{@if name1&&(!result||result==0)}<span class="view_info_btn" onclick="SysConfirm.confirm(0,\'{sysConfirmId}\',\'{orderId}\',\'{type}\',null,\'{name1}\');">{name1}</span>{@/if}',
	btns:{
		"sec_1":[i18n("apply_for_detail")],
		"one_1":[i18n("agree_for_detail"),
		         i18n("degree_for_detail")],
		"sec_2":[i18n("receive_task")]  
		,"one_2":[
	         i18n("agree_for_receive"),
	         i18n("degree_for_receive")
         ],
         "one_3":[
//			i18n("confirm_for_pay_money"),
			i18n("confirm_for_pay_money_online"),
			i18n("modify_idea"),
			i18n("confirm_for_pay_money_offline")
        ],
        "sec_3":[
                 i18n("submit_for_task")
                 ],
        "one_4":[
                 i18n("confirm_for_receive_task")
                 ],
         "sec_4":[
                  i18n("confirm_for_receive_money")
                  ]
	},
	applyInfo:{
		"sec_3":i18n("apply_for_submit_runging"),
		"sec_4":i18n("wait_for_launcher_receive_project"),
		"one_3":i18n("apply_for_submit_runging"),
		"one_4":i18n("wait_for_launcher_receive_project")
	},
	statusString:{
		"-1":"<img src='"+basePath+"newStyle/img/false.png'/>",//i18n("fail"),
		"1":"<img src='"+basePath+"newStyle/img/true.png'/>",//i18n("success")
		"-2":i18n("cancel"),
		"0":i18n("runging")
	},
	loadApplyDetailSysConfirmListUrl : basePath
			+ "/SysConfirm/loadSysConfirm.json",
	loadApplyConfirm:function(orderId,callback,type,isCurrent){
		var data = {};
		data.orderId = orderId;
		data.type = type || TaskFlowStatus.WAIT_FOR_DETAIL;
		if(typeof isCurrent!=="undefined"){data.isCurrent = isCurrent || "0"};
		Utils.ajax({
			url:SysConfirm.loadApplyDetailSysConfirmListUrl,
			data:data
		}).done(function(resp){
			if(resp.retcode==0){
				callback && callback(resp);
			}
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
	confirm:function(status,sysConfirmId,orderId,type,flag,name){
		var title ="请输入查看理由";
		var hs='<textarea name="remark" rows="3" cols="3"></textarea>';
		if(name!=''&&null!=name){
			hs='<textarea name="remark" rows="3" cols="3">'+name+'</textarea>';
			title="请输入"+name+"理由";
		}
		if(sysConfirmId=='' && type=='3'){
			hs+="<input type='hidden' id='iframeFile' name='iframeFile'  />";
			hs+="<iframe height='100px' width='600px' src='"+basePath+"Page/uploadFile.do?callback=uploadIframeSuccess' frameborder=0></iframe>";
		}
		var dialog = new SysConfirmDialog({
			title:title,
			html:hs
		},function(remark){
			var data =  {};
			data.remark = remark;
			data.confirmStatus = status+"";
			data.sysConfirmId = sysConfirmId || "";
			data.orderId = orderId;
			if($("#iframeFile").val()){
				data.iframeFile = $("#iframeFile").val();
			}
			
			if(flag){
				data.flag = flag;
			}
			if(type){data.type = type;}
			Utils.ajax({
				url:SysConfirm.confirmUrl,
				type:'post',
				data:data
			}).done(function(resp){
				if(resp.retcode==0){
					window.location.reload();
				}
			});
		});
	},
	loadChildSysConfirmUrl:basePath+"SysConfirm/loadChildSysConfirm.json",
	loadChildSysConfirm:function(orderId,title,flag){
		Utils.ajax({
			url:SysConfirm.loadChildSysConfirmUrl,
			data:{orderId:orderId}
		}).done(function(resp){
			if(resp.retcode==0){
				var dataList =resp.dataList;
				for(var i in dataList){
					var data = dataList[i];
					data.index = i+1;
					data.typeStr = i18n(TaskFlowStatus[data.type+""]);
					data.statusString = SysConfirm.statusString[data.result||0];
				}
				new ShowPriceDialog({
					title:title || "请输入查看项目理由",
					orderList:dataList,
					flag:true,
					showDialog:flag,
					BodyTemplate:'<li ><span style="font-size: 14px;">[{typeStr}]-</span><span style="font-size: 14px;">[{createDate}]-</span><span style="font-size: 14px;">[{secPartnerRemark}]-</span><span style="font-size: 14px;">[{onPartnerRemark}]-</span><span style="font-size: 14px;">[{statusString}]</span></li>'
				}).show();
			}
		});
	},
	applyConfirmBtn:function(d,type,isSon){
		var data = {},btn=null,template=null;
		if(isSon){
			data.status=d.type||"3";
			data.orderId=d.orderId;
			data.result = d.result;
			data.isSon = true;
			data.type =data.status;
			d.id && (data.sysConfirmId = d.id);
		}else{
			data.sysConfirmId = d.id;
			data.status=d.type;
			data.orderId=d.orderId;
			data.resultStr = d.result==1?i18n("agree"):i18n("degree");
			data.result = d.result;
		}
		if(type){//发包放
			btn = SysConfirm.btns["one_"+data.status];
			if(typeof data.result==="undefined")
				return "";
		}else{//接包方
			btn = SysConfirm.btns["sec_"+data.status];
			if(isSon && data.result==0){
				data.result = 1;
				data.resultStr = SysConfirm.applyInfo["sec_"+data.status];
			}
		}
		if(data.result==1 && data.type==4){
			data.resultStr = i18n("complete");
		}
		data.resultStr = data.resultStr || "";
		for(var i in btn){
			data["name"+i] = btn[i];
		}
		data.sysConfirmId = data.sysConfirmId || "";
		return Utils.complier( SysConfirm.oneConfirmTemplate,data);
	}
}
