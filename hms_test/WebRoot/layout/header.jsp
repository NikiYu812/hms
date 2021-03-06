<%@ page language="java" import="java.util.*" pageEncoding="utf-8"  %>
<%@ page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link href="<%=basePath%>css/style.css" rel="stylesheet"
	type="text/css">

<style>
<!--
-->
</style>

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
				<img alt="中国航发" src="<%=basePath%>image/logo_small.png"/> <img
					alt="文字logo" src="<%=basePath%>image/logo_text.png" />
				<!-- <a class="navbar-brand" href="#">房屋抽签系统</a> -->
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">导航菜单<span class="caret"></span> </a>
						<ul class="dropdown-menu">
							<li class=""><a href="housingServlet?method=list">旧房屋列表</a></li>
							<li><a href="search.jsp">信息查询</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="search_choose1.jsp">第一轮抽签</a></li>
							<li><a href="search_choose2.jsp">第二轮抽签</a></li>
							<li><a href="housingServlet?method=listNh ">新房源列表</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>