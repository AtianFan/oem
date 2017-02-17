<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/page/registerPage.css"/>
<script type="text/javascript" src="<%=basePath%>js/page/register.js"></script>
<title><form:i18n name="register"/></title>
<style>
.company_tag{
	display: none;
}
</style>
<script type="text/javascript">
	function callback_type_select(obj){
		var value = obj.value;
		if(value==1){
			$(".company_tag").hide();
		}else{
			$(".company_tag").show();
			//obj.style.display="block";
		}
	}
	function callback_account_type_select(obj){
		
	}
	var orderId = '${id}';
	function uploadIconSuccess(id,fileUrl,fileName){
		$("#icon_img").attr("src",fileUrl);
		$("#icon_id_input").val(id);
	}
</script>
</head>
<body>

	<%@include file="pagehead.jsp" %>
	<form id="registerForm">
		<div class="form-group" id ="regUpImg" >
			<h4><form:i18n name="headPortrait"/></h4>
			 <img src="" width="100px" height="100px" id="icon_img"/> 
			 <div class="">
			 	<input class="form-input-file" type="hidden"
					name="iconId" id="icon_id_input">
				<iframe
					height="37px" src="uploadFile.do?callback=uploadIconSuccess" frameborder=0></iframe>
			 </div>
		</div>
		<input type=“text” display="none" /><form:input name="loginName" title="loginName"/>
		<input type=“text” display="none" /><form:input name="password" type="password" title="password"/>
		<form:select name="type" id="type_select" title="type" data='[{value:1,title:"个人"},{value:2,title:"团队"}]'/>
		<form:select name="accountType" id="account_type_select" title="accountType" data='[{value:1,title:"接收者"},{value:2,title:"发布者"}]'/>
		<form:input name="company" class_tag="company_tag" title="company"/>
		<form:input name="nickName" title="nickName"/>
		<form:input name="realName" title="realName"/>
		<form:input name="idNo" title="idNo"/>
		<form:input name="email" title="email"/>
		<form:input name="phoneNumber" title="phoneNumber"/>
		<form:input name="address" title="address"/>
		<button type="button" id="registerBtn"><form:i18n name="register"/></button>
		<div class="foot">Copyright © 天津磁石APP 2016</div>
	</form>
</body>
</html>