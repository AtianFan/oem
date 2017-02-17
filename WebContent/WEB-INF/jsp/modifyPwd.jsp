<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/page/modifyUser.css"/>
<script type="text/javascript" src="<%=basePath%>js/page/modifyPwd.js"></script>
<title><form:i18n name="modifyPwd"/></title>
</head>
<body>

	<%@include file="pagehead.jsp" %>
	<div class="modify-info-ui">
		<form id="modifyPwdForm">
			<form:input name="oldPwd" type="password" title="oldPwd"/>
			<form:input name="newPwd" type="password" title="newPwd"/>
			<form:input name="confirmPwd" type="password" title="confirmPwd"/>
			<span type="button" id="modifyBtn"><form:i18n name="modify"/></span>
			<span type="button" id="cancle"><form:i18n name="cancle"/></span>
		</form>
	</div>
	<%@include file="pagefoot.jsp" %>
</body>
</html>