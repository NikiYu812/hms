<%@ page language="java" import="java.util.*,com.dao.*"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理员登录</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!-- Bootstrap core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    //onblur失去焦点的值
    
    //定义一个变量用于存放XMLHttpRequest对象
    var xmlHttp;
    function checkLogin(){
        //获取文本框的值    
        var account=document.getElementById("account").value;
        //alert("测试获取文本框的值："+account);
        //先创建XMLHttpRequest对象
        // code for IE7+, Firefox, Chrome, Opera, Safari
        if (window.XMLHttpRequest) {
            xmlHttp = new XMLHttpRequest();
        } else {// code for IE6, IE5
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        //服务器地址和数据
        var url="system/usercheck?account="+account;
        //规定请求的类型、URL 以及是否异步处理请求。
        xmlHttp.open("GET",url,true);
        //将请求发送到服务器
        xmlHttp.send();
        //回调函数
        xmlHttp.onreadystatechange=function(){
            if (xmlHttp.readyState==4 && xmlHttp.status==200){
                //给div设置内容
                document.getElementById("errorAccount").innerHTML = xmlHttp.responseText;
            }
        }
        //给div设置内容
        //document.getElementById("errorAccount").innerHTML=account;
    }
</script>
</head>
<body>
<div class="container">
	<div class="logo_wrap">
		<img alt="中国航发" src="<%=basePath%>image/logo_small.png" /> 
		<img alt="文字logo" src="<%=basePath%>image/logo_text.png" />
	</div>
	<div class="login_table">
		<form action="javascript:void(0)" method="post" class="form-inline  login">
			<div class="alert alert-danger alert-dismissible hidden" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>用户名或密码错误</div>
			<div class="form-group">
				<input type="text" class="form-control" id="input-username" name="username" placeholder="用户名" />
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="input-password" name="password" placeholder="密码" />
			</div>
			<div class="form-group">
				<button type="submit" class="btn  btn-primary  btn-login" onclick="checkLogin()">登录</button>
			</div>
		</form>
	</div>
</div>

<div id="footer">
	<div class="version_links">
		<span class="version">当前版本：v1.0</span>
		<ul class="links">
			<li><a href="">免责声明</a></li>
			<li><a href="">协议条款</a></li>
			<li><a href="">联系我们</a></li>
		</ul>
	</div>
	<div class="copyright">版权所有：中国航发沈阳发动机研究所-信息技术中心</div>
</div>

</body>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<%=basePath %>js/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="<%=basePath %>js/jquery.min.js"><\/script>')</script>
<script src="<%=basePath %>js/bootstrap.min.js"></script>
<script src="<%=basePath %>js/hms.js"></script>
</html>
