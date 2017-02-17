<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	var userType = '1';
	var orderId = '${id}';
	function uploadIconSuccess(id,fileUrl,fileName){
		$("#icon_img").attr("src",fileUrl);
		$("#icon_id_input").val(id);
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${basePath}newStyle/css/release_task.css">
<script type="text/javascript" src="<%=basePath%>js/page/orderDetail.js"></script>
<script type="text/javascript" src="<%=basePath%>js/page/order_task_add.js"></script>
<script type="text/javascript" src="<%=basePath%>js/page/orderModify.js"></script>
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
					{orderName}<small>{orderType}</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->

		<!-- Portfolio Item Row -->
		<div class="row">
			<div class="well" id="contentDiv">
				<form role="form" id="orderTaskForm">
					<input class="form-input-file" type="hidden" name="id" value="{id}">
					<h4>
						<form:i18n name="poster" />
					</h4>
					<div class="form-group">
						<img src="{iconFile.fileUrl}" width="100px" height="100px" id="icon_img"/>
						<div class="">
							<input class="form-input-file" type="hidden" name="iconId"
								id="icon_id_input" value="{iconId}">
							<iframe height="37px"
								src="${basePath}/Page/uploadFile.do?callback=uploadIconSuccess" frameborder=0></iframe>
						</div>
					</div>
					<h4>
						<form:i18n name="taskName" />
					</h4>
					<div class="form-group">
						<textarea class="form-control" rows="3" name="name">{name}</textarea>
					</div>
					<h4>
						<form:i18n name="taskType" />
					</h4>
					<div class="form-group">
						<select class="form-control" name="type" id="selectType" value="{type}">
						</select>
					</div>
					<h4>
						<form:i18n name="taskIntroduce" />
					</h4>
					<div class="form-group">
						<textarea name="introduce" class="form-control" rows="3">{introduce}</textarea>
					</div>
					<h4>
						<form:i18n name="taskDescription" />
					</h4>
					<div class="form-group">
						<textarea class="form-control" name="description" rows="3">{description}</textarea>
					</div>
					<h4>
						<form:i18n name="requirements" />
					</h4>
					<div class="form-group">
						<textarea name="requirements" class="form-control" rows="3">{requirements}</textarea>
					</div>
					<div class="form-file-div" id="form-file-div">
						<div>
							<input id="form-input-file" class="form-input-file" type="hidden"
								name="fileIds">
							<iframe id="form-file-iframe" style="display: none;"
								height="37px" src="${basePath}Page/uploadFile.do" frameborder=0></iframe>
						</div>

						<div>
							<button type="button" id="form-addfile-control">
								<form:i18n name="addAttachments" />
							</button>
						</div>
					</div>
					<input type="hidden" value="" name="childrensIds" />
					<button type="button" class="btn btn-primary" id="addTaskBtn">
						<form:i18n name="modifyTask" />
					</button>
				</form>
			</div>
		</div>
		<!-- /.row -->

		<!-- Related Projects Row -->
		<div class="row" id="fileListDiv">

			<div class="col-lg-12">
				<h3 class="page-header">附件</h3>
			</div>

		</div>
		<!-- /.row -->
		<div class="row" id="receiveTaskDiv">
			<div class="col-lg-12">
				<h3 class="page-header">接单团队</h3>
			</div>
		</div>
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