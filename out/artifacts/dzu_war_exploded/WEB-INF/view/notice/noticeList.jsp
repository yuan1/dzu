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
<div layoutH="30"> 
<div class="panelBar">
		<ul class="toolBar">
		<c:if test="${fn:contains(menusids,',151,')}">
			<li><a class="search" href="Notice_showNotice?nt_id={nid}" target="navTab"><span>查看</span></a></li>
		</c:if>
		<c:if test="${fn:contains(menusids,',152,')}">
			<li><a class="edit" href="Notice_updateNoticeShow?nt_id={nid}" target="navTab"><span> 修改</span></a></li>
		</c:if>
		<c:if test="${fn:contains(menusids,',153,')}">
			<li><a class="delete" href="Notice_deleteNotice?nt_id={nid}" target="ajaxTodo" title="确认删除?"><span>删除</span></a></li>
		</c:if>
		</ul>
	</div>
<table class="table" width="98%">  
<thead>
   <tr>
   	   <th width="5%">序号</th>
       <th>标题</th>
       <th width="10%">发布时间</th>   
   </tr>
</thead>
<tbody>
	<c:forEach items="${noticeList}" var="nlist" varStatus="m">
		<tr target="nid" rel="${nlist.id}">
			<td>${m.index+1}</td>
			<td>${nlist.title }</td>
			<td>${nlist.date}</td>
		</tr>
	</c:forEach>
</tbody>
</table>
</div> 
<form id="pagerForm" action="Notice_noticeList" method="post">  
<input type="hidden" name="pageNum" value="${pageNum}" /><!--【必须】value=1可以写死-->  
<input type="hidden" name="numPerPage" value="${numPerPage}" /><!--【可选】每页显示多少条-->    
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
<%@include file="../common/js.jsp" %>
</body>
</html>