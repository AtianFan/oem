<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	var orderId = '${id}';
	var userType = '1';
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=basePath%>js/lib/sysConfirm.js"></script>
<script type="text/javascript" src="<%=basePath%>js/page/orderDetail.js"></script>
<link style="text/css" rel="stylesheet" href="<%=basePath%>css/page/orderDetail.css">
<script type="text/javascript" src="<%=basePath%>js/page/showPriceDialog.js"></script>
<title>订单详情页面</title>
</head>
<body>
	<%@include file="../pagehead.jsp"%>
	<!-- Page Content -->
	<div class="container" id="orderTaskInfo"></div>



<!-- 	<div class="form-control" id="orderTaskInfo"></div>
	<div class="form-control" id="fileListDiv"></div> -->
	<%-- <div class="">
		<button type="button">
			<form:i18n name="want_to_receive" />
		</button>
	</div> --%>
	<%-- <div class="form-control" id="receiveListDiv">接单列表</div>
	<div class="form-control" id="receiveListDiv"></div>
	<form id="receiveTaskForm">
		<form:input name="orderId" type="hidden" defaultValue="${id}" />
		<form:textarea name="remark" />
		<form:input name="money" />
		<form:button type="button" title="want_to_receive"
			id="want_to_receiveBtn" />
	</form> --%>
	<div id="receiveTaskTemplate"
		style="display: none; width: 0; height: 0;"></div>
	<div id="taskDetailTemplate"
		style="display: none; width: 0; height: 0;">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					{orderName}<small style="color:red;">{statusString}</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->

		<!-- Portfolio Item Row -->
		<div class="row">

			<div class="col-md-8">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<!-- <ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol> -->

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active">
							<img class="img-responsive"
								src="javaScript:Utils.getFilePath('{iconFile.id}','{iconFile.createDate}','{iconFile.name}')"
								alt=""/>
						</div>
						<div class="item">
							<img class="img-responsive"
								src="javaScript:Utils.getFilePath('{iconFile.id}','{iconFile.createDate}','{iconFile.name}')"
								alt=""/>
						</div>
						<div class="item">
							<img class="img-responsive"
								src="javaScript:Utils.getFilePath('{iconFile.id}','{iconFile.createDate}','{iconFile.name}')"
								alt=""/>
						</div>
					</div>

					<!-- <!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>

			<div class="col-md-4">
				<h3>{orderName}</h3>
				<p>{introduce}</p>
				<h3>任务详情</h3>
				<p>{description}</p>
				<h3>其他指标1</h3>
				<p>xxxxxxxxxxxxxxxxxXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx</p>
				<h3>其他指标2</h3>
				<p>xxxxxxxxxxxxxxxxxXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx</p>
				<a class="btn btn-primary" href="${basePath}/Page/orderModify/${id}"><form:i18n name="modify"/></a>
				{@if !status}<a class="btn btn-primary" href="javascript:void(0)" onclick="OrderDetail.releaseTask()"><form:i18n name="releaseTask"/></a>{@/if}
				<a class="btn btn-primary" href="${basePath}/Page/addSubTask?parentId=${id}"><form:i18n name="addSubtask"/></a>
				{@if launcherId==userId&&sysConfirmInfo&&!sysConfirmInfo.onePartnerStatus}<button class="btn btn-primary" onclick="OemGlobal.showConfirm('{id}','4',OrderDetail.applyForMoneySuccess,'{sysConfirmInfo.sysConfirmId}');"><form:i18n name="pay_money"/></button>{@/if}
				{@if launcherId==userId&&sysConfirmInfo.onePartnerStatus==1}<font color="red"><form:i18n name="has_pay_money"/></font>{@/if}
				<font><form:i18n name="has_finish_money"/>:<span id="hasFinishMoney"></span><form:i18n name="unit"/></font>
			</div>
		</div>
		<!-- /.row -->
		<div class="row" id="subTaskList">
			<div class="col-lg-12">
				<h3 class="page-header">子任务列表</h3>
			</div>
			<div class="row">
				<!-- <div class="col-md-1">A</div>
				<div class="col-md-2">TaskName</div>
				<div class="col-md-3">taskImg</div>
				<div class="col-md-4">taskButton</div>
				<div class="col-md-2">taskButton1</div> -->
			</div>
		</div>
		<!-- Related Projects Row -->
		<div class="row" id="fileListDiv">

			<div class="col-lg-12">
				<h3 class="page-header">附件</h3>
			</div>

		</div>
		<div class="row"  >
			<div class="col-lg-12" id="apply_for_task_list">
				<h3 class="page-header" ><form:i18n name="apply_for_task_list"/></h3>
			</div>
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12"  id="apply_for_detail">
				<h3 class="page-header"  id=""><form:i18n name="apply_for_detail"/></h3>
			</div>
		</div>
		<div class="row" id="receiveTaskDiv">
			<div class="col-lg-12">
				<h3 class="page-header"></h3>
			</div>
		</div>
		<%@include file="../confirm.jsp"%>
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; 天津磁石APP 2016</p>
			</div>
		</div>
		</footer>
	</div>
</body>
</html>