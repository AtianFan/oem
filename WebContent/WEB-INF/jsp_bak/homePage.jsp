<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=basePath%>js/lib/List.js" type="text/javascript"></script>
<script src="<%=basePath%>js/page/homePage.js" type="text/javascript"></script>
<title><form:i18n name="homePage"/></title>
</head>
<body>
	<%@include file="pagehead.jsp"%>

	<!-- Header Carousel -->
	<header id="myCarousel" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<div class="fill" style="background-image: url('<%=basePath%>image/1.png');"></div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
			</div>
			<div class="item">
				<div class="fill" style="background-image: url('<%=basePath%>image/2.png');"></div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
			</div>
			<div class="item">
				<div class="fill" style="background-image: url('<%=basePath%>image/3.jpg');"></div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</header>

	<!-- Page Content -->
	<div class="container">

		<!-- Content Row -->
		<div class="row" id="recContentDiv" style="overflow:hidden;">
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
	</div>
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