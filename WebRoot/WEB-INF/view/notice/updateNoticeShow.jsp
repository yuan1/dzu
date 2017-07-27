<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- -----------------------------kindeditor-------------------------------- -->
<script src="kindeditor/kindeditor-all.js" type="text/javascript"></script>
<script src="kindeditor/lang/zh-CN.js" type="text/javascript"></script>
<script src="kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
<link href="kindeditor/plugins/code/prettify.css" rel="stylesheet" type="text/css" />
<link href="kindeditor/themes/default/default.css" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<div class="pageContent">
<form method="post" action="Notice_updateNoticeDo" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)" > 
<div class="pageFormContent" layoutH="10">
<table cellspacing="1" cellpadding="0" class="stable">
	<tr>
		<th width="100px">标题</th>
		<td style="text-align: left;"><input
			class="required" type="text"
			name="nt.title" size="100" value="${updateNoticeMessage.title}"/><font color="red">${titleMsg }</font>
			<input type="hidden" name="nt.id" value="${updateNoticeMessage.id }"/>
			</td>
	</tr>
	<tr>
		<th>内容</th>
		<td style="text-align: left;">
		<textarea class="kindeditor" name="nt.content" tools="full" style="width: 680px; height: 400px;">${updateNoticeMessage.content }</textarea>
		<font color="red">${contentMsg}</font>
		 </td>
	</tr>
	<tr>
		<th>操作</th>
		<td colspan="7" style="text-align: left;">
		<c:if test="${fn:contains(menusids,',152,')}">
			<input type="submit" value="发布" class='className icon-ok'/>
		</c:if>
		</td>
	</tr>
</table>
</div>
</form>
<%@include file="../common/js.jsp" %>
</div>
</html>