<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=basePath%>newStyle/css/homePage.css"/>
<script src="<%=basePath%>js/lib/List.js" type="text/javascript"></script>
<script src="<%=basePath%>js/page/homePage.js" type="text/javascript"></script>
<title><form:i18n name="homePage"/></title>
</head>
<body>
	<%@include file="pagehead.jsp"%>

	<!-- Header Carousel -->
	<div style="background-color:rgb(238,238,244);">
	<header id="myCarousel" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active homepage_carousel">
				<a href="${basePath}Page/service" target="_blank"><div class="fill" style="background-image: url('<%=basePath%>image/pic1.png');">
				</div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
				<div class="words_parent">
					<div class="words top90 service">
						<p class="icon left">平台服务</p>
						<p class="gray left">Platform services</p>
						<p class="small left">国家数字内容贸易服务平台是中国文化产业协会牵头组织的公共性平台项目</p>
					</div>
				</div></a>
			</div>
			<div class="item homepage_carousel">
				<a href="${basePath}Page/register" target="_blank"><div class="fill" style="background-image: url('<%=basePath%>image/pic2.png');"></div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
				<div class="words_parent">
					<div class="words top106">
						<p class="center">Partner with the world and bring VFX projects to life</p>
						<p class="gray small center">The collaboration platform for making animated films, video games and virtual reality content.</p>
						<span class="join_us_btn">加入我们</span>
					</div>
				</div></a>
			</div>
			<div class="item homepage_carousel">
				<a href="${basePath}Page/ValueAdd#0" target="_blank"><div class="fill" style="background-image: url('<%=basePath%>image/pic3.png');"></div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
				<div class="words_parent">
					<div class="words top45">
						<p class="center">增值技术服务</p>
						<p class="center">Value-added services</p>
						<ul class="ul_list_image">
							<li><div class="bt1" onClick="return goValueAdd(1)"></div><span onClick="return goValueAdd(1)">DIT</span></li>
							<li><div class="bt2" onClick="return goValueAdd(2)"></div><span onClick="return goValueAdd(2)">影视修复</span></li>
							<li><div class="bt3" onClick="return goValueAdd(3)"></div><span onClick="return goValueAdd(3)">影视渲染</span></li>
							<li><div class="bt4" onClick="return goValueAdd(4)"></div><span onClick="return goValueAdd(4)">海外合作伙伴</span></li>
						</ul>
					</div>
				</div></a>
			</div>
			<div class="item homepage_carousel">
				<a href="${basePath}Page/join" target="_blank"><div class="fill" style="background-image: url('<%=basePath%>image/pic4.png');"></div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
				<div class="words_parent">
					<div class="words_parent">
						<div class="words top106">
							<div class="contact">
							<div class="content" style="display: inline-block;"><p class="left">Contact us</p>
							<p class="small center">You are one step away from making something great.</p></div>
							</div>
							<span class="join_us_btn">联系我们</span>
						</div>
					</div>
				</div></a>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</header>
	</div>
	<div class="bg-gray">
	    <div class="sb-container">
	        <div class="sb-title">
	            <i class="sbIcon sbIcon-pj"></i>
	            <span>推荐项目</span>
	        </div>
	    </div>
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
	function goValueAdd(type){
	      window.open("${basePath}Page/ValueAdd#"+type);
	      return false;
	}
	
	
		$('#myCarousel .carousel').carousel({
			interval : 5000
		//changes the speed
		});
	</script>
</body>
</html>