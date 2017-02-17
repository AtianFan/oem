<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/page/join.css"/>
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/page/service_foot.css"/>
<title><form:i18n name="service"/></title>
</head>
<body>
	<%@include file="pagehead.jsp"%>
	<%-- <div>
		<img src="${basePath}newStyle/img/join_us.png"/>
	</div> --%>
	<div id="content">
		<div class="left">
			<p class="title">网址：</p>
			<p class="value">magnetstone.net</p>
			<p class="title">咨询电话：</p>
			<p class="value">13672171705</p>
			<p class="title">邮箱：</p>
			<p class="value">jason@m-and-n.com</p>
			<p class="title">地址：</p>
			<p class="value">天津滨海高新区华苑产业区工华道壹号允公</p>
			<p class="value">
				科技文化产业园D座2门2201
			</p>
		</div>
		<div class="right">
			<p>姓名</p>
			<input type="text" id="userName"/>
			<p>E-MAIL</p>
			<input type="text" id="email"/>
			<p>留言</p>
			<textarea style='font-size:16px;' id="remark"></textarea>
			<span class="btn">联系我们</span>
		</div>
		<script type="text/javascript">
			$(".btn").click(function(){
				var email = $("#email").val();
				 var mailTest=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
				 if (!mailTest.test(email)){
					alert("不是合法的邮箱地址！");
					return;
				}
				 Utils.ajax({
					 url:"${basePath}/global/addSysContactInfo.json",
					 data:{userName:$("#userName").val(),email:$("#email").val(),remark:$("#remark").val()}
				 }).done(function(resp){
					 if(resp.retcode){
						alert("error") 
					 }else{
						 alert("邮件已发送!");
						 window.location.reload();
					 }
				 })
			});
		</script>
	</div>
	<%@include file="pagefoot.jsp" %>
</body>
</html>