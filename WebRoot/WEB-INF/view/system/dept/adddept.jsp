<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<form action="Sym_addDeptDo" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
<div class="pageFormContent" layoutH="10">
<table class="stable1" cellpadding="0" cellspacing="1">
	<tr>
		<th width="100px">部门名称</th>
		<td>
		<input class="required" type="text"
			name="depts.dept_name">
			<input type="hidden"
			name="depts.dept.id" value="${parentdept.id }">
			<input type="hidden"
			name="depts.status" value="1">
		</td>
	</tr>
	<tr>
		<th width="100px">所属部门</th>
		<td>${parentdept.dept_name }</td>
	</tr>
	<tr>
		<th width="100px">排序</th>
		<td><input class="required" type="text"
			name="depts.sort"></td>
	</tr>
	<tr>
		<th width="100px">责任人</th>
		<td><input type="text"
			name="depts.duty_person"></td>
	</tr>
	<tr>
		<th width="100px">责任电话</th>
		<td><input type="text"
			name="depts.d_phone"></td>
	</tr>
	<tr>
		<th width="100px">责任地点</th>
		<td><input type="text"
			name="depts.d_address"></td>
	</tr>
	<tr>
		<th width="100px">是否允许上报</th>
		<td>
			<select name="depts.isshownum">
				<option value="0">不允许</option>
				<option value="1">允许</option>
			</select>
		</td>
	</tr>
	<tr>
		<th width="100px">备注</th>
		<td><input type="text"
			name="depts.remark"></td>
	</tr>
	<tr>
		<th>操作</th>
		<td style="text-align: left;">
		<c:if test="${fn:contains(menusids,',174,')}">
		<input type="submit" value="提交" class='className icon-ok'>
		</c:if>
		</td>
	</tr>
</table>
</div>
<input type="hidden" id="depturl" value="Dept/SeeDept/${deptid}">
</form>
</body>
</html>