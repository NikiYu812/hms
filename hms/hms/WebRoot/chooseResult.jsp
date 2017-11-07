<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.bean.*,java.util.List"%>
<jsp:include page="layout/header.jsp" flush="true" />

<c:forEach items="${ohs }" var="oh" varStatus="status">
	<c:if test="${status.index == 0}">
		<c:set value="${oh.person }" var="person"></c:set>
	</c:if>
</c:forEach>

<c:choose>
	<c:when test="${person.sign_state == 1 }">
		<c:set value="协议已签" var="sign_state"></c:set>
		<c:set value="green" var="sign_state_class"></c:set>
	</c:when>
	<c:otherwise>
		<c:set value="协议未签" var="sign_state"></c:set>
		<c:set value="red" var="sign_state_class"></c:set>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${person.choose_state == 1 }">
		<c:set value="第一轮抽签结果" var="hms_title"></c:set>
		<c:set value="第一轮已抽签，第二轮未抽签" var="choose_state"></c:set>
		<c:set value="warning" var="choose_state_class"></c:set>
	</c:when>
	<c:when test="${person.choose_state == 2 }">
		<c:set value="第二轮抽签结果" var="hms_title"></c:set>
		<c:set value="第二轮已抽签" var="choose_state"></c:set>
		<c:set value="green" var="choose_state_class"></c:set>
	</c:when>
	<c:otherwise>
		<c:set value="" var="hms_title"></c:set>
		<c:set value="未抽签" var="choose_state"></c:set>
		<c:set value="red" var="choose_state_class"></c:set>
	</c:otherwise>
</c:choose>


<div class="container hms_container">
	<div class="hms_title">
		<img alt="black_block" src="./image/black_block.png"
			class="black_block" /> <span class="board_block">${hms_title
			}</span>
	</div>
	<div class="hms_main">
		<div class="choose_result">
			<c:if test="${person.choose_state == 1 }">
				<span class="choose_result_lable" style="margin-left: 0;">您抽中的号码是</span>
				<span class="choose_result_content">${person.choose1_result }</span>
			</c:if>
			<c:if test="${person.choose_state == 2 }">
				<span class="choose_result_lable" style="margin-left: 0;">您抽中的号码是</span>
				<span class="choose_result_content">${person.choose2_result }</span>
				<span class="choose_result_lable">您抽中的房号是</span>
				<span class="choose_result_content">${person.newHouse.house_no
					}</span>
			</c:if>
		</div>
		<hr />

		<h3 class="search_detail_title">
			抽签信息 （<span class="${choose_state_class }">${choose_state }</span>）
		</h3>
		<div class="search_detail_body">
			<c:if test="${person.choose_state == 1 or person.choose_state == 2 }">
				<div class="section">
					<h5>/* 第一轮抽签结果 */</h5>
					<ul class="col-md-2 top0">
						<li><span class="search_detail_lable">抽中号码</span> <span
							class="search_detail_content">${person.choose1_result }</span>
						</li>
					</ul>
					<ul class="col-md-3 top0">
						<li><span class="search_detail_lable">抽签顺序</span> <span
							class="search_detail_content">${person.choose1.select_seq
								}</span></li>
					</ul>
					<ul class="col-md-7 top0">
						<li><span class="search_detail_lable">抽签时间</span> <span
							class="search_detail_content">${person.choose1.select_time
								}</span></li>
					</ul>
				</div>
			</c:if>
			<c:if test="${person.choose_state == 2 }">
				<div class="section">
					<h5>/* 第二轮抽签结果 */</h5>
					<ul class="col-md-2">
						<li><span class="search_detail_lable">抽中号码</span> <span
							class="search_detail_content">${person.newHouse.choose_id
								}</span></li>
					</ul>
					<ul class="col-md-3">
						<li><span class="search_detail_lable">抽中房号</span> <span
							class="search_detail_content">${person.newHouse.house_no }</span>
						</li>
					</ul>
					<ul class="col-md-2">
						<li><span class="search_detail_lable">抽签顺序</span> <span
							class="search_detail_content">${person.newHouse.select_seq
								}</span></li>
					</ul>
					<ul class="col-md-5">
						<li><span class="search_detail_lable">抽签时间</span> <span
							class="search_detail_content">${person.newHouse.select_time
								}</span></li>
					</ul>
				</div>
			</c:if>
		</div>
		<hr />

		<c:if test="${person.choose_state == 2 }">
			<c:choose>
				<c:when test="${person.newHouse.building_type == 1 }">
					<c:set value="多层" var="building_type"></c:set>
				</c:when>
				<c:when test="${person.newHouse.building_type == 2 }">
					<c:set value="高层" var="building_type"></c:set>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
			<h3 class="search_detail_title">新房信息</h3>
			<div class="search_detail_body ">
				<ul class="col-md-4">
					<li><span class="search_detail_lable">房号</span> <span
						class="search_detail_content">${person.newHouse.house_no }</span>
					</li>
				</ul>
				<ul class="col-md-4">
					<li><span class="search_detail_lable">建筑类型</span> <span
						class="search_detail_content">${building_type } </span></li>
				</ul>
				<ul class="col-md-4">
					<li><span class="search_detail_lable">建筑面积</span> <span
						class="search_detail_content">${person.newHouse.area }</span>
					</li>
				</ul>
			</div>
			<hr />
		</c:if>

		<h3 class="search_detail_title">旧房信息</h3>
		<div class="search_detail_body">
			<c:forEach items="${ohs }" var="oh" varStatus="status">
				<ul class="col-md-3">
					<li><span class="search_detail_lable">房号</span> <span
						class="search_detail_content">${oh.house_no }</span>
					</li>
				</ul>
				<ul class="col-md-3">
					<li><span class="search_detail_lable">建筑面积</span> <span
						class="search_detail_content">${oh.area }</span>
					</li>
				</ul>
				<ul class="col-md-3">
					<li><span class="search_detail_lable">搬家状态</span> <c:choose>
							<c:when test="${oh.move_state == 1 }">
								<span class="search_detail_content  green">已搬家</span>
							</c:when>
							<c:otherwise>
								<span class="search_detail_content  red">未搬家</span>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
				<ul class="col-md-3">
					<li><span class="search_detail_lable">搬家顺序号</span> <span
						class="search_detail_content ">${oh.move_seq }</span>
					</li>
				</ul>
			</c:forEach>
		</div>
		<hr />
		<h3 class="search_detail_title">
			人员信息 （<span class="${sign_state_class }">${sign_state }</span>）
		</h3>
		<div class="search_detail_body  long">
			<ul class="col-md-5">
				<li><span class="search_detail_lable">原承租人姓名</span> <span
					class="search_detail_content">${person.p0_name }</span>
				</li>
				<li><span class="search_detail_lable">协议签署人姓名</span> <span
					class="search_detail_content">${person.p1_name }</span>
				</li>
			</ul>
			<ul class="col-md-7">
				<li><span class="search_detail_lable">原承租人职工号</span> <span
					class="search_detail_content">${person.p0_uid }</span>
				</li>
				<li><span class="search_detail_lable">协议签署人身份证号</span> <span
					class="search_detail_content">${person.p1_idcNo }</span>
				</li>
			</ul>
			<ul class="col-md-12 top0">
				<li><span class="search_detail_lable">联系电话</span> <span
					class="search_detail_content">${person.telNo }</span>
				</li>
			</ul>
		</div>
		<hr />
	</div>
</div>

<jsp:include page="layout/footer.jsp" flush="true" />
