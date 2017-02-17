/**
 * 
 */
define(function(require) {
	"use stricts";
	var PanelWidget = require("widget/PanelWidget");
	var panel = new PanelWidget(), form = panel.addForm({
		attrs : {
			id : "login_form"
		}
	});
	form.addInput({
		name:"登陆名:",
		attrs : {
			type : "text",
			name : "loginName"
		}
	});
	form.addInput({
		name:"密码:",
		attrs : {
			type : "text",
			name : "password"
		}
	});
	var upload = form.addUploadFile({
		name:"test"
	});
	/*upload.addInput({
		attrs:{
			type:"button",
			value:"上传"
		},
		click:function($el){
			var data = form.serialize();
			Zqy.utils.ajax({
				url:"/VideoTradePlat/upload",
				type:'POST',
				formData:new FormData(upload.getElement()[0])
//				data:data
			}).done(function(resp){
				console.log(resp);
			});
		}
	});*/
	form.addInput({
		attrs:{
			type:"button",
			value:"登陆"
		},
		click:function($el){
			var data = form.serialize();
			Zqy.utils.ajax({
				url:"/VideoTradePlat/SysUser/login",
				type:'post',
				data:data
			}).done(function(resp){
				console.log(resp);
			});
		}
	});
});