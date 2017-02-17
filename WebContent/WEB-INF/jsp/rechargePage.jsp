<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><form:i18n name="recharge" /></title>
<script type="text/javascript" src="${basePath}js/page/recharge.js"></script>
</head>
<body>
	<%@include file="pagehead.jsp"%>
	<form id="rechargeForm">
		<h4>
			<form:i18n name="money" />
		</h4>
		<div class="form-group">
			<input class="form-control" name="money" />
		</div>
		<h4>
			<form:i18n name="payType" />
		</h4>
		<div class="form-group">
			<select class="form-control" name="payType" id="selectType">
				<option value="1">银行1</option>
			</select>
		</div>
		<h4>
			<form:i18n name="payAccount" />
		</h4>
		<div class="form-group">
			<input class="form-control" name="payAccount" />
		</div>
		<button type="button" class="btn btn-primary" id=rechargeBtn><form:i18n name="recharge"/></button>
	</form>
</body>
</html>