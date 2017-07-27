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
<%
	String zcstr=request.getAttribute("zcstr").toString();
	String json=request.getAttribute("json").toString();
%>
 <script type="text/javascript">
						/* 
						 * 按需加载 
						 * 引入echart.js依赖的zrender.js, 再引入echart.js 
						 */
						require.config({
							packages : [ {
								name : 'zrender',
								location : 'src', // zrender与echarts在同一级目录  
								main : 'zrender'
							}, {
								name : 'echarts',
								location : 'src',
								main : 'echarts'
							} ]
						});
						/***/
						var option ={
							    title : {
							        text: '学位结构分析-${year}年',
							        subtext: '',
							        x:'center'
							    },
							    tooltip : {
							        trigger: 'item',
							        formatter: "{a} <br/><br/>{b} : {c} ({d}%)"
							    },
							    legend: {
							        orient : 'vertical',
							        x : 'left',
							        data:<%=zcstr%>
							    },
							    toolbox: {
							        show : true,
							        feature : {
							            mark : {show: true},
							            dataView : {show: true, readOnly: false},
							            magicType : {
							                show: true, 
							                type: ['pie', 'funnel'],
							                option: {
							                    funnel: {
							                        x: '25%',
							                        width: '50%',
							                        funnelAlign: 'left',
							                        max: 1548
							                    }
							                }
							            },
							            restore : {show: true},
							            saveAsImage : {show: true}
							        }
							    },
							    calculable : true,
							    series : [
							        {
							            name:'学位比例',
							            type:'pie',
							            radius : '55%',
							            center: ['50%', '60%'],
							            data:<%=json%>
							        }
							    ]
							};
						/* 
						 *按需加载 
						 */
						require([ 'echarts', 'echarts/chart/funnel',
								'echarts/chart/pie' ],
						//渲染ECharts图表  
						function DrawEChart(ec) {
							//图表渲染的容器对象  
							var chartContainer = document
									.getElementById("mainxw");
							//加载图表  
							var myChart = ec.init(chartContainer);
							myChart.setOption(option);
						});
					</script>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="St_ByZC" method="post" id="ftijao">
	<div class="searchBar">
		<%@include file="form.jsp" %>
	</div>
	</form>
</div>
  <div id="mainxw" style="width: 100%; height:400px;"></div>
   <table class="stable" cellpadding="0" cellspacing="1">
   		<tr>
   			<th width="15%">年份</th>
   			<td width="15%">${year}年</td>
   			<th width="15%">所属队伍</th>
   			<td width="15%">
				<c:if test="${dw==1 }">
					代表人士
				</c:if>
				<c:if test="${dw==2 }">
					后备人才
				</c:if>
				<c:if test="${dw==0}">
					全部
				</c:if>
			</td>
			<th width="15%">总计人数/有效人数</th>
			<c:set var="aaa"/>
			<c:forEach items="${nums }" var="a">
  				<c:set var="aaa" value="${aaa+a}"/>
  			</c:forEach>
   			<td width="15%">${count }人/${aaa}人</td>
   		</tr>
  		<tr>
  			<td colspan="6">
  				<table class="stable" cellpadding="0" cellspacing="1">
  					<tr>
  						<c:forEach items="${zclist }" var="a">
  							<th width="10%">${a.content }</th>
  						</c:forEach>
  					</tr>
  					<tr>
  						<c:forEach items="${nums }" var="a">
  							<td>${a }人</td>
  						</c:forEach>
  					</tr>
  				</table>
  			</td>
  		</tr>
  </table>
</body>
</html>