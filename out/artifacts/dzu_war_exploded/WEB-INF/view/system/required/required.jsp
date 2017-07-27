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
<div class="pageContent">
	<form method="post" action="Sym_SetRequired" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent nowrap" >
		<fieldset>
			<legend>必填项选择</legend>
			<br>
			<table layoutH="91">
			<tr style="height:30px;">
			<c:forEach items="${rlist}" var="r" varStatus="a">
			<td width="25%">
				<c:if test="${r.r==1 }">
					<input type="checkbox" name="rids" value="${r.id }" checked="checked">
				</c:if>	
				<c:if test="${r.r==0}">
					<input type="checkbox" name="rids" value="${r.id }">
				</c:if>				
				${r.fieldname}&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<c:if test="${(a.index+1)%3==0}">
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
	</form>
</div>
<%@include file="../../common/js.jsp" %>
</body>
</html>