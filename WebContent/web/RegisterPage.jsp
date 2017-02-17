<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录首页</title>
</head>
<body>
	<form id="registerForm">
		<div style="position:absolute;top:30%;left:35%;width:500px;font-size:20px;font-weight:bloder;text-align:center;">
				<div style="width:500px;height:30px;font-size:20px;font-weight:bloder;width:auto;text-align:center;margin:20px;">
					<span style="position:absolute;width:100px;height:30px;left:0px;line-height:30px;">登陆名称</span><input type="text" name="loginName" maxlength=18 style="position: absolute;left: 100px;width: 200px;height: 30px;font-size:20px;"/>
				</div>
				<div style="width:500px;height:30px;font-size:20px;font-weight:bloder;width:auto;text-align:center;margin:20px;">
					<span style="position:absolute;width:100px;height:30px;left:0px;line-height:30px;">密码</span><input type="text" name="password" style="position: absolute;left: 100px;width: 200px;height: 30px;font-size:20px;"/>
				</div>
				<div style="width:500px;height:30px;font-size:20px;font-weight:bloder;width:auto;text-align:center;margin:20px;">
					<span style="position:absolute;width:100px;height:30px;left:0px;line-height:30px;">类型</span><input type="text" name="type" style="position: absolute;left: 100px;width: 200px;height: 30px;font-size:20px;"/>
				</div>
				<div style="width:500px;height:30px;font-size:20px;font-weight:bloder;width:auto;text-align:center;margin:20px;">
					<span style="position:absolute;width:100px;height:30px;left:0px;line-height:30px;">昵称</span><input type="text" name="nickName" style="position: absolute;left: 100px;width: 200px;height: 30px;font-size:20px;"/>
				</div>
				<div style="width:500px;height:30px;font-size:20px;font-weight:bloder;width:auto;text-align:center;margin:20px;">
					<span style="position:absolute;width:100px;height:30px;left:0px;line-height:30px;">真实姓名</span><input type="text" name="realName" style="position: absolute;left: 100px;width: 200px;height: 30px;font-size:20px;"/>
				</div>
				<div style="width:500px;height:30px;font-size:20px;font-weight:bloder;width:auto;text-align:center;margin:20px;">
					<span style="position:absolute;width:100px;height:30px;left:0px;line-height:30px;">身份证号</span><input type="text" name="idNo" maxlength=18 style="position: absolute;left: 100px;width: 200px;height: 30px;font-size:20px;"/>
				</div>
				<div style="width:500px;height:30px;font-size:20px;font-weight:bloder;width:auto;text-align:center;margin:20px;">
					<span style="position:absolute;width:100px;height:30px;left:0px;line-height:30px;">邮箱</span><input type="text" name="email" style="position: absolute;left: 100px;width: 200px;height: 30px;font-size:20px;"/>
				</div>
				<div style="width:500px;height:30px;font-size:20px;font-weight:bloder;width:auto;text-align:center;margin:20px;">
					<span style="position:absolute;width:100px;height:30px;left:0px;line-height:30px;">手机</span><input type="text" name="phoneNumber" style="position: absolute;left: 100px;width: 200px;height: 30px;font-size:20px;"/>
				</div>
				<div style="width:500px;height:30px;font-size:20px;font-weight:bloder;width:auto;text-align:center;margin:20px;">
					<span style="position:absolute;width:100px;height:30px;left:0px;line-height:30px;">地址</span><input type="text" name="address" style="position: absolute;left: 100px;width: 200px;height: 30px;font-size:20px;"/>
				</div>
				<div style="position:absolute;left:25%;font-size:20px;font-weight:bloder;width:auto;text-align:center;margin:20px;"><button type="button" id="registerBtn" style="width: 80px;height: 30px;">注册</button></div>
		</div>
	</form>
</body>
</html>