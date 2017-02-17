<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录首页</title>
</head>
<body>
	<div style="position:absolute;top:30%;left:35%;width:400px;height:300px;border:1px solid #000000;">
		<div style="position:relative;top:10%;font-size:24px;font-weight:bloder;width:auto;text-align:center;">登      录</div>
		<div id="userid" style="position:relative;top:15%;font-size:24px;font-weight:bloder;width:auto;text-align:center;">
		<p style="position: absolute;font-size: 20px;width: 100px;height: 30px;line-height: 30px;text-align:center;">用  户  名</p>
		<input type="text" name="uname" maxlength=12 style="position: absolute;top: 16px;left: 30%;width: 250px;height: 30px;font-size:20px;"/></div>
		<div id="password" style="position:relative;top:40%;font-size:24px;font-weight:bloder;width:auto;text-align:center;">
		<p style="position: absolute;top:20%;font-size: 20px;width: 100px;height: 30px;line-height: 30px;text-align:center;">密     码</p>
		<input type="text" name="psw" maxlength=12 style="position: absolute;top: 16px;left: 30%;width: 250px;height: 30px;font-size:20px;"/></div>
		<div id="login" style="position: absolute;bottom:10%;left:15%;"><button type="button" style="width: 80px;height: 30px;">login</button></div>
		<div id="register" style="position: absolute;bottom:10%;right:15%;"><button type="button" style="width: 80px;height: 30px;">register</button></div>
	</div>
</body>
</html>