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
<form action="Sym_updateDeptDo" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
<div class="pageFormContent" layoutH="10">
<table class="stable1" cellpadding="0" cellspacing="1">
	<tr>
		<th width="100px">部门名称</th>
		<td>
		<input class="required" type="text"
			name="depts.dept_name" value="${aa.dept_name }">
			<input type="hidden"
			name="depts.id" value="${aa.id }">
		</td>
	</tr>
	<tr>
		<th width="100px">所属部门</th>
		<td>${aa.dept.dept_name }
		<c:if test="${aa.dept!=null }">
				<input type="hidden"
			name="depts.dept.id" value="${aa.dept.id }"></c:if>
			</td>
	</tr>
	<tr>
		<th width="100px">排序</th>
		<td><input class="required" type="text"
			name="depts.sort" value="${aa.sort }"></td>
	</tr>
	<tr>
		<th width="100px">责任人</th>
		<td><input type="text"
			name="depts.duty_person" value="${aa.duty_person }"></td>
	</tr>
	<tr>
		<th width="100px">责任电话</th>
		<td><input type="text"
			name="depts.d_phone" value="${aa.d_phone }"></td>
	</tr>
	<tr>
		<th width="100px">责任地点</th>
		<td><input type="text"
			name="depts.d_address" value="${aa.d_address }"></td>
	</tr>
	<tr>
		<th width="100px">是否允许上报</th>
		<td>
			<select name="depts.isshownum">
				<c:if test="${aa.isshownum==0 }">
					<option value="0">不允许</option>
					<option value="1">允许</option>
				</c:if>
				<c:if test="${aa.isshownum==1 }">
					<option value="1">允许</option>
					<option value="0">不允许</option>
				</c:if>
			</select>
		</td>
	</tr>
	<tr>
		<th width="100px">备注</th>
		<td><input type="text"
			name="depts.remark" value="${aa.remark }"></td>
	</tr>
	<tr>
		<th>操作</th>
		<td style="text-align: left;">
		<c:if test="${fn:contains(menusids,',175,')}">
			<input type="submit" value="提交" class='className icon-ok'>
		</c:if>
		</td>
	</tr>
</table>
</div>
</form>
</body>
</html>