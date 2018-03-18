<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.bean.OldHouse,com.bean.Person,java.util.List"%>
<jsp:include page="layout/_header.jsp" flush="true" />

<div class="panel panel-primary  house_list_table">
	<!-- Default panel contents -->
	<div class="panel-heading">旧房屋列表</div>
	<table class="table table-striped table-hover center "
		id="hms-ohs-table">
		<thead>
			<tr class="">
				<th>房号（建筑面积）</th>
				<th>原承租人</th>
				<th>协议签署人</th>
				<th>联系电话</th>
				<th>协议状态</th>
				<th>搬家状态</th>
				<th>搬家顺序号</th>
				<th>抽签状态</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty ohs }">
					<tr>
						<td colspan="8">没有符合条件的数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${ohs}" var="oh">
						<tr onclick="showDetail('${oh.person_id }')" data-toggle="tooltip" title="点击查看详情" data-placement="right">
							<td>${oh.house_no }（${oh.area }）</td>
							<td>${oh.person.p0_name }</td>
							<td>${oh.person.p1_name }</td>
							<td>${oh.person.telNo }</td>
							<c:choose>
								<c:when test="${oh.sign_state == 1 }">
									<td><span class="label label-success">已签</span></td>
								</c:when>
								<c:otherwise>
									<td><span class="label label-danger">未签</span></td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${oh.move_state == 1 }">
									<td><span class="label label-success">已搬 </span></td>
								</c:when>
								<c:otherwise>
									<td><span class="label label-danger">未搬</span></td>
								</c:otherwise>
							</c:choose>
							<td><span class="badge">${oh.move_seq }</span></td>
							<c:choose>
								<c:when test="${oh.person.choose_state == 2 }">
									<td><span class="label label-success">第二轮已抽签</span></td>
								</c:when>
								<c:when test="${oh.person.choose_state == 1 }">
									<td><span class="label label-warning">第一轮已抽签，第二轮未抽签</span></td>
								</c:when>
								<c:otherwise>
									<td><span class="label label-danger">未抽签</span></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<nav>
	<ul class="pagination">
		<c:set var="disabled" value="${page==1?'disabled':''}"></c:set>
		<li class="${disabled }"><a href="<c:url value='housingServlet?method=list&page=1&kw='/>">首页</a></li>
		<li class="${disabled }"><a href="<c:url value='housingServlet?method=list&page=${page-1>1?page-1:1}&kw='/>">&laquo;</a></li>
		<c:choose>
			<c:when test="${page>=1 and page<=6 }">
				<c:set var="begin" value="1"></c:set>
				<c:set var="end" value="10"></c:set>
			</c:when>
			<c:when test="${page>totalPages-4 and page<=totalPages }">
				<c:set var="begin" value="${totalPages-9 }"></c:set>
				<c:set var="end" value="${totalPages }"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="begin" value="${page-5 }"></c:set>
				<c:set var="end" value="${page+4<=totalPages?page+4:totalPages }"></c:set>
			</c:otherwise>
		</c:choose>
		<c:forEach begin="${begin}" end="${end}" varStatus="loop">
			<c:set var="active" value="${loop.index==page?'active':''}" />
			<li class="${active}"><a href="<c:url value="housingServlet?method=list&page=${loop.index}&kw="/>">${loop.index}</a></li>
		</c:forEach>
		<c:set var="disabled" value="${page==totalPages?'disabled':''}"></c:set>
		<li class="${disabled }"><a href="<c:url value="housingServlet?method=list&page=${page+1<totalPages?page+1:totalPages}&kw="/>">&raquo;</a></li>
    <li class="${disabled }"><a href="<c:url value="housingServlet?method=list&page=${totalPages}&kw="/>">尾页</a></li>
	</ul>
</nav>
<jsp:include page="layout/_footer.jsp" flush="true" />



