
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<%=basePath %>js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="<%=basePath %>js/jquery.min.js"><\/script>')</script>
    <script src="<%=basePath %>js/bootstrap.min.js"></script>
		<script src="<%=basePath %>js/hms.js"></script>
  </body>
