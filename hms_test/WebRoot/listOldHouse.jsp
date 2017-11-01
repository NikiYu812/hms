<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page
	import="com.bean.OldHouse,com.bean.Person,net.sf.json.JSONObject"%>
<jsp:include page="layout/header.jsp" flush="true" />

<%
	String method = (String) request.getAttribute("method");
	String ohId = "0";
%>


<div class="container">

	<div class="panel panel-primary  house_list_table">
		<!-- Default panel contents -->
		<div class="panel-heading">旧房屋列表</div>

		<table class="table table-striped table-hover center " id="table">
			<thead>
				<tr class="">
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
					List<OldHouse> ss = (List<OldHouse>) request.getAttribute("ss");
					for (OldHouse s : ss) {
						ohId = s.getId() + "";
						String sign_state = "未签";
						String sign_state_class = "red";
						String move_state = "未搬";
						String move_state_class = "red";
						if (s.getSign_state() == 1) {
							sign_state = "已签";
							sign_state_class = "green";
						}
						if (s.getMove_state() == 1) {
							move_state = "已搬";
							move_state_class = "green";
						}
						JSONObject json = JSONObject.fromObject(s);
						String strJson = json.toString();
				%>
				<tr>
					<!-- 			<td><%=s.getId()%></td> -->
					<td><%=s.getHouse_no()%></td>
					<td><%=s.getP0_name()%></td>
					<%-- <td><%=s.getP0_uid() %></td> --%>
					<%-- <td><%=s.getP0_state() %></td> --%>
					<td><%=s.getP1_name()%></td>
					<%-- <td><%=s.getP1_idcNo() %></td> --%>
					<td><%=s.getTelNo()%></td>
					<%-- <td><%=s.getLocation() %></td> --%>
					<td><%=s.getArea()%></td>
					<td class="<%=sign_state_class%>"><%=sign_state%></td>
					<td class="<%=move_state_class%>"><%=move_state%></td>
					<td><%=s.getMove_seq()%></td>
					<td><a href="#" data-toggle="modal" data-target="#myModal"
						onclick='Detail(<%=strJson%>)'>查看详情</a>
					</td>
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
				<h4 class="modal-title" id="myModalLabel">查看详情</h4>
			</div>
			<div id="oldHouseDetails" class="modal-body hms_main">

				<h6 class="search_detail_title">旧房信息</h6>
				<div class="search_detail_body">
					<ul class="col-md-3">
						<li><span class="search_detail_lable">房号</span> <span
							class="search_detail_content" id="oh_house_no"></span></li>
					</ul>
					<ul class="col-md-3">
						<li><span class="search_detail_lable">建筑面积</span> <span
							class="search_detail_content" id="oh_area"></span></li>
					</ul>
					<ul class="col-md-3">
						<li><span class="search_detail_lable">搬家状态</span> <span
							class="search_detail_content" id="oh_move_state"></span></li>
					</ul>
					<ul class="col-md-3">
						<li><span class="search_detail_lable">搬家顺序号</span> <span
							class="search_detail_content" id="oh_move_seq"></span></li>
					</ul>
				</div>
				<hr>
				<h6 class="search_detail_title">人员信息</h6>
				<div class="search_detail_body long">
					<ul class="col-md-12">
						<li><span class="search_detail_lable">协议状态</span> <span
							class="search_detail_content" id="oh_sign_state"></span></li>
					</ul>
					<ul class="col-md-6 top0">
						<li><span class="search_detail_lable">原承租人姓名</span> <span
							class="search_detail_content" id="oh_p0_name"></span></li>
						<li><span class="search_detail_lable">协议签署人姓名</span> <span
							class="search_detail_content" id="oh_p1_name"></span></li>
					</ul>
					<ul class="col-md-6 top0">
						<li><span class="search_detail_lable">原承租人职工号</span> <span
							class="search_detail_content" id="oh_p0_uid"></span></li>
						<li><span class="search_detail_lable">协议签署人身份证号</span> <span
							class="search_detail_content" id="oh_p1_idcNo"></span></li>
					</ul>
					<ul class="col-md-12 top0">
						<li><span class="search_detail_lable">联系电话</span> <span
							class="search_detail_content" id="oh_telNo"></span></li>
					</ul>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

<jsp:include page="layout/footer.jsp" flush="true" />
