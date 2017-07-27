<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	String deptjson=request.getAttribute("deptjson").toString();
%>
<SCRIPT type="text/javascript">
	var setting = {	
			edit: {
				enable: true,
				showRemoveBtn: false,
				showRenameBtn: false
			},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onClick: onClick,
			beforeDrag: beforeDrag,
			beforeDrop: beforeDrop
		},
		view: {
			selectedMulti: false
		}
	};
	var zNodes =<%=deptjson %>;
	function onClick(event, treeId, treeNode, clickFlag) {
			var $rel = $("#jbsxBox");
				$rel.loadUrl(treeNode.url, {}, function(){
					$rel.find("[layoutH]").layoutH();
				});
			event.preventDefault();
	}

	function beforeDrag(treeId, treeNodes) {
		for (var i=0,l=treeNodes.length; i<l; i++) {
			if (treeNodes[i].drag === false) {
				return false;
			}
		}
		return true;
	}
	
	function beforeDrop(treeId, treeNodes, targetNode, moveType) {
		$('#aa').val(treeNodes[0].id);
		$('#bb').val(targetNode.id);
		alertMsg.confirm("是否将["+treeNodes[0].name+"]移动至["+targetNode.name+"]节点下面？",{okCall:movedept,cancelCall:cancelmove})
	}
	
	var movedept = function(){
		$.post("Sym_moveDept", {
			"d" :$('#aa').val(),"pid":$('#bb').val()
			}, function(data) {
				if(data==1){
					alertMsg.correct("修改成功！");
				}else
					alertMsg.error("修改失败！");
			});
	}
	
	var cancelmove=function(){
		navTab.reload();
	}
	
	$(document).ready(function(){
		$.fn.zTree.init($("#ztreedemodept111"), setting, zNodes);
	});
</SCRIPT>
</head>
<body>
<input type="hidden" id="aa" value="">
<input type="hidden" id="bb" value="">
<div class="pageContent">
	<div class="tabs">
		<div class="tabsContent">
			<div>
				<div layoutH="25" style="float:left; display:block; overflow:auto; width:240px; border:solid 1px #CCC; line-height:21px; background:#fff">
					<ul id="ztreedemodept111" class="ztree"></ul>
				</div>
				<div id="jbsxBox" class="unitBox" style="margin-left:246px;overflow: auto;">
					<!--#include virtual="list1.html" -->
				</div>
			</div>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
</div>
<%
	String deptid=request.getAttribute("deptid").toString();
%>
<script type="text/javascript">
var $rel = $("#jbsxBox");
$rel.loadUrl('Sym_seedept?d=<%=deptid%>', {}, function(){
	$rel.find("[layoutH]").layoutH();
});
</script>
</body>
</html>