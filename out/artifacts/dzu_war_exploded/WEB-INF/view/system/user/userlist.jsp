<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="resources/js/datepicker/WdatePicker.js" defer="defer"></script>
</head>
<body>
<div class="pageFormContent">
<div class="panelBar">
		<ul class="toolBar">
			<li><span>当前部门:<font color="red">${deptname }</font>&nbsp;&nbsp;&nbsp;</span></li>
		</ul>
		<ul class="toolBar">
		<c:if test="${fn:contains(menusids,',154,')}">
			<li><a class="search" href="Sym_updateUser?user_id={nid}&o=s" target="navTab"><span>查看详情</span></a></li>
		</c:if>
		<c:if test="${fn:contains(menusids,',178,')}">
			<li><a class="add" href="Sym_addUser?d=${d }" target="navTab"><span>添加用户</span></a></li>
		</c:if>
		<c:if test="${fn:contains(menusids,',179,')}">
			<li><a class="edit" href="Sym_updateUser?user_id={nid}&o=u" target="navTab"><span> 修改用户</span></a></li>
		</c:if>
		<c:if test="${fn:contains(menusids,',180,')}">
			<li><a class="delete" href="Sym_delUsers?user_id={nid}" target="ajaxTodo" title="确认删除?"><span>删除用户</span></a></li>
		</c:if>
		</ul>
	</div>
<table class="table" width="98%" layoutH="80">  
<thead>
   <tr>
   	   <th>序号</th>
       <th>用户名</th>
       <th>姓名</th>
       <th>性别</th>
       <th>身份证号</th>   
       <th>身份</th>   
       <th>状态</th>   
   </tr>
</thead>
<tbody>
	<c:forEach items="${userlist}" var="nlist" varStatus="m">
		<tr target="nid" rel="${nlist.id}">
			<td>${m.index+1}</td>
			<td>${nlist.username }</td>
			<td>${nlist.realname}</td>
			<td>${nlist.sex}</td>
			<td>${nlist.id_card}</td>
			<td>${nlist.role.name}</td>
			<td>
				<c:if test="${nlist.del==0 }">
					禁止
				</c:if>
				<c:if test="${nlist.del==1 }">
					正常
				</c:if>
			</td>
		</tr>
	</c:forEach>
</tbody>
</table>
</div> 
<form id="pagerForm" action="Sym_user" method="post">  
<input type="hidden" name="pageNum" value="${pageNum}" /><!--【必须】value=1可以写死-->  
<input type="hidden" name="numPerPage" value="${numPerPage}" /><!--【可选】每页显示多少条-->   
<input type="hidden" name="d" value="${d}" /> 
<!--【可选】其它查询条件，业务有关，有什么查询条件就加什么参数。  也可以在searchForm上设置属性rel=”pagerForm”，js框架会自动把searchForm搜索条件复制到 pagerForm中 --> 
</form> 
<div class="panelBar"> 
	<div class="pages">
   <span>每页显示</span>
   <select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
   <option value="10">10</option>
    <option value="20">20</option>
     <option value="30">30</option>
    <option value="50">50</option>
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