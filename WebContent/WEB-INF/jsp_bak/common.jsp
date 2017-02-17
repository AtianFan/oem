<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="form-control" prefix="form"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
	request.setAttribute("basePath", basePath);
%>

<script>
	var basePath = '<%=basePath%>';
</script>
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/common.css" />
<script type="text/javascript"
	src="<%=basePath%>js/lib/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/utils.js"></script>
<script type="text/javascript" src="<%=basePath%>getScript"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/global.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/dialog.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/sysConfirm.js"></script>
<%@include file="source.jsp" %>
<script>
function renderData(url,id,json){
	var template = '<option value="{value}">{title}</option>';
	function appendOption(id,dataList){
		for ( var key in dataList) {
			var data = dataList[key];
			$('#'+id).append(
					template.replace(/\{value\}/g, data.value)
							.replace(/\{title\}/g, data.title));
		}
	}
	if(json){
		appendOption(id, eval('('+json+')'));
		return;
	}
	if(!url){
		return;
	}
	Utils.ajax({
		url : url,
		type : 'post',
	}).done(function(resp) {
			var dataList = resp.dataList;
			appendOption(id, dataList);
			/* for ( var key in dataList) {
				var data = dataList[key];
				$('#'+id).append(
						template.replace(/\{value\}/g, data.value)
								.replace(/\{title\}/g, data.title));
			} */
		});
}
	function changeLanguage(obj){
		Utils.ajax({
			url : basePath + "Language/change.json",
			data : {
				lang : obj.value
			}
		}).done(function(resp) {
			window.location.reload();
		});
	}
</script>
