<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- 
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/page/registerPage.css"/> --%>
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/page/modifyUser.css" />
<script type="text/javascript" src="<%=basePath%>js/page/register.js"></script>
<title><form:i18n name="register" /></title>
<style>
.company_tag {
	display: none;
}

#fixedLayer {
	position: absolute;
	left: 570px;
	top: 70px;
	width: 470px;
	text-size: 16px;
	color: rgb(51, 51, 105);
	/* border: solid 1px; */
	padding: 17px;
	border-radius: 4px;
	background-color: hsla(191, 38%, 87%, 1);
}
</style>
<script type="text/javascript">
	function callback_type_select(obj) {
		var value = obj.value;
		if (value == 1) {
			$(".company_tag").hide();
		} else {
			$(".company_tag").show();
			//obj.style.display="block";
		}
	}
	function callback_account_type_select(obj) {

	}
	var orderId = '${id}';
	function uploadIconSuccess(id, fileUrl, fileName) {
		$("#imghead").attr("src", fileUrl);
		$("#img_id_input").val(id);
	}
	$(function() {
		$("#form-addfile-control1").click(function() {
			$("#form-file-iframe").show();
			$("#form-addfile-control1").hide();
		});
	});
</script>
</head>
<body>
	<%@include file="pagehead.jsp"%>
	<div class="modify-info-ui">
		<div id="fixedLayer">
			➤帐号可以用来承接项目，注册之后请等待管理员审核，审核开通之后帐号方可使用。<br>➤项目提供方注册，请发送附件至邮箱：jason@m-and-n.com，需提供个人/企业相关证照。
		</div>
		<form id="registerForm">
			<div id="preview">
				<span class=""><form:i18n name="headPortrait" /></span> <img
					id="imghead" width=100 height=100 border=0
					src='<%=basePath%>/image/57674ab3154de.png'> <input
					type="hidden" id="img_id_input" name="icon" />
				<iframe style="margin-left: -30px;" height="80px" width="260px"
					src="uploadFile.do?callback=uploadIconSuccess&type=head" frameborder=0
					scrolling="no"></iframe>
			</div>
			<div style="clear: both; height: 1px; width: 1px;"></div>
			<form:input name="loginName" title="loginName" />
			<form:input name="password" type="password" title="password" />
			<form:input name="againPassword" type="password" title="againPassword" />
			<%-- <form:Option name="type" id="type_select" title="type" data='[{value:1,title:"个人"},{value:2,title:"团队"}]'/>
			<form:Option name="accountType" id="account_type_select" title="accountType" data='[{value:1,title:"接收者"},{value:2,title:"发布者"}]'/> --%>
			<form:input name="company" class_tag="company_tag" title="company" />
			<form:input name="nickName" title="nickName" />
			<form:input name="realName" title="realName" />
			<form:input name="idNo" title="idNo" class_tag="idNo_class" />
			<div class="form-control-ui">
				<span>账号类型:</span> <select name="accountType">
					<option value="0">个人</option>
					<option value="1">团队</option>
					<option value="2">公司</option>
				</select>
			</div>
			<form:input name="email" title="email" />
			<form:input name="phoneNumber" title="phoneNumber"
				class_tag="phonenumber_class" />
			<form:input name="address" title="address" class_tag="address_div" />
			<div class="form-file-div" id="form-file-div"
				style="margin-top: 10px;">
				<div class="xttblog">
					<ul class="box" id="box">
					</ul>
				</div>
				<div style="margin-top: 0px;">
					<input id="form-input-file" class="form-input-file" type="hidden"
						name="fileIds">
					<iframe id="form-file-iframe" height="100px" width="364px"
						style="margin-left: -8px; display: none; position: static;"
						src="uploadFile.do" frameborder=0></iframe>
				</div>

				<button type="button" class="blue-btn" id="form-addfile-control1">
					<form:i18n name="addAttachments" />
				</button>
			</div>
			<div class="form-group" style="clear: both; text-align: left;">
				<span class="modifyBtn" type="button" id="registerBtn"><form:i18n
						name="register" /></span>
			</div>
		</form>
	</div>
	<%@include file="pagefoot.jsp"%>
</body>
</html>