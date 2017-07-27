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
<form id="updateUserMess" action="Sym_addUserDo" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
<div class="pageFormContent" layoutH="0">
<table id="myTable" class="stable" cellpadding="0" cellspacing="1">
	<tr>
		<th style="width: 130px;"><font color="red">*</font>用户名</th>
		<td><input id="username"  class="required"
			name="users.username" type="text"
			/></td>
	</tr>
	<tr>
		<th>密码</th>
		<td><input class="required" type="password" name="users.password" value="" /></td>
	</tr>
	<tr>
		<th><font color="red">*</font>姓名</th>
		<td><input  class="required" type="text" name="users.realname" /></td>
	</tr>
	<tr>
		<th>性别</th>
		<td><select class="input_select" name="users.sex">
				<option value="男">男</option>
				<option value="女">女</option>
		</select></td>
	</tr>
		<tr>
		<th><font color="red">*</font>电话</th>
		<td><input  class="required" type="text" name="users.phone"
			value="${userSee3.phone}" /> 
			<input type="hidden" name="users.del" value="1" /></td>
	</tr>
	<tr>
			<th>出生年月</th>
			<td>
			<input readonly="readonly" type="text" name="users.birthday" class="date" dateFmt="yyyy-MM-dd"/> 
			</td>
	</tr><tr>
			<th><font color="red">*</font>身份证号</th>
			<td><input id="idCard" onblur="checkIdCard('');" type="text"
				 class="required" data-options="required:true"
				name="users.id_card"/></td>
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
		<td>${dept.dept_name}
		<input type="hidden" class="input_text" name="users.dept.id"  value="${dept.id }"/>
		</td>
	</tr>
	<tr>
		<th><font color="red">*</font>用户组</th>
		<td>
		<input id="citySel"  class="required" type="text" readonly="readonly" value="" style="width:200px;" onclick="showMenu(); return false;"/>
		<input id="roleid" type="hidden" name="users.role.id">
		</td>
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
<script type="text/javascript">
var setting = {
	view: {
		selectedMulti:false,
		dblClickExpand: false
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		beforeClick: beforeClick,
		onClick: onClick
	}
};

var zNodes=${rolejson};
function beforeClick(treeId, treeNode) {
	return true;
}

function onClick(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
	nodes = zTree.getSelectedNodes(),
	v = "";
	ids="";
	nodes.sort(function compare(a,b){return a.id-b.id;});
	v = nodes[0].name;
	ids=nodes[0].id;
	var cityObj = $("#citySel");
	cityObj.attr("value", v);
	$("#roleid").val(ids);
	hideMenu();
}

function showMenu() {
	var cityObj = $("#citySel");
	var cityOffset = $("#citySel").offset();
	$("#menuContent").css({left:cityOffset.left-211 + "px", top:cityOffset.top -83+ cityObj.outerHeight() + "px"}).slideDown("fast");

	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
		hideMenu();
	}
}

$(document).ready(function(){
	$.fn.zTree.init($("#treeDemo"), setting, zNodes);
});
</SCRIPT>
<div id="menuContent" class="menuContent" style="display:none; position: absolute; background-color: #fff; border:1px solid #000;overflow: auto; ">
	<ul id="treeDemo" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>
<%@include file="../../common/jsclose.jsp" %>
</form>
</body>
</html>