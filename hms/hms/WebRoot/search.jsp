<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bean.OldHouse , java.util.List"%>
<jsp:include page="layout/_header.jsp" flush="true" />
<script src="./js/ajax.js"></script>

<c:choose>
	<c:when
		test="${param.search_choose == '1' or param.search_choose eq '1'}">
		<c:set value="第一轮抽签" var="hms_title"></c:set>
		<c:set value="一、根据关键字查询信息(房号、原承租人姓名)" var="choose_memo"></c:set>
		<c:set value="housingServlet?method=find&choose=1" var="action"></c:set>
	</c:when>
	<c:when
		test="${param.search_choose == '2' or param.search_choose eq '2'}">
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

<input type="hidden" id="search_choose" value="${param.search_choose }">
<div class="container  hms_container">
	<div class="hms_title">
		<img alt="black_block" src="./image/black_block.png"
			class="black_block" /> <span class="board_block">${hms_title
			}</span>
	</div>
	<div class="hms_main">
		<p class="choose_memo">${choose_memo }</p>
		<form action="javascript:void(0)" method="post"
			class="form-inline  searchByKw">
			<div class="form-group">
				<input type="text" class="form-control  search_input"
					id="inputKeyword" name="kw" placeholder="请输入关键字" />
				<button type="submit" class="btn  btn-primary  search_btn"
					onclick="checkInput();">开始查询</button>
			</div>
		</form>
	</div>
</div>

<div class="panel panel-primary  house_list_table"
	id="search_result_list_table" style="display:none;">
	<!-- Default panel contents -->
	<div class="panel-heading">查询结果</div>
	<table class="table table-striped table-hover center "
		id="hms-ohs-table">
		<thead>
			<tr class="">
				<th>房号</th>
				<th>原承租人</th>
				<th>协议签署人</th>
				<th>联系电话</th>
				<th>协议状态</th>
				<th>搬家状态</th>
				<th>搬家顺序号</th>
				<th>抽签状态</th>
			</tr>
		</thead>
		<tbody id="search-result-tbody"></tbody>
	</table>
</div>

<jsp:include page="layout/_footer.jsp" flush="true" />



