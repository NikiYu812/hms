<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.*"%>
<jsp:include page="layout/header.jsp" flush="true" />

<style>
<!--
-->
</style>

<%
	String choose = (String) request.getAttribute("choose");
	List<OldHouse> ohs = (List<OldHouse>) request.getAttribute("ss");
	Person p = ohs.get(0).getPerson();

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
			class="black_block" /> <span class="board_block">查询结果页面</span>
	</div>
	<div class="hms_main">
		<h3 class="search_detail_title">
			抽签信息 （<span class="<%=choose_state_class%>"><%=choose_state%></span>）
		</h3>
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
		<%if (p.getChoose_state() == 2) {
			String building_type = "";
			if(p.getNewHouse().getBuilding_type()==1){
				building_type = "多层";
			}else if(p.getNewHouse().getBuilding_type()==2){
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
		
		<h3 class="search_detail_title">
			人员信息 （<span class="<%=sign_state_class%>"><%=sign_state%></span>）
		</h3>
		<div class="search_detail_body  long">
			<ul class="col-md-5">
				<li><span class="search_detail_lable">原承租人姓名</span> <span
					class="search_detail_content"><%=p.getP0_name()%></span></li>
				<li><span class="search_detail_lable">协议签署人姓名</span> <span
					class="search_detail_content"><%=p.getP1_name()%></span></li>

			</ul>
			<ul class="col-md-7">
				<li><span class="search_detail_lable">原承租人职工号</span> <span
					class="search_detail_content"><%=p.getP0_uid()%></span></li>
				<li><span class="search_detail_lable">协议签署人身份证号</span> <span
					class="search_detail_content"><%=p.getP1_idcNo()%></span></li>
			</ul>
			<ul class="col-md-12 top0">
				<li><span class="search_detail_lable">联系电话</span> <span
					class="search_detail_content"><%=p.getTelNo()%></span></li>
			</ul>
		</div>
		<hr />

		<div class="clearfix"></div>

		<%
			if (choose == "1" || choose.equals("1")) {
				//判断第一轮抽签按钮显示条件(判断如果未签协议，或者如果已抽签，不显示抽签按钮)
				if (p.getSign_state() == 0 || ohs.get(0).getMove_state() == 0
						|| p.getChoose_state() != 0) {
					choose = "0";
				}
			} else if (choose == "2" || choose.equals("2")) {
				if (p.getChoose_state() != 1) {
					choose = "0";
				}
			} else {
				choose = "0";
			}
			System.out.println("choose:" + choose);

			if (choose == "1" || choose.equals("1")) {
				session.setAttribute("person_id", p.getId());
		%>
		<form action="housingServlet?method=choose1" method="post">
			<div id="btn">
				<input type="submit" value="开始第一轮抽签"
					class="btn  btn-primary btn-lg btn-hms-lg" />
			</div>
		</form>
		<%
			} else if (choose == "2" || choose.equals("2")) {
				session.setAttribute("person_id", p.getId());
		%>
		<form action="housingServlet?method=choose2" method="post" class="choose2">
			<h4>请选择要抽选的房源类型</h4>
			<select class="form-control" name="building_type" style="width: 200px;position: relative;top: 2px;">
			  <option value="1">多层</option>
			  <option value="2">高层</option>
			</select>
			<div class="clearfix"></div>
			<div id="btn">
				<input type="submit" value="开始第二轮抽签"
					class="btn  btn-primary btn-lg btn-hms-lg" />
			</div>
		</form>
		<%
			}
		%>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />
