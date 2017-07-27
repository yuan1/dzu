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
<style type="text/css">
th {
	width: 85px;
	line-height: 20px;
	word-break : break-all;
}

input[type="text"] {
	width: 80px;
}

</style>
</head>
<body>
	<div class="pageHeader">
		<form onsubmit="return navTabSearch(this);" action="Person_personList?o=${o }"
			method="post">
			<div class="searchBar">
				<table class="searchContent" style="min-width: 800px;width: 100%">
					<tr>
						<th>姓名：</th>
						<td><input type="text" name="search[0]" value="${search[0] }"/></td>
						<th>性别：</th>
						<td><select name=search[1]>
								<option selected="selected" value="${search[1] }">${search[1] }</option>
								<option value="男">男</option>
								<option value="女">女</option>
						</select></td>
						<th>民族：</th>
						<td><select name=search[2]>
								<option selected="selected" value="${search[2] }">${search[2] }</option>
								<option value="汉族">汉族</option>
								<option value="蒙古族">蒙古族</option>
								<option value="彝族">彝族</option>
								<option value="侗族">侗族</option>
								<option value="哈萨克族">哈萨克族</option>
								<option value="畲族">畲族</option>
								<option value="纳西族">纳西族</option>
								<option value="仫佬族">仫佬族</option>
								<option value="仡佬族">仡佬族</option>
								<option value="怒族">怒族</option>
								<option value="保安族">保安族</option>
								<option value="鄂伦春族">鄂伦春族</option>
								<option value="回族">回族</option>
								<option value="壮族">壮族</option>
								<option value="瑶族">瑶族</option>
								<option value="傣族">傣族</option>
								<option value="高山族">高山族</option>
								<option value="景颇族">景颇族</option>
								<option value="羌族">羌族</option>
								<option value="锡伯族">锡伯族</option>
								<option value="乌孜别克族">乌孜别克族</option>
								<option value="裕固族">裕固族</option>
								<option value="赫哲族">赫哲族</option>
								<option value="藏族">藏族</option>
								<option value="布依族">布依族</option>
								<option value="白族">白族</option>
								<option value="黎族">黎族</option>
								<option value="拉祜族">拉祜族</option>
								<option value="柯尔克孜族">柯尔克孜族</option>
								<option value="布朗族">布朗族</option>
								<option value="阿昌族">阿昌族</option>
								<option value="俄罗斯族">俄罗斯族</option>
								<option value="京族">京族</option>
								<option value="门巴族">门巴族</option>
								<option value="维吾尔族">维吾尔族</option>
								<option value="朝鲜族">朝鲜族</option>
								<option value="土家族">土家族</option>
								<option value="傈僳族">傈僳族</option>
								<option value="水族">水族</option>
								<option value="土族">土族</option>
								<option value="撒拉族">撒拉族</option>
								<option value="普米族">普米族</option>
								<option value="鄂温克族">鄂温克族</option>
								<option value="塔塔尔族">塔塔尔族</option>
								<option value="珞巴族">珞巴族</option>
								<option value="苗族">苗族</option>
								<option value="满族">满族</option>
								<option value="哈尼族">哈尼族</option>
								<option value="佤族">佤族</option>
								<option value="东乡族">东乡族</option>
								<option value="达斡尔族">达斡尔族</option>
								<option value="毛南族">毛南族</option>
								<option value="塔吉克族">塔吉克族</option>
								<option value="德昂族">德昂族</option>
								<option value="独龙族">独龙族</option>
								<option value="基诺族">基诺族</option>
						</select></td>
						<th>出生年月：</th>
						<td><input name="search[3]" size="10" readonly="readonly" value="${search[3] }"
							onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="textInput"
							type="text">-<input name="search[4]" size="10" value="${search[4] }"
							readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM'})"
							class="textInput" type="text"></td>
						<th>身份证号码：</th>
						<td><input type="text" name="search[5]" value="${search[5] }" />
						<input type="hidden" name="search[6]" value="${search[6] }">
						<input type="hidden" name="search[7]" value="${search[7] }">
						<input type="hidden" name="search[8]" value="${search[8] }">
						<input type="hidden" name="search[9]" value="${search[9] }">
						<input type="hidden" name="search[10]" value="${search[10] }">
						</td>

					</tr>
				</table>
				<div class="subBar">
					<ul>
						<li><div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">检索</button>
								</div>
							</div></li>
						<li><a class="button" href="Person_searchList?o=${o }"
							target="dialog" mask="true" title="查询框" ><span>高级检索</span></a></li>
						<li>
						<c:if test="${o=='e' }">
						<a class="button" href="Person_personList?o=e" target="navTab"
								rel="Person_personList?o=e" title="信息编辑" >
								<span>重置</span></a>
								</c:if>
								<c:if test="${o=='z' }">
						<a class="button" href="Person_personList?o=z" target="navTab"
								rel="Person_personList?o=z" title="综合查询" >
								<span>重置</span></a>
								</c:if>
								</li>
					</ul>
				</div>
			</div>
		</form>
	</div>
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<c:if test="${fn:contains(menusids,',258,')}">
					<li><a class="search" href="Person_showPerson?pid={pid}"
						target="navTab"><span>查看</span></a></li>
				</c:if>
				<c:if test="${o=='e' }">
					<c:if test="${fn:contains(menusids,',259,')}">
						<li><a class="edit" href="Person_updatePerson?pid={pid}"
							target="navTab"><span> 修改</span></a></li>
					</c:if>
					<c:if test="${fn:contains(menusids,',260,')}">
						<li><a class="delete" href="Person_delPerson?pid={pid}"
							target="ajaxTodo" title="确认删除?"><span>删除</span></a></li>
					</c:if>
				</c:if>
			</ul>
		</div>
		<table class="table" width="98%" layoutH="140">
			<thead>
				<tr>
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
				<c:forEach items="${personList}" var="plist" varStatus="m">
					<tr target="pid" rel="${plist.id}">
						<td>${m.index+1}</td>
						<td>${plist.dept.dept_name }</td>
						<td>${plist.xm }</td>
						<td>${plist.xb}</td>
						<td>${plist.mz }</td>
						<td>${plist.csny}</td>
						<td>${plist.sfzhm}</td>
						<td>${plist.jg}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<form id="pagerForm" action="Person_personList?o=${o }" method="post">
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<!--【必须】value=1可以写死-->
		<input type="hidden" name="numPerPage" value="${numPerPage}" />
		<!--【可选】每页显示多少条-->
		<!--【可选】其它查询条件，业务有关，有什么查询条件就加什么参数。  也可以在searchForm上设置属性rel=”pagerForm”，js框架会自动把searchForm搜索条件复制到 pagerForm中 -->
	</form>
	<div class="panelBar">
		<div class="pages">
			<span>每页显示</span> <select class="combox" name="numPerPage"
				onchange="navTabPageBreak({numPerPage:this.value})">
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
		<div class="pagination" targetType="navTab" totalCount="${counts}"
			numPerPage="${numPerPage }" pageNumShown="1"
			currentPage="${pageNum }"></div>
	</div>
	</div>
	<%@include file="../common/js.jsp"%>
</body>
</html>