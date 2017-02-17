
var HomePage = {
	TYPE_TEMPLATE:'<a style="left:14px;width:300px;height:60px;margin-top:10px;margin-bottom:10px;" href="javascript:void(0)" onclick="HomePage.loadTaskList(\'{id}\');" class="list-group-item text-center">{name}</a>',
	/*TASK_TEMPLATE:['<div class="col-md-4">',
	               	'<img class = "bgImg" src = "{iconFile.fileUrl}"/>',
	               	'<img class = "sImg" src = "'+basePath+'image/57674ab3154de.png"/>',
					'<div class="panel panel-default" style="height:223px;">',
					'<div class="panel-heading ui-order-name"><h4>{orderName}</h4></div>',
					'<h4 class = "introduce">{introduce}</h4>',
					'<p class = "money"><font color=red style="color:#436976">￥:{sum}</font></p>',
					'<a class="btn btn-default ui-detail-btn" href="'+basePath+'Page/orderDetail/{id}">详情</i></a>',
					'<img class = "rightImg" src = "'+basePath+'image/arrow2.png"/>',
					'</div>',
					'</div>'].join(''),*/
	TASK_TEMPLATE:['<a href="'+basePath+'Page/orderDetail/{id}"><div class="list-item">',
                '<div class="item-img">',
                    '<div class="img-box">',
                       ' <img src="{iconFile.fileUrl}" alt="" onerror="this.src=\''+basePath+'\/newStyle\/img\/normal.png\'">',
                    '</div>',
               ' </div>',
                '<div class="item-info">',
                    '<div class="avatar">',
                        '<div class="img-box">',//sysLauncherFile
                            '<img  {@if hasLanuncherFile} src="{sysLauncherFile.fileUrl}" {@/if} {@if !hasLanuncherFile}src="'+basePath+'image/57674ab3154de.png"{@/if} onerror="'+basePath+'image/57674ab3154de.png" alt="">',
                        '</div>',
                    '</div>',
                    '<h3>{orderName}</h3>',
                    '<p>{introduce}</p>',
                    '<div class="money">',
                        '&yen;:{sum}',
                    '</div>',
                '</div>',
               ' <a href="'+basePath+'Page/orderDetail/{id}" class="btn-detail">详情<i class="sbIcon sbIcon-jt"></i></a>',
            '</div></a>'].join(""),
	CURRENT_INDEX:0,
	renderRec:function(){
		OemGlobal.loadOrderType(function(resp){
			var $dom = $("#recContentDiv");
			resp.splice(0,0,{id:0,name:i18n('recomm')});
			for(var i=0,length=resp.length;i<length;i++){
				var data = resp[i];
				var $div = $(Utils.complier(HomePage.TYPE_TEMPLATE,data));
				if(i==HomePage.CURRENT_INDEX){
					$div.addClass("active");
				}
				$dom.append($div);
			}
		});
	},
	loadHotTask:function(type){
		var data = {
				url : basePath + "OrderTask/loadOrderTask.json",
				type:"post",
				dataType:"json"
			};
		var param = {};
		if(type){
			param = {taskType:type};
		}
		if(typeof keyWord!=="undefined"){
			param.keyWord = keyWord;
		}
		data.data = param;
		Utils.ajax(data).done(function(resp) {
				var jsonData = resp.dataList;
				HomePage.render(jsonData,1);
		});
	},
	loadRecoTask:function(type){
		var data = {
				url : basePath + "OrderTask/loadOrderTask.json",
				type:"post",
				dataType:"json"
			};
		var param = {};
		if(type){
			param = {taskType:type};
			data.data = param;
		}
		if(keyWord){
			data.keyWord = keyWord;
		}
		Utils.ajax(data).done(function(resp) {
				var jsonData = resp.dataList;
				HomePage.render(jsonData,2);
		});
	},
	renderHot:function(){
		OemGlobal.loadOrderType(function(resp){
			var $dom = $("#taskContentDiv");
			resp.splice(0,0,{id:0,name:i18n('all')});
			for(var i=0,length=resp.length;i<length;i++){
				var data = resp[i];
				var $div = $(Utils.complier(HomePage.TYPE_TEMPLATE,data));
				if(i==HomePage.CURRENT_INDEX){
					$div.addClass("active");
				}
				$dom.append($div);
			}
		});
	},
	/**
	 * 渲染数据
	 */
	render:function(dataList,index){
		
		/*if(HomePage.list){
			HomePage.list.renderDataList(dataList);
		}else{*/
			if (index === 1) {
				HomePage.list = new List({
					$el:$('#taskContentDiv'),
					template:HomePage.TASK_TEMPLATE,
					dataList:dataList
				});
			} else {
				HomePage.list = new List({
					$el:$('#recContentDiv'),
					template:HomePage.TASK_TEMPLATE,
					dataList:dataList
				});
			}
		/*}*/
			var $img = $(".item-img img");
			Utils.coverImg($img);
	}
};
$(function(){
	HomePage.loadHotTask();
	$(".service").click(function()
	{
		//<a href="${basePath}Page/video" data-poptrox="vimeo,800x480"></a>
		//window.open(basePath+'Page/video','iframe','width='+(window.screen.availWidth-10)+',height='+(window.screen.availHeight-30)+ ',top=0,left=0,toolbar=no, titlebar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no')  
		//<a href="http://vimeo.com/22439234" data-poptrox="vimeo,800x480"><img src="images/vimeo.png" alt="" title="A Vimeo Video" /></a>
	})
//	HomePage.loadRecoTask();
//	HomePage.renderRec();
//	HomePage.renderHot();
});