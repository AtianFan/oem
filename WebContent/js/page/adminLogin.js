/**
 * 
 */

var AdLoginPage = {
	loginUrl:basePath+"SysUser/adminLogin.json",
	login:function(){
		var $form = $("#loginForm");
		Utils.ajax({
			url:AdLoginPage.loginUrl,
			data:$form.parseKeyValue()
		}).done(function(resp){
			//登陆错误
			var data = $form.parseKeyValue();
			if(resp.retcode!=0){
				
			}else{
				//登陆成功
				window.location.href=basePath+"Page/managePage";
			}
		});
	}
};
$(function(){
	$("#loginBtn").click(function(){
		AdLoginPage.login();
	});
});