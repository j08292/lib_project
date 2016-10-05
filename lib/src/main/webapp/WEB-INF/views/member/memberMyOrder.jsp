<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Page Title ============================================= -->
<section id="page-title">
	<div class="container clearfix">
		<h1>도서 대여내역</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
			<li class="active">My Bookrent List</li>
		</ol>
	</div>
</section>
<!-- #page-title end -->

<!-- Content ============================================= -->
<section id="content">
	<div class="content-wrap">
		<div class="container clearfix">

			<div class="divcenter nobottommargin clearfix">
				<ul class="nav nav-pils center clearfix">
					<li class="inline-block active"><a href="${pageContext.request.contextPath}/member/myOrder.do">도서
							대여내역</a></li>
					<li class="inline-block"><a href="${pageContext.request.contextPath}/member/myOrderS.do">강연
							예약내역</a></li>
				</ul>
				<form:form action="myOrder.do" id="myOrder-form"
					class="nobottommargin" method="get">
					<select id="selectBox" class="form-control"
						style="width: 120px; float: left;">
						<option
							value="${pageContext.request.contextPath}/member/myOrder.do?rent_status=9">전체</option>
						<option
							value="${pageContext.request.contextPath}/member/myOrder.do?rent_status=0">대여</option>
						<option
							value="${pageContext.request.contextPath}/member/myOrder.do?rent_status=1">반납</option>
						<option
							value="${pageContext.request.contextPath}/member/myOrder.do?rent_status=2">예약</option>
						<option
							value="${pageContext.request.contextPath}/member/myOrder.do?rent_status=3">대여대기</option>
						<option
							value="${pageContext.request.contextPath}/member/myOrder.do?rent_status=4">취소</option>
						<option
							value="${pageContext.request.contextPath}/member/myOrder.do?rent_status=5">무인대여 대기</option>
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
	 						$('#selectBox').val('${pageContext.request.contextPath}/member/myOrder.do?rent_status=${param.rent_status}');
	 					});
				</script>
				</c:if>

				<c:if test="${param.rent_status == null }">
					<script type="text/javascript">
	 					$('#selectBox').change(function(){
							location.href=$(this).val();
						});	
	 					$(function() {
 							$('#selectBox').val('${pageContext.request.contextPath}/member/myOrder.do?rent_status=9');
	 					});
				</script>
				</c:if>


				<label>도서 대여내역</label>
				<form:form action="myOrder.do" id="myOrder-form"
					class="nobottommargin">
					<div class="panel panel-default">
						<div class="panel-body">

							<table class="table table-hover provideList">
								<thead>
									<tr>
										<th style="text-align:center;">주문번호</th>
										<th style="text-align:center;">도서정보</th>
										<th style="text-align:center;">대여날짜</th>
										<th style="text-align:center;">반납날짜</th>
										<th style="text-align:center;">상태</th>
										<th style="text-align:center;">비고</th>
									</tr>
								</thead>
								<tbody style="text-align:center;">
									<c:if test="${count > 0 }">
										<c:forEach var="rent" items="${list_rent }">
											<tr>
												<td>${rent.rent_num }</td>
												<td><a
													href="${pageContext.request.contextPath}/member/myOrderDetail.do?
											rent_num=${rent.rent_num}&list_num=${rent.list_num}&list_title=${rent.list_title}">
														${rent.list_title}</a></td>
												<td>${rent.rent_regdate}</td>
												<td>
													<c:if test="${rent.rent_returndate == null }">-</c:if>
													<c:if test="${rent.rent_returndate != null }">${rent.rent_returndate}</c:if>
												</td>
												<td><c:choose>							
														<c:when test="${rent.rent_status == 0}">
															<!-- 대출중 도서의 연체일 구하기 -->
															<jsp:useBean id="toDay" class="java.util.Date" />
															<fmt:parseDate var="returnDate" value="${rent.rent_returndate}" pattern="yyyy-MM-dd" />
															<fmt:parseNumber value="${toDay.time / (1000*60*60*24)}" integerOnly="true" var="nowDays" scope="request" />
															<fmt:parseNumber value="${returnDate.time / (1000*60*60*24)}" integerOnly="true" var="oldDays" scope="request" />
															<c:choose>
																<c:when test="${toDay > rent.rent_returndate}">
																	<c:if test="${(nowDays - oldDays) != 0}">
																		대여  (<font color="red"> ${nowDays - oldDays}</font>일 연체)
																	</c:if>
																	<c:if test="${(nowDays - oldDays) == 0}">
																		대여
																	</c:if>								
																</c:when>
																<c:otherwise>대여</c:otherwise>
															</c:choose>
														</c:when>
														<c:when test="${rent.rent_status == 1 }">
														반납
														</c:when>
														<c:when test="${rent.rent_status == 2 }">
														예약
														</c:when>
														<c:when test="${rent.rent_status == 3 }">
														대여대기
														</c:when>
														<c:when test="${rent.rent_status == 4 }">
														취소
														</c:when>
														<c:when test="${rent.rent_status == 5 }">
														무인대여 대기
														</c:when>
													</c:choose>
												</td>
												<td><c:if test="${rent.rent_status == 2 }">
														<input type="hidden" id="rent_num" name="rent_num"
															class="rent_num" value="${rent.rent_num }">
														<input type="hidden" id="list_num" name="list_num"
															class="list_num" value="${rent.list_num }">
														<a id="reserveCancel-button"
															class="btn btn-primary reserveCancel-button"
															data-num="${rent.rent_num }"
															data-num1="${rent.list_num }"
															onclick="${pageContext.request.contextPath}/book/reserveCancel.do?list_num=${rent.list_num}&rent_num=${rent.rent_num}"
															href="${pageContext.request.contextPath}/member/myOrder.do">취소</a>
												</c:if></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							<c:if test="${count == 0 }">
								<p style="text-align: center; font-size: 20px;">도서대여 및 예약 내역이 없습니다.</p>
							</c:if>
							<div style="text-align: center;">${pagingHtml }</div>
						</div>
					</div>
				</form:form>
			</div>
			</div>
		</div>
</section>