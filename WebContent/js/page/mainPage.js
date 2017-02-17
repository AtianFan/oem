/*<div class="row text-center">
					<div class="col-lg-12">
						<ul class="pagination">
							<li><a href="#">&laquo;</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>*/

var MainPage = {
	TYPE_TEMPLATE:'<a href="javascript:void(0)" onclick="MainPage.loadTaskList(\'{id}\');" class="list-group-item">{name}</a>',
	PERSON_TYPE_TEMPLATE:'<a href="javascript:void(0)" data-usertype="{value}" onclick="MainPage.loadTaskList({value},this);" class="list-group-item">{title}</a>',
	TASK_TEMPLATE:['<div class="ui-list-detail statu{status}">',
					'<div class="ui-task-img">',
					'<a href="#">',
					'<div class="img-responsive" ><img class="img-hover" onerror="this.src=\''+basePath+'\/newStyle\/img\/normal.png\'" src="{iconFile.fileUrl}" alt="" onClick="return false;"></div>',
					'</a>',
					'</div>',
					'<div class="ui-task-detail content_detail">',
					'<h3>{orderName}</h3>',
					'<div style="margin:0 0 0 38px;font-size:14px">状态:{@if status==0}已创建{@/if}{@if status==1}已发布{@/if}{@if status==2}已接单{@/if}</div>',
					'<div class="orderTask_{id} detail_div_info"><div class="introduce" style="margin:0 0 0 38px;">任务简介：</div>',
					'<h4>{description}</h4>',
					'{@if !isCurrentReadonly&&loginFlag&&launcherId!=userId&&status==1&&!sysConfirmInfo}<a class="btn btn-primary apply_for_detail" href="javascript:void(0);" ',
					'onclick="SysConfirm.confirm(\'1\',null,\'{id}\');">'+i18n("apply_for_detail")+'</i></a>{@/if}',
					'{@if launcherId==userId||sysConfirmInfo.sysConfirmResult==1}<a class="btn btn-primary btn-detail" href="'+basePath+'Page/orderDetail/{id}">'+i18n("detail")+'</i></a>{@/if}',
					'{@if !isCurrentReadonly&&launcherId!=userId&&sysConfirmInfo.sysConfirmResult==0&&sysConfirmInfo.partnerStatus==1}<h4>'+i18n("apply_running")+'</h4>{@/if}',
					'</div></div>',
					/*'{@if showApplyInfo&&launcherId!=userId}<span  class="btn btn-primary" onclick="SysConfirm.loadChildSysConfirm(\'{id}\')">'+i18n("view_apply_list")+'</span>{@/if}',*/
					'</div>'].join(''),
	CURRENT_INDEX:0,
	renderTypeList:function(){
		OemGlobal.loadOrderType(function(resp){
			var $dom = $("#typeDom");
			resp.splice(0,0,{id:0,name:i18n('all')});
			for(var i=0,length=resp.length;i<length;i++){
				var data = resp[i];
				var $div = $(Utils.complier(MainPage.TYPE_TEMPLATE,data));
				if(i==MainPage.CURRENT_INDEX){
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
		var param = {};
		if(pageType=="0"){
			type && (param.taskType = type+"");//-1表示发布的
		}else{
			param.pageType = pageType;
			if(typeof complate!=="undefined" && complate==1){
				param.complate = complate+"";
			}else if(typeof all!=="undefined" && all==1){
				param.all = 1+"";
			}else{
				if(typeof status!=="undefined" && type!="null"){
					param.status = status;
				}else{
					param.status=typeof type!=="undefined"? type+"" : "0";
				}
			}
		}
		data.data = param;
		Utils.ajax(data).done(function(resp) {
// if (resp.retcode == 0) {
				var jsonData = resp.dataList,
					userId = resp.userId,
					sysUser = resp.sysUser;
				MainPage.render(jsonData,userId,sysUser);
// }
		});
	},
	/**
	 * 渲染数据
	 */
	render:function(dataList,userId,sysUser){
		var p_template = "<p>{title}</p>";
		if(MainPage.list){
			MainPage.list.renderDataList(dataList);
		}else{
			MainPage.list = new List({
				$el:$('#taskContentDiv'),
				template:MainPage.TASK_TEMPLATE,
				dataList:dataList,
				userId:userId,
				filter:function(data){
					data.showApplyInfo = pageType=="0";
					if(!userId || !sysUser){
						return data;
					}
					//没有登录不展示申请按钮
					data.loginFlag = userId?true:false;
					data.isCurrentReadonly = sysUser.isCurrentReadonly;
					if(data.sysConfirmInfo && data.sysConfirmInfo.sysConfirmResult==1){
						return data;
					}
					if(sysUser.type==="2"){
						SysConfirm.loadApplyConfirm(data.id,function(resp){
							var dataList = resp.dataList,
								html = "<div class='detail_apply_info_list'><p>申请历史记录:</p>";
							if(dataList.length == 0){
								//如果确认信息为空，不展示申请记录
								return;
							}
							for(var i=0,len=dataList.length;i<len;i++){
								var data1 = dataList[i],
									time = data1.onePartnerDate && data1.onePartnerDate.split(" ")[0],
									onPartnerRemark = data1.onPartnerRemark,
									title = time +":"+onPartnerRemark,
									secPartnerId = data1.secPartnerId;
								if(!onPartnerRemark){
									return;
								}
								html += p_template.replace(/\{title\}/,title);
							}
							$(".orderTask_"+data.id).html(html+"</div>");
						});
					}
					return data;
				}
			});
		}
		Utils.coverImg($(".img-responsive img.img-hover"));
	},
	confirmUrl:basePath+"SysConfirm/loadSysConfirm.json",
	successConfirm:function(id){
		window.location.reload();
		/*var data = {orderId:id,type:'1'};//1表示申请查看详情
		var formValue = $("#confirmDialog").parseKeyValue();
		data = $.extend(data,formValue);
		Utils.ajax({
			url:MainPage.confirmUrl,
			type:'post',
			data:data
		}).done(function(resp){
			if(resp.retcode==0){
				window.location.reload();
			}
		});*/
	}
};
$(function(){
	MainPage.loadTaskList();
	if(pageType!=1&&pageType!=2){
		MainPage.renderTypeList();
	}else{
		MyReceiveTask.renderTypeList();
	}
// $('#taskTable select').ddTableFilter();
});