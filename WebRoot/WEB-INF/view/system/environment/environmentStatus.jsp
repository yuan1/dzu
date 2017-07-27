<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#tableMy td {
	text-align: left;
}
</style>
</head>
<body>
<div class="pageFormContent" layoutH="10">
	<table id="tableMy" cellpadding="0" cellspacing="1" class="stable">
		<tr>
		<th style="width: 140px;">操作系统</th>
		<td>${sysinfo.osname }</td>
	</tr>
	<tr>
		<th>服务器地址</th>
		<td>${sysinfo.serIP }</td>
	</tr>
	<tr>
		<th>访问端地址</th>
		<td>${sysinfo.hostIP }</td>
	</tr>
	<tr>
		<th>服务器</th>
		<td><%=application.getServerInfo()%></td>
	</tr>
	<tr>
		<th>文件目录</th>
		<td>${sysinfo.appDir}</td>
	</tr>
	</table>
</div>
</body>
</html>