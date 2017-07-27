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
<div class="pageFormContent" layoutH="10">
<table class="stable1" cellpadding="0" cellspacing="1">
	<tr>
		<th width="100px">部门名称</th>
		<td>${deptMess.dept_name }</td>
	</tr>
	<tr>
		<th width="100px">所属部门</th>
		<td>${deptMess.dept.dept_name }</td>
	</tr>
	<tr>
		<th width="100px">排序</th>
		<td>${deptMess.sort }</td>
	</tr>
	<tr>
		<th width="100px">责任人</th>
		<td>${deptMess.duty_person }</td>
	</tr>
	<tr>
		<th width="100px">责任电话</th>
		<td>${deptMess.d_phone }</td>
	</tr>
	<tr>
		<th width="100px">责任地点</th>
		<td>${deptMess.d_address }</td>
	</tr>
	<tr>
		<th width="100px">是否允许上报</th>
		<td>
			<c:if test="${deptMess.isshownum==0 }">
				不允许
			</c:if>
			<c:if test="${deptMess.isshownum==1 }">
				允许
			</c:if>
		</td>
	</tr>
	<tr>
		<th width="100px">备注</th>
		<td>${deptMess.remark }</td>
	</tr>
	<tr>
		<th width="100px">操作</th>
		<td>
		<c:if test="${fn:contains(menusids,',175,')}">
			<a href="#" class="className icon-edit" onclick="updated('Sym_updateDept?d=${deptMess.id}')">修改</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${fn:contains(menusids,',176,')}">
			<a href="Sym_delDept?d=${deptMess.id}" class="className icon-no" target="ajaxTodo" title="确认要删除吗？">删除</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${fn:contains(menusids,',174,')}">
			<a href="#" class="className icon-add" onclick="updated('Sym_addDept?d=${deptMess.id}')">添加子节点</a>
		</c:if>
		</td>
	</tr>
</table>
</div>
<script type="text/javascript">
	function updated(url) {
		var $rel = $("#jbsxBox");
		$rel.loadUrl(url, {}, function(){
			$rel.find("[layoutH]").layoutH();
		});
		event.preventDefault();
	}
</script>
</body>
</html>