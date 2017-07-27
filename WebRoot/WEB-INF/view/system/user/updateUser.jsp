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
<form id="updateUserMess" action="Sym_updateUserDo" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
<div class="pageFormContent" layoutH="0">
<table id="myTable" class="stable" cellpadding="0" cellspacing="1">
	<tr>
		<th style="width: 130px;"><font color="red">*</font>用户名</th>
		<td>${userSee3.username}<input id="username" class="required" 
			name="users.username" type="hidden"
			value="${userSee3.username}" /> <input type="hidden" name="users.id"
			value="${userSee3.id}" /></td>
	</tr>
	<tr>
		<th>密码</th>
		<td><input class="input_text" type="password" name="users.password" value="" />
		 <font color="red">*</font>更改密码时填写 <input type="hidden" name="old_pass" value="${userSee3.password}" /></td>
	</tr>
	<tr>
		<th><font color="red">*</font>姓名</th>
		<td><input  class="required" type="text" name="users.realname"
			value="${userSee3.realname}" /></td>
	</tr>
	<tr>
		<th>性别</th>
		<td><select class="input_select" name="users.sex">
			<c:if test="${userSee3.sex=='男'}">
				<option value="男" selected="selected">男</option>
				<option value="女">女</option>
			</c:if>
			<c:if test="${userSee3.sex=='女'}">
				<option value="男">男</option>
				<option value="女" selected="selected">女</option>
			</c:if>
		</select></td>
	</tr>
		<tr>
		<th><font color="red">*</font>电话</th>
		<td><input  class="required" type="text" name="users.phone"
			value="${userSee3.phone}" /> <input type="hidden"
			name="users.dept.id" value="${userSee3.dept.id}" /> <input
			type="hidden" name="users.role.id" value="${userSee3.role.id}" />
			<input type="hidden" name="users.del" value="${userSee3.del}" /></td>
	</tr>
	<tr>
			<th>出生年月</th>
			<td>
			<input readonly="readonly" type="text" name="users.birthday" class="date"  value="${userSee3.birthday }" dateFmt="yyyy-MM-dd"/> 
			</td>
	</tr><tr>
			<th><font color="red">*</font>身份证号</th>
			<td><input id="idCard" onblur="checkIdCard('');" type="text"
				 class="required" data-options="required:true"
				name="users.id_card" value="${userSee3.id_card }"/></td>
		</tr>
	<tr>
			<th>职务</th>
			<td><input type="text" class="input_text" name="users.position"  value="${userSee3.position }"/></td>
	</tr><tr>
			<th>住址</th>
			<td><input type="text" class="input_text" name="users.address"  value="${userSee3.address }"/></td>
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
		<td><input class="input_text" type="text" name="users.remark"
			value="${userSee3.remark}" /></td>
	</tr>
	<tr>
		<th>操作</th>
		<td>
		<c:if test="${fn:contains(menusids,',179,')}">
			<input type="submit" value="提交" class='className icon-ok'>
		</c:if>
		</td>
	</tr>
</table>
</div>
<%@include file="../../common/jsclose.jsp" %>
</form>
</body>
</html>