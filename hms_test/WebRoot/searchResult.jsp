<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.OldHouse,com.bean.NewHouse"%>
<jsp:include page="layout/header.jsp" flush="true" />

<%
	String method = (String) request.getAttribute("method");
	String kw = (String) request.getAttribute("kw");
	String choose = (String) request.getAttribute("choose");
	NewHouse nh = (NewHouse) request.getAttribute("nh");

	String choose_state = "未抽签";
	String choose_state_class = "red";
	String sign_state = "未签";
	String sign_state_class = "red";
	String move_state = "未搬";
	String move_state_class = "red";

	if (nh.getIsSelected() == 1) {
		choose_state = "已抽签";
		choose_state_class = "";
	}
%>

<div class="container">
	<div class="main">
		<h1 class="search_detail_title">抽签信息</h1>
		<div class="clear"></div>
		<div class="search_detail_body">
			<div class="search_detail">
				<div class="col-md-6">
					<div>
						<span class="search_detail_lable">抽中号码</span> <span
							class="search_detail_content"><%=nh.getChoose_id()%></span>
					</div>
					<div>
						<span class="search_detail_lable">抽签顺序</span> <span
							class="search_detail_content"><%=nh.getSelect_seq()%></span>
					</div>
				</div>
				<div class="col-md-6">
					<div>
						<span class="search_detail_lable">抽中房号</span> <span
							class="search_detail_content"><%=nh.getHouse_no()%></span>
					</div>
					<div>
						<span class="search_detail_lable">抽签顺序</span> <span
							class="search_detail_content"><%=nh.getSelect_seq()%></span>
					</div>
				</div>
			</div>
		</div>


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
				List<OldHouse> ss = (List<OldHouse>) request.getAttribute("ss");
				for (OldHouse s : ss) {
			%>
			<tr>
				<!-- 			<td><%=s.getId()%></td> -->
				<td><%=s.getHouse_no()%></td>
				<td><%=s.getP0_name()%></td>
				<td><%=s.getP0_uid()%></td>
				<td><%=s.getP0_state()%></td>
				<td><%=s.getP1_name()%></td>
				<td><%=s.getP1_idcNo()%></td>
				<td><%=s.getTelNo()%></td>
				<td><%=s.getLocation()%></td>
				<td><%=s.getArea()%></td>
				<td><%=s.getSign_state()%></td>
				<td><%=s.getMove_state()%></td>
				<td><%=s.getMove_seq()%></td>
			</tr>
			<%
				kw = s.getPerson_id();
				}
			%>
		</table>
		<%
			if (choose == "1" || choose.equals("1")) {
		%>
		<form action="oldHouseServlet?method=choose" method="post">
			<div id="btn">
				<input type="submit" value="开始抽签" />
			</div>
		</form>
		<%
			session.setAttribute("kw", kw);
			}
		%>
	</div>
</div>


<jsp:include page="layout/footer.jsp" flush="true" />
