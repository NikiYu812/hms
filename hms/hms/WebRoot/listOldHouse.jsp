<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.bean.OldHouse,com.bean.Person,java.util.List"%>
<jsp:include page="layout/header.jsp" flush="true" />

<div class="panel panel-primary  house_list_table"
	style="margin-top:30px;">
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
				<th>协议状态</th>
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
						<tr onclick="showDetail('${oh.person_id }')">
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
									<td><span class="label label-success">已搬</span></td>
								</c:when>
								<c:otherwise>
									<td><span class="label label-danger">未搬</span></td>
								</c:otherwise>
							</c:choose>
							<td>${oh.move_seq }</td>
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
<jsp:include page="layout/footer.jsp" flush="true" />
<script>
	
</script>


