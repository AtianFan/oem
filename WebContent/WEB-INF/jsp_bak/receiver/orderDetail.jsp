<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	var orderId = '${id}';
	var userType = '2';//1表示接包
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${basePath}css/page/orderDetail.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>js/lib/sysConfirm.js"></script>
<script type="text/javascript" src="<%=basePath%>js/page/orderDetail.js"></script>
<script type="text/javascript" src="<%=basePath%>js/page/showPriceDialog.js"></script>
<title>订单详情页面</title>
</head>
<body>
	<%@include file="../pagehead.jsp"%>
	<!-- Page Content -->
	<div class="container" id="orderTaskInfo"></div>

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
				<%-- {@if receiverId==userId&&!sysConfirmInfo}<button id="applay_for_money" class="btn btn-primary"  
				onclick="OemGlobal.showConfirm('{id}','4',OrderDetail.applyForMoneySuccess,'{sysConfirmInfo.sysConfirmId}');"><form:i18n name="applay_for_money"/></button>{@/if}
				{@if sysConfirmInfo}<font color="red"><form:i18n name="apply_for_money_running"/></font>{@/if} --%>
				<font><form:i18n name="has_finish_money"/>:<span id="hasFinishMoney"></span><form:i18n name="unit"/></font>
			</div>
			<div class="well receiveForm" style="display:none;">
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
                            <input name="money" class="form-control" rows="3"></textarea>
                        </div>
                        <button type="button" class="btn btn-primary" id="want_to_receiveBtn">提交</button>
                    </form>
           </div>
		</div>
		<div class="row" id="fileListDiv">

			<div class="col-lg-12">
				<h3 class="page-header">附件</h3>
			</div>
		</div>
		
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
		
		
		<!-- /.row -->
		<div class="row" >
			<div class="col-lg-12">
				<h3 class="page-header">申请记录</h3>
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