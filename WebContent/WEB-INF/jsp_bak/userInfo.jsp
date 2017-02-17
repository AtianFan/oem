<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<%
	String id = request.getParameter("id");
request.setAttribute("id", id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	var orderId = '<%=id%>';
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=basePath%>js/page/userInfo.js"></script>
<title>用户详情页面</title>
</head>
<body>
	<%@include file="pagehead.jsp"%>
	<div class="form-usercontrol" id="userInfo"></div>
	<%-- <div class="">
		<button type="button">
			<form:i18n name="want_to_receive" />
		</button>
	</div> 
	<div class="form-control" id="receiveListDiv">接单列表</div>
	<div class="form-control" id="receiveListDiv"></div>
	<form id="receiveTaskForm">
		<form:input name="orderId" type="hidden" defaultValue="${id}" />
		<form:textarea name="remark" />
		<form:input name="money"/>
		<form:button type="button" title="want_to_receive" id="want_to_receiveBtn"/>
	</form>
	--%>
</body>
</html>