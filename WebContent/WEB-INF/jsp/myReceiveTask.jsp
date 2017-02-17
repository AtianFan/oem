<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var pageType = "${pageType}";
	var status = "<%=request.getParameter("status")%>";
	var complate = "<%=request.getParameter("complate")%>";
	var all = "<%=request.getParameter("all")%>";
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=basePath%>js/lib/List.js" type="text/javascript"></script>
<script src="<%=basePath%>js/page/myReceiveTask.js" type="text/javascript"></script>
<script src="<%=basePath%>js/page/mainPage.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/page/mainPage.css"/>
<title>信息主页</title>
<style type="text/css">
.img-responsive {
    width: 480px!important;
    height: 220px!important;
    border-radius: 2px;
}
</style>
</head>
<body>
	<%@include file="pagehead.jsp"%>
	<!-- Page Content -->
	<div class="container task-list">

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
	</div>
	<%@include file="pagefoot.jsp"%>
</body>
</html>