<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="form-control" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath = request.getContextPath();
	String callback = request.getParameter("callback");
	if (callback == null) {
		callback = (String) request.getAttribute("callback");
	}
	System.out.println(callback + "====");
	request.setAttribute("callback", callback);
	
	String type=(String) request.getParameter("type");
	request.setAttribute("type", type);
	
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
	request.setAttribute("basePath", basePath);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${basePath}newStyle/css/common.css">
<style type="text/css">
</style>
<title>上传</title>
</head>
<style type="text/css">
input:FIRST-CHILD {
	float: left;
	width: 120px;
}

input[type="file"] {
	position: absolute;
	height: 31px;
	left: 0;
	top: 48px;
	opacity: 0
}

.blue-btn {
	float: left;
	margin-top:23px;
}
.blue-btn:hover {
	background: rgb(85,175,238);
	background-size: 100% 100%;
	border-radius:5px;
}
.green-btn {
	float: right;
	margin-top:23px;
}

#fileName {
	font-size: 12px;
	width: 160px;
	overflow: hidden;
	text-overflow: ellipsis;
	word-wrap: break-word;
	white-space: nowrap;
	display: inline-block;
}
</style>
<body>
	<form name="form1" id="upload_file_form" enctype="multipart/form-data"
		action="<%=contextPath%>/SysFile/commonUpload.do"
		onsubmit="return valid()" method="post">
		<div style="height:100%;">
			<%-- <input type="file" name="file" /> <input type="submit" value="提交" />
		<input type="hidden" value="${callback}" name="callback" /> --%>
			<input type="hidden" value="${callback}" name="callback" /> 
			<span ><input 
				onchange="document.getElementById('fileName').innerHTML=this.value"
				type="file" name="file"  style="font-size:0px;cursor: pointer;"  /></span>
			<div style="height:16px;">
				<span style="font-size: 12px;" id="fileName"></span>
			</div>
			<div style="display: inline">
				<button class="blue-btn" style="">
					<form:i18n name="chooseFile" />
				</button>
			</div>
			<div style="display: inline">
				<button class="green-btn" type="submit">
					<form:i18n name="submit" />
				</button>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		var callback = '${callback}' || 'uploadFileSuccess';
		//alert(callback);
		var type="${type}";
		var fileUrl = '${data.path}', flag = '${data.flag}', id = '${data.id}', data = '${data}', fileName = '${data.originName}';
		if (data && flag) {
			parent[callback](id, fileUrl, fileName);
		}
		function valid() {
			var s = document.form1.file.value;
			if (s == "") {
				alert("请选择文件");
				return false;
			}
			
			var photoExt=s.substr(s.lastIndexOf(".")).toLowerCase();//获得文件后缀名
			if(type=='head'){
			    if(photoExt!='.jpg'&&photoExt!='.png'&&photoExt!='.jpeg'&&photoExt!='.gif'){
			        alert("请上传后缀名为jpg,png,gif,jpeg的图片!");
			        return false;
			    }
		    }
		    var fileSize = 0;
		    var isIE = /msie/i.test(navigator.userAgent) && !window.opera;            
		    if (isIE && !obj.files) {          
		         var filePath = document.form1.file.value;            
		         var fileSystem = new ActiveXObject("Scripting.FileSystemObject");   
		         var file = fileSystem.GetFile (filePath);               
		         fileSize = file.Size;         
		    }else {  
		         fileSize = document.form1.file.files[0].size;     
		    } 
		    fileSize=Math.round(fileSize/1024*100)/100; //单位为KB
		    
		    if(type=='head'){
			    if(fileSize>600){
			        alert("照片最大尺寸为600KB，请重新上传!");
			        return false;
			    }
		    }else{
		    	if(fileSize>(5*1024)){
			        alert("附件最大为5M，请重新上传!");
			        return false;
			    }
		    }
			
			return true;
		}
	</script>
</body>
</html>