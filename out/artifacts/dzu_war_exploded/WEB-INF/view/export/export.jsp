<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<form method="post" action="Info_ExportExcelDo">
<input type="hidden" name="dw" value="${dw}">
<input type="hidden" name="year" value="${year}">
<input type="hidden" name="type" value="${type}">
<input type="hidden" name="deptids" value="${deptids}">
<input type="hidden" name="exporttype" value="${exporttype}" >
<div class="pageContent">
		<div class="pageFormContent nowrap" layoutH="0">
		<fieldset>
			<legend>选择导出列</legend>
			<br>
			<table>
			<tr style="height:30px;">
			<c:forEach items="${field}" var="r" varStatus="a">
			<td width="25%">
					<input type="checkbox" name="fieldids" value="${r.id }" checked="checked">
				${r.fieldname}&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<c:if test="${(a.index+1)%4==0}">
				</tr><tr style="height:30px">
			</c:if>
			</c:forEach>
			</tr>
			</table>
			<br>
		</fieldset>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
		</div>
</div>
</form>
</body>
</html>