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
<form action="Sym_addRoleDo" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
<div class="pageFormContent" layoutH="10">
<table class="stable1" cellpadding="0" cellspacing="1">
	<tr>
		<th width="100px">角色名称</th>
		<td>
		<input class="required" type="text"
			name="role.name">
			<input type="hidden"
			name="role.role.id" value="${roleMess.id }">
		</td>
	</tr>
	<tr>
		<th width="100px">所属角色</th>
		<td>${roleMess.name }
			</td>
	</tr>
	<tr>
		<th width="100px">排序</th>
		<td><input class="required" type="text"
			name="role.sort"></td>
	</tr>
	<tr>
		<th width="100px">备注</th>
		<td><input type="text"
			name="role.remark"></td>
	</tr>
	<tr>
		<th>操作</th>
		<td style="text-align: left;">
		<c:if test="${fn:contains(menusids,',181,')}">
			<input type="submit" value="提交" class='className icon-ok'>
		</c:if>
		</td>
	</tr>
</table>
</div>
</form>
</body>
</html>