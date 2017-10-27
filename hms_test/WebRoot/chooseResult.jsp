<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.bean.NewHouse"%>
<jsp:include page="layout/header.jsp" flush="true" />
<%
	NewHouse nh = (NewHouse) request.getAttribute("nh");
%>

<div class="container">
	<div class="main">
		<div>
			<span>您抽中的号码是</span> <span><%=nh.getChoose_id()%></span> <span>您抽中的房源是</span>
			<span><%=nh.getHouse_no()%></span>
		</div>

		<div>
			person_id:
			<%=nh.getPerson_id()%>
		</div>
		<div>
			p0_name:
			<%=nh.getPerson_name()%>
		</div>
		<div>
			id:
			<%=nh.getId()%>
		</div>
		<div>
			choose_id:
			<%=nh.getChoose_id()%>
		</div>
		<div>
			p0_name:
			<%=nh.getPerson_name()%>
		</div>
		<div>
			isSelected:
			<%=nh.getIsSelected()%>
		</div>
		<div>
			area:
			<%=nh.getArea()%>
		</div>
		<div>
			select_seq:
			<%=nh.getSelect_seq()%>
		</div>
		<div>
			select_time:
			<%=nh.getSelect_time()%>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />
