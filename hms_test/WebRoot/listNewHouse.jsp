<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.NewHouse,com.bean.Person"%>
<jsp:include page="layout/header.jsp" flush="true" />

<%
	String method =(String) request.getAttribute("method");
	String nhId = "0";
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
					<th>房屋状态</th>
					<th>抽签人姓名</th>
					<th>联系电话</th>
					<th>抽签顺序</th>
					<th>抽签时间</th>
				</tr>
			</thead>
			<tbody>
				<%
					List<NewHouse> nhs = (List<NewHouse>)request.getAttribute("nhs");   
			    for(NewHouse nh : nhs){
			   		nhId = nh.getId()+"";
			    	String select_state = "未被选";
						String select_state_class = "red";
						if(nh.getIsSelected()==1){
							select_state = "已被选";
							select_state_class = "green";
						}
				%>
				<tr>
					<td><%=nh.getChoose_id()%></td>
					<td><%=nh.getHouse_no()%></td>
					<td><%=nh.getArea()%></td>
					<td class="<%=select_state_class%>"><%=select_state%></td>
					<td><%=nh.getPerson().getP1_name()%></td>
					<td><%=nh.getPerson().getTelNo()%></td>
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

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
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

<jsp:include page="layout/footer.jsp" flush="true" />
<script type="text/javascript">

</script>
