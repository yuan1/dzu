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
	<form onsubmit="return navTabSearch(this);" action="" method="post" id="ftijao">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					选择年份:<select name="year" style="width:200px;">
							<option value="${year }">${year }</option>
							<c:forEach items="${allyear }" var="a">
								<option value="${a }">${a}</option>
							</c:forEach>
						</select>
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
	</div>
	</form>
</div>
<input type="hidden" name="time" value="${time }">
<table class="stable" cellpadding="0" cellspacing="1">
	<tr>
		<th width="5%" rowspan="2">序号</th>
		<th width="10%" rowspan="2">部门</th>
		<th width="30%" colspan="3">代表人士</th>
		<th width="30%" colspan="3">后备人才</th>
	</tr>
	<tr>
		<th width="10%">应报数量</th>
		<th width="10%">已报数量</th>
		<th width="10%">剩余数量</th>
		<th width="10%">应报数量</th>
		<th width="10%">已报数量</th>
		<th width="10%">剩余数量</th>
	</tr>
	<c:forEach items="${deptlist }" var="d" varStatus="m">
		<tr>
			<td>${m.index+1 }</td>
			<td>${d.dept_name }</td>
			<td>
				<c:set var="s1" value="0"/>
				<c:set var="a" value="0"/>
				<c:forEach items="${d.personnum}" var="n">
					<c:if test="${n.year==year }">
						${n.num}<c:set var="a" value="1"/>
						<c:set var="s1" value="${n.num }"/>
					</c:if>
				</c:forEach>
				<c:if test="${a==0 }">0</c:if>
			</td>
			<td>
				<c:forEach items="${da }" var="nn">
					<c:if test="${nn[0]==d.id }">
						<c:if test="${nn[2]==1 }">
							${nn[1] }
							<c:set var="s1" value="${s1-nn[1]}"></c:set>
						</c:if>
					</c:if>
				</c:forEach>
			</td>
			<td>${s1 }</td>
			<td>
				<c:set var="b" value="0"/>
				<c:set var="s2" value="0"/>
				<c:forEach items="${d.personnum}" var="n">
				<c:if test="${n.year==year }">
					${n.num2}<c:set var="b" value="1"/>
					<c:set var="s2" value="${n.num }"/>
				</c:if>
				</c:forEach>
				<c:if test="${b==0 }">0</c:if>
			</td>
			<td>
				<c:forEach items="${da }" var="nn">
					<c:if test="${nn[0]==d.id }">
						<c:if test="${nn[2]==2 }">
							${nn[1] }
							<c:set var="s2" value="${s2-nn[1]}"></c:set>
						</c:if>
					</c:if>
				</c:forEach>
			</td>
			<td>${s2}</td>
		</tr>
	</c:forEach>
</table>
</div>
</body>
</html>