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
<link style="text/css" rel="stylesheet"
	href="<%=basePath%>css/page/orderDetail.css">
<script type="text/javascript"
	src="<%=basePath%>js/page/showPriceDialog.js"></script>
<title>订单详情页面</title>
</head>
<body>
	<%@include file="../pagehead.jsp"%>
	<div class="order-detail">
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
			<!-- <div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					{orderName}<small style="color:red;">{statusString}</small>
				</h1>
			</div>
		</div> -->
			<!-- /.row -->

			<!-- Portfolio Item Row -->
			<div class="row detail_panel">
				<div class="detail_info_div">
					<div class="detail_img">
						<span></span> <span id="detailSpanId" style="display: none">{iconFile.fileUrl}</span>
						<img id="detailImgId"
							onerror="this.src='${basePath}/newStyle/img/normal.png'"
							width="547" height="337" /> <span></span>
					</div>
					<div class="detail_info">
						<div class="detail_title" id="test">
							<div class="order_name">{orderName}</div>
							<small style="color: red;" class="order_status">{statusString}</small>
						</div>
						<div class="order_price">
							<span class="price"><form:i18n name="has_finish_money" /></span><span
								class="money" id="hasFinishMoney">￥:</span>
						</div>
						<div class="line"></div>
						<div class="btns_list">
							{@if !isCurrentReadonly}<a class="btn btn-primary modify_btn"
								href="${basePath}/Page/orderModify/${id}"><form:i18n
									name="modify" /></a>{@/if} {@if !isCurrentReadonly}<a
								id="addsbuTask" class="btn btn-primary add_sub_task_btn"
								href="${basePath}/Page/addSubTask?parentId=${id}"><form:i18n
									name="addSubtask" /></a>{@/if} {@if !isCurrentReadonly&&!status}<a
								id="releaseTask" class="btn btn-primary release_btn"
								href="javascript:void(0)" onclick="OrderDetail.releaseTask()"><form:i18n
									name="releaseTask" /></a>{@/if}
							<%-- {@if launcherId==userId&&sysConfirmInfo&&!sysConfirmInfo.onePartnerStatus}<button class="btn btn-primary" onclick="OemGlobal.showConfirm('{id}','4',OrderDetail.applyForMoneySuccess,'{sysConfirmInfo.sysConfirmId}');"><form:i18n name="pay_money"/></button>{@/if} --%>
							{@if
							!isCurrentReadonly&&launcherId==userId&&sysConfirmInfo.onePartnerStatus==1}<font
								color="red"><form:i18n name="has_pay_money" /></font>{@/if} <a
								id="cancel_task" class="btn btn-primary modify_btn"
								href="javascript:void(0);" onclick="OrderDetail.delTask();"><form:i18n
									name="cancel_task" /></a>
						</div>
						<%-- <font><form:i18n name="has_finish_money"/>:<span id="hasFinishMoney"></span><form:i18n name="unit"/></font> --%>
					</div>
				</div>
				<!-- <div class="col-md-8">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					Indicators
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					Wrapper for slides
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

					<!-- Controls
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
			</div>-->
			</div>
			<div class="row">
				<div class="detail_info_div">
					<div class="col-lg-12">
						<h3 class="page-header">
							<form:i18n name="download_hetong" />
						</h3>
					</div>
					<div class="col-lg-12" id="attachmentDiv_class">
						<div class="col-lg-12">
							<img src="${basePath}newStyle/img/icon.png"
								style="margin-right: 10px;"> <a target="_blank"
								href="${basePath}Download">合同下载</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Related Projects Row -->
			<div class="row" id="fileListDiv">
				<div class="detail_info_div">
					<div class="col-lg-12">
						<h3 class="page-header">附件</h3>
					</div>
					<div class="col-lg-12" id="fileListDiv_class">
						<div class="xttblog">
							<ul class="box" id="box">
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="detail_info_div">
					<div class="col-lg-12">
						<h3 class="page-header">子任务列表</h3>
					</div>
					<div class="row" id="subTaskList">
						<!-- <div class="col-md-1">A</div>
					<div class="col-md-2">TaskName</div>
					<div class="col-md-3">taskImg</div>
					<div class="col-md-4">taskButton</div>
					<div class="col-md-2">taskButton1</div> -->
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="detail_info_div">
					<div class="col-lg-12">
						<h3 class="page-header" id="">
							<form:i18n name="apply_for_detail" />
						</h3>
					</div>
					<table class="table_info gree_body">
						<thead>
							<th width="120px"><form:i18n name="loginName" /></th>
							<th width="477px"><form:i18n name="taskDescription" /></th>
							<th width="125px"><form:i18n name="result" /></th>
							<th width="204px"></th>
						</thead>
						<tbody id="apply_for_detail">
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="detail_info_div">
					<div class="col-lg-12">
						<h3 class="page-header">
							<form:i18n name="apply_for_task_list" />
						</h3>
					</div>
					<table class="table_info gree_body">
						<thead>
							<th width="120px"><form:i18n name="loginName" /></th>
							<th width="477px"><form:i18n name="taskDescription" /></th>
							<th width="125px"><form:i18n name="result" /></th>
							<th width="204px"></th>
						</thead>
						<tbody id="apply_for_task_list">
						</tbody>
					</table>
				</div>
			</div>
			<div class="row" id="receiveTaskDiv">
				<div class="col-lg-12">
					<h3 class="page-header"></h3>
				</div>
			</div>
			<div style="text-align: center;height: 48px;font-size: 20px;margin-top: 0px">
			<a href="javascript:void(0)"  onclick="Javascript:history.go(-1)">返回</a>
			</div>
			<%@include file="../confirm.jsp"%>
		</div>
	</div>
	<%@include file="../pagefoot.jsp"%>
</body>
<script type="text/javascript">
	window.onload = function() {
		isImgLoad(copyText);
		if ('${subTaskFlag}' == "true") {
			//如果是进入子任务详情页面，以下功能不可食用
			//增加子任务
			document.getElementById("addsbuTask").style.display = "none";
			//发布任务
			document.getElementById("releaseTask").style.display = "none";
		}
	}
	var t_img; // 定时器
	var isLoad = false; // 控制变量

	// 判断图片加载的函数
	function isImgLoad(callback) {
		// 注意我的图片类名都是cover，因为我只需要处理cover。其它图片可以不管。
		// 查找所有封面图，迭代处理
		if (document.getElementById("detailSpanId").innerHTML != "{iconFile.fileUrl}") {
			isLoad = true;
		}
		// 为true，没有发现为0的。加载完毕
		if (isLoad) {
			clearTimeout(t_img); // 清除定时器
			// 回调函数
			callback();
			// 为false，因为找到了没有加载完成的图，将调用定时器递归
		} else {
			t_img = setTimeout(function() {
				isImgLoad(callback); // 递归扫描
			}, 100); // 我这里设置的是100毫秒就扫描一次，可以自己调整
		}
	}
	function copyText() {
		document.getElementById("detailImgId").src = document
				.getElementById("detailSpanId").innerHTML;
		var $img = $(".detail_img img");
		Utils.coverImg($img);
	}
</script>
</html>