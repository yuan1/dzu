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
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="Sym_proList" method="post" id="ftijao">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					类别:<select name="proname" style="width:200px;">
							<option value="${proname }">${proname }</option>
							<c:forEach items="${names }" var="a">
								<c:if test="${a!=proname }">
									<option value="${a }">${a}</option>
								</c:if>
							</c:forEach>
						</select>
					<input type="hidden" name="pageNum" value="1" /><!--【必须】value=1可以写死-->  
					<input type="hidden" name="numPerPage" value="${numPerPage}" /><!--【可选】每页显示多少条-->
					<button type="submit">查询</button>
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="search" href="Sym_uPro?pro_id={nid}&o=s" target="navTab"><span>查看</span></a></li>
		<c:if test="${fn:contains(menusids,',193,')}">
			<li><a class="add" href="Sym_AddPro" target="navTab"><span>添加</span></a></li>
		</c:if>
		<c:if test="${fn:contains(menusids,',194,')}">
			<li><a class="edit" href="Sym_uPro?pro_id={nid}&o=u" target="navTab"><span> 修改</span></a></li>
		</c:if>
		<c:if test="${fn:contains(menusids,',195,')}">
			<li><a class="delete" href="Sym_DeleteProDo?pro_id={nid}" target="ajaxTodo" title="确认删除?"><span>删除</span></a></li>
		</c:if>
		</ul>
	</div>
<table class="table" width="98%" layoutH="115">  
<thead>
   <tr>
   	   <th>序号</th>
       <th>类别</th>
       <th>内容</th>
   </tr>
</thead>
<tbody>
	<c:forEach items="${prolist}" var="nlist" varStatus="m">
		<tr target="nid" rel="${nlist.id}">
			<td>${m.index+1}</td>
			<td>${nlist.p_name }</td>
			<td>${nlist.content}</td>
		</tr>
	</c:forEach>
</tbody>
</table>
<form id="pagerForm" action="Sym_proList" method="post">  
<input type="hidden" name="pageNum" value="${pageNum}" /><!--【必须】value=1可以写死-->  
<input type="hidden" name="numPerPage" value="${numPerPage}" /><!--【可选】每页显示多少条-->
<input type="hidden" name="proname" value="${proname}" />    
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
<%@include file="../../common/js.jsp" %>
</body>
</html>