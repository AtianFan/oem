<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/page/loginPage.css"/>
<title>登录首页</title>
</head>
<body>
	<form>
		<div id="loginForm">
			<div class="loginTitle">登      录</div>
			<form:input name="loginName" title="用户名"/>
			<form:input name="password" type="password" title="密码"/>
			<div id="login"><button id="loginBtn" type="button" onclick="">login</button></div>
			<div id="register"><button type="button" id="regstBtn" onclick="window.location.href='RegisterPage.do';">register</button></div>
		</div>
	</form>
	<script type="text/javascript">  
        $(document).ready(function() {  
            ajaxSubmit();  
        });  
        function ajaxSubmit() {  
            $("#login").click(function() {  
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
                $.ajax({  
                    url: "",
                    type: "post",  
                    dataType: "json",  
                    data: {  
                        "userName": username,  
                        "password": psw 
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