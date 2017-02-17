/**
 * 
 */
define(function(require) {
	"use stricts";
	var PanelWidget = require("widget/PanelWidget");
	var panel = new PanelWidget(), form = panel.addForm({
		attrs : {
			id : "registerForm"
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
	form.addInput({
		name:"类型:",
		attrs : {
			type : "text",
			name : "type"
		}
	});
	form.addInput({
		name:"昵称:",
		attrs : {
			type : "text",
			name : "nickName"
		}
	});
	form.addInput({
		name:"真实姓名:",
		attrs : {
			type : "text",
			name : "realName"
		}
	});
	form.addInput({
		name:"身份证号:",
		attrs : {
			type : "text",
			name : "idNo"
		}
	});
	form.addInput({
		name:"邮箱:",
		attrs : {
			type : "text",
			name : "email"
		}
	});
	form.addInput({
		name:"手机:",
		attrs : {
			type : "text",
			name : "phoneNumber"
		}
	});
	form.addInput({
		name:"地址:",
		attrs : {
			type : "text",
			name : "address"
		}
	});
	form.addInput({
		attrs:{
			type:"button",
			value:"注册"
		},
		click:function($el){
			var data = form.serialize();
			Zqy.utils.ajax({
				url:"/VideoTradePlat/SysUser/register",
				type:'post',
				data:data
			}).done(function(resp){
				console.log(resp);
			});
		}
	});
});