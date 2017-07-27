<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
	function dcsbSubClick() {
		document.getElementById('dcsbSub').click();
	}
</script>
</head>
<body>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="PersonSB_personlist1?type=${type }" method="post" id="ftijao">
	<div class="searchBar">
		<%@include file="form.jsp" %>
	</div>
	</form>
</div>
		<form action="PersonSB_export" method="post" id="saas" target="_blank">
		<div class="panelBar">
			<ul class="toolBar">
					<li><a class="search" href="Person_showPerson?pid={pid}"
						target="navTab"><span>查看</span></a></li>
					<li>
					<c:if test="${fn:contains(menusids,',188,')}">
					<a class="icon" onclick="dcsbSubClick();"><span>导出</span></a>
					<div style="display:none;">
					<input  class="search" id="dcsbSub"type="submit" value="导出">
					</div>
					</c:if>
					</li>
					<li></li>
			</ul>
		</div>
		<input type="hidden" name="dw" value="${dw }">
		<input type="hidden" name="year" value="${year }">
		<input type="hidden" name="type" value="${type }">
		<table class="table" width="98%" layoutH="115">
			<thead>
				<tr>
					<th width="5%"><input type="checkbox" class="checkboxCtrl" group="pids"/></th>
					<th width="5%">序号</th>
					<th width="15%">部门</th>
					<th width="10%">姓名</th>
					<th width="5%">性别</th>
					<th width="15%">民族</th>
					<th width="15%">出生年月</th>
					<th width="15%">身份证号码</th>
					<th width="20%">籍贯</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${personlist}" var="plist" varStatus="m">
					<tr target="pid" rel="${plist.id}">
						<td><input type="checkbox" name="pids" value="${plist.id}" /></td>
						<td>${m.index+1}</td>
						<td>${plist.dept.dept_name }</td>
						<td>${plist.xm }</td>
						<td>${plist.xb}</td>
						<td>${plist.mz}</td>
						<td>${plist.csny}</td>
						<td>${plist.sfzhm}</td>
						<td>${plist.jg}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</form>
<form id="pagerForm" action="PersonSB_personlist1" method="post">  
<input type="hidden" name="pageNum" value="${pageNum}" /><!--【必须】value=1可以写死-->  
<input type="hidden" name="numPerPage" value="${numPerPage}" /><!--【可选】每页显示多少条-->
 <input type="hidden" name="dw" value="${dw}" />
 <input type="hidden" name="year" value="${year}" />
 <input type="hidden" name="type" value="${type}" />
 <input type="hidden" name="deptids" value="${deptids}" />
<!--【可选】其它查询条件，业务有关，有什么查询条件就加什么参数。  也可以在searchForm上设置属性rel=”pagerForm”，js框架会自动把searchForm搜索条件复制到 pagerForm中 --> 
</form> 
<div class="panelBar"> 
	<div class="pages">
   <span>每页显示</span>
   <select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
    <option value="20">20</option>
    <option value="10">10</option>
    <option value="30">30</option>
    <option value="500">50</option>
    <option value="100">100</option>
   </select>
   <script>
        $("select[name='numPerPage']").val('${numPerPage}');
    </script>
   <span>条，共${counts}条</span>
  </div>
<!-- totalCount: 总条数     numPerPage: 每页显示多少条   pageNumShown: 页标数字多少个    currentPage: 当前是第几页 -->
    <div class="pagination" targetType="navTab" totalCount="${counts}" numPerPage="${numPerPage }" pageNumShown="1" currentPage="${pageNum }"></div>
</div>
<script type="text/javascript">
	function fsub() {
		document.getElementById('saas').submit();
	}
</script>
</body>
</html>