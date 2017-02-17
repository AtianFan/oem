<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>视频</title>
</head>
<body>
<div id="videoDiv" style="width:60%;height:60%;z-index: 2000;">
<video src="${basePath}file/test.mp4" autoplay="autoplay" width="100%" height="100%" style="object-fit: cover;position: absolute;left:0;top:0;" controls preload>
</video>
</div>
</body>
</html>