<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	var pageType = '0';
</script>
<script src="<%=basePath%>js/lib/List.js" type="text/javascript"></script>
<script src="<%=basePath%>js/page/mainPage.js" type="text/javascript"></script>
<link style="text/css" rel="stylesheet" href="<%=basePath%>css/page/mainPage.css">
<script type="text/javascript" src="<%=basePath%>js/page/showPriceDialog.js"></script>
<title><form:i18n name="hotTaskPage"/></title>
</head>
<body>
	<%@include file="pagehead.jsp"%>
	<!-- Page Content -->
	<div class="container">

		<!-- Content Row -->
		<div class="row" style="margin-top:50px;">
			<!-- Sidebar Column -->
			<div class="col-md-3">
				<div class="list-group" id="typeDom">
					<!-- <a href="#" class="list-group-item active">全部</a> <a href="#"
						class="list-group-item">平面设计</a> <a href="#"
						class="list-group-item">网站设计</a> <a href="#"
						class="list-group-item">app设计</a> <a href="#"
						class="list-group-item">二维动画</a> <a href="#"
						class="list-group-item">三维动画</a> <a href="#"
						class="list-group-item">多媒体</a> <a href="#"
						class="list-group-item">影视特效</a> <a href="#"
						class="list-group-item">影视后期</a> -->
				</div>
			</div>
			<!-- Content Column -->
			<div class="col-md-9" id="taskContentDiv">
				<!-- Pagination -->
			</div>
		</div>
	<!-- 	<div class="row" id="taskContentDiv" style="text-align:center;">
		</div> -->
		<%@include file="confirm.jsp"%>
	</div>
</body>
</html>