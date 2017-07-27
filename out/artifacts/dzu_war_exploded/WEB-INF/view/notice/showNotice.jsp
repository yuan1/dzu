<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!-- -----------------------------kindeditor-------------------------------- -->
	<script src="kindeditor/kindeditor-all.js" type="text/javascript"></script>
	<script src="kindeditor/lang/zh-CN.js" type="text/javascript"></script>
	<script src="kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
	<link href="kindeditor/plugins/code/prettify.css" rel="stylesheet" type="text/css" />
	<link href="kindeditor/themes/default/default.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="pageFormContent" layoutH="10">
<table cellspacing="1" cellpadding="0" class="stable">
	<tr>
		<th width="100px">标题</th>
		<td style="text-align: left;">${noticeMessage.title}
			</td>
	</tr>
	<tr>
		<th>内容</th>
		<td style="text-align: left;">
			<textarea class="kindeditor" name="nt.content" tools="simple" style="width: 680px; height: 400px;">${noticeMessage.content }</textarea>
		 </td>
	</tr>
</table>
</div>
</body>
</html>