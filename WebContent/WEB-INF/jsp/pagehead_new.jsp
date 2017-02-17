<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,com.cishi.view.Menu"%>
<script>
	function callback_select_lang(obj) {
		Utils.ajax({
			url : basePath + "Language/change.json",
			data : {
				lang : obj.value
			}
		}).done(function(resp) {
			window.location.reload();
		});
	}
</script>
<style>
.header .container a {
	color: white;
	text-decoration: none;
}
</style>
<div class="header">
	<div class="container">
		<div class="fl">
			<div class="logo"></div>
		</div>
		<div class="fr">
			<ul class="main-nav">
			<%
				List<Menu> menuList = (List<Menu>)request.getAttribute("menuList");
				for(Menu menu:menuList){
			%>
				<li class="curr"><a href="${basePath}Page/<%=menu.getUrl()%>"><form:i18n name="<%=menu.getName()%>" />
					<div class="line"></div></a></li>
				<!-- <li><a href="mainPage"><form:i18n name="mainPage" /></a>
					<div class="line"></div></li> -->
			<%} %>
			</ul>
			<div class="head-action">
				<div class="en-chn">
					<!-- <form:i18n name="cn" /> -->
					<form:select id="select_lang" title=""
						url="${basePath}Language/loadLanguage.json" />
				</div>
			</div>
			<div class="log-rgt">
				<div class="log-rgt-btn">
					<a href="login"> <form:i18n name="loginOrRegister" />
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
