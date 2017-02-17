/**
 * 
 */
var preData = null;
var ModifyPwd = {
	modifyPwd:function(){
		if(!ModifyPwd.check()){
			return;
		}
		var oldPwd = $("[name='oldPwd']").val().trim();
		var newPwd = $("[name='newPwd']").val().trim();
		var confirmPwd = $("[name='confirmPwd']").val().trim();
		Utils.ajax({
			url:basePath+"SysUser/modifyPassword.json",
			data:{
				oldPassword:oldPwd,
				newPassword:newPwd,
				confirmNewPassword:confirmPwd
				},
			type:"post",
			dataType:"json"
		}).done(function(resp){
			if(resp.retcode == 0){
				alert('修改成功！');
				var preData = resp.data;
				ModifyUser.show(preData);
			}else if(resp.retcode == 101005){
				alert('原密码错误或者两次密码不一致！');
			}
		});
	},
	check:function(){ 
		var $form = $("#modifyPwdForm");
        var oldPwd = $("[name='oldPwd']").val().trim();  
        var newPwd = $("[name='newPwd']").val().trim();
        var confirmPwd = $("[name='confirmPwd']").val().trim(); 
        if(oldPwd == ""){
       	 	alert("旧码不能为空！");
       	 	return false;  
        }
        if(newPwd == ""){
        	 alert("新密码不能为空！");
        	 return false;  
        }
        if(confirmPwd == ""){
        	alert("确认密码不能为空！");
       	 	return false;  
       }
        if(newPwd.length<6){
        	alert("新密码长度不能小于6位");
        	return false;  
        }
        if (newPwd !== confirmPwd) {
        	$form.showMessage("新密码和确认密码不一致！");
            return false;  
        }
        return true;
	}
};

$(function(){
	$("#modifyBtn").click(function(){
		ModifyPwd.modifyPwd();
	});
	$("#cancle").click(function(){
		history.go(-1);
	});
});