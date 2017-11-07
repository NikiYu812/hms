<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.bean.OldHouse,java.util.List"%>
<jsp:include page="layout/header.jsp" flush="true" />

<c:choose>
	<c:when test="${param.search_choose == '1' or param.search_choose eq '1'}">
		<c:set value="第一轮抽签" var="hms_title"></c:set>
		<c:set value="一、根据关键字查询信息(房号、原承租人姓名)" var="choose_memo"></c:set>
		<c:set value="housingServlet?method=find&choose=1" var="action"></c:set>
	</c:when>
	<c:when test="${param.search_choose == '2' or param.search_choose eq '2'}">
		<c:set value="第二轮抽签" var="hms_title"></c:set>
		<c:set value="一、根据关键字查询信息(房号、原承租人姓名)" var="choose_memo"></c:set>
		<c:set value="housingServlet?method=find&choose=2" var="action"></c:set>
	</c:when>
	<c:otherwise>
		<c:set value="查询房屋信息" var="hms_title"></c:set>
		<c:set value="" var="choose_memo"></c:set>
		<c:set value="housingServlet?method=find&choose=0" var="action"></c:set>
	</c:otherwise>
</c:choose>

<div class="container  hms_container">
	<div class="hms_title">
		<img alt="black_block" src="./image/black_block.png"
			class="black_block" /> <span class="board_block">${hms_title }</span>
	</div>
	<div class="hms_main">
		<p class="choose_memo">${choose_memo }</p>
		<form action="${action }" method="post"
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


