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
	<div class="bg">
		<div class="release_content">
			<form id="orderTaskForm">
				<div class="input-control">
					<p class="input-title">
						<form:i18n name="poster" />
					</p>
					<span style="font-size: 14px;color:#bdbaba"> 
						(此文件会显示在首页，后续可以编辑，文件限制为jpg，png，等。)
					</span>
					<div class="clearfix">
						<div class="div-logo">
							<img src="" width="100px" height="100px" id="icon_img" />
						</div>
						<div class="div-submit">

							<input class="form-input-file" type="hidden" name="iconId"
								id="icon_id_input">
							<iframe height="50px" width="600px"
								src="uploadFile.do?callback=uploadIconSuccess&type=head" frameborder=0></iframe>
						</div>
					</div>
				</div>
				<div class="input-control">
					<p class="input-title">
						<form:i18n name="taskName" />
					</p>
					<span style="font-size: 14px;color:#bdbaba"> 
						(此名称会展示在首页，后续可以编辑，字数限制为100，请尽可能描述准确，等。)
					</span>
					<textarea class="text-area" cols="150" rows="7" name="name"></textarea>
				</div>
				<div class="input-control">
					<p class="input-title">
						<form:i18n name="taskType" />
					</p>
					<select name="type" id="selectType">
					</select>
				</div>
				<div class="input-control">
					<p class="input-title">
						<form:i18n name="taskDescriptonOrIntroduce" />
					</p>
					<span style="font-size: 14px;color:#bdbaba"> 
						(此处任何人都可以查看，字数限制是300，请描述任务的时间，制造要求，前提，等。)
					</span>
					<textarea name="description" class="text-area" cols="150" rows="7"
						style="height: 100px">背景：&#13;&#10;描述：&#13;&#10;目的：</textarea>
				</div>
				<div class="input-control">
					<p class="input-title">
						<form:i18n name="requirements" />
					</p>
					<span style="font-size: 14px;color:#bdbaba"> 
					(根据项目填写要求，字数限制是1000，超过请使用附件功能，额外提供文档说明，等。)
					</span>
					<textarea class="text-area" name="requirements" cols="150" rows="7"
						style="height: 100px">性能：&#13;&#10;大小：&#13;&#10;周期：</textarea>
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
							<iframe id="form-file-iframe" height="200px" width="600px"
								style="display: none; margin-top: 15px;" src="uploadFile.do"
								frameborder=0></iframe>
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