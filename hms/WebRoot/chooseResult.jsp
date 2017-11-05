<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.bean.*,java.util.List"%>
<jsp:include page="layout/header.jsp" flush="true" />
<%
	List<OldHouse> ohs = (List<OldHouse>) request.getAttribute("ohs");
	Person p = ohs.get(0).getPerson();

	String hms_title = "";
	if (p.getChoose_state() == 1) {
		hms_title = "第一轮抽签结果";
	} else if (p.getChoose_state() == 2) {
		hms_title = "第二轮抽签结果";
	} else {
		response.sendRedirect("error.jsp");
	}
	
	String choose_state = "未抽签";
	String choose_state_class = "red";
	String sign_state = "协议未签";
	String sign_state_class = "red";
	String move_state = "未搬";
	String move_state_class = "red";

	if (p.getChoose_state() == 1) {
		choose_state = "第一轮已抽签，第二轮未抽签";
		choose_state_class = "warning";
	} else if (p.getChoose_state() == 2) {
		choose_state = "第二轮已抽签";
		choose_state_class = "green";
	}
	if (p.getSign_state() == 1) {
		sign_state = "协议已签";
		sign_state_class = "green";
	}
%>
<div class="container hms_container">
	<div class="hms_title">
		<img alt="black_block" src="./image/black_block.png"
			class="black_block" /> <span class="board_block"><%=hms_title %></span>
	</div>
	<div class="hms_main">
		<div class="choose_result">
		<% if(p.getChoose_state()==1){ %>
			<span class="choose_result_lable" style="margin-left: 0;">您抽中的号码是</span> <span class="choose_result_content"><%=p.getChoose1_result()%></span> 
		<% }else if(p.getChoose_state() == 2){ %>
			<span class="choose_result_lable" style="margin-left: 0;">您抽中的号码是</span> <span class="choose_result_content"><%=p.getChoose2_result()%></span> 
			<span class="choose_result_lable">您抽中的房号是</span> <span class="choose_result_content"><%=p.getNewHouse().getHouse_no()%></span> 
		<%} %>
		</div>
		<hr />
		
		<h3 class="search_detail_title">抽签信息 （<span class="<%=choose_state_class%>"><%=choose_state%></span>）</h3>
		<div class="search_detail_body">
			<%
				if (p.getChoose_state() == 1 || p.getChoose_state() == 2) {
			%>
			<div class="section">
				<h5>/* 第一轮抽签结果 */</h5>
				<ul class="col-md-2 top0">
					<li><span class="search_detail_lable">抽中号码</span> <span
						class="search_detail_content"><%=p.getChoose1_result()%></span></li>
				</ul>
				<ul class="col-md-3 top0">
					<li><span class="search_detail_lable">抽签顺序</span> <span
						class="search_detail_content"><%=p.getChoose1().getSelect_seq()%></span>
					</li>
				</ul>
				<ul class="col-md-7 top0">
					<li><span class="search_detail_lable">抽签时间</span> <span
						class="search_detail_content"><%=p.getChoose1().getSelect_time()%></span>
					</li>
				</ul>
			</div>
			<%
				}
				if (p.getChoose_state() == 2) {
			%>
			<div class="section">
				<h5>/* 第二轮抽签结果 */</h5>
				<ul class="col-md-2">
					<li><span class="search_detail_lable">抽中号码</span> <span
						class="search_detail_content"><%=p.getNewHouse().getChoose_id()%></span>
					</li>
				</ul>
				<ul class="col-md-3">
					<li><span class="search_detail_lable">抽中房号</span> <span
						class="search_detail_content"><%=p.getNewHouse().getHouse_no()%></span>
					</li>
				</ul>
				<ul class="col-md-2">
					<li><span class="search_detail_lable">抽签顺序</span> <span
						class="search_detail_content"><%=p.getNewHouse().getSelect_seq()%></span>
					</li>
				</ul>
				<ul class="col-md-5">
					<li><span class="search_detail_lable">抽签时间</span> <span
						class="search_detail_content"><%=p.getNewHouse().getSelect_time()%></span>
					</li>
				</ul>
			</div>
			<%
				}
			%>
		</div>
		<hr />
		
		<%
			if (p.getChoose_state() == 2) {
				String building_type = "";
				if (p.getNewHouse().getBuilding_type() == 1) {
					building_type = "多层";
				} else if (p.getNewHouse().getBuilding_type() == 2) {
					building_type = "高层";
				}
		%>
		<h3 class="search_detail_title">新房信息</h3>
		<div class="search_detail_body ">
			<ul class="col-md-4">
				<li><span class="search_detail_lable">房号</span> <span
					class="search_detail_content"><%=p.getNewHouse().getHouse_no()%></span>
				</li>
			</ul>
			<ul class="col-md-4">
				<li><span class="search_detail_lable">建筑类型</span> <span
					class="search_detail_content"><%=building_type%></span>
				</li>
			</ul>
			<ul class="col-md-4">
				<li><span class="search_detail_lable">建筑面积</span> <span
					class="search_detail_content"><%=p.getNewHouse().getArea()%></span>
				</li>
			</ul>
		</div>
		<hr />
		<%} %>
		
		<h3 class="search_detail_title">旧房信息</h3>
		<div class="search_detail_body">
			<%
				for (OldHouse oh : ohs) {
					if (oh.getMove_state() == 1) {
						move_state = "已搬家";
						move_state_class = "green";
					}
			%>
			<ul class="col-md-3">
				<li><span class="search_detail_lable">房号</span> <span
					class="search_detail_content"><%=oh.getHouse_no()%></span></li>
			</ul>
			<ul class="col-md-3">
				<li><span class="search_detail_lable">建筑面积</span> <span
					class="search_detail_content"><%=oh.getArea()%></span></li>
			</ul>
			<ul class="col-md-3">
				<li><span class="search_detail_lable">搬家状态</span> <span
					class="search_detail_content  <%=move_state_class%>"><%=move_state%></span>
				</li>
			</ul>
			<ul class="col-md-3">
				<li><span class="search_detail_lable">搬家顺序号</span> <span
					class="search_detail_content "><%=oh.getMove_seq()%></span></li>
			</ul>
			<%
				}
			%>
		</div>
		<hr />

		<h3 class="search_detail_title">人员信息 （<span class="<%=sign_state_class%>"><%=sign_state%></span>）</h3>
		<div class="search_detail_body  long">
			<ul class="col-md-6">
				<li><span class="search_detail_lable">原承租人姓名</span> <span
					class="search_detail_content"><%=p.getP0_name()%></span>
				</li>
				<li><span class="search_detail_lable">协议签署人姓名</span> <span
					class="search_detail_content"><%=p.getP1_name()%></span>
				</li>
				<li><span class="search_detail_lable">联系电话</span> <span
					class="search_detail_content"><%=p.getTelNo()%></span>
				</li>
			</ul>
			<ul class="col-md-6">
				<li><span class="search_detail_lable">原承租人职工号</span> <span
					class="search_detail_content"><%=p.getP0_uid()%></span>
				</li>
				<li><span class="search_detail_lable">协议签署人身份证号</span> <span
					class="search_detail_content"><%=p.getP1_idcNo()%></span>
				</li>
			</ul>
		</div>
		<hr />

	</div>
</div>

<jsp:include page="layout/footer.jsp" flush="true" />
