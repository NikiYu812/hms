<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.OldHouse"%>
<jsp:include page="layout/header.jsp" flush="true" />

<%
	String method = (String) request.getAttribute("method");
	String ohId = "0";
%>

<style>

</style>


<div class="container  hms_container">
	<div class="hms_title">
		<img alt="black_block" src="./image/black_block.png"
			class="black_block" /> <span class="board_block">查询房屋信息</span>
	</div>
	<div class="hms_main">
		<form action="housingServlet?method=find&choose=0" method="post"
			class="form-inline  searchByKw">
			<div class="form-group">
				<input type="text" class="form-control  search_input" id="inputKeyword" name="kw"
					placeholder="请输入关键字" />
				<button type="submit" class="btn  btn-primary  search_btn"  />
				开始查询
				</button>
			</div>
		</form>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />

