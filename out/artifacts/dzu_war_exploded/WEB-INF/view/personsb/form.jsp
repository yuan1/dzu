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
					列入队伍:
						<select name="dw" style="width:200px;">
							<c:if test="${dw==1 }">
								<option value="1">代表人士</option>
								<option value="2">后备人才</option>
							</c:if>
							<c:if test="${dw==2 }">
								<option value="2">后备人才</option>
								<option value="1">代表人士</option>
							</c:if>
						</select>
					选择部门:
						<input id="citySel1${rurl}" type="text" readonly="readonly" value="" style="width:200px;" onclick="showMenu();"/>
						<input id="deptsids1${rurl}" name="deptids" type="hidden" style="width:320px;"/>
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
					<input type="hidden" name="pageNum" value="1" /><!--【必须】value=1可以写死-->  
					<input type="hidden" name="numPerPage" value="${numPerPage}" /><!--【可选】每页显示多少条-->    
				</td>
			</tr>
		</table>
<div id="menuContent1${rurl}" class="menuContent1" style="display:none; position:fixed; z-index:999; background-color: #fff; border:1px solid #000;overflow: auto; height: 330px;">
	<ul id="treeDemo1${rurl}" class="ztree" style="margin-top:0; width:200px; height: 300px;overflow: auto;"></ul>
</div>
	<SCRIPT type="text/javascript">
		var setting = {
			check: {
				enable: true,
				chkboxType: { "Y" : "", "N" : "" }
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
			var zTree = $.fn.zTree.getZTreeObj("treeDemo1${rurl}");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}
		
		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo1${rurl}"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			x="";
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
				x += nodes[i].id + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			if (x.length > 0 ) x = x.substring(0, x.length-1);
			var cityObj = $("#citySel1${rurl}");
			cityObj.attr("value", v);
			var cityObj1 = $("#deptsids1${rurl}");
			cityObj1.attr("value", x);
		}

		function showMenu() {
			var cityObj = $("#citySel1${rurl}");
			var cityOffset = $("#citySel1${rurl}").offset();
			$("#menuContent1${rurl}").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent1${rurl}").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "citySel1${rurl}" || event.target.id == "menuContent1${rurl}" || $(event.target).parents("#menuContent1${rurl}").length>0)) {
				hideMenu();
			}
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo1${rurl}"), setting, zNodes);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo1${rurl}"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			x="";
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
				x += nodes[i].id + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			if (x.length > 0 ) x = x.substring(0, x.length-1);
			var cityObj = $("#citySel1${rurl}");
			cityObj.attr("value", v);
			var cityObj1 = $("#deptsids1${rurl}");
			cityObj1.attr("value", x);
		});
	</SCRIPT>
</body>
</html>