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
	String mzdp=request.getAttribute("mzdp").toString();
	String wdp=request.getAttribute("wdp").toString();
	String ssmz=request.getAttribute("ssmz").toString();
	String zjj=request.getAttribute("zjj").toString();
	String fgyzjj=request.getAttribute("fgyzjj").toString();
	String gatb=request.getAttribute("gatb").toString();
	String xshjc=request.getAttribute("xshjc").toString();
	String dwzsfz=request.getAttribute("dwzsfz").toString();
	String cghgglx=request.getAttribute("cghgglx").toString();
	String tbts=request.getAttribute("tbts").toString();
	String hq=request.getAttribute("hq").toString();
	String qt=request.getAttribute("qt").toString();
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
							        text: '类别结构分析-${year}年',
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
							        data:['民主党派','无党派','少数民族','宗教界','非公有制经济',
							              '港澳同胞','新的社会阶层','党外知识分子','出国和归国留学',
							             '台湾同胞及其在大陆的亲属','华侨、归侨及侨眷','其他需要联系和团结的人员']
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
							            name:'类别比例',
							            type:'pie',
							            radius : '55%',
							            center: ['50%', '60%'],
							            data:[
							                {value:<%=mzdp%>, name:'民主党派'},
							                {value:<%=wdp%>, name:'无党派'},
							                {value:<%=ssmz%>, name:'少数民族'},
							                {value:<%=zjj%>, name:'宗教界'},
							                {value:<%=fgyzjj%>, name:'非公有制经济'},
							                {value:<%=gatb%>, name:'港澳同胞'},
							                {value:<%=xshjc%>, name:'新的社会阶层'},
							                {value:<%=dwzsfz%>, name:'党外知识分子'},
							                {value:<%=cghgglx%>, name:'出国和归国留学'},
							                {value:<%=tbts%>, name:'台湾同胞及其在大陆的亲属'},
							                {value:<%=hq%>, name:'华侨、归侨及侨眷'},
							                {value:<%=qt%>, name:'其他需要联系和团结的人员'}
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
									.getElementById("maintype");
							//加载图表  
							var myChart = ec.init(chartContainer);
							myChart.setOption(option);
						});
					</script>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="St_ByType" method="post" id="ftijao">
	<div class="searchBar">
		<%@include file="form.jsp" %>
	</div>
	</form>
</div>
  <div id="maintype" style="width: 100%; height:400px;"></div>
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
   			<td width="15%">${count }人/${count-count1}人</td>
   		</tr>
  		<tr>
  			<th>民主党派</th>
  			<th>无党派</th>
  			<th>少数民族</th>
  			<th>宗教界</th>
  			<th>非公有制经济</th>
  			<th>港澳同胞</th>
  		</tr>
  		<tr>
  			<td>${mzdp1 }人</td>
  			<td>${wdp1 }人</td>
  			<td>${ssmz1 }人</td>
  			<td>${zjj1 }人</td>
  			<td>${fgyzjj1 }人</td>
  			<td>${gatb1 }人</td>
  		</tr>
  		<tr>
  			<th>新的社会阶层</th>
  			<th>党外知识分子</th>
  			<th>出国和归国留学</th>
  			<th>台湾同胞及其在大陆的亲属</th>
  			<th>华侨、归侨及侨眷</th>
  			<th>其他需要联系和团结的人员</th>
  		</tr>
  		<tr>
  			<td>${xshjc1 }人</td>
  			<td>${dwzsfz1 }人</td>
  			<td>${cghgglx1 }人</td>
  			<td>${tbts1 }人</td>
  			<td>${hq1 }人</td>
  			<td>${qt1 }人</td>
  		</tr>
  </table>
</body>
</html>