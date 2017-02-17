/**
 * 
 */

var LoginPage = {
	loginUrl:basePath+"SysUser/login.json",
	login:function(){
		var $form = $("#loginForm");
		Utils.ajax({
			url:LoginPage.loginUrl,
			data:$form.parseKeyValue()
		}).done(function(resp){
//			console.log(resp);
			//登陆错误
			var data = $form.parseKeyValue();
			if(resp.retcode!=0){
				//window.location.href=basePath+"Page/register.do";
				//alert("请先进行注册！");
			}else{
				//登陆成功
				window.location.href=basePath+"Page/mainPage";//.do/"+data.loginName;
			}
		});
	}
};
$(function(){
	$("#loginBtn").click(function(){
		LoginPage.login();
	});
	$("#registerBtn").click(function(){
		window.location.href=basePath+"Page/register";
	});
});