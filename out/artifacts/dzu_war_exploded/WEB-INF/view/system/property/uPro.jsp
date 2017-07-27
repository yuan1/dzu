<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<form method="post" action="Sym_DuPro" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
<div class="pageFormContent" layoutH="10">
<table class="stable1" cellpadding="0" cellspacing="1">
	<tr>
		<th width="8%">名称</th>
		<td>${pro.p_name}<input type="hidden" name="pro_id"
			value="${pro.id}" /></td>
	</tr>
	<tr>
		<th>内容</th>
		<td>
			<textarea rows="6" cols="90" name="property.content" class="required" >${pro.content}</textarea>
		</td>
	</tr>
	<tr>
		<th>操作</th>
		<td><input type="submit" value="提交" class='className icon-ok'></td>
	</tr>
</table>
</div>
<%@include file="../../common/jsclose.jsp" %>
</form>
</body>
</html>