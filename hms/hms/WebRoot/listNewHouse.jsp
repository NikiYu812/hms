<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.bean.NewHouse,com.bean.Person,java.util.List"%>
<jsp:include page="layout/_header.jsp" flush="true" />

<div class="panel panel-primary  house_list_table">
	<div class="panel-heading">新房源列表</div>
	<table class="table table-striped table-hover center ">
		<thead>
			<tr class="">
				<th>房源编号</th>
				<th>房源房号</th>
				<th>建筑类型</th>
				<th>建筑面积</th>
				<th>房屋状态</th>
				<th>原承租人姓名</th>
				<th>抽签顺序</th>
				<th>抽签时间</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty nhs }">
					<tr>
						<td colspan="8">没有符合条件的数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${nhs}" var="nh">
						<tr onclick="showDetail('${nh.person_id}')" data-toggle="tooltip" title="点击查看详情" data-placement="right">
							<td>${nh.choose_id }</td>
							<td>${nh.house_no }</td>
							<td><c:choose>
									<c:when test="${nh.building_type == 1 }">多层</c:when>
									<c:when test="${nh.building_type == 2 }">高层	</c:when>
									<c:otherwise>未知</c:otherwise>
								</c:choose></td>
							<td>${nh.area }</td>
							<c:choose>
								<c:when test="${nh.isSelected == 1 }">
									<td><span class="label label-danger">已抽中</span></td>
								</c:when>
								<c:otherwise>
									<td><span class="label label-success">可抽</span></td>
								</c:otherwise>
							</c:choose>
							<td>${nh.p0_name }</td>
							<td>${nh.select_seq }</td>
							<td>${nh.select_time }</td>
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
		<li class="${disabled }"><a
			href="<c:url value='housingServlet?method=listNh&page=1&kw='/>">首页</a>
		</li>
		<li class="${disabled }"><a
			href="<c:url value='housingServlet?method=listNh&page=${page-1>1?page-1:1}&kw='/>">&laquo;</a>
		</li>
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
			<li class="${active}"><a
				href="<c:url value="housingServlet?method=listNh&page=${loop.index}&kw="/>">${loop.index}</a>
			</li>
		</c:forEach>
		<c:set var="disabled" value="${page==totalPages?'disabled':''}"></c:set>
		<li class="${disabled }"><a
			href="<c:url value="housingServlet?method=listNh&page=${page+1<totalPages?page+1:totalPages}&kw="/>">&raquo;</a>
		</li>
		<li class="${disabled }"><a
			href="<c:url value="housingServlet?method=listNh&page=${totalPages}&kw="/>">尾页</a>
		</li>
	</ul>
</nav>
<jsp:include page="layout/_footer.jsp" flush="true" />
