<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.List" %>  
<%@page import="com.bean.OldHouse" %>
<jsp:include page = "layout/header.jsp" flush = "true" />

<%
	String method =(String) request.getAttribute("method");
	String ohId = "0";
 %>
	 

<div class="container">

	<div class="panel panel-primary">
  <!-- Default panel contents -->
  <div class="panel-heading">旧房屋列表</div>
	
	<table class = "table table-striped table-hover center" >
			<thead>
				<tr class ="" >
		<!-- 			<th>id</th> -->
					<th>房号</th>
					<th>原承租人</th>
					<!-- <th>职工号</th> -->
					<!-- <th>状态</th> -->
					<th>协议签署人</th>
					<!-- <th>身份证号码</th> -->
					
	 				<th>联系电话</th>
					<!-- <th>房屋位置</th> -->
					<th>建筑面积</th>
					<th>协议状态</th>
					<th>搬家状态</th>
					<th>搬家顺序号</th>
					<th>详情</th>
				</tr>
			</thead>
			<tbody>
	<% 
	
		List<OldHouse> ss = (List<OldHouse>)request.getAttribute("ss");   
	    for(OldHouse s : ss){  
	   		ohId = s.getId()+"";
	    	String sign_state = "未签";
				String sign_state_class = "red";
				String move_state = "未搬";
				String move_state_class = "red";
				if(s.getSign_state()==1){
					sign_state = "已签";
					sign_state_class = "";
				}
				if(s.getMove_state() == 1){
					move_state = "已搬";
					move_state_class = "";
				}
	 %>
			<tr>
	<!-- 			<td><%=s.getId() %></td> -->
				<td><%=s.getHouse_no()  %></td>
				<td><%=s.getP0_name() %></td>
				<%-- <td><%=s.getP0_uid() %></td> --%>
				<%-- <td><%=s.getP0_state() %></td> --%>
				<td><%=s.getP1_name() %></td>
				<%-- <td><%=s.getP1_idcNo() %></td> --%>
				<td><%=s.getTelNo() %></td>
				<%-- <td><%=s.getLocation() %></td> --%>
				<td><%=s.getArea() %></td>
				<td class="<%=sign_state_class %>"><%=sign_state %></td>
				<td class="<%=move_state_class %>"><%=move_state %></td>
				<td><%=s.getMove_seq() %></td>
				<td><a href="#" data-toggle="modal" data-target="#myModal"  onclick="Detail(<%=s%>)">查看详情</a></td>					
			</tr>
	<%
	
	}
	 %>
	</tbody>	
	</table>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div id="oldHouseDetails" class="modal-body">
      	<input type="text" id="id" name="id" value="" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<jsp:include page = "layout/footer.jsp" flush = "true" />
<script type="text/javascript">

</script>
