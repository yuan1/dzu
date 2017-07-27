<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<form method="post" action="Sym_AddProDo" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
<div class="pageFormContent" layoutH="10">
<table class="stable1" cellpadding="0" cellspacing="1">
	<tr>
		<th width="8%">名称</th>
		<td>
			<select name="property.p_name">
				<c:forEach items="${names }" var="a">
					<option value="${a }">${a}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>内容</th>
		<td>
			<textarea rows="6" cols="90" name="property.content" class="required" >${pro.content}</textarea>
		</td>
	</tr>
	<tr>
		<th>操作</th>
		<td>
		<c:if test="${fn:contains(menusids,',193,')}">
		<input type="submit" value="提交" class='className icon-ok'>
		</c:if>
		</td>
	</tr>
</table>
</div>
</form>
<%@include file="../../common/jsclose.jsp" %>
</html>