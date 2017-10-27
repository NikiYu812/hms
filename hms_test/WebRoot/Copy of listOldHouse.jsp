<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.List" %>  
<%@page import="com.bean.OldHouse" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>旧房信息详情</title>
</head>
<body>
	method:
	<%
		String method =(String) request.getAttribute("method");
	 %>
	 <%=method %>
	<table>
		<tr>
<!-- 			<th>id</th> -->
			<th>房号</th>
			<th>原承租人</th>
			<th>职工号</th>
			<th>状态</th>
			<th>协议签署人</th>
			<th>身份证号码</th>
			<th>联系电话</th>
			<th>房屋位置</th>
			<th>建筑面积</th>
			<th>协议状态</th>
			<th>搬家状态</th>
			<th>搬家顺序号</th>
		</tr>
<% 
	List<OldHouse> ss = (List<OldHouse>)request.getAttribute("ss");   
    for(OldHouse s : ss){  
 %>
		<tr>
<!-- 			<td><%=s.getId() %></td> -->
			<td><%=s.getHouse_no()  %></td>
			<td><%=s.getP0_name() %></td>
			<td><%=s.getP0_uid() %></td>
			<td><%=s.getP0_state() %></td>
			<td><%=s.getP1_name() %></td>
			<td><%=s.getP1_idcNo() %></td>
			<td><%=s.getTelNo() %></td>
			<td><%=s.getLocation() %></td>
			<td><%=s.getArea() %></td>
			<td><%=s.getSign_state() %></td>
			<td><%=s.getMove_state() %></td>
			<td><%=s.getMove_seq() %></td>
		</tr>
<%} %>	
	</table>
</body>
</html>