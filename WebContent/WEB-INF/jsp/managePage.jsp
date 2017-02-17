<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap/jquery.bdt.min.css" media="screen" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>css/bootstrap/vendor/bootstrap.min.css" media="screen" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>css/page/managePage.css" media="screen" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/lib/jquery-3.0.0.min.js"></script>
<script src="<%=basePath%>js/vendor/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/vendor/jquery.sortelements.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery.bdt.js" type="text/javascript"></script>
<script src="<%=basePath%>js/lib/List.js" type="text/javascript"></script>
<script src="<%=basePath%>js/page/managePage.js" type="text/javascript"></script>
<title><form:i18n name="managePage"/></title>
</head>
<body>
	<%@include file="pagehead.jsp"%>
	<div id="container">
	</div>
	
	<div id="taskContainer">
	</div>

	<!-- Page Content -->
	<%-- <div class="container">

		<!-- Content Row -->
		<div class="row" id="userDiv" style="overflow:hidden;">
			 <div class="col-lg-12">
                <h1 class="page-header">
                  	<form:i18n name="recomm"/>
                </h1>
            </div>
		</div>
		<div class="row text-center" id="taskContentDiv"style="overflow:hidden;">
			<div class="col-lg-12">
                <h2 class="page-header"><form:i18n name="hotTaskPage"/></h2>
            </div>
		</div>
	</div> --%>
</body>
</html>