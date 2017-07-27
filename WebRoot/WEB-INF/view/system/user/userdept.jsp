<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	String deptjson=request.getAttribute("deptjson1").toString();
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
		},
		view: {
			selectedMulti: false
		}
	};
	var zNodes =<%=deptjson %>;
	function onClick(event, treeId, treeNode, clickFlag) {
			var $rel = $("#jbsxBox1");
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
	
	$(document).ready(function(){
		$.fn.zTree.init($("#ztreedemouser333"), setting, zNodes);
	});
</SCRIPT>
</head>
<body>
<a href="" target="navTab" rel="" title="用户管理" id="aa"></a>
<div class="pageContent">
	<div class="tabs">
		<div class="tabsContent">
			<div>
				<div layoutH="25" style="float:left; display:block; overflow:auto; width:240px; border:solid 1px #CCC; line-height:21px; background:#fff">
					<ul id="ztreedemouser333" class="ztree"></ul>
				</div>
				<div id="jbsxBox1" class="unitBox" style="margin-left:246px;">
				</div>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
</div>
</div>
<%
	String deptid=request.getAttribute("deptid1").toString();
	String pageindex=request.getAttribute("pageNum").toString();
	String pagenum=request.getAttribute("numPerPage").toString();
%>
<script type="text/javascript">
var $rel = $("#jbsxBox1");
$rel.loadUrl("Sym_userlist?d=<%=deptid%>&pageNum=<%=pageindex%>&numPerPage=<%=pagenum%>", {}, function(){
		$rel.find("[layoutH]").layoutH();
	});
</script>
</body>
</html>