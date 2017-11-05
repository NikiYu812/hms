<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.NewHouse,com.bean.Person"%>
<jsp:include page="layout/header.jsp" flush="true" />

<%
	String method =(String) request.getAttribute("method");
	List<NewHouse> nhs = (List<NewHouse>)request.getAttribute("nhs");   
%>


<div class="container">

	<div class="panel panel-primary  house_list_table">
		<!-- Default panel contents -->
		<div class="panel-heading">新房源列表</div>

		<table class="table table-striped table-hover center ">
			<thead>
				<tr class="">
					<!-- 			<th>id</th> -->
					<th>新房编号</th>
					<th>新房房号</th>
					<th>建筑面积</th>
					<th>建筑类型</th>
					<th>房屋状态</th>
					<th>原承租人姓名</th>
					<th>抽签顺序</th>
					<th>抽签时间</th>
				</tr>
			</thead>
			<tbody>
				<%
			    for(NewHouse nh : nhs){
			    	String select_state = "未被选";
						String select_state_class = "red";
						if(nh.getIsSelected()==1){
							select_state = "已被选";
							select_state_class = "green";
						}
						String building_type = "";
						if(nh.getBuilding_type()==1){
							building_type = "多层";
						}else if(nh.getBuilding_type()==2){
							building_type = "高层";
						}
						
				%>
				<tr>
					<td><%=nh.getChoose_id()%></td>
					<td><%=nh.getHouse_no()%></td>
					<td><%=nh.getArea()%></td>
					<td><%=building_type %></td>
					<td class="<%=select_state_class%>"><%=select_state%></td>
					<td><%=nh.getP0_name()%></td>
					<td><%=nh.getSelect_seq()%></td>
					<td><%=nh.getSelect_time()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="layout/footer.jsp" flush="true" />
