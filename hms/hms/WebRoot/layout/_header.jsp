<%@ page language="java" import="java.util.*,com.dao.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	NewHouseDao nhd = new NewHouseDaoImpl();
	List<String> list = nhd.getCount();
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<base href="<%=basePath%>">
<title>房屋管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- Bootstrap core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- Static navbar -->
	<nav class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<img alt="中国航发" src="<%=basePath%>image/logo_small.png" /> <img
					alt="文字logo" src="<%=basePath%>image/logo_text.png" />
				<!-- <a class="navbar-brand" href="#">房屋抽签系统</a> -->
			</div>
			<div class="login_bar"><a href="<%=basePath%>login.jsp">管理员登录</a></div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">导航菜单<span class="caret"></span> </a>
						<ul class="dropdown-menu">
							<li class=""><a href="<%=basePath%>housingServlet?method=list&page=1&kw=">旧房屋列表</a>
							</li>
							<li><a href="<%=basePath%>search.jsp?search_choose=0">信息查询</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="<%=basePath%>search.jsp?search_choose=1">第一轮抽签</a></li>
							<li><a href="<%=basePath%>search.jsp?search_choose=2">第二轮抽签</a></li>
							<li><a href="<%=basePath%>housingServlet?method=listNh">新房源列表</a></li>
						</ul>
					</li>
				</ul>
<!-- 				<form class="navbar-form navbar-right" action="javascript:void(0)">
					<input type="text" class="form-control" placeholder="Search..."
						id="nav-search-input">
				</form> -->
				
			</div>
			
			<!--/.nav-collapse -->
			
		</div>
	</nav>
	<!--计数器  -->
	<div class="newhouse_count">
		<div class="row">
			<ul class="count_block_list">
				<li class="block_green">
					<h2>多层已抽</h2>
					<h2><%=list.get(0) %>套</h2>
				</li>
				<li class="block_blue">
					<h2>多层剩余</h2>
					<h2><%=list.get(1) %>套</h2>
				</li>
				<li class="block_red">
					<h2>高层已抽</h2>
					<h2><%=list.get(2) %>套</h2>
				</li>
				<li class="block_yellow">
					<h2>高层剩余</h2>
					<h2><%=list.get(3) %>套</h2>
				</li>
			</ul>
		</div>
	</div>
