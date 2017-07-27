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
<div layoutH="10">
<form action="Sym_roleEditDo" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
	<table cellpadding="0" cellspacing="1" class="stable1">
		<tr>
			<th style="width: 100px;">角色名称</th>
			<td>${roleMess.name} <input type="hidden" name="role_id"
				value="${roleMess.id}" /></td>
		</tr>
		<tr>
			<th>管理范围</th>
			<td><input id="citySel" type="text" readonly="readonly" value="" style="width:300px;" onclick="showMenu();"/>
			<input id="deptsids" name="deptsids" type="hidden" readonly="readonly" style="width:320px;"/>
			&nbsp;&nbsp;<font color="red">*</font>不选默认管理范围为所在单位及下级单位</td>
		</tr>
		<tr>
			<th>权限编辑<br><br>
			<input type="checkbox" class="checkboxCtrl" group="menusid" />全选 
			</th>
			<td>
			<table cellpadding="0" cellspacing="1" class="stable1">
				<c:forEach items="${menus }" var="m">
					<c:if test="${m.menus==null }">
						<tr>
							<th width="150px"><label>
							<c:set var="s" value=",${m.id},"/>
							<c:if test="${roleids.contains(s)}">
								<input type="checkbox" name="menusid" value="${m.id}" checked="checked"/>
							</c:if>
							<c:if test="${!roleids.contains(s)}">
								<input type="checkbox" name="menusid" value="${m.id}" />
							</c:if>
							${m.menu_name }</label></th>
							<td>
								<c:forEach items="${m.children}" var="m2">
									<label>
									<c:set var="s" value=",${m2.id},"/>
									<c:if test="${roleids.contains(s)}">
										<input type="checkbox" name="menusid" value="${m2.id}" checked="checked"/>
									</c:if>
									<c:if test="${!roleids.contains(s)}">
										<input type="checkbox" name="menusid" value="${m2.id}" />
									</c:if>
									${m2.menu_name}</label>
									[
										<c:forEach items="${m2.children}" var="m3">
											<label>
											<c:set var="s" value=",${m3.id},"/>
											<c:if test="${roleids.contains(s)}">
												<input type="checkbox" name="menusid" value="${m3.id}" checked="checked"/>
											</c:if>
											<c:if test="${!roleids.contains(s)}">
												<input type="checkbox" name="menusid" value="${m3.id}" />
											</c:if>
											${m3.menu_name}</label>
										</c:forEach>
									]<br>
								</c:forEach>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			</td>
		</tr>
		<tr>
			<th>操作</th>
			<td>
			<c:if test="${fn:contains(menusids,',184,')}">
				<input type="submit" value="提交" class='className icon-ok'>
				</c:if>
			</td>
		</tr>
	</table>
	</form>
	</div>
<div id="menuContent" class="menuContent" style="display:none; position: absolute; background-color: #fff; border:1px solid #000;overflow: auto; ">
	<ul id="treeDemo" class="ztree" style="margin-top:0; width:300px; height: 300px;"></ul>
</div>
	<SCRIPT type="text/javascript">
		var setting = {
			check: {
				enable: true,
				chkboxType: {"Y":"", "N":""}
			},
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeClick: beforeClick,
				onCheck: onCheck
			}
		};

		var zNodes =${deptjson3};

		function beforeClick(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}
		
		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			x="";
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
				x += nodes[i].id + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			if (x.length > 0 ) x = x.substring(0, x.length-1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
			var cityObj1 = $("#deptsids");
			cityObj1.attr("value", x);
		}

		function showMenu() {
			var cityObj = $("#citySel");
			var cityOffset = $("#citySel").offset();
			$("#menuContent").css({left:cityOffset.left-210 + "px", top:cityOffset.top-80 + cityObj.outerHeight() + "px"}).slideDown("fast");
			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			x="";
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
				x += nodes[i].id + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			if (x.length > 0 ) x = x.substring(0, x.length-1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
			var cityObj1 = $("#deptsids");
			cityObj1.attr("value", x);
		});
	</SCRIPT>
</body>
</html>