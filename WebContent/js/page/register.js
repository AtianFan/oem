/**
 * 
 */
var Register = {
	register:function(){
		if(!Register.check()){
			return;
		}
		Utils.ajax({
			url:basePath+"SysUser/register.json",
			data:$("#registerForm").parseKeyValue(),
			type:"post",
			dataType:"json"
		}).done(function(resp){
			console.log(resp);
			if(resp.retcode==0){
				alert("注册成功，审核完毕之后，审核结果会以短信或邮件的方式，通知用户");
				window.location.href=basePath+"Page/homePage";
				return;
			}
			if(resp.retcode=='899996'){
				alert("注册成功");
				window.location.href='login.do';
			}
		});
	},
	check:function(){
		var username = $("[name='loginName']").val().trim();  
        if (username.length === 0) {  
            alert("用户名不能为空！");  
            return false;  
        }  
        var psw = $("[name='password']").val().trim();  
        if (psw.length === 0) {  
            alert("密码不能为空！");
            return false;  
        }
        var apsw = $("[name='againPassword']").val().trim();  
        if (psw.length === 0) {  
            alert("确认密码不能为空！");
            return false;  
        }
        if(psw!=apsw){
        	alert("两次密码不一致");
            return false;
        }
        if(psw.length<6){
        	alert("密码长度不能小于6位");
        	return false;
        }
//        var type = $("[name='type']").val().trim();  
//        if (type.length === 0) {  
//            alert("类型不能为空！");
//            return false;  
//        }
       /* var nickName = $("[name='nickName']").val().trim();  
        if (nickName.length === 0) {  
            alert("昵称不能为空！");
            return false;  
        }
        var realName = $("[name='realName']").val().trim();  
        if (realName.length === 0) {  
            alert("真实姓名不能为空！");
            return false;  
        }*/
        var idNo = $("[name='idNo']").val().trim();  
        if (idNo.length === 0) {  
        	$(".idNo_class span.msg").text("身份证号输入有误");
            return false;  
        }
        var idTest = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if (!idTest.test(idNo)){
			$(".idNo_class span.msg").text("身份证号输入有误");
			return false;
		}
       /* var email = $("[name='email']").val().trim();  
        if (email.length === 0) {  
            alert("邮箱不能为空！");
            return false;  
        }
        var mailTest=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		if (!mailTest.test(email)){
			alert("不是合法的邮箱地址！");
			return false;
		}*/
        var phoneNumber = $("[name='phoneNumber']").val().trim();  
        if (phoneNumber.length === 0) {  
        	$(".phonenumber_class span.msg").text("手机号输入有误");
            return false;  
        }
        var phoneTest=/^1\d{10}$/;
		if (!phoneTest.test(phoneNumber)){
//			alert("不是合法的手机号码！");
			$(".phonenumber_class span.msg").text("手机号输入有误");
			return false;
		}
        /*var address = $("[name='address']").val().trim();  
        if (address.length === 0) {  
            alert("地址不能为空！");
            return false;  
        }*/
		return true;
	}
};

$(function(){
	$("#registerBtn").click(function(){
		Register.register();
	});
});