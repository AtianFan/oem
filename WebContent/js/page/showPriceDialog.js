var parseKeyValue = function(body){
	var map = [];
	body.find("input").each(function(index,el){
		var name = el.name,
			obj = name.split("\_"),
			index = +obj[1],
			type = obj[0];
		if(!map[index]){
			map[index] = {};
		}
		map[index][type] = el.value;
	});
	//alert($("#iframeFile").val());
	return {priceList:JSON.stringify(map),remark:body.find("textarea").val(),iframeFile:$("#iframeFile").val()};
}
//orderList i18n("order_remark")+":
var Template = ["<div class='ui-dialog-mask' style=' width:100%;height:800px; '><div class='ui-price-dialog'>",
				"<div class='ui-price-title'>{title}</div>",
				"<div class='ui-price-content'>" +
				"{@if !showDialog}<textarea name='remark' cols='100' rows='3'></textarea>{@/if}" +
				"</div>"+
				//"<input type='hidden' id='iframeFile' name='iframeFile'  />"+
				//"<iframe height='100px' width='600px' src='"+basePath+"Page/uploadFile.do?callback=uploadIframeSuccess' frameborder=0></iframe>"+
				"<div class='ui-price-btns' id='ui-price-btns'></div>"+
				"</div></div>" 
				].join("");
var BodyTemplate = ["<li>" +
                    "<input type='hidden' value='{id}' name='orderId_{index}'/>" +
                    "<span style='display:inline-block;font-size: 14px;'>{index}</span>",
					"<span style='display:inline-block;font-size: 14px;'>{name}</span>",
					"<span style='display:inline-block;font-size: 14px;'><input type='text' name='money_{index}' value='{money}' onchange='ShowPriceDialog.change();'/></span></li>"].join("");
var ButtonTemplate= ["<span class='green-btn'>{title}</span>"].join("");
var ShowPriceDialog = function(option){
	var self = this,
		defaultData = {
		title:"test",
		btns:[{title:"确认",action:function(dataList){
			option.success && option.success(dataList);
			self.close();
		}},{title:"取消",action:function(dataList){
			self.close();
		}}]
	};
	$.extend(this,defaultData,option);
	this.$el = $(Utils.complier(Template,this));
	this.$body = this.$body();
	this.init();
	// this.initButtons();
	// this.afterInit();
};
ShowPriceDialog.change = function(){
	var money = 0;
	$("input[name^='money']").each(function(index,el){
		var value = +el.value;
		money+=value;
	});
	$("#totalMoney").text(i18n("totalMoney")+":"+money);
}
ShowPriceDialog.prototype = {
	init:function(){
		if(!this.orderList){
			throw new Error("There is no param[orderList]!");
		}
		var $content = $("<ul class='ui-info-list' style='margin:0;padding:0'></ul>");
		var total = 0;
		for(var key in this.orderList){
			var order = this.orderList[key];
			order.index = +key+1;
			$order = $(Utils.complier(this.BodyTemplate||BodyTemplate,order));
			$content.append($order);
			total+=+order.money;
		}
		this.$body.append($content);
		if(!this.flag)
		this.$body.append("<div id='totalMoney'>"+i18n("totalMoney")+":"+total+"</div>");
		this.initButtons();
		$("body").append(this.$el);
	},
	getBtnEl:function(){
		return this.find("#ui-price-btns");
	},
	initButtons:function(){
		var self = this;
		for(var key in this.btns){
			var btn = this.btns[key],
				$btn = $(Utils.complier(ButtonTemplate||this.ButtonTemplate,btn));
			self.getBtnEl().append($btn);
			$btn.on("click",{btn:btn},function(ev){
				var btn = ev.data.btn;
				btn.action && btn.action(parseKeyValue(self.$body));
			});
		}
		this.afterInit();
	},
	afterInit:function(){
	},
	$body:function(){
		return this.find(".ui-price-content");
	},
	close:function(){
		this.$el.remove();
	},
	append:function(order){
		this.$el.aapend(order);
	},
	find:function(str){
		return this.$el.find(str);
	},
	show:function(){
		$("#iframeFile").val('');
		this.$el.show();
	}
};