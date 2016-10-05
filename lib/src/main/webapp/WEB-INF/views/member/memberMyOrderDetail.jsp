<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Page Title ============================================= -->
<section id="page-title">
	<div class="container clearfix">
		<h1>대여 상세내역</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/member/myOrder.do">My Bookrent List</a></li>
			<li class="active">My Bookrent Info</li>
		</ol>
	</div>
</section>
<!-- #page-title end -->

<!-- Content ============================================= -->
<section id="content">
	<div class="content-wrap">
		<div class="container clearfix">

			<label>대여 정보</label>
			<div class="panel">
				<div class="panel-body">
					<table class="table table-bordered">
						<tbody>
							<c:if test="${rent != null }">
								<tr>
									<th style = "width:20%">대여 번호</th>
									<td style = "width:30%">${rent.rent_num }</td>
									<th style = "width:20%">대여 일자</th>
									<td style = "width:30%">${rent.rent_regdate }</td>
								</tr>
								<tr>
									<th>도서 대여자</th>
									<td>${name}</td>
									<th>대여 처리상태</th>
									<c:choose>
										<c:when test="${rent.rent_status == 0 }">
											<td>대여</td>
										</c:when>
										<c:when test="${rent.rent_status == 1 }">
											<td>반납</td>
										</c:when>
										<c:when test="${rent.rent_status == 2 }">
											<td>예약</td>
										</c:when>
										<c:when test="${rent.rent_status == 3}">
											<td>대여대기</td>
										</c:when>
										<c:when test="${rent.rent_status == 4 }">
											<td>예약취소</td>
										</c:when>
										<c:when test="${rent.rent_status == 5 }">
											<td>무인대여</td>
										</c:when>
									</c:choose>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			
			&nbsp;&nbsp;<label>배송지 정보</label>
			<div class="panel">
				<div class="panel-body">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th style="width: 15%">수취인</th>
								<td style="width: 35%">${delivery.delivery_name }</td>
								<th style="width: 15%">연락처</th>
								<td style="width: 35%">${delivery.delivery_cell }</td>
							</tr>
							<tr>
								<th>주소 (도서 무인대여기)</th>
								<td>${delivery.sample3_postcode }&nbsp;
									${delivery.delivery_address }</td>
								<th>이메일</th>
								<td>${delivery.delivery_email }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<label>&nbsp;&nbsp;대여 도서정보</label>
			<div class="panel">
				<div class="panel-body">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th>구분</th>
								<th>도서정보</th>
								<th>도서명</th>
								<th>수량</th>
								<th>배송관련</th>
							</tr>
							<tr>
								<td>
								<c:choose>
										<c:when test="${delivery.delivery_status == 0 }">
											일반
										</c:when>
										<c:when test="${delivery.delivery_status == 1 }">
											무인
										</c:when>
										<c:otherwise>
											예약												
										</c:otherwise>
									</c:choose>
								</td>
								<td>
								<div id = "up" style = "position:absolute; width:30%; left:700px; top:300px; display:none;">
								</div>
								<a href="${pageContext.request.contextPath}/book/detail.do?list_title=${book.list_title}&list_filename=${book.list_filename }&list_num=${book.list_num }">
								<img src="/lib/upload/${book.list_filename }" class ="bookfilename" width="30"></a></td>
								<td>${book.list_title }</td>
								<td>1 권</td>
								<td>
								<c:if test="${delivery.delivery_status == 0 }">
								3000원								
								</c:if>
								<c:if test="${delivery.delivery_status == 1 }">
								-								
								</c:if>
								</td>								
									<c:choose>
										<c:when test="${rent.rent_status == 0 }">
											<td>배송완료</td>
										</c:when>
										<c:when test="${rent.rent_status == 1 }">
											<td>반납완료</td>
										</c:when>
										<c:when test="${rent.rent_status == 2 }">
											<td>예약</td>
										</c:when>
										<c:when test="${rent.rent_status == 3}">
											<td>배송전</td>
										</c:when>
										<c:when test="${rent.rent_status == 4 }">
											<td>취소</td>
										</c:when>
										<c:when test="${rent.rent_status == 5 }">
											<td>무인대여 대여</td>
										</c:when>
									</c:choose>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<label>&nbsp;&nbsp;결제 정보</label>
			<div class="panel">
				<div class="panel-body">
					<table class="table table-bordered" style = "text-align:center;">
						<tbody >
							<tr>
								<th style = "width:30%;text-align:center;">결제방법</th>
								<th style = "width:35%;text-align:center;">결제금액</th>
								<th style = "width:35%;text-align:center;">비고</th>
							</tr>
							<tr>
								<td style = "width:30%;">무통장입금</td>
								<td style = "width:35%;">3000원</td>
								<td style = "width:35%;"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</section>