<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
	function uploadifySuccess(file,data,response){
		alert(data);
	}
</script>
</head>
<body>
	<div class="pageHeader">
		<input id="uploadify" name="uploadify"
			uploaderOption="{
						swf:'dwz/uploadify/scripts/uploadify.swf',
						uploader:'PersonSB_comeinPersonDo',
						formData:{PHPSESSID:'xxx', ajax:1},
						buttonText:'点击选择文件',
						fileTypeDesc:'*.dwrs;',
						fileTypeExts:'*.dwrs',
						auto:true,
						multi:false,
						onUploadSuccess:uploadifySuccess,
						onQueueComplete:uploadifyQueueComplete
						}"
			type="file" /> 
	</div>
</body>
</html>