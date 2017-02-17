<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/page/modifyUser.css"/>
<script type="text/javascript" src="<%=basePath%>js/page/modifyUserInfo.js"></script>
<title><form:i18n name="modifyUserInfo"/></title>
<style>
.company_tag{
	display: none;
}
</style>
<script type="text/javascript">
	function callback_type_select(obj){
		var value = obj.value;
		if(value==1){
			$(".company_tag").hide();
		}else{
			$(".company_tag").show();
			//obj.style.display="block";
		}
	}
	function callback_account_type_select(obj){
		
	}
	function uploadIconSuccess(id,fileUrl,fileName){
		$("#imghead").attr("src",fileUrl);
		$("#img_id_input").val(id);
	}
</script>
</head>
<body>

	<%@include file="pagehead.jsp" %>
	<div class="modify-info-ui">
		<form id="modifyUserForm">
			<div id="preview">
				<span class=""><form:i18n name="headPortrait"/></span>
			    <img id="imghead" width=100 height=100 border=0 src='<%=basePath%>/image/57674ab3154de.png'>
				<input type="hidden" id="img_id_input" name="icon"/>
				<iframe left="-20px" height="80px" width="400px" src="uploadFile.do?callback=uploadIconSuccess&type=head" frameborder=0 scrolling="no"></iframe>
			</div>
			<input type="hidden" name="id" id="id"/>
			<div style="clear:both;"></div>
			<form:input name="loginName" title="loginName"/>
		<%-- 	<form:select name="type" id="type_select" title="type" data='[{value:1,title:"personal"},{value:2,title:"company"}]'/>
			<form:select name="accountType" id="account_type_select" title="accountType" data='[{value:1,title:"receiver"},{value:2,title:"launcher"}]'/> --%>
			<form:input name="company" class_tag="company_tag" title="company"/>
			<form:input name="nickName" title="nickName"/>
			<form:input name="realName" title="realName"/>
			<form:input name="idNo" title="idNo" class_tag="idNo_class"/>
			<form:input name="email" title="email"/>
			<form:input name="phoneNumber" title="phoneNumber" class_tag="phonenumber_class"/>
			<form:input name="address" title="address"  class_tag="address_class"/>
			<span type="button" id="modifyBtn"><form:i18n name="modify"/></span>
			<span type="button" id="cancle"><form:i18n name="cancle"/></span>
			<input type="hidden" name="accountReadonly" class="accountReadonly"/>
			<input type="hidden" name="readonlyFlag" class="readonlyFlag"/>
			<div class="read-only">
				<p><form:i18n name="apply_for_read_only"/></p>
				<label class="accountReadonly">${name}</label><i id="lock_icon" class="lock_icon_off"></i>
			</div>
			<script>
				//var 
				$("#lock_icon").click(function(){
					var clazz = $(this).attr("class");
					if(clazz==="lock_icon_on"){
						$(this).removeClass().addClass("lock_icon_off");
						$(".readonlyFlag").val(false);
					}else{
						$(this).removeClass().addClass("lock_icon_on");
						$(".readonlyFlag").val(true);
					}
				});
			</script>
		</form>
	</div>
	<%@include file="pagefoot.jsp" %>
</body>
</html>