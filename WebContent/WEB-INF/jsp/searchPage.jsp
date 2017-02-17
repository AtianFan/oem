<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	var keyWord = decodeURI(decodeURI('${param.keyWord}'));
</script>
<link type="text/css" rel="stylesheet" href="<%=basePath%>newStyle/css/homePage.css"/>
<script src="<%=basePath%>js/lib/List.js" type="text/javascript"></script>
<script src="<%=basePath%>js/page/homePage.js" type="text/javascript"></script>
<title><form:i18n name="homePage"/></title>
</head>
<body>
	<%@include file="pagehead.jsp"%>

	<!-- Header Carousel -->
	<div class="search_header">
		<a class="total_project" href="${basePath}Page/mainPage"><form:i18n name="all"/></a>
		<span class="search_page_info"><form:i18n name="search_page_info"/></span>
	</div>
	<div class="bg-gray">
	    <div class="sb-container">
	        <div class="pro-list" id="taskContentDiv">
	        </div>
	    </div>
	</div>
	<%@include file="pagefoot.jsp"%>
	<!-- Bootstrap Core JavaScript -->
    <script src="<%=basePath%>js/vendor/bootstrap.min.js"></script>
	<!-- Script to Activate the Carousel -->
	<script>
		$('#myCarousel .carousel').carousel({
			interval : 5000
		//changes the speed
		});
	</script>
</body>
</html>