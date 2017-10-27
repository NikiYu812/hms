<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.List" %>  
<%@page import="com.bean.OldHouse" %>
<jsp:include page = "layout/header.jsp" flush = "true" />

<%
	String method =(String) request.getAttribute("method");
	String ohId = "0";
 %>
	 

<div class="container">
<div class="main">
	<div class="h4 title">查询房屋信息</div>
	<form action="oldHouseServlet?method=find&choose=0" method="post" class = "form-inline">
		<div class="form-group">
	    <input type="text" class="form-control" id="inputKeyword"  name="kw" placeholder = "请输入关键字"  style="width:500px;"/>
	    <button type="submit" class="btn  btn-primary"  class = "btn" />开始查询</button>
	  </div>
	</form>
</div>
</div>
<jsp:include page = "layout/footer.jsp" flush = "true" />

