<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>柳州市党外代表人士信息管理系统</title>
<%@include file="common/include.jsp" %>
<script type="text/javascript">
	$(function() {
		DWZ.init("dwz/dwz.frag.xml", {
			loginUrl : "index.jsp", // 跳到登录页面
			ui : {
				hideMode : 'offsets'
			}, //【可选】hideMode:navTab组件切换的隐藏方式，支持的值有’display’，’offsets’负数偏移位置的值，默认值为’display’
			debug : false, // 调试模式 【true|false】
			callback : function() {
				initEnv();
				$("#themeList").theme({
					themeBase : "dwz/themes"
				}); // themeBase 相对于index页面的主题base路径
			}
		});
	});
</script>
</head>
<body>
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				柳州市党外代表人士信息管理系统
				<ul class="nav">
					<li>欢迎：${users.username }，登录</li>
					<li><a href="Login_quit">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div>蓝色</div></li>
					<li theme="green"><div class="selected">绿色</div></li>
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>

			<!-- navMenu -->

		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>功能菜单</h2>
					<div>收缩</div>
				</div>

				<div class="accordion" fillSpace="sidebar">
				<c:forEach items="${topMenusList}" var="top">
				<c:if test="${top.menus.id==null}">
						<div class="accordionHeader">
							<h2>
								<span>Folder</span> 
								${top.menu_name}
							</h2>
						</div>
						<div class="accordionContent">
							<ul class="tree tree1Folder">
							<table width="100%" cellpadding="0" cellspacing="0">
								<!-- <li style="clear:both; display:block; line-height:22px;"><a href="${menu.url}" target="navTab"
									rel="${menu.url}" style="display:inherit; height:22px; line-height:22px;">${menu.menu_name }</a></li> -->
									<c:forEach items="${top.children }" var="menu2">
									<c:set var="a" value=",${menu2.id },"/>
									<c:if test="${fn:contains(menusids,a)}">
									<tr height="22px" style="line-height:22px;">
										<td class="aaaa" style="cursor:pointer;" onmouseover="this.style.backgroundColor ='#F5F5F5';" onmouseout="this.style.backgroundColor ='#fff';">
											<img alt="" src="dwz/themes/css/img/file.png" width="14px" height="14px" style="padding-left:15%;"/>
											&nbsp;&nbsp;
											<a href="${menu2.url }" target="navTab"
												rel="${menu2.url }">${menu2.menu_name }</a>
										</td>
									</tr>
									</c:if>
									</c:forEach>
							</table>
							</ul>
						</div>
				</c:if>
				</c:forEach>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span
										class="home_icon">主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div>
					<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox" style="overflow:auto;">
						<div class="accountInfo">
							<p>
								<span>欢迎使用</span>
							</p>
							<p>党外代表人士信息管理系统</p>
						</div>
						<div class="pageFormContent" layoutH="80">
														<pre style="margin: 5px; line-height: 1.4em">
一、请查看最新的通知公告。<br>
二、本系统采用最新Java开源框架开发<br>
三、如有疑问，请电话咨询：0534-8888888。<br>
</pre>

							<div class="divider"></div>
								<h2></h2>
	
							<div class="divider"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div id="footer">
		Copyright &copy; 2016&nbsp;德州学院   Inc. All Rights
			Reserved.
	</div>
</body>
</html>