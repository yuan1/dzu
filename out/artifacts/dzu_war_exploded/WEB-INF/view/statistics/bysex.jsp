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
	String mancount=request.getAttribute("mancount").toString();
	String womancount=request.getAttribute("womencount").toString();
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
							        text: '性别结构分析-${year}年',
							        subtext: '当前共查询到${count}人',
							        x:'center'
							    },
							    tooltip : {
							        trigger: 'item',
							        formatter: "{a} <br/><br/>{b} : {c} ({d}%)"
							    },
							    legend: {
							        orient : 'vertical',
							        x : 'left',
							        data:['男','女']
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
							            name:'性别比例',
							            type:'pie',
							            radius : '55%',
							            center: ['50%', '60%'],
							            data:[
							                {value:<%=mancount%>, name:'男'},
							                {value:<%=womancount%>, name:'女'}
							            ]
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
									.getElementById("mainsex");
							//加载图表  
							var myChart = ec.init(chartContainer);
							myChart.setOption(option);
						});
					</script>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="St_BySex" method="post" id="ftijao">
	<div class="searchBar">
		<%@include file="form.jsp" %>
	</div>
	</form>
</div>
  <div id="mainsex" style="width: 100%; height:400px;"></div>
  <table class="stable" cellpadding="0" cellspacing="1">
  		<tr>
  			<th>年份</th>
  			<th>所属队伍</th>
  			<th>总计人数</th>
  			<th>有效人数</th>
  			<th>男性人数</th>
  			<th>女性人数</th>
  		</tr>
  		<tr>
  			<td>${year }年</td>
  			<td>
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
  			<td>${count}人</td>
  			<td>${mancount+womencount }人</td>
  			<td>${mancount }人</td>
  			<td>${womencount }人</td>
  		</tr>
  </table>
</body>
</html>