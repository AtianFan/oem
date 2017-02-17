<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<%=basePath%>js/page/order_task_add.js"></script>
<title><form:i18n name="addSubTask"/></title>
<script type="text/javascript">
	function uploadIconSuccess(id,fileUrl,fileName){
		$("#icon_img").attr("src",fileUrl);
		$("#icon_id_input").val(id);
	}
</script>
</head>
<body>
	<%@include file="pagehead.jsp"%>

	<div class="container">


		<!-- Portfolio Item Row -->
		<div class="row">




			<div class="well">
				<form role="form" id="orderTaskForm">
					<h4><form:i18n name="poster"/></h4>
					<input type="hidden" name="parentId" value="${param.parentId}"/>
					<div class="form-group">
						 <img src="" width="100px" height="100px" id="icon_img"/> 
						 <div class="">
						 	<input class="form-input-file" type="hidden"
								name="iconId" id="icon_id_input">
							<iframe
								height="37px" src="uploadFile.do?callback=uploadIconSuccess" frameborder=0></iframe>
						 </div>
					</div>
					<h4><form:i18n name="subTaskName"/></h4>
					<div class="form-group">
						<textarea class="form-control" rows="3" name="name"></textarea>
					</div>
					<h4><form:i18n name="taskIntroduce"/></h4>
					<div class="form-group">
						<textarea name="introduce" class="form-control" rows="3"></textarea>
					</div>
					<h4><form:i18n name="taskDescription"/></h4>
					<div class="form-group">
						<textarea class="form-control" name="description" rows="3"></textarea>
					</div>
					<h4><form:i18n name="subTaskMoney"/></h4>
					<div class="form-group">
						<input name="money" class="form-control" />
					</div>
					<div class="form-file-div" id="form-file-div">
						<div>
							<input id="form-input-file" class="form-input-file" type="hidden"
								name="fileIds">
							<iframe id="form-file-iframe" style="display: none;"
								height="37px" src="uploadFile.do" frameborder=0></iframe>
						</div>
						<div>
							<button type="button" id="form-addfile-control"><form:i18n name="addAttachment"/></button>
						</div>
					</div>
					<button type="button" class="btn btn-primary" id="addTaskBtn"><form:i18n name="add_task"/></button>
				</form>
			</div>
		</div>
		<!-- /.row -->

		<!-- Footer -->
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