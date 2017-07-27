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
<div class="pageFormContent" layoutH="0">
<table class="stable1" cellpadding="0" cellspacing="1">
	<tr>
		<th width="100px">角色名称</th>
		<td>${roleMess.name }</td>
	</tr>
	<tr>
		<th width="100px">所属角色</th>
		<td>${roleMess.role.name }</td>
	</tr>
	<tr>
		<th width="100px">排序</th>
		<td>${roleMess.sort }</td>
	</tr>
	<tr>
		<th width="100px">备注</th>
		<td>${roleMess.remark }</td>
	</tr>
	<tr>
		<th width="100px">操作</th>
		<td>
		<c:if test="${fn:contains(menusids,',182,')}">
			<a href="#" class="className icon-edit" onclick="updated('Sym_updateRole?d=${roleMess.id}')">修改</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${fn:contains(menusids,',183,')}">
			<a href="Sym_delRoleDo?role_id=${roleMess.id}" class="className icon-no" target="ajaxTodo" title="确认要删除吗？">删除</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${fn:contains(menusids,',181,')}">
			<a href="#" class="className icon-add" onclick="updated('Sym_addRole?d=${roleMess.id}')">添加子节点</a>
		</c:if>
		<c:if test="${fn:contains(menusids,',184,')}">
			<a href="#" class="className icon-edit" onclick="updated('Sym_roleEdit?d=${roleMess.id}')">权限编辑</a>
		</c:if>
		</td>
	</tr>
</table>
</div>
<script type="text/javascript">
	function updated(url) {
		var $rel = $("#jbsxBox2");
		$rel.loadUrl(url, {}, function(){
			$rel.find("[layoutH]").layoutH();
		});
		event.preventDefault();
	}
</script>
</body>
</html>