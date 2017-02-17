<%@page import="org.springframework.util.StringUtils"%>
<%@page import="com.cishi.controller.SysUserController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List,com.cishi.view.Menu,com.cishi.beans.SysUser"%>
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
<link rel="stylesheet" type="text/css"
	href="${basePath}newStyle/css/head.css">
<link rel="stylesheet" type="text/css"
	href="${basePath}newStyle/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${basePath}newStyle/css/common.css">
<style>
.header {
	z-index: 1000;
	position: relative;
}

.header .container a {
	color: black;
	text-decoration: none;
}

.submenu {
	display: none;
}

.main-nav>li:hover .submenu {
	display: block;
}
</style>
<div class="header">
	<div class="container">
		<div class="fl log_search">
			<a class="log_a" href="${basePath}Page/mainPage"><div class="logo"></div></a>
			<span class="search"> 
			<input onfocus = "searchFocus()" onblur="searchBlur()"type="text" placeholder="<form:i18n name='search'/>" id="key_word"/>
			<span class="icon"></span>
			<script>
			function search(){
				if(typeof keyWord !=="undefined"){
					$("#key_word").val(keyWord);
				}
				$(".icon").click(function(){
					var keyWord = $("#key_word").val();
					if(!keyWord){
						return;
					}
					location.href=basePath+"Page/searchPage?keyWord="+ encodeURI(encodeURI(keyWord));
				});
			}
			search();
			</script>
			</span>
		</div>
		<div class="fr">
			<ul class="main-nav">
				<%
					List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
					String pageName = (String) request.getAttribute("pageName");
					for (Menu menu : menuList) {
					List<Menu> sonList = menu.getMenuList(); 
					Boolean isParent = menu.getIsParent()!=null && sonList!=null && sonList.size()!=0;
				%>
				<li
					class="<%if (pageName != null && pageName.equals(menu.getUrl())) {%>curr<%}%> <%if(isParent){ %>parent<%}%>">
					<%
					if(isParent){
					%> <form:i18n name="<%=menu.getName()%>" />
					<div class="line"></div> <i class="icon-arrow"></i>
					<ul class="submenu">
						<%for(Menu m:sonList) {
							String param = m.getParam();
							System.out.println("param="+param);
						%>
						<li
							<%
									String liClass=m.getLiClass();
									if(liClass!=null){
								%>
							class="<%=liClass%>" <%}%>>
							<!-- <span>你目前还没有任务项目</span> --> <a
							<%String styleClass = m.getStyleClass();
                                	if(styleClass!=null){
                                %>
							class="<%=styleClass%>" <%} %>
							href="${basePath}Page/<%=m.getUrl()%><%if(param!=null){%>?<%=param%><%}%>"> <%
                                String icon = m.getIcon();
                                if(icon!=null){
                                %><i class="<%=icon%>"></i> <%}%> <form:i18n
									name="<%=m.getName()%>" /></a>
						</li>
						<%}%>
					</ul> <%
					}else{
					%> <a href="${basePath}Page/<%=menu.getUrl()%>"><form:i18n
							name="<%=menu.getName()%>" />
						<div class="line"></div></a>
				</li>
				<%}%>
				<%
					}
				%>
			</ul>
			<div class="head-action">
				<div class="en-chn">
					<!-- <span></span>
					中文 -->
					<!-- <form:i18n name="cn" /> -->
					<%-- <form:select id="select_lang" title="" 
						url="${basePath}Language/loadLanguage.json" /> --%>
						 <form:Span id="select_lang" title="" 
						url="${basePath}Language/loadLanguage.json" />
					<div>
						<span class="up-arrow icon"></span>
						<span class="down-arrow icon"></span>
					</div>
				</div>
			</div>
			<%
				SysUser sysUser = SysUserController.loadSysUser(session);
				String fileUrl = sysUser==null?"test":sysUser.getIconFile()!=null ? sysUser.getIconFile().getFileUrl():"";
				String contextPath1 = request.getContextPath();
				String realPath1 = request.getSession().getServletContext().getRealPath("/");
				String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
						+ contextPath1 + "/"; 
				fileUrl = fileUrl.replaceAll("\\{basePath\\}", basePath1).replace("oem","sys_upload");
				if(StringUtils.isEmpty(fileUrl)){
					fileUrl="../newStyle/img/admin-icon.png";
				}
				if (sysUser != null) {
			%>
			   <span class="log-icon" href="javascript:void(0);">
					<div class="icon-log">
						<img  src="<%=fileUrl%>">
						<p><%=sysUser.getLoginName()%></p>
					</div>
				<ul class="submenu" style=" margin-top: 9px;">	
						<li class="bdb">
							<span class="moneyFont"><form:i18n name="remainMoney" />:￥:<%=sysUser.getMoney()%></span>
							<span class="moneyFont"><form:i18n name="lockMoney" />:￥:<%=sysUser.getLockMoney()%></span>
							<a class="blue-common-btn" href="${basePath}Page/modifyUserInfo"> <i class="icon-setting"></i><form:i18n name="personInfo"/></a>
						</li>
						
						<li>
							<a class="common-head-btn" href="${basePath}Page/modifyPwd"><form:i18n name="modifyPwd"/></a>
						</li>
						
						<li>
							<a class="red-btn" href="${basePath}Page/logout"><form:i18n name="logout"/></a>
						</li>
					</ul>
			</span>
			<%-- <span><form:i18n name="remain" />:<%=sysUser.getMoney()%></span> --%>
			<%
				}else{
			%>
			<div class="log-rgt">
				<div class="log-rgt-btn">
					<a href="${basePath}Page/login"> <form:i18n name="loginOrRegister" />
					</a>
				</div>
			</div>
			<%}%>
		</div>
		<script type="text/javascript">
		var bool = false;
		function searchFocus(){
			bool = true;
		}
		function searchBlur(){
			bool = false;
		}
		function keyEnter(){
			if(bool)
			$(".icon").click();
			typeof keyEnterPage!=="undefined"  && keyEnterPage();
		}
		
		$(function(){
			var $img = $(".img-box img");
			$img.each(function(index,el){
				var $parent = $(el).parent(),
				width = $parent.width,height = $parent.height,p=width/height
				src = el.src;
				var image = new Image();
				image.src=src;
				image.srcImage = el;
				image.$parent = $parent;
				image.onload = function(){
					var real_width = this.width,real_height=this.height,real_p = real_width/real_height,
						height = this.$parent.width(),height = this.$parent.height(),p=width/height;
					if(real_p>p){
						$(this.srcImage).width("100%");
						$(this.srcImage).height("auto");
					}else{
						$(this.srcImage).height("100%");
						$(this.srcImage).width("auto");
					}
				}
			});
		});
		</script>
	</div>
</div>
