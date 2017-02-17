/**
 * 
 */
var preData = null;
var ModifyUser = {
	findUser:function(){
		Utils.ajax({
			url:basePath+"SysUser/loadCurrentUser.json",
			type:"post",
			dataType:"json"
		}).done(function(resp){
			preData = resp.data;
			ModifyUser.show(preData);
		});
	},
	show:function(preData){
		if (preData.iconFile!=null&&preData.iconFile.fileUrl !== null && preData.iconFile.fileUrl !== '' && preData.iconFile.fileUrl !== undefined) {
			$("[id='imghead']").attr("src",preData.iconFile.fileUrl);
		}
		$("#id").val(preData.id);
		$("[name='loginName']").val(preData.loginName);
		$("#modifyUserForm").find("input")[1]&&$("#modifyUserForm").find("input")[1].setAttribute("disabled","disabled");
        $("[name='type']").val(preData.type);  
        $("[name='nickName']").val( preData.nickName);  
        $("[name='realName']").val(preData.realName);  
        $("#modifyUserForm").find("input")[5]&&$("#modifyUserForm").find("input")[4].setAttribute("disabled","disabled");
        $("[name='idNo']").val(preData.idNo);  
        $("#modifyUserForm").find("input")[6]&&$("#modifyUserForm").find("input")[5].setAttribute("disabled","disabled");
        $("[name='email']").val(preData.email);  
        $("[name='phoneNumber']").val(preData.phoneNumber);          
        $("[name='address']").val(preData.address);
        $("label.accountReadonly").text(preData.loginName+"_readonly");
        $("input.accountReadonly").val(preData.loginName+"_readonly");
        $(".readonlyFlag").val(preData.readonlyFlag);
        $("#lock_icon").removeClass().addClass(preData.readonlyFlag?"lock_icon_on":"lock_icon_off");
	},
	modifyUser:function(){
		if(!ModifyUser.checkMail()){
			return;
		}
		Utils.ajax({
			url:basePath+"SysUser/updateUser.json",
			data:$("#modifyUserForm").parseKeyValue(),
			type:"post",
			dataType:"json"
		}).done(function(resp){
			if(resp.retcode==0){
				alert(i18n("success"));
			}
			var preData = resp.data;
			ModifyUser.show(preData);
		});
	},
	check:function(){
        var nickName = $("[name='nickName']").val().trim();
        var realName = $("[name='realName']").val().trim();
        var email = $("[name='email']").val().trim();
        var phoneNumber = $("[name='phoneNumber']").val().trim();
        var address = $("[name='address']").val().trim();
       /* if ((nickName === preData.nickName) && (email === preData.email) && (phoneNumber === preData.phoneNumber) && (address === preData.address)) {  
            alert("用户信息未进行任何修改！");
            return false;  
        }
        if ((nickName !== preData.nickName) || (email !== preData.email) || (phoneNumber !== preData.phoneNumber) || (address !== preData.address)) {  
            preData.nickName = nickName;
            preData.realName = realName;
            preData.email = email;
            preData.phoneNumber = phoneNumber;
            preData.address = address;
            return preData;  
        }*/
	},
	checkMail:function(){
		var email = $("[name='idNo']").val().trim();
		var mailTest=/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;;
		if (mailTest.test(email)){
			if(!ModifyUser.checkPhone()){
				return false;
			}
			return true;
		} else {
			$(".idNo_class span.msg").text("身份证号输入有误！");
			return false;
		}
	},
	checkPhone:function(){
		var phoneNumber = $("[name='phoneNumber']").val().trim();
		var phoneTest=/^1\d{10}$/;
		if (phoneTest.test(phoneNumber)){
			ModifyUser.check();
			return true;
		} else {
			$(".phonenumber_class span.msg").text("手机号输入有误！");
			return false;
		}
	}
};

$(function(){
	ModifyUser.findUser();
	$("#modifyBtn").click(function(){
		ModifyUser.modifyUser();
	});
	
	$("#cancle").click(function(){
		history.go(-1);
	});
});