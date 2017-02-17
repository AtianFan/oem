<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${basePath}newStyle/css/release_task.css">
<script type="text/javascript"
	src="<%=basePath%>js/page/order_task_add.js"></script>
<title>发布任务</title>
<script type="text/javascript">
	var orderId = '${id}';
	function uploadIconSuccess(id, fileUrl, fileName) {
		$("#icon_img").attr("src", fileUrl);
		$("#icon_id_input").val(id);
	}
</script>
</head>
<body>
	<%@include file="pagehead.jsp"%>
	<div class="bg" style="min-height: 100%;">
		<div class="release_content">
			<form id="orderTaskForm">
				<div class="input-control">
					<p class="input-title">
						<form:i18n name="poster" />
					</p>
					<div class="clearfix">
						<div class="div-logo">
							<img src="" width="100px" height="100px" id="icon_img" /> <input
								type="hidden" name="parentId" value="${param.parentId}" />
						</div>
						<div class="div-submit">

							<input class="form-input-file" type="hidden" name="iconId"
								id="icon_id_input">
							<iframe height="50px" width="600px" src="uploadFile.do?callback=uploadIconSuccess&type=head" frameborder=0></iframe>
						</div>
					</div>
				</div>
				<div class="input-control">
					<p class="input-title">
						<form:i18n name="taskName" />
					</p>
					<textarea class="text-area" cols="150" rows="7" name="name"></textarea>
				</div>
				<div class="input-control">
					<p class="input-title">
						<form:i18n name="taskDescriptonOrIntroduce" />
					</p>
					<textarea name="description" class="text-area" cols="150" rows="7"
						style="height: 155px"></textarea>
				</div>
				<div class="input-control">
					<p class="input-title">
						<form:i18n name="subTaskMoney" />
					</p>
					<!-- <textarea type="number" name="money" class="text-area" cols="150" rows="7"
						style="height: 155px"></textarea> -->
					<form:input name="money" type="number" />
				</div>
				<div class="input-control">
					<div class="form-file-div" id="form-file-div">
						<div class="xttblog">
							<ul class="box" id="box">
							</ul>
						</div>
						<div>
							<input id="form-input-file" class="form-input-file" type="hidden"
								name="fileIds">
							<iframe id="form-file-iframe" height="50px" width="600px"
								style="display: none;" src="uploadFile.do" frameborder=0></iframe>
						</div>

						<div>
							<button type="button" class="blue-btn" id="form-addfile-control">
								<form:i18n name="addAttachments" />
							</button>
						</div>
					</div>
					<input type="hidden" value="" name="childrensIds" />
					<button type="button" class="green-btn" id="addTaskBtn">
						<form:i18n name="add_task" />
					</button>
				</div>
			</form>
		</div>
	</div>
	<%@include file="pagefoot.jsp"%>
</body>
</html>