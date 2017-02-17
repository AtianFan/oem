<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>底部</title>
<style>
.foot{
	width: 100%;
    height: 60px;
    background-color: #B2D4DC;
    position: fixed;
    bottom: 0;
    opacity: 0.8;
}
.foot_href{
	color:#7d7d7d;
	font-size:15px;
	margin-right:20px;
	height: 22px;
	display: inline-block;
	line-height: 22px;
}
.foot_icon1{
	display:inline-block;
	width: 22px;
	height: 22px;
	margin-left:15px;
	margin-right:15px;
	vertical-align: middle;
}
.foot_icon2{
	display:inline-block;
	width: 22px;
	height: 22px;
	margin-right:15px;
	vertical-align: middle;
}
.foot_icon3{
	display:inline-block;
	width: 22px;
	height: 22px;
	margin-right:15px;
	vertical-align: middle;
}
.foot_line{
	height: 22px;
	width: 2px;
	background-color: #ddd;
	display:inline-block;
}
.icon_div{
	display: inline-block;
	height: 38px;
	border-left: 2px solid  #7d7d7d;
	border-right: 2px solid  #7d7d7d;
	margin-right:15px;
}
</style>
</head>
<body>
<div style="height:60px;"></div>
<div class="foot" style="font-size:20px;text-align:right;margin:0px auto 0px auto; " >
<div style="margin-right:109px;margin-top:13px;"><a href="${basePath}Page/service" class="foot_href" target="_blank">关于我们</a><a class="foot_href" href="${basePath}Page/join" target="_blank">联系我们</a>
<div class="icon_div"><span class="foot_icon1"><img src="${basePath}image/qq.png"/></span>
<span class="foot_icon2">
<img src="${basePath}image/weibo.png"/>
</span>
<span class="foot_icon3">
<img src="${basePath}image/weixin.png"/>
</span></div>
<span style="color:#7d7d7d;font-size:15px;">©2016,Magnet.Inc</span>
</div>
</div>
</body>
</html>