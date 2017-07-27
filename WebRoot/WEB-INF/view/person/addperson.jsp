<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
	function uploadifySuccess(file,data,response){
		$("#url3").attr("value",data);//填充内容 
		$("#image1").attr("src",'/uploads/'+data);//填充内容 
	}
	function Exporthtml() {
		var str=document.getElementById('myTable').outerHTML;
		document.getElementById('htmltext').value=str;
		document.getElementById('exporthtml').submit();
	}
</script>
<style type="text/css">
#myTable td {
	text-align: left;
	min-width: 80px;
}

#myTable th {
	width: 150px;
	min-width: 100px;
	line-height: 20px
}

input[type="text"] {
	width: 150px;
}

select {
	width: 150px;
}
</style>
<div class="pageContent">
	<form method="post" action="Person_addPersonDo"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,navTabAjaxDone)">
		<div class="pageFormContent" layoutH="35">
			<table id="myTable" class="stable" cellpadding="0" cellspacing="1">
				<tbody>
					<tr>
						<td colspan="7" height="20px" style="text-align: center">
							<h2>统一战线代表人士信息采集表</h2>
						</td>
					</tr>
					<TR>
						<td colSpan="7">
							<table cellspacing="1" cellpadding="0" class="stable">
								<TR>
									<TD>
										<table cellspacing="1" cellpadding="0" class="stable">
											<TR>
												<TD>
													<table cellspacing="1" cellpadding="0" class="stable">
														<tr>
															<th>姓名</th>
															<td><input id="xm" name="personMessage.xm"
																<c:if test="${fn:contains(requiredstr,',2,')}">
															 class="required"
															</c:if>
																class="textInput" type="text"></td>
															<th>性别</th>
															<td><select name="personMessage.xb"
																<c:if test="${fn:contains(requiredstr,',3,')}">
															 class="required"
															</c:if>>
																	<option value="男">男</option>
																	<option value="女">女</option>
															</select></td>
															<th>出生年月</th>
															<td><input name="personMessage.csny"
																<c:if test="${fn:contains(requiredstr,',4,')}">
															 class="required"
															</c:if>
																readonly="readonly"
																onClick="WdatePicker({dateFmt:'yyyy-MM'})"
																class="textInput" type="text"></td>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<th>民族</th>
															<td><select name="personMessage.mz"
																<c:if test="${fn:contains(requiredstr,',5,')}">
															 class="required"
															</c:if>>
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
															<th>籍贯</th>
															<td><input name="personMessage.jg"
																<c:if test="${fn:contains(requiredstr,',6,')}">
															 class="required"
															</c:if>
																class="textInput" type="text"></td>
															<th>国籍</th>
															<td><input name="personMessage.gj"
																<c:if test="${fn:contains(requiredstr,',7,')}">
															 class="required"
															</c:if>
																class="textInput" type="text"></td>
															<th>参加工作时间</th>
															<td><input name="personMessage.cjgzsj"
																<c:if test="${fn:contains(requiredstr,',8,')}">
															 class="required"
															</c:if>
																readonly="readonly"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																class="textInput" type="text"></td>
														</tr>
														<tr>
															<th>第一党派及加入时间</th>
															<td colspan="2">党派: <select
																<c:if test="${fn:contains(requiredstr,',9,')}">
															 class="required"
															</c:if>
																name="personMessage.dydp">
																	<option value="" selected="selected"></option>
																	<c:forEach items="${prolist }" var="pro">
																		<c:if test="${pro.p_name=='党派' }">
																			<option value="${pro.id }">${pro.content }</option>
																		</c:if>
																	</c:forEach>
															</select></td>
															<td>时间: <input
																<c:if test="${fn:contains(requiredstr,',10,')}">
															 class="required"
															</c:if>
																name="personMessage.dydpjrsj" readonly="readonly"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																class="textInput" type="text"></td>
															<th colspan="2">第二党派及加入时间</th>
															<td>党派: <select name="personMessage.dedp"
																<c:if test="${fn:contains(requiredstr,',11,')}">
															 class="required"
															</c:if>>
																	<option value="" selected="selected"></option>
																	<c:forEach items="${prolist }" var="pro">
																		<c:if test="${pro.p_name=='党派' }">
																			<option value="${pro.id }">${pro.content }</option>
																		</c:if>
																	</c:forEach>
															</select></td>
															<td>时间: <input
																<c:if test="${fn:contains(requiredstr,',12,')}">
															 class="required"
															</c:if>
																name="personMessage.dedpjrsj" readonly="readonly"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																class="textInput" type="text"></td>
														</tr>
													</table>
												</TD>
											</TR>
										</table>
									</TD>
									<TD width="100px"><img alt="" width="100" height="112"
										id="image1" src=""></TD>
								</TR>
							</table>
						</td>
					</TR>
					<tr>
						<th>上传照片</th>
						<td colspan="2"><input id="uploadify" name="uploadify"
							<c:if test="${fn:contains(requiredstr,',13,')}">
								class="required"
							</c:if>
							uploaderOption="{
						swf:'dwz/uploadify/scripts/uploadify.swf',
						uploader:'Person_uploadImage',
						formData:{PHPSESSID:'xxx', ajax:1},
						buttonText:'点击选择',
						fileSizeLimit:'200KB',
						fileTypeDesc:'*.jpg;*.jpeg;*.gif;*.png;',
						fileTypeExts:'*.jpg;*.jpeg;*.gif;*.png;',
						auto:true,
						multi:false,
						width:60,
						height:20,
						onUploadSuccess:uploadifySuccess,
						onQueueComplete:uploadifyQueueComplete
						}"
							type="file" /> <input name="personMessage.sczp" id="url3"
							type="hidden" value=""></td>
						<th>宗教类别<br>（宗教界人士填写）
						</th>
						<td colspan="3"><select name="personMessage.zjlb"
							<c:if test="${fn:contains(requiredstr,',14,')}">
															 class="required"
															</c:if>>
								<option value="" selected="selected"></option>
								<c:forEach items="${prolist }" var="pro">
									<c:if test="${pro.p_name=='宗教类别' }">
										<option value="${pro.id }">${pro.content }</option>
									</c:if>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th>海外留学经历</th>
						<td colspan="2"><select name="personMessage.hwlxjl"
							<c:if test="${fn:contains(requiredstr,',15,')}">
															 class="required"
															</c:if>>
								<option value="否" selected="selected">否</option>
								<option value="是">是</option>
						</select> 国别：<input id="gb" name="personMessage.hwlxjlgb"
							<c:if test="${fn:contains(requiredstr,',16,')}">
															 class="required"
															</c:if>
							class="textInput" type="text"></td>
						<th>新的社会阶层<br>（新的社会阶层人士填写）
						</th>
						<td colspan="3"><select name="personMessage.shxjc"
							<c:if test="${fn:contains(requiredstr,',17,')}">
															 class="required"
															</c:if>>
								<option value="" selected="selected"></option>
								<c:forEach items="${prolist }" var="pro">
									<c:if test="${pro.p_name=='新的社会阶层' }">
										<option value="${pro.id }">${pro.content }</option>
									</c:if>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th rowspan="2">人员类别 <c:if
								test="${fn:contains(requiredstr,',18,')}">
								<font color="red">*</font>
							</c:if>
						</th>
						<td rowspan="2" colspan="2">
							<table cellpadding="0" cellspacing="1"
								style="font-size: 12px; margin: 0px; padding: 0px;">
								<tr>
									<td nowrap><input value="民主党派" type="checkbox" id="rylb1"
										name="personMessage.rylb" />民主党派 <input value="无党派"
										type="checkbox" id="rylb2" name="personMessage.rylb" />无党派 <input
										value="少数民族" type="checkbox" id="rylb3"
										name="personMessage.rylb" />少数民族 <input value="宗教界"
										type="checkbox" id="rylb4" name="personMessage.rylb" />宗教界 <input
										value="非公有制经济" type="checkbox" id="rylb5"
										name="personMessage.rylb" />非公有制经济</td>
								</tr>
								<tr>
									<td nowrap><input value="港澳同胞" type="checkbox" id="rylb6"
										name="personMessage.rylb" />港澳同胞 <input value="新的社会阶层"
										type="checkbox" id="rylb7" name="personMessage.rylb" />新的社会阶层
										<input value="党外知识分子" type="checkbox" id="rylb8"
										name="personMessage.rylb" />党外知识分子 <input value="出国和归国留学"
										type="checkbox" id="rylb9" name="personMessage.rylb" />出国和归国留学</td>
								</tr>
								<tr>
									<td nowrap><input value="台湾同胞及其在大陆的亲属" type="checkbox"
										id="rylb10" name="personMessage.rylb" />台湾同胞及其在大陆的亲属 <input
										value="华侨、归侨及侨眷" type="checkbox" id="rylb11"
										name="personMessage.rylb" />华侨、归侨及侨眷 <input
										value="其他需要联系和团结的人员" type="checkbox" id="rylb12"
										name="personMessage.rylb" />其他需要联系和团结的人员</td>
								</tr>
							</table>
						</td>
						<th>列入队伍</th>
						<td colspan="3"><select name="personMessage.lrdw"
							<c:if test="${fn:contains(requiredstr,',19,')}">
															 class="required"
															</c:if>>
								<option selected="selected" value="1">代表人士</option>
								<option value="2">后备人才</option>
						</select></td>
					</tr>
					<tr>
						<th>身份证号码</th>
						<td colspan="3"><input name="personMessage.sfzhm" id='idCard'
							<c:if test="${fn:contains(requiredstr,',20,')}">
															 class="required"
															</c:if>
							class="textInput" type="text"></td>
					</tr>
					<tr>
						<th>工作单位及职务</th>
						<td colspan="2"><input name="personMessage.fzdwjzw"
							<c:if test="${fn:contains(requiredstr,',21,')}">
															 class="required"
															</c:if>
							class="textInput" type="text"></td>
						<th>现任级别<br>(机关事业单位人员填写)
						</th>
						<td><select name="personMessage.xrjb"
							<c:if test="${fn:contains(requiredstr,',22,')}">
															 class="required"
															</c:if>>
								<option value="" selected="selected"></option>
								<c:forEach items="${prolist }" var="pro">
									<c:if test="${pro.p_name=='现任级别' }">
										<option value="${pro.id }">${pro.content }</option>
									</c:if>
								</c:forEach>
						</select></td>
						<th>任现职时间</th>
						<td><input name="personMessage.rxzsj" readonly="readonly"
							<c:if test="${fn:contains(requiredstr,',23,')}">
															 class="required"
															</c:if>
							onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="textInput"
							type="text"></td>
					</tr>
					<tr>
						<th>任同级时间</th>
						<td><input name="personMessage.rtjsj" readonly="readonly"
							<c:if test="${fn:contains(requiredstr,',24,')}">
															 class="required"
															</c:if>
							onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="textInput"
							type="text"></td>
						<th>专业技术职称</th>
						<td><input name="personMessage.zyjszc"
							<c:if test="${fn:contains(requiredstr,',25,')}">
															 class="required"
															</c:if>
							class="textInput" type="text"></td>
						<th>职称级别</th>
						<td colspan="2"><select name="personMessage.zcjb"
							<c:if test="${fn:contains(requiredstr,',26,')}">
															 class="required"
															</c:if>>
								<option value="" selected="selected"></option>
								<c:forEach items="${prolist }" var="pro">
									<c:if test="${pro.p_name=='职称级别' }">
										<option value="${pro.id }">${pro.content }</option>
									</c:if>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th>学历信息 <c:if test="${fn:contains(requiredstr,',27,')}">
								<font color="red">*</font>
							</c:if> <br /> <input type="button" value="新增" onClick="addxlxx();" /></th>
						<td colspan="6">
							<table class="stable" id="xlxxtable" cellpadding="0"
								cellspacing="1">
								<tr>

									<th>毕业院校及专业</th>
									<th colspan="2">起止时间</th>
									<th>取得学历</th>
									<th>所获学位</th>
									<th>院校类别</th>
									<th>是否最高学历</th>
									<th style="width: 60px">操作</th>
								</tr>
								<tr>
									<td><input name="xlxx[0].byyxjzy"
										<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="xlxx[0].kssj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><input name="xlxx[0].jssj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><select name="xlxx[0].qdxl"
										<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>>
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='学历' }">
													<option value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select></td>
									<td><select name="xlxx[0].shxw"
										<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>>
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='学位' }">
													<option value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select></td>
									<td><select name="xlxx[0].type"
										<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>>
											<option value="" selected="selected"></option>
											<option value="全日制教育">全日制教育</option>
											<option value="在职教育">在职教育</option>
									</select></td>
									<td><select name="xlxx[0].hight"
										<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>>
											<option value="0" selected="selected">否</option>
											<option value="1">是</option>
									</select></td>
									<td><input type="button" value="删除" onClick="delxlxx();" /></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th>工作简历 <c:if test="${fn:contains(requiredstr,',28,')}">
								<font color="red">*</font>
							</c:if> <br /> <input type="button" value="新增" onClick="addgzjl();" /></th>
						<td colspan="6">
							<table class="stable" cellpadding="0" cellspacing="1"
								id="gzjltable">
								<tr>
									<th colspan="2">起止时间<br>(年月-年月，要前后衔接，不得空断)
									</th>
									<th>工作单位及职务</th>
									<th style="width: 60px">操作</th>
								</tr>
								<tr>
									<td><input name="gzjl[0].kssj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',28,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="textInput"
										type="text"></td>
									<td><input name="gzjl[0].jssj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',28,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="textInput"
										type="text"></td>
									<td><input name="gzjl[0].gzdwjzw"
										<c:if test="${fn:contains(requiredstr,',28,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input type="button" value="删除" onClick="delgzjl();" /></td>
								</tr>

							</table>
						</td>
					</tr>
					<tr>
						<th>目前在各级人大安排情况 <c:if
								test="${fn:contains(requiredstr,',29,')}">
								<font color="red">*</font>
							</c:if> <br /> <input type="button" value="新增"
							onClick="addmqzgjrdapqk();" />
						</th>
						<td colspan="6">
							<table class="stable" cellpadding="0" cellspacing="1"
								id="mqzgjrdapqkable">
								<tr>
									<th>各级人大组织名称<br />(如：聊城市人大)
									</th>
									<th>届次<br>(如：十七届)
									</th>
									<th>组织级别</th>
									<th>安排职务</th>
									<th>安排时间</th>
									<th colspan="2">备注</th>
									<th style="width: 60px">操作</th>
								</tr>
								<tr>
									<td><input name="mqzgjrdapqk[0].gjrdzzmc"
										<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="mqzgjrdapqk[0].jc"
										<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><select name="mqzgjrdapqk[0].zzjb"
										<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>>
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='组织级别' }">
													<option value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select></td>
									<td><select name="mqzgjrdapqk[0].apzw"
										<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>>
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='安排职务' }">
													<option value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select></td>
									<td><input name="mqzgjrdapqk[0].apsj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td colspan="2"><input name="mqzgjrdapqk[0].bz"
										<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input type="button" value="删除"
										onClick="delmqzgjrdapqk();" /></td>
								</tr>

							</table>
						</td>
					</tr>
					<tr>
						<th>目前在各级政协安排情况 <c:if
								test="${fn:contains(requiredstr,',30,')}">
								<font color="red">*</font>
							</c:if> <br /> <input type="button" value="新增"
							onClick="addmqzgjzxapqk();" />
						</th>
						<td colspan="6">
							<table class="stable" cellpadding="0" cellspacing="1"
								id="mqzgjzxapqktable">
								<tr>
									<th colspan="2">各级政协组织名称<br />(如：聊城市政协)
									</th>
									<th>届次(如：十三届)</th>
									<th>组织级别</th>
									<th>安排职务</th>
									<th>安排时间</th>
									<th>安排界别<br />(如：教育、医药卫生)
									</th>
									<th style="width: 60px">操作</th>
								</tr>
								<tr>
									<td colspan="2"><input name="mqzgjzxapqk[0].gjzxzzmc"
										<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="mqzgjzxapqk[0].jc"
										<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><select name="mqzgjzxapqk[0].zzjb"
										<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>>
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='组织级别' }">
													<option value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select></td>
									<td><select name="mqzgjzxapqk[0].apzw"
										<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>>
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='安排职务' }">
													<option value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select></td>
									<td><input name="mqzgjzxapqk[0].apsj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><select name="mqzgjzxapqk[0].apjb"
										<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>>
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='安排界别' }">
													<option value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select></td>
									<td><input type="button" value="删除"
										onClick="delmqzgjzxapqk();" /></td>
								</tr>

							</table>
						</td>
					</tr>
					<tr>
						<th>现任民主党派、工商联、爱国宗教团体、知联会、海联会、光彩会等职务情况 <c:if
								test="${fn:contains(requiredstr,',31,')}">
								<font color="red">*</font>
							</c:if> <br /> <input type="button" value="新增" onClick="addxrzwqk();" />
						</th>
						<td colspan="6">
							<table class="stable" cellpadding="0" cellspacing="1"
								id="xrzwqktable">
								<tr>
									<th>组织名称</th>
									<th colspan="2">任职起止时间</th>
									<th>安排职务</th>
									<th style="width: 60px">操作</th>
								</tr>
								<tr>
									<td><input name="xrzwqk[0].zzmc"
										<c:if test="${fn:contains(requiredstr,',31,')}">
									class="required"
									</c:if>
										class="textInput" type="text" /></td>
									<td><input name="xrzwqk[0].rzkssj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',31,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><input name="xrzwqk[0].rzjssj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',31,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><select name="xrzwqk[0].apzw"
										<c:if test="${fn:contains(requiredstr,',31,')}">
									class="required"
									</c:if>>
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='安排职务' }">
													<option value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select></td>
									<td><input type="button" value="删除" onClick="delxrzwqk();" /></td>
								</tr>

							</table>
						</td>
					</tr>
					<tr>
						<th>现任有关部门、单位特约人员（监督员）情况 <c:if
								test="${fn:contains(requiredstr,',32,')}">
								<font color="red">*</font>
							</c:if> <br /> <input type="button" value="新增" onClick="addxrygbmqk();" />
						</th>
						<td colspan="6">
							<table class="stable" cellpadding="0" cellspacing="1"
								id="xrygbmqktable">
								<tr>
									<th>聘请部门、单位名称</th>
									<th>特约人员（监督员）名称</th>
									<th colspan="2">起止时间</th>
									<th style="width: 60px">操作</th>
								</tr>
								<tr>
									<td><input name="xrygbmqk[0].pqbm"
										<c:if test="${fn:contains(requiredstr,',32,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="xrygbmqk[0].tyrymc"
										<c:if test="${fn:contains(requiredstr,',32,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="xrygbmqk[0].kssj"
										<c:if test="${fn:contains(requiredstr,',32,')}">
									class="required"
									</c:if>
										class="textInput" type="text" readonly="readonly"
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></td>
									<td><input name="xrygbmqk[0].jssj"
										<c:if test="${fn:contains(requiredstr,',32,')}">
									class="required"
									</c:if>
										class="textInput" type="text" readonly="readonly"
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></td>
									<td><input type="button" value="删除"
										onClick="delxrygbmqk();" /></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th>现任其他社会职务 <c:if test="${fn:contains(requiredstr,',33,')}">
								<font color="red">*</font>
							</c:if> <br />(人民团体、社会团体、学术及科研机构等)<br /> <input type="button"
							value="新增" onClick="addxrqtshzw();" />
						</th>
						<td colspan="6">
							<table class="stable" cellpadding="0" cellspacing="1"
								id="xrqtshzwtable">
								<tr>
									<th>组织名称</th>
									<th colspan="2">任职起止时间</th>
									<th>安排职务</th>
									<th style="width: 60px">操作</th>
								</tr>
								<tr>
									<td><input name="xrqtshzw[0].zzmc"
										<c:if test="${fn:contains(requiredstr,',33,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="xrqtshzw[0].rzkssj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',33,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><input name="xrqtshzw[0].rzjssj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',33,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><select name="xrqtshzw[0].apzw"
										<c:if test="${fn:contains(requiredstr,',33,')}">
									class="required"
									</c:if>>
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='安排职务' }">
													<option value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select></td>
									<td><input type="button" value="删除"
										onClick="delxrqtshzw();" /></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th>近五年来参加培训情况 <c:if
								test="${fn:contains(requiredstr,',34,')}">
								<font color="red">*</font>
							</c:if> <br /> <input type="button" value="新增"
							onClick="addjwnlcjpxqk();" />
						</th>
						<td colspan="6">
							<table class="stable" cellpadding="0" cellspacing="1"
								id="jwnlcjpxqktable">
								<tr>
									<th>主办单位</th>
									<th>班次名称</th>
									<th>培训院校</th>
									<th colspan="2">起止时间</th>
									<th style="width: 60px">操作</th>
								</tr>
								<tr>
									<td><input name="jwnlcjpxqk[0].zbdw"
										<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="jwnlcjpxqk[0].bcmc"
										<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="jwnlcjpxqk[0].pxyx"
										<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="jwnlcjpxqk[0].kssj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><input name="jwnlcjpxqk[0].jssj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text">
									<td><input type="button" value="删除"
										onClick="deljwnlcjpxqk();" /></td>
								</tr>

							</table>
						</td>
					</tr>
					<tr>
						<th>获奖或受表彰情况 <c:if test="${fn:contains(requiredstr,',35,')}">
								<font color="red">*</font>
							</c:if> <br /> <input type="button" value="新增" onClick="addhjhsbzqk();" />
						</th>
						<td colspan="6">
							<table class="stable" cellpadding="0" cellspacing="1"
								id="hjhsbzqktable">
								<tr>
									<th>授予单位</th>
									<th colspan="2">获奖或受表彰名称</th>
									<th>获奖时间</th>
									<th style="width: 60px">操作</th>
								</tr>
								<tr>
									<td><input name="hjhsbzqk[0].xydw"
										<c:if test="${fn:contains(requiredstr,',35,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td colspan="2"><input name="hjhsbzqk[0].hjhsbzmc"
										<c:if test="${fn:contains(requiredstr,',35,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="hjhsbzqk[0].sjsj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',35,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><input type="button" value="删除"
										onClick="delhjhsbzqk();" /></td>
								</tr>

							</table>
						</td>
					</tr>
					<tr>
						<th>主要政治表现<br />(200字左右)
						</th>
						<td colspan="6"><textarea name="personMessage.zyzzbx"
								<c:if test="${fn:contains(requiredstr,',36,')}">
															 class="required"
															</c:if>
								class="textInput" rows="5" cols="100"></textarea></td>
					</tr>
					<tr>
						<th>主要成就和社会影响<br />(300字左右)
						</th>
						<td colspan="6"><textarea name="personMessage.zycjhshyx"
								<c:if test="${fn:contains(requiredstr,',37,')}">
															 class="required"
															</c:if>
								class="textInput" rows="5" cols="100"></textarea></td>
					</tr>
					<tr>
						<th>年度考核情况 <c:if test="${fn:contains(requiredstr,',38,')}">
								<font color="red">*</font>
							</c:if> <br />(机关、事业单位人员填写)<br /> <input type="button" value="新增"
							onClick="addndkhqk();" />
						</th>
						<td colspan="6">
							<table class="stable" cellpadding="0" cellspacing="1"
								id="ndkhqktable">
								<tr>
									<th>近三年以来</th>
									<th colspan="2">考核结果</th>
									<th style="width: 60px">操作</th>
								</tr>
								<tr>
									<td width="100px"><input name="ndkhqk[0].sj"
										<c:if test="${fn:contains(requiredstr,',38,')}">
									class="required"
									</c:if>
										readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy'})"
										class="textInput" type="text"></td>
									<td colspan="2"><input name="ndkhqk[0].khjg"
										<c:if test="${fn:contains(requiredstr,',38,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input type="button" value="删除" onClick="delndkhqk();" /></td>
								</tr>

							</table>
						</td>
					</tr>
					<tr>
						<th>综合评价情况 <c:if test="${fn:contains(requiredstr,',39,')}">
								<font color="red">*</font>
							</c:if> <br /> <input type="button" value="新增" onClick="addzhpjqk();" />
						</th>
						<td colspan="6">
							<table class="stable" cellpadding="0" cellspacing="1"
								id="zhpjqktable">
								<tr>
									<th colspan="2">综合评价结果</th>
									<th>评价单位</th>
									<th>评价时间</th>
									<th style="width: 60px">操作</th>
								</tr>
								<tr>
									<td colspan="2"><input name="zhpjqk[0].zhpjjg"
										<c:if test="${fn:contains(requiredstr,',39,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="zhpjqk[0].pjdw"
										<c:if test="${fn:contains(requiredstr,',39,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="zhpjqk[0].pjsj" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',39,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><input type="button" value="删除" onClick="delzhpjqk();" /></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th>家庭成员及重要社会关系 <c:if
								test="${fn:contains(requiredstr,',40,')}">
								<font color="red">*</font>
							</c:if> <br /> <input type="button" value="新增"
							onClick="addjtcyjzyshgx();" /></th>
						<td colspan="6">
							<table class="stable" cellpadding="0" cellspacing="1"
								id="jtcyjzyshgxtable">
								<tr>
									<th>称谓</th>
									<th>姓名</th>
									<th>出生年月</th>
									<th>政治面貌</th>
									<th colspan="2">工作单位及职务</th>
									<th style="width: 60px">操作</th>
								</tr>
								<tr>
									<td><input name="jtcyjzyshgx[0].cw"
										<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="jtcyjzyshgx[0].xm"
										<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="jtcyjzyshgx[0].csny" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="textInput"
										type="text"></td>
									<td><input name="jtcyjzyshgx[0].zzmm"
										<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td colspan="2"><input name="jtcyjzyshgx[0].gzdwjzw"
										<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input type="button" value="删除"
										onClick="deljtcyjzyshgx();" /></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th>是否台胞台属</th>
						<td colspan="6"><select id="selTbts" onchange="checkTbts();" name="personMessage.tbts"
							<c:if test="${fn:contains(requiredstr,',50,')}">
						 class="required"
						</c:if>>
								<option value="否" selected="selected">否</option>
								<option value="是">是</option>
						</select></td>
					</tr>
					<tr id="tbtsTr" style="display: none">
						<td colspan="7">
							<table cellspacing="1" cellpadding="0" class="stable">
								<tr>
									<th>姓名</th>
									<td><input  name="personMessage.tbtsjbxx.xm"
										<c:if test="${fn:contains(requiredstr,',51,')}">
															 class="required"
															</c:if>
										class="textInput" type="text"></td>
									<th>原名</th>
									<td><input name="personMessage.tbtsjbxx.ym"
										<c:if test="${fn:contains(requiredstr,',52,')}">
															 class="required"
															</c:if>
										class="textInput" type="text"></td>
									<th>性别</th>
									<td><select name="personMessage.tbtsjbxx.xb"
										<c:if test="${fn:contains(requiredstr,',53,')}">
															 class="required"
															</c:if>>
											<option value="男">男</option>
											<option value="女">女</option>
									</select></td>
									<th>出生年月</th>
									<td><input name="personMessage.tbtsjbxx.csny"
										<c:if test="${fn:contains(requiredstr,',54,')}">
															 class="required"
															</c:if>
										readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM'})"
										class="textInput" type="text"></td>
								</tr>
								<tr>
									<th>民族</th>
									<td><select name="personMessage.tbtsjbxx.mz"
										<c:if test="${fn:contains(requiredstr,',55,')}">
															 class="required"
															</c:if>>
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
									<th>籍贯</th>
									<td><input name="personMessage.tbtsjbxx.jg"
										<c:if test="${fn:contains(requiredstr,',56,')}">
															 class="required"
															</c:if>
										class="textInput" type="text"></td>
									<th>学历</th>
									<td>
									<select name="personMessage.tbtsjbxx.xl"
										<c:if test="${fn:contains(requiredstr,',57,')}">
									class="required"
									</c:if>>
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='学历' }">
													<option value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select>
									</td>
									<th>党派</th>
									<td><select
										<c:if test="${fn:contains(requiredstr,',58,')}">
									 class="required"
									</c:if>
										name="personMessage.tbtsjbxx.dp">
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='党派' }">
													<option value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
								<th>宗教信仰</th>
								<td><select
										<c:if test="${fn:contains(requiredstr,',59,')}">
									 class="required"
									</c:if>
										name="personMessage.tbtsjbxx.zjxy">
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='宗教类别' }">
													<option value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select></td>
									<th>邮编</th>
									<td><input name="personMessage.tbtsjbxx.yb"
										<c:if test="${fn:contains(requiredstr,',60,')}">
															 class="required"
															</c:if>
										class="textInput" type="text"></td>
									<th>台湾住址</th>
									<td colspan="3"><input name="personMessage.tbtsjbxx.twzj"
										<c:if test="${fn:contains(requiredstr,',61,')}">
															 class="required"
															</c:if>
										class="textInput" type="text"></td>
								</tr>
								<tr>
								<th>工作单位及职务</th>
								<td><input class="textInput"
										<c:if test="${fn:contains(requiredstr,',62,')}">
															 class="required"
															</c:if> name="personMessage.tbtsjbxx.gzdwjzw" type="text"></td>
								
								<th>社会职务</th>
								<td><input class="textInput"
										<c:if test="${fn:contains(requiredstr,',63,')}">
															 class="required"
															</c:if> name="personMessage.tbtsjbxx.shzw" type="text"></td>
								<th>联系电话</th>
								<td><input class="textInput"
										<c:if test="${fn:contains(requiredstr,',64,')}">
															 class="required"
															</c:if> name="personMessage.tbtsjbxx.lxdh" type="text"></td>
								
								<th>家庭人口</th>
								<td><input class="textInput"
										<c:if test="${fn:contains(requiredstr,',65,')}">
															 class="required"
															</c:if> name="personMessage.tbtsjbxx.jtrk" type="text"></td>
							</tr>											
							<tr>
								<th>家庭经济状况</th>
								<td><input class="textInput" 
										<c:if test="${fn:contains(requiredstr,',66,')}">
															 class="required"
															</c:if>name="personMessage.tbtsjbxx.jtjjqk" type="text"></td>
								<th>称谓</th>
								<td><input class="textInput"
										<c:if test="${fn:contains(requiredstr,',67,')}">
															 class="required"
															</c:if> name="personMessage.tbtsjbxx.cw" type="text"></td>
								
								<th>日常联络情况</th>
								<td colspan="3"><input class="textInput"
										<c:if test="${fn:contains(requiredstr,',68,')}">
															 class="required"
															</c:if> name="personMessage.tbtsjbxx.rcllqk" type="text"></td>
							</tr>
							<tr>
						<th>去台人员家庭成员及重要社会关系 <c:if
								test="${fn:contains(requiredstr,',69,')}">
								<font color="red">*</font>
							</c:if> <br /> <input type="button" value="新增"
							onClick="addqtryjtqk();" /></th>
						<td colspan="7">
							<table class="stable" cellpadding="0" cellspacing="1"
								id="qtryjtqktable">
								<tr>
									<th>称谓</th>
									<th>姓名</th>
									<th>出生年月</th>
									<th>政治面貌</th>
									<th colspan="2">工作单位及职务</th>
									<th style="width: 60px">操作</th>
								</tr>
								<tr>
									<td><input name="qtryjtqk[0].cw"
										<c:if test="${fn:contains(requiredstr,',69,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="qtryjtqk[0].xm"
										<c:if test="${fn:contains(requiredstr,',69,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input name="qtryjtqk[0].csny" readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',69,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="textInput"
										type="text"></td>
									<td><input name="qtryjtqk[0].zzmm"
										<c:if test="${fn:contains(requiredstr,',69,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td colspan="2"><input name="qtryjtqk[0].gzdwjzw"
										<c:if test="${fn:contains(requiredstr,',69,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input type="button" value="删除"
										onClick="delqtryjtqk();" /></td>
								</tr>
							</table>
						</td>
					</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th>通讯地址</th>
						<td colspan="4"><input name="personMessage.txdz"
							<c:if test="${fn:contains(requiredstr,',42,')}">
															 class="required"
															</c:if>
							class="textInput" type="text"></td>
						<th>邮政编码</th>
						<td><input name="personMessage.yzbm"
							<c:if test="${fn:contains(requiredstr,',43,')}">
															 class="required"
															</c:if>
							class="textInput" type="text"></td>
					</tr>
					<tr>
						<th>办公电话</th>
						<td><input name="personMessage.bgdh"
							<c:if test="${fn:contains(requiredstr,',44,')}">
															 class="required"
															</c:if>
							class="textInput" type="text"></td>
						<th>手机号码</th>
						<td><input name="personMessage.sjhm"
							<c:if test="${fn:contains(requiredstr,',45,')}">
															 class="required"
															</c:if>
							class="textInput" type="text"></td>
						<th>电子信箱</th>
						<td colspan="2"><input name="personMessage.dzxx"
							<c:if test="${fn:contains(requiredstr,',46,')}">
															 class="required"
															</c:if>
							class="textInput" type="text"></td>
					</tr>
					<tr>
						<th>微信号码</th>
						<td><input name="personMessage.wxhm"
							<c:if test="${fn:contains(requiredstr,',47,')}">
															 class="required"
															</c:if>
							class="textInput" type="text"></td>
						<th>QQ号码</th>
						<td colspan="4"><input name="personMessage.qqhm"
							<c:if test="${fn:contains(requiredstr,',48,')}">
															 class="required"
															</c:if>
							class="textInput" type="text"></td>
					</tr>
					<tr>
						<th>备注</th>
						<td colspan="6"><textarea rows="5" cols="100"
								<c:if test="${fn:contains(requiredstr,',49,')}">
															 class="required"
															</c:if>
								class="textInput" name="personMessage.bz"></textarea></td>
					</tr>
				<%@include file="../common/jstableadd.jsp"%>
<script type="text/javascript">
function checkTbts(){
		var tabs=document.getElementById('selTbts').value;
		if(tabs=='是'){
			document.getElementById('tbtsTr').style.display="table-row";
		}else{
			document.getElementById('tbtsTr').style.display="none";
		}
	}
</script>
				</tbody>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<c:if test="${fn:contains(menusids,',256,')}">
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">保存</button>
							</div>
						</div></li>
				</c:if>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
				<c:if test="${fn:contains(menusids,',263,')}">
					<li><div class="button">
							<div class="buttonContent">
								<button type="button" onclick="Exporthtml();">导出</button>
							</div>
						</div></li>
				</c:if>
			</ul>
		</div>
	</form>
	<form action="Person_Exporthtml" method="post" id="exporthtml">
		<input id="htmltext" name="htmltext" type="hidden" value="">
	</form>
	<%@include file="../common/js.jsp"%>
</div>
</html>