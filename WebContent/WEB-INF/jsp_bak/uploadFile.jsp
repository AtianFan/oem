<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath = request.getContextPath();
    String callback = request.getParameter("callback");
    if(callback==null){
    	callback = (String)request.getAttribute("callback");
    }
    System.out.println(callback+"====");
    request.setAttribute("callback", callback);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传</title>
</head>
<style type="text/css">
	input:FIRST-CHILD {
		float: left;
		width: 187px;
	}
</style>
<body>
	<form enctype="multipart/form-data"
		action="<%=contextPath%>/SysFile/commonUpload.do"
		method="post">
		<input type="file" name="file" /> <input type="submit" value="提交" />
		<input type="hidden" value="${callback}" name="callback" />
	</form>
	<script type="text/javascript">
		var callback = '${callback}' || 'uploadFileSuccess';
		//alert(callback);
		var fileUrl = '${data.path}', flag = '${data.flag}', id = '${data.id}',data='${data}',fileName='${data.originName}';
		if (data && flag) {
			parent[callback](id,fileUrl,fileName);
		}
	</script>
</body>
</html>