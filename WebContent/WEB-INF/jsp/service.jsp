<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=basePath%>js/page/video.js" type="text/javascript"></script>
<title><form:i18n name="service"/></title>
</head>
<body>
	<%@include file="pagehead.jsp"%>
	<div style="position: relative;">
		<img id="playId" alt="" src="${basePath}image/play-nor.png" style="position: absolute;
    		left: 50%;
        	margin-left: -31px;
    		top: 202px;cursor:pointer">
		<img src="${basePath}newStyle/img/service.png"/>
	</div>
	<%@include file="pagefoot.jsp"%>
	 <script type="text/javascript">
$(function(){
	$("#playId").click(function(){
		video.play();
		$("body").css("overflow","hidden");
	});
});
</script>
</body>
</html>