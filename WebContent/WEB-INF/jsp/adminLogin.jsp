<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/page/loginPage.css"/>
<script type="text/javascript" src="<%=basePath%>js/page/adminLogin.js"></script>
<title><form:i18n name="adminLogin"/></title>
</head>
<body>
	<%@include file="pagehead.jsp"%>
	<form id="loginForm">
		<form:input name="loginName" title="loginName"/>
		<form:input name="password" type="password" title="password"/>
		<button id="loginBtn" type="button"><form:i18n name="login"/></button>
		<div class="foot">Copyright © 天津磁石APP 2016</div>
	</form>
</body>
</html>