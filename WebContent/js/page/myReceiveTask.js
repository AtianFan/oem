var MenuList = [
                {title:i18n('wait_relase'),value:"0"},
                {title:i18n('has_release'),value:"1"},
                {title:i18n('running'),value:"2"}
                ];

if(pageType==2){
	MenuList = [
        {title:i18n('has_receive'),value:"0"}
    ];
}
var MyReceiveTask = {
	TYPE_TEMPLATE:'<a href="javascript:void(0)" data-usertype="{value}" onclick="MainPage.loadTaskList({value},this);" class="list-group-item">{title}</a>',
	/*TASK_TEMPLATE:['<div class="row">',
					'<div class="col-md-7">',
					'<a href="#">',
					'<img class="img-responsive img-hover" src="{iconFile.fileUrl}" alt="">',
					'</a>',
					'</div>',
					'<div class="col-md-5">',
					'<h3>{orderName}</h3>',
					'<h4>{introduce}</h4>',
					'<p><font color=red>{money}'+i18n('unit')+'</font></p>',
					'<a class="btn btn-primary" href="'+basePath+'Page/orderDetail/{id}">详情</i></a>',
					'</div>',
					'</div>'].join(''),*/
	CURRENT_INDEX:0,
	renderTypeList:function(){
		var $dom = $("#typeDom");
		for(var i=0,length=MenuList.length;i<length;i++){
			var data = MenuList[i];
			var $div = $(Utils.complier(MyReceiveTask.TYPE_TEMPLATE,data));
			if(i==MyReceiveTask.CURRENT_INDEX){
				$div.addClass("active");
			}
			$dom.append($div);
		}
	},
	loadTaskList:function(type,obj){
		var data = {
				url : basePath + "OrderTask/loadOrderTask.json",
				type:"post",
				dataType:"json"
			};
		var param = null;
		if(type){
			param = {};
			param.userType = type+"";
		}
		param && (data.data = param);
		if(typeof status!=="undefined" && status!="null"){
			param.status = status;
		}
		if(typeof complate!=="undefined" && complate==1){
			param.complate = complate+"";
		}
		Utils.ajax(data).done(function(resp) {
			var jsonData = resp.dataList;
			MyReceiveTask.render(jsonData);
		});
		$(".list-group-item").removeClass("active");
		$(obj).addClass("active");
	},
	list:null,
	/**
	 * 渲染数据
	 */
	render:function(dataList){
		if(!MyReceiveTask.list){
			MyReceiveTask.list = new List({
				$el:$('#taskContentDiv'),
				template:MyReceiveTask.TASK_TEMPLATE,
				dataList:dataList
			});
		}else{
			MyReceiveTask.list.renderDataList(dataList);
		}
	},
};
