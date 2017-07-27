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
<div class="pageFormContent" layoutH="10">
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="Sym_PersonNum1" method="post" id="ftijao">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					选择设置年份:<select name="time" style="width:200px;">
							<option value="${time }">${time }</option>
							<c:forEach items="${allyear }" var="a">
								<option value="${a }">${a}</option>
							</c:forEach>
						</select>
					<input type="hidden" name="pageNum" value="1" /><!--【必须】value=1可以写死-->  
					<input type="hidden" name="numPerPage" value="${numPerPage}" /><!--【可选】每页显示多少条-->
					<button type="submit">查询</button>
					<font color="red">重要提示：以下文本框只允许填写数字。只允许设置当年数据，往年不能修改。</font>
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>
<form method="post" action="Sym_SetPersonNum"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,navTabAjaxDone)">
<input type="hidden" name="time" value="${time }">
<table class="stable" cellpadding="0" cellspacing="1">
	<tr>
		<th width="10%">序号</th>
		<th width="30%">部门</th>
		<th width="30%">代表数量</th>
		<th width="30%">后备代表数量</th>
	</tr>
	<c:forEach items="${deptlist }" var="d" varStatus="m">
		<tr>
			<td>${m.index+1 }</td>
			<td>${d.dept_name }</td>
			<td>
				<c:set var="a" value="0"/>
				<c:forEach items="${d.personnum}" var="n">
					<c:set var="a" value="1"/>
					<c:if test="${n.year==time }">
						<c:if test="${input==1}">
							<input class="required number" type="text" value="${n.num}" name="personnum[${m.index }].num">
							<input type="hidden" value="${d.id}" name="personnum[${m.index }].dept.id">
						</c:if>
						<c:if test="${input==0}">
							${n.num}
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${a==0 }">
					<c:if test="${input==1}">
							<input class="required number" type="text" value="" name="personnum[${m.index }].num">
							<input type="hidden" value="${d.id}" name="personnum[${m.index }].dept.id">
						</c:if>
				</c:if>
			</td>
			<td>
				<c:set var="a" value="0"/>
				<c:forEach items="${d.personnum}" var="n">
				<c:set var="a" value="1"/>
				<c:if test="${n.year==time }">
						<c:if test="${input==1}">
							<input class="required number" type="text" value="${n.num2}" name="personnum[${m.index }].num2">
						</c:if>
						<c:if test="${input==0}">
							${n.num2}
						</c:if>
						</c:if>
				</c:forEach>
				<c:if test="${a==0 }">
					<c:if test="${input==1}">
							<input class="required number" type="text" value="${n.num}" name="personnum[${m.index }].num2">
						</c:if>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div></li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
		</form>
</div>
<%@include file="../../common/js.jsp"%>
</body>
</html>