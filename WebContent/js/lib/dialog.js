/**
 * template：'',
 * title:'',
 * data:'',
 * confirm:
 * cancel
 * btns:
 */
var DialogTemplate = [
                      ' <div class="ui-dialog-mask"><div class="ui-dialog">',
                      		'<div class="ui-dialog-title">{title}</div>',
                      		'<div class="ui-dialog-body">{html}</div>',
                      		'<ul class="ui-dialog-btns">',
                      		'</ul>',
                      '</div></div>'
                      ].join(""),
                      BtnTemplate = '<li> <span class="green-btn">{title}</span></li>';
var Dialog = function(option){
	var defaultSeting = {
		title:"警告",
		html:'<div></div>',
		btns:[
		      {
		    	  name:'',
		    	  title:'',
		    	  action:function(){
		    		  
		    	  }
		      }
		]
	}
	$.extend(this,option);
	this.init();
}
Dialog.prototype = {
	btnsList:[],
	init:function(){
		var data = {title:this.title,html:this.html};
		this.$el = $("<div></div>").html(Utils.complier(DialogTemplate,data));
		$("body").append(this.$el);
		this.initButtons();
	},
	find:function(str){
		return this.$el.find(str);
	},
	getText:function(name){
		var body = this.find(".ui-dialog-body"),
		control = body.find("[name='"+name+"']");
		return control?control.val():null;
	},
	initButtons:function(){
		var pBtns = this.find(".ui-dialog-btns"),self = this;
		for(var i =0,length=this.btns.length;i<length;i++){
			var btn = this.btns[i];
			var $btns = $(Utils.complier(BtnTemplate,btn));
			$btns.on("click",btn,function(event){
				var obj = event.data;
				obj.action && obj.action(self.data);
			});
			this.btnsList.push($btns);
			pBtns.append($btns);
		}
	},
	close:function(){
		this.$el.remove();
	}
}
function SysConfirmDialog(option,callback){
	var sysConfirmDialog = new Dialog({
		title:option.title||i18n('cofirm'),
		html:option.html,
		btns:[{
			title:i18n("confirm"),
			action:function(data){
				callback && callback(sysConfirmDialog.getText("remark"));
				sysConfirmDialog.close();
			}
		},{
			title:i18n("cancle"),
			action:function(data){
				sysConfirmDialog.close()
			}
		}]
	});
	return sysConfirmDialog;
};