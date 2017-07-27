<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="pageContent">
		<form method="post" action="Person_personList?o=${o }" class="pageForm"
			onsubmit="return navTabSearch(this);">
			<div class="pageFormContent" layoutH="58">
				<div class="divider">divider</div>
				<div class="unit">
					<label>姓名：</label> <input type="text" size="25" name="search[0]"
						value="${search[0]}" /> <span class="inputInfo">全称</span>
				</div>
				<div class="unit">
					<label>性别：</label> <select name=search[1]>
						<option value="${search[1] }">${search[1] }</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select> <span class="inputInfo"></span>
				</div>
				<div class="unit">
					<label>民族：</label> <select name=search[2]>
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
					</select> <span class="inputInfo"></span>
				</div>
				<div class="unit">
					<label>出生年月：</label> <input name="search[3]" size="9" value="${search[3]}"
						readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM'})"
						class="alphanumeric" type="text">-<input name="search[4]" value="${search[4]}"
						size="8" readonly="readonly"
						onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="alphanumeric"
						type="text"> <span class="inputInfo">区间</span>
				</div>
				<div class="unit">
					<label>身份证号码：</label> <input type="text" size="25" name="search[5]" value="${search[5]}" />
					<span class="inputInfo">完整的号码</span>
				</div>
				<div class="unit">
					<label>人员类别：</label> <select style="width: 155px" name="search[6]">
						<option value="${search[6]}" selected="selected">${search[6]}</option>
						<option value="民主党派">民主党派</option>
						<option value="无党派">无党派</option>
						<option value="少数民族">少数民族</option>
						<option value="宗教">宗教</option>
						<option value="非公有制经济">非公有制经济</option>
						<option value="港澳同胞">港澳同胞</option>
						<option value="新的社会阶层">新的社会阶层</option>
						<option value="党外知识分子">党外知识分子</option>
						<option value="出国和归国留学">出国和归国留学</option>
						<option value="台湾同胞及其在大陆的亲属">台湾同胞及其在大陆的亲属</option>
						<option value="华侨、归侨及侨眷">华侨、归侨及侨眷</option>
						<option value="其他需要联系和团结的人员">其他需要联系和团结的人员</option>
					</select> <span class="inputInfo"></span>
				</div>
				<div class="unit">
					<label>列入队伍：</label> <select style="width: 155px" name="search[7]">
						<option value="${search[7]}" selected="selected">${search[7]}</option>
						<option value="1">代表人士</option>
						<option value="2">后备人才</option>
					</select> <span class="inputInfo"></span>
				</div>
				<div class="unit">
					<label>党外干部：</label> <select style="width: 155px" name="search[8]">
						<option value="${search[8]}" selected="selected">${search[8]}</option>
						<c:forEach items="${prolist }" var="pro">
							<c:if test="${pro.p_name=='现任级别' }">
								<option value="${pro.id }">${pro.content }</option>
							</c:if>
						</c:forEach>
					</select> <span class="inputInfo"></span>
				</div>
				<div class="unit">
					<label>党外人大代表：</label> <select style="width: 155px"
						name="search[9]">
						<option value="${search[9]}" selected="selected">${search[9]}</option>
						<c:forEach items="${prolist }" var="pro">
							<c:if test="${pro.p_name=='组织级别' }">
								<option value="${pro.id }">${pro.content }</option>
							</c:if>
						</c:forEach>
					</select> <span class="inputInfo"></span>
				</div>
				<div class="unit">
					<label>党外政协委员：</label> <select style="width: 155px"
						name="search[10]">
						<option value="${search[10]}" selected="selected">${search[10]}</option>
						<c:forEach items="${prolist }" var="pro">
							<c:if test="${pro.p_name=='组织级别' }">
								<option value="${pro.id }">${pro.content }</option>
							</c:if>
						</c:forEach>
					</select> <span class="inputInfo"></span>
				</div>
				<div class="divider">divider</div>
			</div>
			<div class="formBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">开始检索</button>
							</div>
						</div></li>
					<li><div class="button">
							<div class="buttonContent">
								<button type="reset">清空重输</button>
							</div>
						</div></li>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>