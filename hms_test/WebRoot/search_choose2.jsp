<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.OldHouse"%>
<jsp:include page="layout/header.jsp" flush="true" />

<div class="container  hms_container">
	<div class="hms_title">
		<img alt="black_block" src="./image/black_block.png"
			class="black_block" /> <span class="board_block">第二轮抽签</span>
	</div>
	<div class="hms_main">
		<p class="choose_memo">
			一、根据关键字查询信息
		</p>
		<form action="housingServlet?method=find&choose=2" method="post"
			class="form-inline  searchByKw">
			<div class="form-group">
				<input type="text" class="form-control  search_input" id="inputKeyword" name="kw"
					placeholder="请输入关键字" />
				<input type="submit" class="btn  btn-primary  search_btn  hms_btn_lg"  value="开始查询" />
			</div>
		</form>
	</div>
</div>

<jsp:include page="layout/footer.jsp" flush="true" />

