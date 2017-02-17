<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${basePath}css/page/ValueAdd.css"/>
<title>增值服务</title>
</head>
<script>
	function getValueAdd(){
	      var  value=window.location.hash;
	      value=value.replace('#','div');
	      document.getElementById(value).scrollIntoView();
	}	
</script>
<body onload='getValueAdd()'>
	<%@include file="pagehead.jsp" %>
	<div class="content">
		<img id="div3" src="${basePath}image/2.png"/>
		<p class="cn_title">影视渲染</p>
		<p class="en_title">Film Render</p>
		<div class="line"></div>
		<p class="model_content">平台自身拥有目前业内最顶级的渲染集群设备，同时也与国家超级计算天津中心建立了战略合作关系，可以随时调用“天河一号”超级计算机的计算资源和技术资源。平台渲染技术团队也拥有多年的技术服务经验，对于数字内容制作技术有着深入的了解，先后完成过十余部海内外电影、特效等项目的渲染任务，独立研发了数款渲染管理工具，也获得了行业内的高度好评。</p>
		<img id="div1" class="device" alt="" src="${basePath}image/3.png">
		<p class="cn_title">DIT数字影像工程技术</p>
		<p class="en_title">Digital Imaging Technician</p>
		<div class="line"></div>
		<p class="model_content height170">平台DIT服务团队是国内最早的一批掌握DIT技术流程的团队，并且紧跟技术发展潮流，掌握着最新的软件工具、设备和解决方案。在完成了数部高难度电影的DIT服务之后，更是将DIT技术服务拓展到后期统筹领域，能够对影视作品在拍摄之后的各个环节进行统筹管理和技术支持，成为导演和制片不可缺少的左膀右臂。</p>
		<img id="div2" alt="" src="${basePath}image/1.png">
		<p class="cn_title height54">影视修复</p>
		<p class="en_title">Film Repair</p>
		<div class="line" ></div>
		<p class="model_content height218">平台修复团队引入好莱坞资深胶片技术和数字技术研发企业MTI Film公司的软件和技术，2012年至今完成了五十余部好莱坞经典老电影的4K画质的数字化修复工作，并且数次派遣技术团队赴洛杉矶交流学习，掌握了4K数字胶片修复的全流程技术，修复效率和完成度获得了客户的高度评价。目前，修复团队还与中国电影资料馆达成了胶片资料修复合作协议，开展国产老电影《盗马贼》与《黄土地》的全流程精致修复工作，并在未来的3-5年，协同另外两方共同打造一批具有影响力的电影修复作品。</p>
		<img id="div4" alt="" src="${basePath}image/4.png">
		<p class="cn_title height54">海外合作伙伴</p>
		<p class="en_title">Overseas Partners</p>
		<div class="line" ></div>
		<p class="model_content height645"><b>加拿大国家动漫中心（NAD）</b><br>加拿大国家动漫中心（NAD）拥有动漫领域世界最先进的技术，集合了各类最优秀的专业人才，如电视、电影、电子游戏等领域。NAD的教授为学生传授各项专业技能，创新创造与就业方向的知识。目前已经培训了千余名专业3D设计师，特别是为国际知名的电视电影公司在电影后期制作上培训了大量专业人才，好莱坞就是其中之一，很多毕业生参与了《侏罗纪公园》、《加勒比海盗》、《阿凡达》等影片的制作。<br><br><b>魁北克大学</b><br>魁北克大学建于1969年，是加拿大一所法语大学。她的使命是普及大学教育，促进魁北克的科学发展，开发魁北克省的各个地区，拥有约6000名教授和教师，在校学生达86000名。特点归结为：创新、胆识、优秀的教学品质以及面向世界的开放精神。专业比较齐全，气象学、商业数据处理、旅游管理、不动产研究、记号语言、职业教育等有相当实力。<br><br><b>Digital Dimension</b><br>Digital Dimension公司业务涉及动画、CGI、视效等，拥有专业的人才团队，可提供完整的创作方案和技术服务，公司拥有良好的业界声誉，投资及制作众多商业项目包括《当幸福来敲门》、《史密斯行动》、《变相怪杰》、《蜀山传》等。<br><br><b>Wow Studio</b><br>Wow Studio是一家拥有多年经验的专业的商业摄影工作室，摄影师团队来自日本、新加坡、加拿大等世界各地。<br><br><b>AQUA MEDIA (A.M.)</b><br>AQUA MEDIA (A.M.)是多媒体服务行业的领袖，提供包括平面设计、视频和音频制造等一站式服务，服务客户包括NBA、探索频道、橄榄球联盟网络等。<br><br><b>Oblique FX</b><br>Oblique FX公司提供高质量多样化的视觉特效服务，团队艺术家们经验丰富，擅长虚拟现实等各项技术，以设计逼真的环境和材质CG特效为主，公司的使命是在客户要求的时间和预算之内，超越期待，完成惊人的图像质量，制作影片包括《美女与野兽》、《断背山》、《边境杀手》、《星际传奇3》、《石墙》等电影。</p>
		<p class="gray small center">The collaboration platform for making animated films, video games and virtual reality content.</p>
		<a href="${basePath}Page/register" target="_blank"><span class="join_us_btn">加入我们</span></a>
	</div>
	<%@include file="pagefoot.jsp"%>
</body>
</html>