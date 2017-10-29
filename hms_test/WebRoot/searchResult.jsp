<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.OldHouse,com.bean.NewHouse"%>
<jsp:include page="layout/header.jsp" flush="true" />

<style>
<!--
-->
</style>

<%
	String method = (String) request.getAttribute("method");
	String kw = (String) request.getAttribute("kw");
	String choose = (String) request.getAttribute("choose");
	NewHouse nh = (NewHouse) request.getAttribute("nh");
	List<OldHouse> ss = (List<OldHouse>) request.getAttribute("ss");
	OldHouse oh = ss.get(0);
	kw = oh.getPerson_id();
	String choose_state = "未抽签";
	String choose_state_class = "red";
	String sign_state = "协议未签";
	String sign_state_class = "red";
	String move_state = "未搬";
	String move_state_class = "red";

	if (nh.getIsSelected() == 1) {
		choose_state = "已抽签";
		choose_state_class = "green";
	}
	if(oh.getSign_state() == 1){
		sign_state = "协议已签";
		sign_state_class = "green";
	}
%>
<div class="container hms_container">
	<div class="hms_title">
		<img alt="black_block" src="./image/black_block.png"
			class="black_block" /> <span class="board_block">查询结果页面</span>
	</div>
	<div class="hms_main">
			<h3 class="search_detail_title">抽签信息</h3>
			<div class="search_detail_body">
				<ul class="col-md-12">
					<li><span class="search_detail_lable">抽签状态</span> <span
						class="search_detail_content  <%=choose_state_class%>"><%=choose_state%></span></li>
				</ul>
				<%if(choose_state == "已抽签"||choose_state.equals("已抽签")){ %>
				<ul class="col-md-3">
					<li><span class="search_detail_lable">抽中房号</span> <span
						class="search_detail_content"><%=nh.getHouse_no()%></span></li>
				</ul>
				<ul class="col-md-3">
					<li><span class="search_detail_lable">抽中号码</span> <span
						class="search_detail_content"><%=nh.getChoose_id()%></span></li>
				</ul>
				<ul class="col-md-3">
					<li><span class="search_detail_lable">抽签顺序</span> <span
						class="search_detail_content"><%=nh.getSelect_seq()%></span></li>
				</ul>
				<%} %>
			</div>
			<hr />
			<h3 class="search_detail_title">人员信息</h3>
			<div class="search_detail_body  long">
				<ul class="col-md-6">
					<li><span class="search_detail_lable">原承租人姓名</span> <span
						class="search_detail_content"><%=oh.getP0_name()%></span></li>
					<li><span class="search_detail_lable">协议签署人姓名</span> <span
						class="search_detail_content"><%=oh.getP1_name()%></span></li>
					<li><span class="search_detail_lable">联系电话</span> <span
						class="search_detail_content"><%=oh.getTelNo()%></span></li>
				</ul>
				<ul class="col-md-6">
					<li><span class="search_detail_lable">原承租人职工号</span> <span
						class="search_detail_content"><%=oh.getP0_uid()%></span></li>
					<li><span class="search_detail_lable">协议签署人身份证号</span> <span
						class="search_detail_content"><%=oh.getP1_idcNo()%></span></li>
					<li><span class="search_detail_lable">协议状态</span> <span
						class="search_detail_content <%=sign_state_class%>"><%=sign_state%></span></li>
				</ul>
			</div>
			<hr />

			<div class="clear"></div>
			<h3 class="search_detail_title">旧房信息</h3>
			<div class="search_detail_body">
				<%
					for (OldHouse s : ss) {
						if (s.getMove_state() == 1) {
							move_state = "已搬家";
							move_state_class = "green";
						}
				%>
				<ul class="col-md-3">
					<li><span class="search_detail_lable">房号</span> <span
						class="search_detail_content"><%=s.getHouse_no()%></span></li>
				</ul>
				<ul class="col-md-3">
					<li><span class="search_detail_lable">建筑面积</span> <span
						class="search_detail_content"><%=s.getArea()%></span></li>
				</ul>
				<ul class="col-md-3">
					<li><span class="search_detail_lable">搬家状态</span> <span
						class="search_detail_content  <%=move_state_class %>"><%=move_state%></span></li>
				</ul>
				<ul class="col-md-3">
					<li><span class="search_detail_lable">搬家顺序号</span> <span
						class="search_detail_content "><%=s.getMove_seq()%></span></li>
				</ul>
				<%
					}
				%>
			</div>
			<hr />
	<%
			if (choose == "1" || choose.equals("1")) {
		%>
		<form action="oldHouseServlet?method=choose" method="post">
			<div id="btn">
				<input type="submit" value="开始抽签"  class="btn  btn-primary btn-lg btn-hms-lg"/>
			</div>
		</form>
		<%
			session.setAttribute("kw", kw);
			}
		%>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />
