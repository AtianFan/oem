<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	var orderId = '${id}';
	var userType = '2';//1表示接包
	function uploadIframeSuccess(id, fileUrl, fileName) {
		$("#iframeFile").val(id);
		alert("附件上传成功");
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${basePath}css/page/orderDetail.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>js/lib/sysConfirm.js"></script>
<script type="text/javascript" src="<%=basePath%>js/page/orderDetail.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/page/showPriceDialog.js"></script>
<title>订单详情页面</title>
</head>
<body>
	<%@include file="../pagehead.jsp"%>
	<div class="order-detail">
		<!-- Page Content -->
		<div class="container" id="orderTaskInfo"></div>

		<div id="receiveTaskTemplate"
			style="display: none; width: 0; height: 0;"></div>
		<div id="taskDetailTemplate"
			style="display: none; width: 0; height: 0;">

			<!-- Page Heading/Breadcrumbs -->
			<!-- 	<div class="row">
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
						<img id="detailImgId" width="547" height="367"
							onerror="this.src='${basePath}/newStyle/img/normal.png'" /> <span></span>
					</div>
					<div class="detail_info">
						<div class="detail_title" id="test">
							<div class="order_name">{orderName}</div>
							<small style="color: red;" class="order_status">{statusString}</small>
						</div>
						<!-- <div class="order_price"><span class="price">价格</span><span class="money">￥:120</span></div> -->
						<div class="line"></div>
						<div id="detail_apply_info_list">
							<p>
								<form:i18n name="apply_info" />
							</p>
						</div>
						<div class="line"></div>
						{@if canReceive}<a class="btn btn-primary modify_btn"
							href="javascript:void(0)" onclick="OrderDetail.showForm();">接单</a>{@/if}
						<%-- {@if !canReceive&&!receiverId}<font color="red"><form:i18n name="ACCEPT_FOR_TASK"/></font>{@/if} --%>
						<!-- <a class="btn btn-primary" href="javascript:void(0)" onclick="OrderDetail.showOrderReceiveInfo();">查看接单详情</a> -->
						<%-- {@if receiverId}<font color="red"><form:i18n name="hasReceive"/></font>{@/if} --%>
						<%-- {@if receiverId==userId&&!sysConfirmInfo}<button id="applay_for_money" class="btn btn-primary"  
					onclick="OemGlobal.showConfirm('{id}','4',OrderDetail.applyForMoneySuccess,'{sysConfirmInfo.sysConfirmId}');"><form:i18n name="applay_for_money"/></button>{@/if} --%>
						<%-- {@if sysConfirmInfo}<font color="red"><form:i18n name="apply_for_money_running"/></font>{@/if} --%>
						<%-- <font><form:i18n name="has_finish_money"/>:<span id="hasFinishMoney"></span><form:i18n name="unit"/></font> --%>
					</div>
				</div>
				<%-- <div class="col-md-8">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<!-- <ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
 -->
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
				{@if canReceive}<a class="btn btn-primary" href="javascript:void(0)" onclick="OrderDetail.showForm();">接单</a>{@/if}
				{@if !canReceive&&!receiverId}<font color="red"><form:i18n name="ACCEPT_FOR_TASK"/></font>{@/if}
				<a class="btn btn-primary" href="javascript:void(0)" onclick="OrderDetail.showOrderReceiveInfo();">查看接单详情</a>
			<!-- 	{@if waitforConfirm}<a class="btn btn-primary" href="javascript:void(0)" onclick="OrderDetail.confirm();">确认</a>{@/if} -->
				{@if receiverId}<font color="red"><form:i18n name="hasReceive"/></font>{@/if}
				{@if receiverId==userId&&!sysConfirmInfo}<button id="applay_for_money" class="btn btn-primary"  
				onclick="OemGlobal.showConfirm('{id}','4',OrderDetail.applyForMoneySuccess,'{sysConfirmInfo.sysConfirmId}');"><form:i18n name="applay_for_money"/></button>{@/if}
				{@if sysConfirmInfo}<font color="red"><form:i18n name="apply_for_money_running"/></font>{@/if}
				<font><form:i18n name="has_finish_money"/>:<span id="hasFinishMoney"></span><form:i18n name="unit"/></font>
			</div> --%>
				<div class="well receiveForm" style="display: none;">
					<form role="form" id="receiveTaskForm">
						<input name="orderId" type="hidden" value="${id}" />
						<h4>自我介绍</h4>
						<div class="form-group">
							<textarea name="remark" class="form-control" rows="3"></textarea>
						</div>
						<!--  <h4>公司团队信息</h4>
                        <div class="form-group">
                            <textarea class="form-control" rows="3"></textarea>
                        </div> -->
						<h4>价格</h4>
						<div class="form-group">
							<input name="money" class="form-control" rows="3">
							</textarea>
						</div>
						<button type="button" class="btn btn-primary"
							id="want_to_receiveBtn">提交</button>
					</form>
				</div>
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
			<div class="row apply_info_div"
				style="width: 950px; margin: 0 auto; margin-bottom: 100px;">
				<div class="col-lg-12">
					<h3 class="page-header apply_info">申请记录</h3>
					<table id="applyInfoList">
						<thead>
							<th width="10%">序号</th>
							<th width="10%">类型</th>
							<th width="20%">操作时间</th>
							<th width="20%">备注</th>
							<th width="30%">对方原因</th>
							<th width="10%">结果</th>
						</thead>
					</table>
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