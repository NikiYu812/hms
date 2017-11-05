<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.OldHouse"%>
<jsp:include page="layout/header.jsp" flush="true" />

<%
	String hms_title ="查询房屋信息";
	String choose_memo = "";
	String action = "housingServlet?method=find&choose=0";
	String search_choose = request.getParameter("search_choose");
	if(search_choose == "1"||search_choose.equals("1")){
		hms_title = "第一轮抽签";
		choose_memo = "一、根据关键字查询信息(房号、原承租人姓名)";
		action = "housingServlet?method=find&choose=1";
	}else if(search_choose == "2"||search_choose.equals("2")){
		hms_title = "第二轮抽签";
		choose_memo = "一、根据关键字查询信息(房号、原承租人姓名)";
		action = "housingServlet?method=find&choose=2";
	}
	
%>


<div class="container  hms_container">
	<div class="hms_title">
		<img alt="black_block" src="./image/black_block.png"
			class="black_block" /> <span class="board_block"><%=hms_title %></span>
	</div>
	<div class="hms_main">
		<p class="choose_memo"><%=choose_memo %></p>
		<form action="<%=action %>" method="post"
			class="form-inline  searchByKw">
			<div class="form-group">
				<input type="text" class="form-control  search_input"
					id="inputKeyword" name="kw" placeholder="请输入关键字" />
				<button type="submit" class="btn  btn-primary  search_btn">
					开始查询</button>
			</div>
		</form>
		<div class="clearfix"></div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />

