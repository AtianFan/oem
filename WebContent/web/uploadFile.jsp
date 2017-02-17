<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath = request.getContextPath();
	String id = request.getParameter("id");
	/* if(id==null){
		request.getParameter("id");
	} */
	request.setAttribute("id", id);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传</title>
</head>
<body>
	<style>
input:FIRST-CHILD {
	float: left;
	width: 187px;
}
</style>
	<form enctype="multipart/form-data"
		action="<%=contextPath%>/SysFile/commonUpload.do?id=${id}" method="post">
		<input type="file" name="file" /> <input type="submit" value="提交" />
	</form>
	<script type="text/javascript">
		var data = '${data}', flag = '${data.flag}', id = '${id}';
		if (data && flag) {
			parent.uploadFileSuccess(id);
		}
	</script>
</body>
</html>