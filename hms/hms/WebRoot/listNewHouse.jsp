<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.bean.NewHouse,com.bean.Person,java.util.List"%>
<jsp:include page="layout/header.jsp" flush="true" />

<div class="container">
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
							<tr onclick="showDetail('${nh.p0_name}')">
								<td>${nh.choose_id }</td>
								<td>${nh.house_no }</td>
								<td><c:choose>
										<c:when test="${nh.building_type == 1 }">多层</c:when>
										<c:when test="${nh.building_type == 2 }">高层	</c:when>
										<c:otherwise>未知</c:otherwise>
									</c:choose>
								</td>
								<td>${nh.area }</td>
								<c:choose>
									<c:when test="${nh.isSelected == 1 }">
										<td class="red">已抽中</td>
									</c:when>
									<c:otherwise>
										<td class="green">可抽</td>
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
</div>

<jsp:include page="layout/footer.jsp" flush="true" />
