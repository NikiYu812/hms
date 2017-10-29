<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.bean.NewHouse,com.bean.Person"%>
<jsp:include page="layout/header.jsp" flush="true" />
<%
	NewHouse nh = (NewHouse) request.getAttribute("nh");
	Person p = nh.getPerson();
%>
<div class="container hms_container">
	<div class="hms_title">
		<img alt="black_block" src="./image/black_block.png"
			class="black_block" /> <span class="board_block">抽签结果页面</span>
	</div>
	<div class="hms_main">
		<div class="choose_result">
			<span class="choose_result_lable" style="margin-left: 0;">您抽中的号码是</span> <span class="choose_result_content"><%=nh.getChoose_id()%></span> 
			<span class="choose_result_lable">您抽中的房号是</span> <span class="choose_result_content"><%=nh.getHouse_no()%></span> 
		</div>
		<hr />
		<h3 class="search_detail_title">抽签结果</h3>
		<div class="search_detail_body">
			<ul class="col-md-2">
				<li><span class="search_detail_lable">抽中号码</span> <span
					class="search_detail_content"><%=nh.getChoose_id()%></span></li>
			</ul>
			<ul class="col-md-3">
				<li><span class="search_detail_lable">抽中房号</span> <span
					class="search_detail_content"><%=nh.getHouse_no()%></span></li>
			</ul>

			<ul class="col-md-2">
				<li><span class="search_detail_lable">抽签顺序</span> <span
					class="search_detail_content"><%=nh.getSelect_seq()%></span></li>
			</ul>
			<ul class="col-md-5">
				<li><span class="search_detail_lable">抽签时间</span> <span
					class="search_detail_content"><%=nh.getSelect_time()%></span></li>
			</ul>
		</div>
		<hr />

		<h3 class="search_detail_title">人员信息</h3>
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
		
		<h3 class="search_detail_title">新房信息</h3>
		<div class="search_detail_body ">
			<ul class="col-md-6">
				<li><span class="search_detail_lable">房号</span> <span
					class="search_detail_content"><%=nh.getHouse_no()%></span>
				</li>
			</ul>
			<ul class="col-md-6">
				<li><span class="search_detail_lable">建筑面积</span> <span
					class="search_detail_content"><%=nh.getArea()%></span>
				</li>
			</ul>
		</div>
		<hr />



	</div>
</div>

<jsp:include page="layout/footer.jsp" flush="true" />
