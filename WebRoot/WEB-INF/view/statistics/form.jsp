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
<table class="searchContent">
			<tr>
				<td>
					年份:<select name="year" style="width:200px;">
							<option value="${year }">${year }</option>
							<c:forEach items="${allyear }" var="a">
								<option value="${a }">${a}</option>
							</c:forEach>
						</select>
					所属队伍:
						<select name="dw" style="width:200px;">
							<c:if test="${dw==1 }">
								<option value="1">代表人士</option>
								<option value="2">后备人才</option>
								<option value="0">全部</option>
							</c:if>
							<c:if test="${dw==2 }">
								<option value="2">后备人才</option>
								<option value="1">代表人士</option>
								<option value="0">全部</option>
							</c:if>
							<c:if test="${dw==0}">
								<option value="0">全部</option>
								<option value="1">代表人士</option>
								<option value="2">后备人才</option>
							</c:if>
						</select>
					人员状态:
						<select name="type" style="width:200px;">
							<c:if test="${type==1 }">
								<option value="1">未上报</option>
								<option value="2">已上报</option>
								<option value="0">全部</option>
							</c:if>
							<c:if test="${type==2 }">
								<option value="2">已上报</option>
								<option value="1">未上报</option>
								<option value="0">全部</option>
							</c:if>
							<c:if test="${type==0}">
								<option value="0">全部</option>
								<option value="1">未上报</option>
								<option value="2">已上报</option>
							</c:if>
						</select>
					选择部门:
						<input id="citySel1${menusss}" type="text" readonly="readonly" value="" style="width:200px;" onclick="showMenu();"/>
						<input id="deptsids1${menusss}" name="deptids" type="hidden" style="width:320px;"/>
						&nbsp;&nbsp;<font color="red">*</font>不选默认为所管辖范围内的所有部门
					</td>
				<td>
				<div class="subBar">
					<ul>
						<li><div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">检索</button>
								</div>
							</div></li>
					</ul>
				</div>
				</td>
			</tr>
		</table>
<div id="menuContent1${menusss}" class="menuContent1" style="display:none; position:fixed; z-index:999; background-color: #fff; border:1px solid #000;overflow: auto; height: 330px;">
	<ul id="treeDemo1${menusss}" class="ztree" style="margin-top:0; width:200px; height: 300px;overflow: auto;"></ul>
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
			var zTree = $.fn.zTree.getZTreeObj("treeDemo1${menusss}");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}
		
		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo1${menusss}"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			x="";
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
				x += nodes[i].id + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			if (x.length > 0 ) x = x.substring(0, x.length-1);
			var cityObj = $("#citySel1${menusss}");
			cityObj.attr("value", v);
			var cityObj1 = $("#deptsids1${menusss}");
			cityObj1.attr("value", x);
		}

		function showMenu() {
			var cityObj = $("#citySel1${menusss}");
			var cityOffset = $("#citySel1${menusss}").offset();
			$("#menuContent1${menusss}").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent1${menusss}").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "citySel1${menusss}" || event.target.id == "menuContent1${menusss}" || $(event.target).parents("#menuContent1${menusss}").length>0)) {
				hideMenu();
			}
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo1${menusss}"), setting, zNodes);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo1${menusss}"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			x="";
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
				x += nodes[i].id + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			if (x.length > 0 ) x = x.substring(0, x.length-1);
			var cityObj = $("#citySel1${menusss}");
			cityObj.attr("value", v);
			var cityObj1 = $("#deptsids1${menusss}");
			cityObj1.attr("value", x);
		});
	</SCRIPT>
</body>
</html>