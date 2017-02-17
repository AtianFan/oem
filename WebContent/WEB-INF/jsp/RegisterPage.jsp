<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/page/registerPage.css"/>
<title>注册页面</title>
</head>
<body>
	<form>
		<div id="registerForm">
			<form:input name="loginName" title="登陆名称"/>
			<form:input name="password" type="password" title="密码"/>
			<form:input name="type" title="类型"/>
			<form:input name="nickName" title="昵称"/>
			<form:input name="realName" title="真实姓名"/>
			<form:input name="idNo" title="身份证号"/>
			<form:input name="email" title="邮箱"/>
			<form:input name="phoneNumber" title="手机"/>
			<form:input name="address" title="地址"/>
			<!-- <div>
				<span>登陆名称</span><input id="loginName" type="text" name="loginName" maxlength=18/>
			</div>
			<div>
				<span>密码</span><input id="password" type="text" name="password"/>
			</div>
			<div>
				<span>类型</span><input id="type" type="text" name="type"/>
			</div>
			<div> 
				<span>昵称</span><input id="nickName" type="text" name="nickName"/>
			</div>
			<div>
				<span>真实姓名</span><input id="realName" type="text" name="realName"/>
			</div>
			<div>
				<span>身份证号</span><input id="idNo" type="text" name="idNo" maxlength=18/>
			</div>
			<div>
				<span>邮箱</span><input id="email" type="text" name="email"/>
			</div>
			<div>
				<span>手机</span><input id="phoneNumber" type="text" name="phoneNumber"/>
			</div>
			<div>
				<span>地址</span><input id="address" type="text" name="address"/>
			</div> -->
			<div id="register"><button type="button" id="registerBtn">注册</button></div>
		</div>
	</form>
	<script type="text/javascript">  
        $(document).ready(function() {  
            ajaxSubmit();  
        });  
        function ajaxSubmit() {  
            $("#register").click(function() {  
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
                var type = $("[name='type']").val().trim();  
                if (type.length === 0) {  
                    alert("类型不能为空！");
                    return false;  
                }
                var nickName = $("[name='nickName']").val().trim();  
                if (nickName.length === 0) {  
                    alert("昵称不能为空！");
                    return false;  
                }
                var realName = $("[name='realName']").val().trim();  
                if (realName.length === 0) {  
                    alert("真实姓名不能为空！");
                    return false;  
                }
                var idNo = $("[name='idNo']").val().trim();  
                if (idNo.length === 0) {  
                    alert("身份证号不能为空！");
                    return false;  
                }
                var email = $("[name='email']").val().trim();  
                if (email.length === 0) {  
                    alert("邮箱不能为空！");
                    return false;  
                }
                var phoneNumber = $("[name='phoneNumber']").val().trim();  
                if (phoneNumber.length === 0) {  
                    alert("手机号码不能为空！");
                    return false;  
                }
                var address = $("[name='address']").val().trim();  
                if (address.length === 0) {  
                    alert("地址不能为空！");
                    return false;  
                }
                $.ajax({  
                    url: "",  
                    type: "post",  
                    dataType: "json",  
                    data: {  
                        
                    },  
                    success: function() {  
                        alert("success");  
                    },  
                    error: function() {  
                        alert("error");  
                    }  
                });  
            });  
        } 
    </script> 
</body>
</html>