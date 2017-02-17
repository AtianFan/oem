<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/page/modifyPwd.css"/>
<script type="text/javascript" src="<%=basePath%>js/page/modifyPwd.js"></script>
<title><form:i18n name="modifyPwd"/></title>
</head>
<body>

	<%@include file="pagehead.jsp" %>
	<form id="modifyPwdForm">
		<label class="title"><form:i18n name="modifyPwd"/></label>
		<form:input name="oldPwd" type="password" title="oldPwd"/>
		<form:input name="newPwd" type="password" title="newPwd"/>
		<form:input name="confirmPwd" type="password" title="confirmPwd"/>
		<button type="button" id="modifyBtn"><form:i18n name="modify"/></button>
		<div class="foot">Copyright © 天津磁石APP 2016</div>
	</form>
</body>
</html>