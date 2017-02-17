<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/page/modifyUser.css"/>
<script type="text/javascript" src="<%=basePath%>js/page/modifyUserInfo.js"></script>
<title><form:i18n name="modifyUserInfo"/></title>
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
	function uploadIconSuccess(id,fileUrl,fileName){
		$("#imghead").attr("src",fileUrl);
		$("#img_id_input").val(id);
	}
</script>
</head>
<body>

	<%@include file="pagehead.jsp" %>
	<form id="modifyUserForm">
		<div id="preview">
		    <img id="imghead" width=100 height=100 border=0 src='<%=basePath%>/image/57674ab3154de.png'>
		</div>
		<input type="hidden" id="img_id_input" name="icon"/>
		<iframe left="-20px" height="50px" width="400px" src="uploadFile.do?callback=uploadIconSuccess" frameborder=0></iframe>
		<form:input name="loginName" title="loginName"/>
	<%-- 	<form:select name="type" id="type_select" title="type" data='[{value:1,title:"personal"},{value:2,title:"company"}]'/>
		<form:select name="accountType" id="account_type_select" title="accountType" data='[{value:1,title:"receiver"},{value:2,title:"launcher"}]'/> --%>
		<form:input name="company" class_tag="company_tag" title="company"/>
		<form:input name="nickName" title="nickName"/>
		<form:input name="realName" title="realName"/>
		<form:input name="idNo" title="idNo"/>
		<form:input name="email" title="email"/>
		<form:input name="phoneNumber" title="phoneNumber"/>
		<form:input name="address" title="address"/>
		<button type="button" id="modifyBtn"><form:i18n name="modify"/></button>
		<div class="foot">Copyright © 天津磁石APP 2016</div>
	</form>
</body>
</html>