<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
</style>
<div class="pageContent">
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
														<td>${personMessage.xm}</td>
														<th>性别</th>
														<td>${personMessage.xb}</td>
														<th>出生年月</th>
														<td>${personMessage.csny}</td>
														<td></td>
														<td></td>
													</tr>
													<tr>
														<th>民族</th>
														<td>${personMessage.mz }</td>
														<th>籍贯</th>
														<td>${personMessage.jg}</td>
														<th>国籍</th>
														<td>${personMessage.gj}</td>
														<th>参加工作时间</th>
														<td>${personMessage.cjgzsj}</td>
													</tr>
													<tr>
														<th>第一党派及加入时间</th>
														<td colspan="2">党派: <c:forEach items="${prolist }"
																var="pro">
																<c:if test="${pro.p_name=='党派' }">
																	<c:if test="${pro.id==personMessage.dydp }">
																		${pro.content }
																		</c:if>
																</c:if>
															</c:forEach>
														</td>
														<td>时间: ${personMessage.dydpjrsj}</td>
														<th colspan="2">第二党派及加入时间</th>
														<td>党派: <c:forEach items="${prolist }" var="pro">
																<c:if test="${pro.p_name=='党派' }">
																	<c:if test="${pro.id==personMessage.dedp }">
																		${pro.content }
																		</c:if>
																</c:if>
															</c:forEach>
														</td>
														<td>时间: ${personMessage.dedpjrsj}</td>
													</tr>
												</table>
											</TD>
										</TR>
									</table>
								</TD>
								<TD width="100px"><img alt="" width="100" height="112"
									src="uploads/${personMessage.sczp}"></TD>
							</TR>
						</table>
					</td>
				</TR>
				<tr>
					<th>上传照片</th>
					<td colspan="2"><c:if test="${personMessage.sczp != ''}">
							已上传						
						</c:if> <c:if test="${personMessage.sczp == ''}">
							未上传						
						</c:if></td>
					<th>宗教类别<br>（宗教界人士填写）
					</th>
					<td colspan="3"><c:forEach items="${prolist }" var="pro">
							<c:if test="${pro.p_name=='宗教类别' }">
								<c:if test="${pro.id==personMessage.zjlb }">
								${pro.content }
								</c:if>
							</c:if>
						</c:forEach></td>
				</tr>
				<tr>
					<th>海外留学经历</th>
					<td colspan="2">${personMessage.hwlxjl}
						国别：${personMessage.hwlxjlgb}</td>
					<th>新的社会阶层<br>（新的社会阶层人士填写）
					</th>
					<td colspan="3"><c:forEach items="${prolist }" var="pro">
							<c:if test="${pro.p_name=='新的社会阶层' }">
								<c:if test="${pro.id==personMessage.shxjc }">
								${pro.content }
								</c:if>
							</c:if>
						</c:forEach></td>
				</tr>
				<tr>
					<th rowspan="2">人员类别</th>
					<td rowspan="2" colspan="2">
						<table cellpadding="0" cellspacing="1"
							style="font-size: 12px; margin: 0px; padding: 0px;">
							<tr>
								<td nowrap>${personMessage.rylb}</td>
							</tr>
						</table>
					</td>
					<th>列入队伍</th>
					<td colspan="3"><c:if test="${personMessage.lrdw==1 }">
							代表人士
						</c:if> <c:if test="${personMessage.lrdw==2 }">
							后备人才
						</c:if></td>
				</tr>
				<tr>
					<th>身份证号码</th>
					<td colspan="3">${personMessage.sfzhm}</td>
				</tr>
				<tr>
					<th>工作单位及职务</th>
					<td colspan="2">${personMessage.fzdwjzw}</td>
					<th>现任级别<br>(机关事业单位人员填写)
					</th>
					<td><c:forEach items="${prolist }" var="pro">
							<c:if test="${pro.p_name=='现任级别' }">
								<c:if test="${pro.id==personMessage.xrjb }">
								${pro.content }
								</c:if>
							</c:if>
						</c:forEach></td>
					<th>任现职时间</th>
					<td>${personMessage.rxzsj}</td>
				</tr>
				<tr>
					<th>任同级时间</th>
					<td>${personMessage.rtjsj}</td>
					<th>专业技术职称</th>
					<td>${personMessage.zyjszc}</td>
					<th>职称级别</th>
					<td colspan="2"><c:forEach items="${prolist }" var="pro">
							<c:if test="${pro.p_name=='职称级别' }">
								<c:if test="${pro.id==personMessage.zcjb }">
								${pro.content }
								</c:if>
							</c:if>
						</c:forEach></td>
				</tr>
				<tr>
					<th>学历信息</th>
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
							</tr>
							<c:forEach items="${personMessage.xlxx}" var="xlxxList">
								<tr>
									<td>${xlxxList.byyxjzy}</td>
									<td>${xlxxList.kssj}</td>
									<td>${xlxxList.jssj}</td>
									<td><c:forEach items="${prolist }" var="pro">
											<c:if test="${pro.p_name=='学历' }">
												<c:if test="${pro.id==xlxxList.qdxl }">
												${pro.content }
												</c:if>
											</c:if>
										</c:forEach></td>
									<td><c:forEach items="${prolist }" var="pro">
											<c:if test="${pro.p_name=='学位' }">
												<c:if test="${pro.id==xlxxList.shxw }">
												${pro.content }
												</c:if>
											</c:if>
										</c:forEach></td>
									<td>${xlxxList.type}</td>
									<td><c:if test="${xlxxList.hight=='1' }">
											是
											</c:if> <c:if test="${xlxxList.hight=='0' }">
										否
											</c:if></td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<th>工作简历</th>
					<td colspan="6">
						<table class="stable" cellpadding="0" cellspacing="1"
							id="gzjltable">
							<tr>
								<th colspan="2">起止时间<br>(年月-年月，要前后衔接，不得空断)
								</th>
								<th>工作单位及职务</th>
							</tr>
							<c:forEach items="${personMessage.gzjl}" var="gzjlList">
								<tr>
									<td>${gzjlList.kssj}</td>
									<td>${gzjlList.jssj}</td>
									<td>${gzjlList.gzdwjzw}</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<th>目前在各级人大安排情况</th>
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
							</tr>
							<c:forEach items="${personMessage.mqzgjrdapqk}"
								var="mqzgjrdapqkList">
								<tr>
									<td>${mqzgjrdapqkList.gjrdzzmc}</td>
									<td>${mqzgjrdapqkList.jc}</td>
									<td><c:forEach items="${prolist }" var="pro">
											<c:if test="${pro.p_name=='组织级别' }">
												<c:if test="${pro.id==mqzgjrdapqkList.zzjb }">
												${pro.content }
												</c:if>
											</c:if>
										</c:forEach></td>
									<td><c:forEach items="${prolist }" var="pro">
											<c:if test="${pro.p_name=='安排职务' }">
												<c:if test="${pro.id==mqzgjrdapqkList.apzw }">
												${pro.content }
												</c:if>
											</c:if>
										</c:forEach></td>
									<td>${mqzgjrdapqkList.apsj}</td>
									<td>${mqzgjrdapqkList.bz}</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<th>目前在各级政协安排情况</th>
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
							</tr>
							<c:forEach items="${personMessage.mqzgjzxapqk}"
								var="mqzgjzxapqkList">
								<tr>
									<td colspan="2">${mqzgjzxapqkList.gjzxzzmc}</td>
									<td>${mqzgjzxapqkList.jc}</td>
									<td><c:forEach items="${prolist }" var="pro">
											<c:if test="${pro.p_name=='组织级别' }">
												<c:if test="${pro.id==mqzgjzxapqkList.zzjb }">
												${pro.content }
												</c:if>
											</c:if>
										</c:forEach></td>
									<td><c:forEach items="${prolist }" var="pro">
											<c:if test="${pro.p_name=='安排职务' }">
												<c:if test="${pro.id==mqzgjzxapqkList.apzw }">
												${pro.content }
												</c:if>
											</c:if>
										</c:forEach></td>
									<td>${mqzgjzxapqkList.apsj}</td>
									<td><c:forEach items="${prolist }" var="pro">
											<c:if test="${pro.p_name=='安排界别' }">
												<c:if test="${pro.id==mqzgjzxapqkList.apjb }">
												${pro.content }
												</c:if>
											</c:if>
										</c:forEach></td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<th>现任民主党派、工商联、爱国宗教团体、知联会、海联会、光彩会等职务情况</th>
					<td colspan="6">
						<table class="stable" cellpadding="0" cellspacing="1"
							id="xrzwqktable">
							<tr>
								<th>组织名称</th>
								<th colspan="2">任职起止时间</th>
								<th>安排职务</th>
							</tr>
							<c:forEach items="${personMessage.xrzwqk}" var="xrzwqkList">
								<tr>
									<td>${xrzwqkList.zzmc}</td>
									<td>${xrzwqkList.rzkssj}</td>
									<td>${xrzwqkList.rzjssj}</td>
									<td><c:forEach items="${prolist }" var="pro">
											<c:if test="${pro.p_name=='安排职务' }">
												<c:if test="${pro.id==xrzwqkList.apzw }">
												${pro.content }
												</c:if>
											</c:if>
										</c:forEach></td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<th>现任有关部门、单位特约人员（监督员）情况</th>
					<td colspan="6">
						<table class="stable" cellpadding="0" cellspacing="1"
							id="xrygbmqktable">
							<tr>
								<th>聘请部门、单位名称</th>
								<th>特约人员（监督员）名称</th>
								<th colspan="2">起止时间</th>
							</tr>
							<c:forEach items="${personMessage.xrygbmqk}" var="xrygbmqkList">
								<tr>
									<td>${xrygbmqkList.pqbm}</td>
									<td>${xrygbmqkList.tyrymc}</td>
									<td>${xrygbmqkList.kssj}</td>
									<td>${xrygbmqkList.jssj}</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<th>现任其他社会职务<br />(人民团体、社会团体、学术及科研机构等)
					</th>
					<td colspan="6">
						<table class="stable" cellpadding="0" cellspacing="1"
							id="xrqtshzwtable">
							<tr>
								<th>组织名称</th>
								<th colspan="2">任职起止时间</th>
								<th>安排职务</th>
							</tr>
							<c:forEach items="${personMessage.xrqtshzw}" var="xrqtshzwList">
								<tr>
									<td>${xrqtshzwList.zzmc}</td>
									<td>${xrqtshzwList.rzkssj}</td>
									<td>${xrqtshzwList.rzjssj}</td>
									<td><c:forEach items="${prolist }" var="pro">
											<c:if test="${pro.p_name=='安排职务' }">
												<c:if test="${pro.id==xrqtshzwList.apzw }">
												${pro.content }
												</c:if>
											</c:if>
										</c:forEach></td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<th>近五年来参加培训情况</th>
					<td colspan="6">
						<table class="stable" cellpadding="0" cellspacing="1"
							id="jwnlcjpxqktable">
							<tr>
								<th>主办单位</th>
								<th>班次名称</th>
								<th>培训院校</th>
								<th colspan="2">起止时间</th>
							</tr>
							<c:forEach items="${personMessage.jwnlcjpxqk}"
								var="jwnlcjpxqkList">
								<tr>
									<td>${jwnlcjpxqkList.zbdw}</td>
									<td>${jwnlcjpxqkList.bcmc}</td>
									<td>${jwnlcjpxqkList.pxyx}</td>
									<td>${jwnlcjpxqkList.kssj}</td>
									<td>${jwnlcjpxqkList.jssj}</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<th>获奖或受表彰情况</th>
					<td colspan="6">
						<table class="stable" cellpadding="0" cellspacing="1"
							id="hjhsbzqktable">
							<tr>
								<th>授予单位</th>
								<th colspan="2">获奖或受表彰名称</th>
								<th>获奖时间</th>
							</tr>
							<c:forEach items="${personMessage.hjhsbzqk}" var="hjhsbzqkList">
								<tr>
									<td>${hjhsbzqkList.xydw}</td>
									<td colspan="2">${hjhsbzqkList.hjhsbzmc}</td>
									<td>${hjhsbzqkList.sjsj}</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<th>主要政治表现<br />(200字左右)
					</th>
					<td colspan="6">${personMessage.zyzzbx}</td>
				</tr>
				<tr>
					<th>主要成就和社会影响<br />(300字左右)
					</th>
					<td colspan="6">${personMessage.zycjhshyx}</td>
				</tr>
				<tr>
					<th>年度考核情况<br />(机关、事业单位人员填写
					</th>
					<td colspan="6">
						<table class="stable" cellpadding="0" cellspacing="1"
							id="ndkhqktable">
							<tr>
								<th>近三年以来</th>
								<th colspan="2">考核结果</th>
							</tr>
							<c:forEach items="${personMessage.ndkhqk}" var="ndkhqkList">
								<tr>
									<td>${ndkhqkList.sj}</td>
									<td>${ndkhqkList.khjg}</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<th>综合评价情况</th>
					<td colspan="6">
						<table class="stable" cellpadding="0" cellspacing="1"
							id="zhpjqktable">
							<tr>
								<th colspan="2">综合评价结果</th>
								<th>评价单位</th>
								<th>评价时间</th>
							</tr>
							<c:forEach items="${personMessage.zhpjqk}" var="zhpjqkList">
								<tr>
									<td colspan="2">${zhpjqkList.zhpjjg}</td>
									<td>${zhpjqkList.pjdw}</td>
									<td>${zhpjqkList.pjsj}</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<th>家庭成员及重要社会关系</th>
					<td colspan="6">
						<table class="stable" cellpadding="0" cellspacing="1"
							id="jtcyjzyshgxtable">
							<tr>
								<th>称谓</th>
								<th>姓名</th>
								<th>出生年月</th>
								<th>政治面貌</th>
								<th colspan="2">工作单位及职务</th>
							</tr>
							<c:forEach items="${personMessage.jtcyjzyshgx}"
								var="jtcyjzyshgxList">
								<tr>
									<td>${jtcyjzyshgxList.cw}</td>
									<td>${jtcyjzyshgxList.xm}</td>
									<td>${jtcyjzyshgxList.csny}</td>
									<td>${jtcyjzyshgxList.zzmm}</td>
									<td colspan="2">${jtcyjzyshgxList.gzdwjzw}</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<th>是否台胞台属</th>
					<td colspan="6">${personMessage.tbts}</td>
				</tr>
					<c:if test="${personMessage.tbts=='是'}">
				<tr>
					<td colspan="7">
						<table cellspacing="1" cellpadding="0" class="stable">
							<tr>
								<th>姓名</th>
								<td>${personMessage.tbtsjbxx.xm}</td>
								<th>原名</th>
								<td>${personMessage.tbtsjbxx.ym}</td>
								<th>性别</th>
								<td>${personMessage.tbtsjbxx.xb}</td>
								<th>出生年月</th>
								<td>${personMessage.tbtsjbxx.csny}</td>
							</tr>
							<tr>
								<th>民族</th>
								<td>${personMessage.tbtsjbxx.mz}</td>
								<th>籍贯</th>
								<td>${personMessage.tbtsjbxx.jg}</td>
								<th>学历</th>
								<td>
									<c:forEach items="${prolist }" var="pro">
										<c:if test="${pro.p_name=='学历' }">
												<c:if test="${pro.id==personMessage.tbtsjbxx.xl}">
												${pro.content }
												</c:if>
										</c:if>
									</c:forEach>
								</td>
								<th>党派</th>
								<td>
										<c:forEach items="${prolist }" var="pro">
											<c:if test="${pro.p_name=='党派' }">
												<c:if test="${pro.id==personMessage.tbtsjbxx.dp}">
												${pro.content }
												</c:if>													
											</c:if>
										</c:forEach></td>
							</tr>
							<tr>
								<th>宗教信仰</th>
								<td>
										<c:forEach items="${prolist }" var="pro">
											<c:if test="${pro.p_name=='宗教类别' }">
													<c:if test="${pro.id==personMessage.tbtsjbxx.zjxy}">
													${pro.content }
													</c:if>
											</c:if>
										</c:forEach>
								</td>
								<th>邮编</th>
								<td>${personMessage.tbtsjbxx.yb}</td>
								<th>台湾住址</th>
								<td colspan="3">${personMessage.tbtsjbxx.twzj}</td>
							</tr>
							<tr>
								<th>工作单位及职务</th>
								<td>${personMessage.tbtsjbxx.gzdwjzw}</td>

								<th>社会职务</th>
								<td>${personMessage.tbtsjbxx.shzw}</td>
								<th>联系电话</th>
								<td>${personMessage.tbtsjbxx.lxdh}</td>

								<th>家庭人口</th>
								<td>${personMessage.tbtsjbxx.jtrk}</td>
							</tr>
							<tr>
								<th>家庭经济状况</th>
								<td>${personMessage.tbtsjbxx.jtjjqk}</td>
								<th>称谓</th>
								<td>${personMessage.tbtsjbxx.cw}</td>

								<th>日常联络情况</th>
								<td colspan="3">${personMessage.tbtsjbxx.rcllqk}</td>
							</tr>
							<tr>
								<th>去台人员家庭成员及重要社会关系 </th>
								<td colspan="7">
									<table class="stable" cellpadding="0" cellspacing="1"
										id="qtryjtqktable">
										<tr>
											<th>称谓</th>
											<th>姓名</th>
											<th>出生年月</th>
											<th>政治面貌</th>
											<th colspan="2">工作单位及职务</th>
										</tr>
										<c:forEach items="${personMessage.tbtsjbxx.qtryjtqk}"
											var="qtryjtqkList" varStatus="m" begin="0">
											<tr>
												<td>${qtryjtqkList.cw}</td>
												<td>${qtryjtqkList.xm}</td>
												<td>${qtryjtqkList.csny}</td>
												<td>${qtryjtqkList.zzmm}</td>
												<td colspan="2">${qtryjtqkList.gzdwjzw}</td>
											</tr>
										</c:forEach>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				</c:if>
				<tr>
					<th>通讯地址</th>
					<td colspan="4">${personMessage.txdz}</td>
					<th>邮政编码</th>
					<td>${personMessage.yzbm}</td>
				</tr>
				<tr>
					<th>办公电话</th>
					<td>${personMessage.bgdh}</td>
					<th>手机号码</th>
					<td>${personMessage.sjhm}</td>
					<th>电子信箱</th>
					<td colspan="2">${personMessage.dzxx}</td>
				</tr>
				<tr>
					<th>微信号码</th>
					<td>${personMessage.wxhm}</td>
					<th>QQ号码</th>
					<td colspan="4">${personMessage.qqhm}</td>
				</tr>
				<tr>
					<th>备注</th>
					<td colspan="6">${personMessage.bz}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="button">
				<div class="buttonContent">
					<button type="button" onclick="ExportPDF();">导出</button>
				</div>
			</div></li>
		</ul>
	</div>
	<%@include file="../common/js.jsp"%>
	<%@include file="../common/jstableadd.jsp"%>
</div>
<script>
	function ExportPDF() {
		window.open("Info_ExportPDF?pid=${personMessage.id}");
    }
</script>
</html>