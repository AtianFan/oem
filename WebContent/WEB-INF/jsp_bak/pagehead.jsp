<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#order_task_add_div,#order_task_receive_div{
		display: none;
	}
</style>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">磁石</a>
		</div>



		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<!-- <input width="400px" type="tel" class="" id="phone" required
				data-validation-required-message="Please enter your phone number.">
			<button type="submit" class="btn btn-primary"><form:i18n name="search"/></button> -->
			<ul class="nav navbar-nav navbar-right" id="menuUl">
				<li><a href="${basePath}Page/homePage"><form:i18n name="homePage"/></a></li>
				<%-- <li id="login"><a href="${basePath}Page/login"><form:i18n name="loginOrRegister"/></a></li> --%>
				<li id="order_task_receive_div"><a href="${basePath}Page/mainPage"><form:i18n name="webtask"/></a></li>
				<li class="user_model_task" id="order_task_add_div"><a href="${basePath}Page/orderTaskAdd"><form:i18n name="add_task"/></a></li>
				<li  class="user_model_task" ><a href="${basePath}Page/myReceiveTask"><form:i18n name="my_task"/></a></li>
				<li  class="user_model_task" ><a href="${basePath}Page/rechargePage"><form:i18n name="recharge"/></a></li>
				<li  class="user_model_task" ><a href="javascript:void(0)"><form:i18n name="remain"/>:<span id="remainSpan"></span><form:i18n name="unit"/></a></li>
				<li class="dropdown">
					 <form:select id="select_lang"
						url="${basePath}Language/loadLanguage.json" />
				<li><a href="${basePath}Page/releaseNote"><form:i18n name="releaseNote"/></form></a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>

<script>
	Utils.ajax({
		url:basePath+"SysUser/loadCurrentUser.json",
		type:'post',
	}).done(function(resp){
		var template = '<li><a href="{url}">{nickName}</a></li>';
		if(resp.retcode==0){
			var data = resp.data;
			data.url = basePath+"Page/modifyUserInfo";
			$("#menuUl").append(Utils.complier(template,data));
			data.nickName = i18n("logout");
			data.url = basePath+"Page/logout";
			$("#menuUl").append(Utils.complier(template,data));
			data.nickName = i18n("modifyPwd");
			data.url = basePath+"Page/modifyPwd";
			$("#menuUl").append(Utils.complier(template,data));
			if(data.type==2&&data.status==1){
				$("#order_task_add_div").show();
				$("#order_task_receive_div").remove();
			}else{
				$("#order_task_add_div").remove();
				$("#order_task_receive_div").show();
			}
			$("#remainSpan").text(data.money);
		}else{
			var data = {nickName:i18n("login_frist")};
			data.url = basePath+"Page/login";
			$("#menuUl").append(Utils.complier(template,data));
			$(".user_model_task").remove();
		}
	});

</script>