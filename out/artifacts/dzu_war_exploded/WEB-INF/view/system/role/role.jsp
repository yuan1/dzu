<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	String deptjson=request.getAttribute("deptjson2").toString();
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
			var $rel = $("#jbsxBox2");
				$rel.loadUrl(treeNode.url, {}, function(){
					$rel.find("[layoutH]").layoutH();
				});
			event.preventDefault();
	}
	
	var cancelmove=function(){
		navTab.reload();
	}
	
	$(document).ready(function(){
		$.fn.zTree.init($("#ztreedemorole222"), setting, zNodes);
	});
</SCRIPT>
</head>
<body>
<div class="pageContent">
	<div class="tabs">
		<div class="tabsContent">
			<div>
				<div layoutH="25" style="float:left; display:block; overflow:auto; width:240px; border:solid 1px #CCC; line-height:21px; background:#fff">
					<ul id="ztreedemorole222" class="ztree"></ul>
				</div>
				<div id="jbsxBox2" class="unitBox" style="margin-left:246px;">
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
	String deptid=request.getAttribute("roleid").toString();
%>
<script type="text/javascript">
var $rel = $("#jbsxBox2");
$rel.loadUrl('Sym_seerole?d=<%=deptid%>', {}, function(){
	$rel.find("[layoutH]").layoutH();
});
</script>
</body>
</html>