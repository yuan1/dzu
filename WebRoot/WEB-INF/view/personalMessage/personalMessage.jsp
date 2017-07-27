<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#myTable td {
	text-align: left;
}

input {
	width: 200px;
}
</style>
</head>
<body>
<div class="pageFormContent" layoutH="10">
<table id="myTable" class="stable" cellpadding="0" cellspacing="1">
	<tr>
		<th style="width: 130px;">用户名</th>
		<td>${userSee3.username}</td>
	</tr>
	<tr>
		<th>姓名</th>
		<td>${userSee3.realname}</td>
	</tr>
	<tr>
		<th>性别</th>
		<td>${userSee3.sex}</td>
	</tr>
		<tr>
		<th>电话</th>
		<td>${userSee3.phone}</td>
	</tr>
	<tr>
			<th>出生年月</th>
			<td>
			${userSee3.birthday }
			</td>
	</tr><tr>
			<th>身份证号</th>
			<td>${userSee3.id_card }</td>
		</tr>
	<tr>
			<th>职务</th>
			<td>${userSee3.position }</td>
	</tr><tr>
			<th>住址</th>
			<td>${userSee3.address }</td>
		</tr>
	<tr>
		<th>单位</th>
		<td>${userSee3.dept.dept_name}</td>
	</tr>
	<tr>
		<th>用户组</th>
		<td>${userSee3.role.name}</td>
	</tr>
	<tr>
		<th>备注</th>
		<td>${userSee3.remark}</td>
	</tr>
</table>
</div>
</body>
</html>