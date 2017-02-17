<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common_new.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${basePath}js/page/login.js"></script>
<link rel="stylesheet" type="text/css"
	href="${basePath}newStyle/css/index.css">
<link rel="stylesheet" type="text/css"
	href="${basePath}newStyle/css/reset.css">
<title><form:i18n name="login" /></title>
</head>
<body>
	<%----%>
	<form id="loginForm">
		<%-- 	<form:input name="loginName" title="loginName"/>
		<form:input name="password" type="password" title="password"/>
		<button id="loginBtn" type="button"><form:i18n name="login"/></button>
		<button id="registerBtn" type="button"><form:i18n name="register"/></button>
		<div class="foot">Copyright © 天津磁石APP 2016</div> --%>
		<div class="login-container">
			<%@include file="pagehead.jsp"%>
			<div class = "centerlogo"></div>
			<div class="content">
				<div class="form-control">
					<h4>
						<form:i18n name="loginName" />
					</h4>
					<input type="text" onfocus="inputFocus()"  onblur="inputBlur()"  name="loginName"
						placeholder="    <form:i18n name="emailOrphone"/>" />
					<img src="${basePath}newStyle/img/admin icon.png" style="position: relative;top: -54px;left: 20px;"/>
				</div>
				<div class="form-control">
					<h4>
						<form:i18n name="password" />
					</h4>
					<input type="password" onfocus="inputFocus()"  onblur="inputBlur()"  name="password"
						placeholder="    <form:i18n name="password"/>" />
					<img src="${basePath}newStyle/img/lock icon.png" style="position: relative;top: -54px;left: 20px;"/>
				</div>
			</div>
			<div class="btns">
				<span id="loginBtn" class="login-btn fl"><form:i18n name="login" /></span>
				<span class="register-btn fr" id="registerBtn"><form:i18n
						name="register" /></span>
			</div>
		</div>
		<div></div>
		<script type="text/javascript">
		(function($) {
			var placeholderfriend = {
				focus : function(s) {
					s = $(s).hide().prev().show().focus();
					var idValue = s.attr("id");
					if (idValue) {
						s.attr("id", idValue.replace("placeholderfriend",
								""));
					}
					var clsValue = s.attr("class");
					if (clsValue) {
						s.attr("class", clsValue.replace(
								"placeholderfriend", ""));
					}
				}
			}

			//判断是否支持placeholder  
			function isIE() {
				var chromName = navigator.userAgent;
				if (chromName.indexOf("Firefox") == -1 && chromName.indexOf("Safari") == -1 && chromName.indexOf("Chrome") == -1 && chromName.indexOf("Opera") == -1) {
					return true;
				}
				return false;
			}
			//不支持的代码  
			if (isIE()) {
				$(function() {

					var form = $(this);
					var elements = form
							.find("input[name='loginName'][placeholder]");
					elements.each(function() {
						var s = $(this);
						var pValue = s.attr("placeholder");
						var sValue = s.val();
						if (pValue) {
							if (sValue == '') {
								var html = this.outerHTML || "";
								html = html
										.replace(
												/\s*type=(['"])?text\1/gi,
												" type=text placeholderfriend")
										.replace(
												/\s*(?:value|on[a-z]+|name)(=(['"])?\S*\1)?/gi,
												" ")
										.replace(
												/\s*placeholderfriend/,
												" placeholderfriend value='"
														+ pValue
														+ "' "
														+ "onfocus='placeholderfriendfocus(this);' ");
								var idValue = s.attr("id");
								if (idValue) {
									s.attr("id", idValue
											+ "placeholderfriend");
								}
								var clsValue = s.attr("class");
								if (clsValue) {
									s.attr("class", clsValue
											+ "placeholderfriend");
								}
								s.hide();
								s.after(html);
							}
						}
					
					});

					elements.focus(function() {
						var s = $(this);
						var pValue = s.attr("placeholder");
						var sValue = s.val();
						if (sValue && pValue) {
							if (sValue == pValue) {
								s.val('');
							}
						}
					});

					elements.blur(function() {
						var s = $(this);
						var sValue = s.val();
						if (sValue == '') {
							var idValue = s.attr("id");
							if (idValue) {
								s.attr("id", idValue
										+ "placeholderfriend");
							}
							var clsValue = s.attr("class");
							if (clsValue) {
								s.attr("class", clsValue
										+ "placeholderfriend");
							}
							s.hide().next().show();
						}
					});

					var elementsPass = form
							.find("input[type='password'][placeholder]");
					elementsPass
							.each(function(i) {
								var s = $(this);
								var pValue = s.attr("placeholder");
								var sValue = s.val();
								if (pValue) {
									if (sValue == '') {
										var html = this.outerHTML || "";
										html = html
												.replace(
														/\s*type=(['"])?password\1/gi,
														" type=text placeholderfriend")
												.replace(
														/\s*(?:value|on[a-z]+|name)(=(['"])?\S*\1)?/gi,
														" ")
												.replace(
														/\s*placeholderfriend/,
														" placeholderfriend value='"
																+ pValue
																+ "' "
																+ "onfocus='placeholderfriendfocus(this);' ");
										var idValue = s.attr("id");
										if (idValue) {
											s.attr("id", idValue
													+ "placeholderfriend");
										}
										var clsValue = s.attr("class");
										if (clsValue) {
											s.attr("class", clsValue
													+ "placeholderfriend");
										}
										s.hide();
										s.after(html);
									}
								}
							});

					elementsPass
							.blur(function() {
								var s = $(this);
								var sValue = s.val();
								if (sValue == '') {
									var idValue = s.attr("id");
									if (idValue) {
										s.attr("id", idValue
												+ "placeholderfriend");
									}
									var clsValue = s.attr("class");
									if (clsValue) {
										s.attr("class", clsValue
												+ "placeholderfriend");
									}
									s.hide().next().show();
								}
							});

				});
			}
			window.placeholderfriendfocus = placeholderfriend.focus;
		})(jQuery);
		var flag = false;
	    function inputBlur(){
			flag = false;
		}
		function inputFocus(){
			flag=true;
		}
		function keyEnterPage(){
			if(flag){
				$("#loginBtn").click();
			}
		}
		</script>
		<%@include file="pagefoot.jsp"%>
	</form>
</body>
</html>