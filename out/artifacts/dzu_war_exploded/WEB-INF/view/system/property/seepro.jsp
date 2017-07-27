<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<div class="pageFormContent" layoutH="10">
<table class="stable1" cellpadding="0" cellspacing="1">
	<tr>
		<th width="8%">名称</th>
		<td>${pro.p_name}</td>
	</tr>
	<tr>
		<th>内容</th>
		<td>
			${pro.content}
		</td>
	</tr>
</table>
</div>
</body>
</html>