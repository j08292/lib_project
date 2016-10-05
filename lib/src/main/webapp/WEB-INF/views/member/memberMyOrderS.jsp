<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Page Title
		============================================= -->
<section id="page-title">
	<div class="container clearfix">
		<h1>강연 예약내역</h1>
	</div>
</section>
<!-- #page-title end -->

<!-- Content
		============================================= -->

<section id="content">
	<div class="content-wrap">
		<div class="container clearfix">

			<div class="divcenter nobottommargin clearfix">
				<ul class="nav nav-pils center clearfix">
					<li class="inline-block"><a	href="${pageContext.request.contextPath}/member/myOrder.do">도서	예약내역</a></li>
					<li class="inline-block active"><a href="${pageContext.request.contextPath}/member/myOrderS.do">강연 예약내역</a></li>
				</ul>

				<form:form action="myOrderS.do" id="myOrder-form"
					class="nobottommargin" method="get">
					<select id="selectBox" class="form-control"
						style="width: 120px; float: left;">
						<option
							value="${pageContext.request.contextPath}/member/myOrders.do?rent_status=9">전체</option>
						<option
							value="${pageContext.request.contextPath}/member/myOrders.do?rent_status=0">대여</option>
						<option
							value="${pageContext.request.contextPath}/member/myOrders.do?rent_status=1">반납</option>
						<option
							value="${pageContext.request.contextPath}/member/myOrders.do?rent_status=2">예약</option>
						<option
							value="${pageContext.request.contextPath}/member/myOrders.do?rent_status=3">대여대기</option>
						<option
							value="${pageContext.request.contextPath}/member/myOrders.do?rent_status=4">취소</option>
						<option
							value="${pageContext.request.contextPath}/member/myOrders.do?rent_status=5">무인대여</option>
					</select>
					<br>
					<br>
				</form:form>
				<c:if test="${param.rent_status != null }">
					<script type="text/javascript">
	 					$('#selectBox').change(function(){
							location.href=$(this).val();
						});	
	 					$(function() {
	 						$('#selectBox').val('${pageContext.request.contextPath}/member/myOrders.do?rent_status=${param.rent_status}');
	 					});
				</script>
				</c:if>

				<c:if test="${param.rent_status == null }">
					<script type="text/javascript">
	 					$('#selectBox').change(function(){
							location.href=$(this).val();
						});	
	 					$(function() {
 							$('#selectBox').val('${pageContext.request.contextPath}/member/myOrders.do?rent_status=9');
	 					});
				</script>
				</c:if>

				<label>강연 예약내역</label>
				<form:form action="myOrders.do" id="myOrder-form"
					class="nobottommargin">
					<div class="panel panel-default">
						<div class="panel-body">

							<table class="table table-hover provideList">
								<thead>
									<tr>
										<th>강연 예약번호</th>
										<th>강연 제목</th>
										<th>강연 날짜</th>
										<th>강연 신청날짜</th>
										<th>강연 가격</th>
										<th>상태</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${count > 0 }">
										<c:forEach var="speech" items="${speechReservationCommand }">
											<tr>
												<td>${speech.speech_reserve_num }</td>
												<td><a
													href="${pageContext.request.contextPath}/member/myOrderSDetail.do?speech_reserve_num=${speech.speech_reserve_num}">${speech.speech_title}</a></td>
												<td>${speech.speech_regdate }</td>
												<td>${speech.speech_reserve_date }</td>
												<td>${speech.speech_price }</td>
												<c:choose>
													<c:when test="${speech.speech_reserve_status == 0 }">
														<td>예약신청</td>
													</c:when>
													<c:when test="${speech.speech_reserve_status == 1 }">
														<td>예약완료</td>
													</c:when>
													<c:when test="${speech.speech_reserve_status == 2 }">
														<td>취소신청</td>
													</c:when>
													<c:when test="${speech.speech_reserve_status == 3 }">
														<td>취소완료</td>
													</c:when>
												</c:choose>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							<c:if test="${count == 0 }">
								<p style="text-align: center; font-size: 20px;">강연 예약 내역이
									없습니다.</p>
							</c:if>
							<div style="text-align: center;">${pagingHtml }</div>
						</div>
				</form:form>
			</div>
		</div>
	</div>
</section>
