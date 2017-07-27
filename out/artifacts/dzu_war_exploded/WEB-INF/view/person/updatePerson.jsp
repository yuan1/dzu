<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
	function uploadifySuccess(file, data, response) {
		$("#url3").attr("value", data);//填充内容 
		$("#image1").attr("src", '/uploads/' + data);//填充内容 
	}
	function checkTbts(){
		var tabs=document.getElementById('selTbts').value;
		if(tabs=='是'){
			document.getElementById('tbtsTr').style.display="table-row";
		}else{
			document.getElementById('tbtsTr').style.display="none";
		}
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
	width: 70%;
}
</style>
<div class="pageContent">
	<form method="post" action="Person_updatePersonDo"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,navTabAjaxDone)">
		<div class="pageFormContent" layoutH="35">
			<table id="myTable" class="stable" cellpadding="0" cellspacing="1">
				<tbody>
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
															<td><input type="hidden" name="personMessage.id"
																value="${personMessage.id}"> <input
																type="hidden" name="personMessage.year"
																value="${personMessage.year}"> <input
																type="hidden" name="personMessage.dept.id"
																value="${personMessage.dept.id}"> <input
																type="hidden" name="personMessage.type"
																value="${personMessage.type}"> <input id="xm"
																name="personMessage.xm" value="${personMessage.xm}"
																<c:if test="${fn:contains(requiredstr,',2,')}">
															 class="required"
															</c:if>
																class="textInput" type="text"></td>
															<th>性别</th>
															<td><select name="personMessage.xb"
																<c:if test="${fn:contains(requiredstr,',3,')}">
															 class="required"
															</c:if>>
																	<option
																		<c:if test="${personMessage.xb=='男'}">
																	selected="selected"
																</c:if>
																		value="男">男</option>
																	<option
																		<c:if test="${personMessage.xb=='女'}">
																	selected="selected"
																</c:if>
																		value="女">女</option>
															</select></td>
															<th>出生年月</th>
															<td><input name="personMessage.csny"
																readonly="readonly" value="${personMessage.csny}"
																onClick="WdatePicker({dateFmt:'yyyy-MM'})"
																<c:if test="${fn:contains(requiredstr,',4,')}">
															 class="required"
															</c:if>
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
																	<option value="${personMessage.mz }"
																		selected="selected">${personMessage.mz }</option>
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
																value="${personMessage.jg }"
																<c:if test="${fn:contains(requiredstr,',6,')}">
															 class="required"
															</c:if>
																class="textInput" type="text"></td>
															<th>国籍</th>
															<td><input name="personMessage.gj"
																<c:if test="${fn:contains(requiredstr,',7,')}">
															 class="required"
															</c:if>
																value="${personMessage.gj}" class="textInput"
																type="text"></td>
															<th>参加工作时间</th>
															<td><input name="personMessage.cjgzsj"
																<c:if test="${fn:contains(requiredstr,',8,')}">
															 class="required"
															</c:if>
																readonly="readonly" value="${personMessage.cjgzsj}"
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
																			<option
																				<c:if test="${pro.id==personMessage.dydp}">
																				selected="selected"
																			</c:if>
																				value="${pro.id }">${pro.content }</option>
																		</c:if>
																	</c:forEach>
															</select></td>
															<td>时间: <input name="personMessage.dydpjrsj"
																<c:if test="${fn:contains(requiredstr,',10,')}">
															 class="required"
															</c:if>
																readonly="readonly" value="${personMessage.dydpjrsj}"
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
																			<option
																				<c:if test="${pro.id==personMessage.dedp}">
																				selected="selected"
																			</c:if>
																				value="${pro.id }">${pro.content }</option>
																		</c:if>
																	</c:forEach>
															</select></td>
															<td>时间: <input name="personMessage.dedpjrsj"
																<c:if test="${fn:contains(requiredstr,',12,')}">
															 class="required"
															</c:if>
																readonly="readonly"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																value="${personMessage.dedpjrsj}" class="textInput"
																type="text"></td>
														</tr>

													</table>
												</TD>
											</TR>
										</table>
									</TD>
									<TD width="100px"><img alt="" width="100" height="112"
										src="/uploads/${personMessage.sczp}"></TD>
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
							type="hidden" value="${personMessage.sczp}"></td>
						<th>宗教类别<br>（宗教界人士填写）
						</th>
						<td colspan="3"><select name="personMessage.zjlb"
							<c:if test="${fn:contains(requiredstr,',14,')}">
								 class="required"
								</c:if>>
								<option value="" selected="selected"></option>
								<c:forEach items="${prolist }" var="pro">
									<c:if test="${pro.p_name=='宗教类别' }">
										<option
											<c:if test="${pro.id==personMessage.zjlb}">
											selected="selected"
										</c:if>
											value="${pro.id }">${pro.content }</option>
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
								<option
									<c:if test="${personMessage.hwlxjl=='否'}">
									selected="selected"
								</c:if>
									value="否">否</option>
								<option
									<c:if test="${personMessage.hwlxjl=='是'}">
									selected="selected"
								</c:if>
									value="是">是</option>
						</select> 国别：<input id="gb" name="personMessage.hwlxjlgb"
							<c:if test="${fn:contains(requiredstr,',16,')}">
															 class="required"
															</c:if>
							value="${personMessage.hwlxjlgb}" class="textInput" type="text"></td>
						<th>新的社会阶层<br>（新的社会阶层人士填写）
						</th>
						<td colspan="3"><select name="personMessage.shxjc"
							<c:if test="${fn:contains(requiredstr,',17,')}">
															 class="required"
															</c:if>>
								<option value="" selected="selected"></option>
								<c:forEach items="${prolist }" var="pro">
									<c:if test="${pro.p_name=='新的社会阶层' }">
										<option
											<c:if test="${pro.id==personMessage.shxjc }">
										selected="selected"
										</c:if>
											value="${pro.id }">${pro.content }</option>
									</c:if>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th rowspan="2">人员类别<c:if
								test="${fn:contains(requiredstr,',18,')}">
								<font color="red">*</font>
							</c:if></th>
						<td rowspan="2" colspan="2">
							<table cellpadding="0" cellspacing="1"
								style="font-size: 12px; margin: 0px; padding: 0px;">
								<tr>
									<td nowrap><input value="民主党派" type="checkbox"
										<c:if test="${fn:contains(personMessage.rylb,'民主党派')}">
									 checked="checked"
									</c:if>
										id="rylb1" name="personMessage.rylb" />民主党派 <input
										value="无党派" type="checkbox"
										<c:if test="${fn:contains(personMessage.rylb,'无党派')}">
									 checked="checked"
									</c:if>
										id="rylb2" name="personMessage.rylb" />无党派 <input
										value="少数民族" type="checkbox"
										<c:if test="${fn:contains(personMessage.rylb,'少数民族')}">
									 checked="checked"
									</c:if>
										id="rylb3" name="personMessage.rylb" />少数民族 <input
										value="宗教界" type="checkbox"
										<c:if test="${fn:contains(personMessage.rylb,'宗教界')}">
									 checked="checked"
									</c:if>
										id="rylb4" name="personMessage.rylb" />宗教界 <input
										value="非公有制经济" type="checkbox"
										<c:if test="${fn:contains(personMessage.rylb,'非公有制经济')}">
									 checked="checked"
									</c:if>
										id="rylb5" name="personMessage.rylb" />非公有制经济</td>
								</tr>
								<tr>
									<td nowrap><input value="港澳同胞" type="checkbox"
										<c:if test="${fn:contains(personMessage.rylb,'港澳同胞')}">
									 checked="checked"
									</c:if>
										id="rylb6" name="personMessage.rylb" />港澳同胞 <input
										value="新的社会阶层" type="checkbox"
										<c:if test="${fn:contains(personMessage.rylb,'新的社会阶层')}">
									 checked="checked"
									</c:if>
										id="rylb7" name="personMessage.rylb" />新的社会阶层 <input
										value="党外知识分子" type="checkbox"
										<c:if test="${fn:contains(personMessage.rylb,'党外知识分子')}">
									 checked="checked"
									</c:if>
										id="rylb8" name="personMessage.rylb" />党外知识分子 <input
										value="出国和归国留学" type="checkbox"
										<c:if test="${fn:contains(personMessage.rylb,'出国和归国留学')}">
									 checked="checked"
									</c:if>
										id="rylb9" name="personMessage.rylb" />出国和归国留学</td>
								</tr>
								<tr>
									<td nowrap><input value="台湾同胞及其在大陆的亲属" type="checkbox"
										<c:if test="${fn:contains(personMessage.rylb,'台湾同胞及其在大陆的亲属')}">
									 checked="checked"
									</c:if>
										id="rylb10" name="personMessage.rylb" />台湾同胞及其在大陆的亲属 <input
										value="华侨、归侨及侨眷" type="checkbox"
										<c:if test="${fn:contains(personMessage.rylb,'华侨、归侨及侨眷')}">
									 checked="checked"
									</c:if>
										id="rylb11" name="personMessage.rylb" />华侨、归侨及侨眷 <input
										value="其他需要联系和团结的人员" type="checkbox"
										<c:if test="${fn:contains(personMessage.rylb,'其他需要联系和团结的人员')}">
									 checked="checked"
									</c:if>
										id="rylb12" name="personMessage.rylb" />其他需要联系和团结的人员</td>
								</tr>
							</table>
						</td>
						<th>列入队伍</th>
						<td colspan="3"><select name="personMessage.lrdw"
							<c:if test="${fn:contains(requiredstr,',19,')}">
															 class="required"
															</c:if>>
								<option
									<c:if test="${personMessage.lrdw==1 }">
							selected="selected"
							</c:if>
									value="1">代表人士</option>
								<option
									<c:if test="${personMessage.lrdw==2 }">
							selected="selected"
							</c:if>
									value="2">后备人才</option>
						</select></td>
					</tr>
					<tr>
						<th>身份证号码</th>
						<td colspan="3"><input name="personMessage.sfzhm"
							<c:if test="${fn:contains(requiredstr,',20,')}">
															 class="required"
															</c:if>
							value="${personMessage.sfzhm}" class="textInput" type="text"></td>
					</tr>
					<tr>
						<th>工作单位及职务</th>
						<td colspan="2"><input name="personMessage.fzdwjzw"
							<c:if test="${fn:contains(requiredstr,',21,')}">
															 class="required"
															</c:if>
							value="${personMessage.fzdwjzw}" class="textInput" type="text"></td>
						<th>现任级别<br>(机关事业单位人员填写)
						</th>
						<td><select name="personMessage.xrjb"
							<c:if test="${fn:contains(requiredstr,',22,')}">
															 class="required"
															</c:if>>
								<option value="" selected="selected"></option>
								<c:forEach items="${prolist }" var="pro">
									<c:if test="${pro.p_name=='现任级别' }">
										<option
											<c:if test="${pro.id==personMessage.xrjb }">
										selected="selected"
										</c:if>
											value="${pro.id }">${pro.content }</option>
									</c:if>
								</c:forEach>
						</select></td>
						<th>任现职时间</th>
						<td><input name="personMessage.rxzsj" readonly="readonly"
							<c:if test="${fn:contains(requiredstr,',23,')}">
															 class="required"
															</c:if>
							value="${personMessage.rxzsj}"
							onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="textInput"
							type="text"></td>
					</tr>
					<tr>
						<th>任同级时间</th>
						<td><input name="personMessage.rtjsj" readonly="readonly"
							<c:if test="${fn:contains(requiredstr,',24,')}">
															 class="required"
															</c:if>
							value="${personMessage.rtjsj}"
							onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="textInput"
							type="text"></td>
						<th>专业技术职称</th>
						<td><input name="personMessage.zyjszc"
							<c:if test="${fn:contains(requiredstr,',25,')}">
															 class="required"
															</c:if>
							class="textInput" value="${personMessage.zyjszc}" type="text"></td>
						<th>职称级别</th>
						<td colspan="2"><select name="personMessage.zcjb"
							<c:if test="${fn:contains(requiredstr,',26,')}">
															 class="required"
															</c:if>>
								<option value="" selected="selected"></option>
								<c:forEach items="${prolist }" var="pro">
									<c:if test="${pro.p_name=='职称级别' }">
										<option
											<c:if test="${pro.id==personMessage.zcjb }">
										selected="selected"
										</c:if>
											value="${pro.id }">${pro.content }</option>
									</c:if>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th>学历信息<c:if test="${fn:contains(requiredstr,',27,')}">
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
								<c:forEach items="${personMessage.xlxx}" varStatus="m" begin="0"
									var="xlxxList">
									<tr>
										<td><input name="xlxx[${m.index}].byyxjzy"
											<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>
											class="textInput" value="${xlxxList.byyxjzy}" type="text">
										</td>
										<td><input name="xlxx[${m.index}].kssj"
											<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>
											readonly="readonly"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											class="textInput" type="text" value="${xlxxList.kssj}">
										</td>
										<td><input name="xlxx[${m.index}].jssj"
											<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>
											readonly="readonly"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											class="textInput" value="${xlxxList.jssj}" type="text">
										</td>
										<td><select name="xlxx[${m.index}].qdxl"
											<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>>
												<option value="" selected="selected"></option>
												<c:forEach items="${prolist }" var="pro">
													<c:if test="${pro.p_name=='学历' }">
														<option
															<c:if test="${pro.id==xlxxList.qdxl }">
													selected="selected"
													</c:if>
															value="${pro.id }">${pro.content }</option>
													</c:if>
												</c:forEach>
										</select></td>
										<td><select name="xlxx[${m.index}].shxw"
											<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>>
												<option value="" selected="selected"></option>
												<c:forEach items="${prolist }" var="pro">
													<c:if test="${pro.p_name=='学位' }">
														<option
															<c:if test="${pro.id==xlxxList.shxw }">
													selected="selected"
													</c:if>
															value="${pro.id }">${pro.content }</option>
													</c:if>
												</c:forEach>
										</select></td>
										<td><select name="xlxx[${m.index}].type"
											<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>>
												<option value="" selected="selected"></option>
												<option
													<c:if test="${xlxxList.type=='全日制教育' }">
											selected="selected"
											</c:if>
													value="全日制教育">全日制教育</option>
												<option
													<c:if test="${xlxxList.type=='在职教育' }">
											selected="selected"
											</c:if>
													value="在职教育">在职教育</option>
										</select></td>
										<td><select name="xlxx[${m.index}].hight"
											<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>>
												<option
													<c:if test="${xlxxList.hight=='1' }">
											selected="selected"
											</c:if>
													value="1">是</option>
												<option
													<c:if test="${xlxxList.hight=='0' }">
											selected="selected"
											</c:if>
													value="0">否</option>
										</select></td>
										<td><input type="button" value="删除" onClick="delxlxx();" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td><input
										name="xlxx[${fn:length(personMessage.xlxx)}].byyxjzy"
										<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="xlxx[${fn:length(personMessage.xlxx)}].kssj"
										readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><input
										name="xlxx[${fn:length(personMessage.xlxx)}].jssj"
										readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><select
										name="xlxx[${fn:length(personMessage.xlxx)}].qdxl"
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
									<td><select
										name="xlxx[${fn:length(personMessage.xlxx)}].shxw"
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
									<td><select
										name="xlxx[${fn:length(personMessage.xlxx)}].type"
										<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>>
											<option value="" selected="selected"></option>
											<option value="全日制教育">全日制教育</option>
											<option value="在职教育">在职教育</option>
									</select></td>
									<td><select
										name="xlxx[${fn:length(personMessage.xlxx)}].hight"
										<c:if test="${fn:contains(requiredstr,',27,')}">
									class="required"
									</c:if>>
											<option value="1" selected="selected">是</option>
											<option value="0">否</option>
									</select></td>
									<td><input type="button" value="删除" onClick="delxlxx();" /></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th>工作简历<c:if test="${fn:contains(requiredstr,',28,')}">
								<font color="red">*</font>
							</c:if><br /> <input type="button" value="新增" onClick="addgzjl();" /></th>
						<td colspan="6">
							<table class="stable" cellpadding="0" cellspacing="1"
								id="gzjltable">
								<tr>
									<th colspan="2">起止时间<br>(年月-年月，要前后衔接，不得空断)
									</th>
									<th>工作单位及职务</th>
									<th style="width: 60px">操作</th>
								</tr>
								<c:forEach items="${personMessage.gzjl}" var="gzjlList"
									varStatus="m" begin="0">
									<tr>
										<td><input name="gzjl[${m.index }].kssj"
											<c:if test="${fn:contains(requiredstr,',28,')}">
									class="required"
									</c:if>
											readonly="readonly" value="${gzjlList.kssj}"
											onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="textInput"
											type="text"></td>
										<td><input name="gzjl[${m.index }].jssj"
											<c:if test="${fn:contains(requiredstr,',28,')}">
									class="required"
									</c:if>
											readonly="readonly" value="${gzjlList.jssj}"
											onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="textInput"
											type="text"></td>
										<td><input name="gzjl[${m.index }].gzdwjzw"
											<c:if test="${fn:contains(requiredstr,',28,')}">
									class="required"
									</c:if>
											class="textInput" value="${gzjlList.gzdwjzw}" type="text"></td>
										<td><input type="button" value="删除" onClick="delgzjl();" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td><input
										name="gzjl[${fn:length(personMessage.gzjl)}].kssj"
										readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',28,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="textInput"
										type="text"></td>
									<td><input
										name="gzjl[${fn:length(personMessage.gzjl)}].jssj"
										readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',28,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="textInput"
										type="text"></td>
									<td><input
										name="gzjl[${fn:length(personMessage.gzjl)}].gzdwjzw"
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
						<th>目前在各级人大安排情况<c:if
								test="${fn:contains(requiredstr,',29,')}">
								<font color="red">*</font>
							</c:if><br /> <input type="button" value="新增"
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
								<c:forEach items="${personMessage.mqzgjrdapqk}"
									var="mqzgjrdapqkList" varStatus="m" begin="0">
									<tr>
										<td><input name="mqzgjrdapqk[${m.index }].gjrdzzmc"
											<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>
											value="${mqzgjrdapqkList.gjrdzzmc}" class="textInput"
											type="text"></td>
										<td><input name="mqzgjrdapqk[${m.index }].jc"
											<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>
											class="textInput" value="${mqzgjrdapqkList.jc}" type="text"></td>
										<td><select name="mqzgjrdapqk[${m.index }].zzjb"
											<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>>
												<option value="" selected="selected"></option>
												<c:forEach items="${prolist }" var="pro">
													<c:if test="${pro.p_name=='组织级别' }">
														<option
															<c:if test="${pro.id==mqzgjrdapqkList.zzjb }">
													selected="selected"
													</c:if>
															value="${pro.id }">${pro.content }</option>
													</c:if>
												</c:forEach>
										</select></td>
										<td><select name="mqzgjrdapqk[${m.index }].apzw"
											<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>>
												<option value="" selected="selected"></option>
												<c:forEach items="${prolist }" var="pro">
													<c:if test="${pro.p_name=='安排职务' }">
														<option
															<c:if test="${pro.id==mqzgjrdapqkList.apzw }">
													selected="selected"
													</c:if>
															value="${pro.id }">${pro.content }</option>
													</c:if>
												</c:forEach>
										</select></td>
										<td><input name="mqzgjrdapqk[${m.index }].apsj"
											<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>
											readonly="readonly" value="${mqzgjrdapqkList.apsj}"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											class="textInput" type="text"></td>
										<td colspan="2"><input name="mqzgjrdapqk[${m.index }].bz"
											<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>
											value="${mqzgjrdapqkList.bz}" class="textInput" type="text"></td>
										<td><input type="button" value="删除"
											onClick="delmqzgjrdapqk();" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td><input
										name="mqzgjrdapqk[${fn:length(personMessage.mqzgjrdapqk)}].gjrdzzmc"
										<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="mqzgjrdapqk[${fn:length(personMessage.mqzgjrdapqk)}].jc"
										<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><select
										name="mqzgjrdapqk[${fn:length(personMessage.mqzgjrdapqk)}].zzjb"
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
									<td><select
										name="mqzgjrdapqk[${fn:length(personMessage.mqzgjrdapqk)}].apzw"
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
									<td><input
										name="mqzgjrdapqk[${fn:length(personMessage.mqzgjrdapqk)}].apsj"
										readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',29,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td colspan="2"><input
										name="mqzgjrdapqk[${fn:length(personMessage.mqzgjrdapqk)}].bz"
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
						<th>目前在各级政协安排情况<c:if
								test="${fn:contains(requiredstr,',30,')}">
								<font color="red">*</font>
							</c:if><br /> <input type="button" value="新增"
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
								<c:forEach items="${personMessage.mqzgjzxapqk}" varStatus="m"
									begin="0" var="mqzgjzxapqkList">
									<tr>
										<td colspan="2"><input
											name="mqzgjzxapqk[${m.index }].gjzxzzmc"
											<c:if test="${fn:contains(requiredstr,',30,')}">
											class="required"
											</c:if>
											value="${mqzgjzxapqkList.gjzxzzmc}" class="textInput"
											type="text"></td>
										<td><input name="mqzgjzxapqk[${m.index }].jc"
											<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>
											class="textInput" value="${mqzgjzxapqkList.jc}" type="text"></td>
										<td><select name="mqzgjzxapqk[${m.index }].zzjb"
											<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>>
												<option value="" selected="selected"></option>
												<c:forEach items="${prolist }" var="pro">
													<c:if test="${pro.p_name=='组织级别' }">
														<option
															<c:if test="${pro.id==mqzgjzxapqkList.zzjb }">
													selected="selected"
													</c:if>
															value="${pro.id }">${pro.content }</option>
													</c:if>
												</c:forEach>
										</select></td>
										<td><select name="mqzgjzxapqk[${m.index }].apzw"
											<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>>
												<option value="" selected="selected"></option>
												<c:forEach items="${prolist }" var="pro">
													<c:if test="${pro.p_name=='安排职务' }">
														<option
															<c:if test="${pro.id==mqzgjzxapqkList.apzw }">
													selected="selected"
													</c:if>
															value="${pro.id }">${pro.content }</option>
													</c:if>
												</c:forEach>
										</select></td>
										<td><input name="mqzgjzxapqk[${m.index }].apsj"
											<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>
											readonly="readonly"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											class="textInput" type="text"></td>
										<td><select name="mqzgjzxapqk[${m.index }].apjb"
											<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>>
												<option value="" selected="selected"></option>
												<c:forEach items="${prolist }" var="pro">
													<c:if test="${pro.p_name=='安排界别' }">
														<option
															<c:if test="${pro.id==mqzgjzxapqkList.apjb }">
													selected="selected"
													</c:if>
															value="${pro.id }">${pro.content }</option>
													</c:if>
												</c:forEach>
										</select></td>
										<td><input type="button" value="删除"
											onClick="delmqzgjzxapqk();" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="2"><input
										name="mqzgjzxapqk[${fn:length(personMessage.mqzgjzxapqk)}].gjzxzzmc"
										<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="mqzgjzxapqk[${fn:length(personMessage.mqzgjzxapqk)}].jc"
										<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><select
										name="mqzgjzxapqk[${fn:length(personMessage.mqzgjzxapqk)}].zzjb"
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
									<td><select
										name="mqzgjzxapqk[${fn:length(personMessage.mqzgjzxapqk)}].apzw"
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
									<td><input
										name="mqzgjzxapqk[${fn:length(personMessage.mqzgjzxapqk)}].apsj"
										readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',30,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><select
										name="mqzgjzxapqk[${fn:length(personMessage.mqzgjzxapqk)}].apjb"
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
						<th>现任民主党派、工商联、爱国宗教团体、知联会、海联会、光彩会等职务情况<c:if
								test="${fn:contains(requiredstr,',31,')}">
								<font color="red">*</font>
							</c:if><br /> <input type="button" value="新增" onClick="addxrzwqk();" />
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
								<c:forEach items="${personMessage.xrzwqk}" var="xrzwqkList"
									varStatus="m" begin="0">
									<tr>
										<td><input name="xrzwqk[${m.index }].zzmc"
											<c:if test="${fn:contains(requiredstr,',31,')}">
									class="required"
									</c:if>
											class="textInput" value="${xrzwqkList.zzmc}" type="text" /></td>
										<td><input name="xrzwqk[${m.index }].rzkssj"
											<c:if test="${fn:contains(requiredstr,',31,')}">
									class="required"
									</c:if>
											readonly="readonly" value="${xrzwqkList.rzkssj}"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											class="textInput" type="text"></td>
										<td><input name="xrzwqk[${m.index }].rzjssj"
											<c:if test="${fn:contains(requiredstr,',31,')}">
									class="required"
									</c:if>
											readonly="readonly" value="${xrzwqkList.rzjssj}"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											class="textInput" type="text"></td>
										<td><select name="xrzwqk[${m.index }].apzw"
											<c:if test="${fn:contains(requiredstr,',31,')}">
									class="required"
									</c:if>>
												<option value="" selected="selected"></option>
												<c:forEach items="${prolist }" var="pro">
													<c:if test="${pro.p_name=='安排职务' }">
														<option
															<c:if test="${pro.id==xrzwqkList.apzw }">
													 selected="selected"
													</c:if>
															value="${pro.id }">${pro.content }</option>
													</c:if>
												</c:forEach>
										</select></td>
										<td><input type="button" value="删除"
											onClick="delxrzwqk();" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td><input
										name="xrzwqk[${fn:length(personMessage.xrzwqk)}].zzmc"
										<c:if test="${fn:contains(requiredstr,',31,')}">
									class="required"
									</c:if>
										class="textInput" type="text" /></td>
									<td><input
										name="xrzwqk[${fn:length(personMessage.xrzwqk)}].rzkssj"
										readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',31,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><input
										name="xrzwqk[${fn:length(personMessage.xrzwqk)}].rzjssj"
										readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',31,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><select
										name="xrzwqk[${fn:length(personMessage.xrzwqk)}].apzw"
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
								<c:forEach items="${personMessage.xrygbmqk}" var="xrygbmqkList"
									varStatus="m" begin="0">
									<tr>
										<td><input name="xrygbmqk[${m.index }].pqbm"
											<c:if test="${fn:contains(requiredstr,',32,')}">
									class="required"
									</c:if>
											class="textInput" value="${xrygbmqkList.pqbm}" type="text"></td>
										<td><input name="xrygbmqk[${m.index }].tyrymc"
											<c:if test="${fn:contains(requiredstr,',32,')}">
									class="required"
									</c:if>
											class="textInput" value="${xrygbmqkList.tyrymc}" type="text"></td>
										<td><input name="xrygbmqk[${m.index }].kssj"
											<c:if test="${fn:contains(requiredstr,',32,')}">
									class="required"
									</c:if>
											class="textInput" value="${xrygbmqkList.kssj}" type="text"
											readonly="readonly"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></td>
										<td><input name="xrygbmqk[${m.index }].jssj"
											<c:if test="${fn:contains(requiredstr,',32,')}">
									class="required"
									</c:if>
											class="textInput" value="${xrygbmqkList.jssj}" type="text"
											readonly="readonly"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></td>
										<td><input type="button" value="删除"
											onClick="delxrygbmqk();" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td><input
										name="xrygbmqk[${fn:length(personMessage.xrygbmqk)}].pqbm"
										<c:if test="${fn:contains(requiredstr,',32,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="xrygbmqk[${fn:length(personMessage.xrygbmqk)}].tyrymc"
										<c:if test="${fn:contains(requiredstr,',32,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="xrygbmqk[${fn:length(personMessage.xrygbmqk)}].kssj"
										<c:if test="${fn:contains(requiredstr,',32,')}">
									class="required"
									</c:if>
										class="textInput" type="text" readonly="readonly"
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></td>
									<td><input
										name="xrygbmqk[${fn:length(personMessage.xrygbmqk)}].jssj"
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
						<th>现任其他社会职务<c:if test="${fn:contains(requiredstr,',33,')}">
								<font color="red">*</font>
							</c:if><br />(人民团体、社会团体、学术及科研机构等)<br /> <input type="button"
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
								<c:forEach items="${personMessage.xrqtshzw}" var="xrqtshzwList"
									varStatus="m" begin="0">
									<tr>
										<td><input name="xrqtshzw[${m.index }].zzmc"
											<c:if test="${fn:contains(requiredstr,',33,')}">
									class="required"
									</c:if>
											class="textInput" value="${xrqtshzwList.zzmc}" type="text"></td>
										<td><input name="xrqtshzw[${m.index }].rzkssj"
											<c:if test="${fn:contains(requiredstr,',33,')}">
									class="required"
									</c:if>
											readonly="readonly" value="${xrqtshzwList.rzkssj}"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											class="textInput" type="text"></td>
										<td><input name="xrqtshzw[${m.index }].rzjssj"
											<c:if test="${fn:contains(requiredstr,',33,')}">
									class="required"
									</c:if>
											readonly="readonly" value="${xrqtshzwList.rzjssj}"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											class="textInput" type="text"></td>
										<td><select name="xrqtshzw[${m.index }].apzw"
											<c:if test="${fn:contains(requiredstr,',33,')}">
									class="required"
									</c:if>>
												<option value="" selected="selected"></option>
												<c:forEach items="${prolist }" var="pro">
													<c:if test="${pro.p_name=='安排职务' }">
														<option
															<c:if test="${pro.id==xrqtshzwList.apzw }">
													selected="selected"
													</c:if>
															value="${pro.id }">${pro.content }</option>
													</c:if>
												</c:forEach>
										</select></td>
										<td><input type="button" value="删除"
											onClick="delxrqtshzw();" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td><input
										name="xrqtshzw[${fn:length(personMessage.xrqtshzw)}].zzmc"
										<c:if test="${fn:contains(requiredstr,',33,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="xrqtshzw[${fn:length(personMessage.xrqtshzw)}].rzkssj"
										readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',33,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><input
										name="xrqtshzw[${fn:length(personMessage.xrqtshzw)}].rzjssj"
										readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',33,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><select
										name="xrqtshzw[${fn:length(personMessage.xrqtshzw)}].apzw"
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
								<c:forEach items="${personMessage.jwnlcjpxqk}"
									var="jwnlcjpxqkList" varStatus="m" begin="0">
									<tr>
										<td><input name="jwnlcjpxqk[${m.index }].zbdw"
											<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
											class="textInput" value="${jwnlcjpxqkList.zbdw}" type="text"></td>
										<td><input name="jwnlcjpxqk[${m.index }].bcmc"
											<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
											class="textInput" value="${jwnlcjpxqkList.bcmc}" type="text"></td>
										<td><input name="jwnlcjpxqk[${m.index }].pxyx"
											<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
											class="textInput" value="${jwnlcjpxqkList.pxyx}" type="text"></td>
										<td><input name="jwnlcjpxqk[${m.index }].kssj"
											<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
											readonly="readonly" value="${jwnlcjpxqkList.kssj}"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											class="textInput" type="text"></td>
										<td><input name="jwnlcjpxqk[${m.index }].jssj"
											<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
											readonly="readonly" value="${jwnlcjpxqkList.jssj}"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											class="textInput" type="text">
										<td><input type="button" value="删除"
											onClick="deljwnlcjpxqk();" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td><input
										name="jwnlcjpxqk[${fn:length(personMessage.jwnlcjpxqk)}].zbdw"
										<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="jwnlcjpxqk[${fn:length(personMessage.jwnlcjpxqk)}].bcmc"
										<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="jwnlcjpxqk[${fn:length(personMessage.jwnlcjpxqk)}].pxyx"
										<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="jwnlcjpxqk[${fn:length(personMessage.jwnlcjpxqk)}].kssj"
										readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',34,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
										class="textInput" type="text"></td>
									<td><input
										name="jwnlcjpxqk[${fn:length(personMessage.jwnlcjpxqk)}].jssj"
										readonly="readonly"
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
						<th>获奖或受表彰情况<c:if test="${fn:contains(requiredstr,',35,')}">
								<font color="red">*</font>
							</c:if><br /> <input type="button" value="新增" onClick="addhjhsbzqk();" />
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
								<c:forEach items="${personMessage.hjhsbzqk}" var="hjhsbzqkList"
									varStatus="m" begin="0">
									<tr>
										<td><input name="hjhsbzqk[${m.index }].xydw"
											<c:if test="${fn:contains(requiredstr,',35,')}">
									class="required"
									</c:if>
											class="textInput" value="${hjhsbzqkList.xydw}" type="text"></td>
										<td colspan="2"><input
											name="hjhsbzqk[${m.index }].hjhsbzmc"
											<c:if test="${fn:contains(requiredstr,',35,')}">
									class="required"
									</c:if>
											value="${hjhsbzqkList.hjhsbzmc}" class="textInput"
											type="text"></td>
										<td><input name="hjhsbzqk[${m.index }].sjsj"
											<c:if test="${fn:contains(requiredstr,',35,')}">
									class="required"
									</c:if>
											readonly="readonly"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											value="${hjhsbzqkList.sjsj}" class="textInput" type="text"></td>
										<td><input type="button" value="删除"
											onClick="delhjhsbzqk();" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td><input
										name="hjhsbzqk[${fn:length(personMessage.hjhsbzqk)}].xydw"
										<c:if test="${fn:contains(requiredstr,',35,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td colspan="2"><input
										name="hjhsbzqk[${fn:length(personMessage.hjhsbzqk)}].hjhsbzmc"
										<c:if test="${fn:contains(requiredstr,',35,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="hjhsbzqk[${fn:length(personMessage.hjhsbzqk)}].sjsj"
										readonly="readonly"
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
								class="textInput" rows="5" cols="100">${personMessage.zyzzbx}</textarea></td>
					</tr>
					<tr>
						<th>主要成就和社会影响<br />(300字左右)
						</th>
						<td colspan="6"><textarea name="personMessage.zycjhshyx"
								<c:if test="${fn:contains(requiredstr,',37,')}">
															 class="required"
															</c:if>
								class="textInput" rows="5" cols="100">${personMessage.zycjhshyx}</textarea></td>
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
								<c:forEach items="${personMessage.ndkhqk}" var="ndkhqkList"
									varStatus="m" begin="0">
									<tr>
										<td width="100px"><input name="ndkhqk[${m.index }].sj"
											<c:if test="${fn:contains(requiredstr,',38,')}">
									class="required"
									</c:if>
											value="${ndkhqkList.sj}" readonly="readonly"
											onClick="WdatePicker({dateFmt:'yyyy'})" class="textInput"
											type="text"></td>
										<td colspan="2"><input name="ndkhqk[${m.index }].khjg"
											<c:if test="${fn:contains(requiredstr,',38,')}">
									class="required"
									</c:if>
											value="${ndkhqkList.khjg}" class="textInput" type="text"></td>
										<td><input type="button" value="删除"
											onClick="delndkhqk();" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td width="100px"><input
										name="ndkhqk[${fn:length(personMessage.ndkhqk)}].sj"
										<c:if test="${fn:contains(requiredstr,',38,')}">
									class="required"
									</c:if>
										readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy'})"
										class="textInput" type="text"></td>
									<td colspan="2"><input
										name="ndkhqk[${fn:length(personMessage.ndkhqk)}].khjg"
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
								<c:forEach items="${personMessage.zhpjqk}" var="zhpjqkList"
									varStatus="m" begin="0">
									<tr>
										<td colspan="2"><input name="zhpjqk[${m.index }].zhpjjg"
											<c:if test="${fn:contains(requiredstr,',39,')}">
									class="required"
									</c:if>
											value="${zhpjqkList.zhpjjg}" class="textInput" type="text"></td>
										<td><input name="zhpjqk[${m.index }].pjdw"
											<c:if test="${fn:contains(requiredstr,',39,')}">
									class="required"
									</c:if>
											class="textInput" value="${zhpjqkList.pjdw}" type="text"></td>
										<td><input name="zhpjqk[${m.index }].pjsj"
											<c:if test="${fn:contains(requiredstr,',39,')}">
									class="required"
									</c:if>
											readonly="readonly" value="${zhpjqkList.pjsj}"
											onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											class="textInput" type="text"></td>
										<td><input type="button" value="删除"
											onClick="delzhpjqk();" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="2"><input
										name="zhpjqk[${fn:length(personMessage.zhpjqk)}].zhpjjg"
										<c:if test="${fn:contains(requiredstr,',39,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="zhpjqk[${fn:length(personMessage.zhpjqk)}].pjdw"
										<c:if test="${fn:contains(requiredstr,',39,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="zhpjqk[${fn:length(personMessage.zhpjqk)}].pjsj"
										readonly="readonly"
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
						<th>家庭成员及重要社会关系<c:if
								test="${fn:contains(requiredstr,',40,')}">
								<font color="red">*</font>
							</c:if><br /> <input type="button" value="新增"
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
								<c:forEach items="${personMessage.jtcyjzyshgx}"
									var="jtcyjzyshgxList" varStatus="m" begin="0">
									<tr>
										<td><input name="jtcyjzyshgx[${m.index }].cw"
											<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
											class="textInput" value="${jtcyjzyshgxList.cw}" type="text"></td>
										<td><input name="jtcyjzyshgx[${m.index }].xm"
											<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
											class="textInput" value="${jtcyjzyshgxList.xm}" type="text"></td>
										<td><input name="jtcyjzyshgx[${m.index }].csny"
											<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
											readonly="readonly" value="${jtcyjzyshgxList.csny}"
											onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="textInput"
											type="text"></td>
										<td><input name="jtcyjzyshgx[${m.index }].zzmm"
											<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
											class="textInput" value="${jtcyjzyshgxList.zzmm}" type="text"></td>
										<td colspan="2"><input
											name="jtcyjzyshgx[${m.index }].gzdwjzw"
											<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
											value="${jtcyjzyshgxList.gzdwjzw}" class="textInput"
											type="text"></td>
										<td><input type="button" value="删除"
											onClick="deljtcyjzyshgx();" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td><input
										name="jtcyjzyshgx[${fn:length(personMessage.jtcyjzyshgx)}].cw"
										<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="jtcyjzyshgx[${fn:length(personMessage.jtcyjzyshgx)}].xm"
										<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td><input
										name="jtcyjzyshgx[${fn:length(personMessage.jtcyjzyshgx)}].csny"
										readonly="readonly"
										<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
										onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="textInput"
										type="text"></td>
									<td><input
										name="jtcyjzyshgx[${fn:length(personMessage.jtcyjzyshgx)}].zzmm"
										<c:if test="${fn:contains(requiredstr,',40,')}">
									class="required"
									</c:if>
										class="textInput" type="text"></td>
									<td colspan="2"><input
										name="jtcyjzyshgx[${fn:length(personMessage.jtcyjzyshgx)}].gzdwjzw"
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
								<option value="${personMessage.tbts}" selected="selected">${personMessage.tbts}</option>
								<option value="否">否</option>
								<option value="是">是</option>
						</select></td>
					</tr>
					<tr id="tbtsTr" 
					<c:if test="${personMessage.tbts=='否'}">
					style="display: none"
					</c:if>
					<c:if test="${personMessage.tbts=='是'}">
					style="display: table-row"
					</c:if>
					>
						<td colspan="7">
							<table cellspacing="1" cellpadding="0" class="stable">
								<tr>
									<th>姓名</th>
									<td><input name="personMessage.tbtsjbxx.xm" value="${personMessage.tbtsjbxx.xm}"
										<c:if test="${fn:contains(requiredstr,',51,')}">
															 class="required"
															</c:if>
										class="textInput" type="text"></td>
									<th>原名</th>
									<td><input name="personMessage.tbtsjbxx.ym" value="${personMessage.tbtsjbxx.ym}"
										<c:if test="${fn:contains(requiredstr,',52,')}">
															 class="required"
															</c:if>
										class="textInput" type="text"></td>
									<th>性别</th>
									<td><select name="personMessage.tbtsjbxx.xb"
										<c:if test="${fn:contains(requiredstr,',53,')}">
															 class="required"
															</c:if>>
											<option selected="selected" value="${personMessage.tbtsjbxx.xb}">${personMessage.tbtsjbxx.xb}</option>
											<option value="男">男</option>
											<option value="女">女</option>
									</select></td>
									<th>出生年月</th>
									<td><input name="personMessage.tbtsjbxx.csny" value="${personMessage.tbtsjbxx.csny}"
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
											<option selected="selected" value="${personMessage.tbtsjbxx.mz}">${personMessage.tbtsjbxx.mz}</option>
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
									<td><input name="personMessage.tbtsjbxx.jg" value="${personMessage.tbtsjbxx.jg}"
										<c:if test="${fn:contains(requiredstr,',56,')}">
															 class="required"
															</c:if>
										class="textInput" type="text"></td>
									<th>学历</th>
									<td><select name="personMessage.tbtsjbxx.xl"
										<c:if test="${fn:contains(requiredstr,',57,')}">
									class="required"
									</c:if>>
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='学历' }">
													<option 
													<c:if test="${pro.id==personMessage.tbtsjbxx.xl}">
													selected="selected"
													</c:if>
													value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select></td>
									<th>党派</th>
									<td><select
										<c:if test="${fn:contains(requiredstr,',58,')}">
									 class="required"
									</c:if>
										name="personMessage.tbtsjbxx.dp">
											<option value="" selected="selected"></option>
											<c:forEach items="${prolist }" var="pro">
												<c:if test="${pro.p_name=='党派' }">
													<option
													<c:if test="${pro.id==personMessage.tbtsjbxx.dp}">
													selected="selected"
													</c:if>
													 value="${pro.id }">${pro.content }</option>
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
													<option 
													<c:if test="${pro.id==personMessage.tbtsjbxx.zjxy}">
													selected="selected"
													</c:if>
													value="${pro.id }">${pro.content }</option>
												</c:if>
											</c:forEach>
									</select></td>
									<th>邮编</th>
									<td><input name="personMessage.tbtsjbxx.yb" value="${personMessage.tbtsjbxx.yb}"
										<c:if test="${fn:contains(requiredstr,',60,')}">
															 class="required"
															</c:if>
										class="textInput" type="text"></td>
									<th>台湾住址</th>
									<td colspan="3"><input name="personMessage.tbtsjbxx.twzj" value="${personMessage.tbtsjbxx.twzj}"
										<c:if test="${fn:contains(requiredstr,',61,')}">
															 class="required"
															</c:if>
										class="textInput" type="text"></td>
								</tr>
								<tr>
									<th>工作单位及职务</th>
									<td><input class="textInput" value="${personMessage.tbtsjbxx.gzdwjzw}"
										<c:if test="${fn:contains(requiredstr,',62,')}">
															 class="required"
															</c:if>
										name="personMessage.tbtsjbxx.gzdwjzw" type="text"></td>

									<th>社会职务</th>
									<td><input class="textInput" value="${personMessage.tbtsjbxx.shzw}"
										<c:if test="${fn:contains(requiredstr,',63,')}">
															 class="required"
															</c:if>
										name="personMessage.tbtsjbxx.shzw" type="text"></td>
									<th>联系电话</th>
									<td><input class="textInput" value="${personMessage.tbtsjbxx.lxdh}"
										<c:if test="${fn:contains(requiredstr,',64,')}">
															 class="required"
															</c:if>
										name="personMessage.tbtsjbxx.lxdh" type="text"></td>

									<th>家庭人口</th>
									<td><input class="textInput" value="${personMessage.tbtsjbxx.jtrk}"
										<c:if test="${fn:contains(requiredstr,',65,')}">
															 class="required"
															</c:if>
										name="personMessage.tbtsjbxx.jtrk" type="text"></td>
								</tr>
								<tr>
									<th>家庭经济状况</th>
									<td><input class="textInput" value="${personMessage.tbtsjbxx.jtjjqk}"
										<c:if test="${fn:contains(requiredstr,',66,')}">
															 class="required"
															</c:if>
										name="personMessage.tbtsjbxx.jtjjqk" type="text"></td>
									<th>称谓</th>
									<td><input class="textInput" value="${personMessage.tbtsjbxx.cw}"
										<c:if test="${fn:contains(requiredstr,',67,')}">
															 class="required"
															</c:if>
										name="personMessage.tbtsjbxx.cw" type="text"></td>

									<th>日常联络情况</th>
									<td colspan="3"><input class="textInput" value="${personMessage.tbtsjbxx.rcllqk}"
										<c:if test="${fn:contains(requiredstr,',68,')}">
															 class="required"
															</c:if>
										name="personMessage.tbtsjbxx.rcllqk" type="text"></td>
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
										<c:forEach items="${personMessage.tbtsjbxx.qtryjtqk}"
											var="qtryjtqkList" varStatus="m" begin="0">
											<tr>
												<td><input name="qtryjtqk[${m.index }].cw"
													<c:if test="${fn:contains(requiredstr,',69,')}">
											class="required"
											</c:if>
													class="textInput" value="${qtryjtqkList.cw}" type="text"></td>
												<td><input name="qtryjtqk[${m.index }].xm"
													<c:if test="${fn:contains(requiredstr,',69,')}">
											class="required"
											</c:if>
													class="textInput" value="${qtryjtqkList.xm}" type="text"></td>
												<td><input name="qtryjtqk[${m.index }].csny"
													<c:if test="${fn:contains(requiredstr,',69,')}">
											class="required"
											</c:if>
													readonly="readonly" value="${qtryjtqkList.csny}"
													onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="textInput"
													type="text"></td>
												<td><input name="qtryjtqk[${m.index }].zzmm"
													<c:if test="${fn:contains(requiredstr,',69,')}">
											class="required"
											</c:if>
													class="textInput" value="${qtryjtqkList.zzmm}" type="text"></td>
												<td colspan="2"><input
													name="qtryjtqk[${m.index }].gzdwjzw"
													<c:if test="${fn:contains(requiredstr,',69,')}">
											class="required"
											</c:if>
													value="${qtryjtqkList.gzdwjzw}" class="textInput"
													type="text"></td>
												<td><input type="button" value="删除"
													onClick="delqtryjtqk();" /></td>
											</tr>
										</c:forEach>
										<tr>
											<td><input
												name="qtryjtqk[${fn:length(personMessage.tbtsjbxx.qtryjtqk)}].cw"
												<c:if test="${fn:contains(requiredstr,',69,')}">
											class="required"
											</c:if>
												class="textInput" type="text"></td>
											<td><input
												name="qtryjtqk[${fn:length(personMessage.tbtsjbxx.qtryjtqk)}].xm"
												<c:if test="${fn:contains(requiredstr,',69,')}">
											class="required"
											</c:if>
												class="textInput" type="text"></td>
											<td><input
												name="qtryjtqk[${fn:length(personMessage.tbtsjbxx.qtryjtqk)}].csny"
												readonly="readonly"
												<c:if test="${fn:contains(requiredstr,',69,')}">
											class="required"
											</c:if>
												onClick="WdatePicker({dateFmt:'yyyy-MM'})" class="textInput"
												type="text"></td>
											<td><input
												name="qtryjtqk[${fn:length(personMessage.tbtsjbxx.qtryjtqk)}].zzmm"
												<c:if test="${fn:contains(requiredstr,',69,')}">
											class="required"
											</c:if>
												class="textInput" type="text"></td>
											<td colspan="2"><input
												name="qtryjtqk[${fn:length(personMessage.tbtsjbxx.qtryjtqk)}].gzdwjzw"
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
							value="${personMessage.txdz}" class="textInput" type="text"></td>
						<th>邮政编码</th>
						<td><input name="personMessage.yzbm"
							<c:if test="${fn:contains(requiredstr,',43,')}">
															 class="required"
															</c:if>
							class="textInput" value="${personMessage.yzbm}" type="text"></td>
					</tr>
					<tr>
						<th>办公电话</th>
						<td><input name="personMessage.bgdh"
							<c:if test="${fn:contains(requiredstr,',44,')}">
															 class="required"
															</c:if>
							class="textInput" value="${personMessage.bgdh}" type="text"></td>
						<th>手机号码</th>
						<td><input name="personMessage.sjhm"
							<c:if test="${fn:contains(requiredstr,',45,')}">
															 class="required"
															</c:if>
							class="textInput" value="${personMessage.sjhm}" type="text"></td>
						<th>电子信箱</th>
						<td colspan="2"><input name="personMessage.dzxx"
							<c:if test="${fn:contains(requiredstr,',46,')}">
															 class="required"
															</c:if>
							value="${personMessage.dzxx}" class="textInput" type="text"></td>
					</tr>
					<tr>
						<th>微信号码</th>
						<td><input name="personMessage.wxhm"
							<c:if test="${fn:contains(requiredstr,',47,')}">
															 class="required"
															</c:if>
							class="textInput" value="${personMessage.wxhm}" type="text"></td>
						<th>QQ号码</th>
						<td colspan="4"><input name="personMessage.qqhm"
							<c:if test="${fn:contains(requiredstr,',48,')}">
															 class="required"
															</c:if>
							value="${personMessage.qqhm}" class="textInput" type="text"></td>
					</tr>
					<tr>
						<th>备注</th>
						<td colspan="6"><textarea rows="5" cols="100"
								<c:if test="${fn:contains(requiredstr,',49,')}">
															 class="required"
															</c:if>
								class="textInput" class="input_textarea" name="personMessage.bz">${personMessage.bz}</textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">修改</button>
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
	<%@include file="../common/jsclose.jsp"%>
	<%@include file="../common/jstableadd.jsp"%>
</div>
</html>