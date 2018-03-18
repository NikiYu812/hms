<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<style>

}
</style>
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