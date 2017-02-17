/**
 * 
 */

define(function(require){
	'use stricts';
	var  ElementWidget = require("widget/ElementWidget"),
		UploadFile = require("widget/UploadWidget"),
		Input = require("widget/InputWidget");
	return ElementWidget.extend({
		template:"<form class='ui-zqy-form'></form>",
		getFormValue:function(){
			return this.$el.serialize();
		},
		serialize:function(){
			var data = {};
			this.$el.find("input,select,textarea").each(function(index,el){
				var name = $(el).prop("name");
				if(name=="loginName" && (el.value==null||el.value=='')){
					alert("登录名不能为空！");
					return false;
				}
				if(name=="password" && (el.value==null||el.value=='')){
					alert("密码不能为空！");
					return false;
				}
				if(name=="type" && (el.value==null||el.value=='')){
					alert("类型不能为空！");
					return false;
				}
				if(name=="nickName" && (el.value==null||el.value=='')){
					alert("昵称不能为空！");
					return false;
				}
				if(name=="realName" && (el.value==null||el.value=='')){
					alert("真实姓名不能为空！");
					return false;
				}
				if(name=="idNo" && (el.value==null||el.value=='')){
					alert("身份证号不能为空！");
					return false;
				}
				if(name=="email" && (el.value==null||el.value=='')){
					alert("邮箱不能为空！");
					return false;
				}
				if(name=="phoneNumber" && (el.value==null||el.value=='')){
					alert("手机号码不能为空！");
					return false;
				}
				if(name=="address" && (el.value==null||el.value=='')){
					alert("地址不能为空！");
					return false;
				}
				if(name && el.value){
					data[name] = el.value;
				}
			});
			return data;
		}
	});
});