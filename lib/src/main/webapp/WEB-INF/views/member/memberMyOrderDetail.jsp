<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Page Title
		============================================= -->

<section id="page-title">

	<div class="container clearfix">
		<h1>주문 내역</h1>
		<ol class="breadcrumb">
			<li><a href="#">Home</a></li>
			<li><a href="#">Library</a></li>
			<li class="active">Data</li>
		</ol>
	</div>

</section>
<!-- #page-title end -->

<!-- Content
		============================================= -->
<section id="content">
	<div class="content-wrap">
		<div class="container clearfix">

			<label>주문 정보</label>
			<div class="panel">
				<div class="panel-body">
					<table class="table table-bordered">
						<tbody>
							<c:if test="${rent != null }">
								<tr>
									<th>주문 번호</th>
									<td>${rent.rent_num }</td>
									<th>주문 일자</th>
									<td>${rent.rent_regdate }</td>
								</tr>
								<tr>
									<th>주문자</th>
									<td>${name}</td>
									<th>주문처리상태</th>
									<c:choose>
										<c:when test="${rent.rent_status == 0 }">
											<td>대여대기</td>
										</c:when>
										<c:when test="${rent.rent_status == 1 }">
											<td>대여중</td>
										</c:when>
										<c:when test="${rent.rent_status == 2 }">
											<td>반납</td>
										</c:when>
										<c:when test="${rent.rent_status == 3 }">
											<td>예약</td>
										</c:when>
										<c:when test="${rent.rent_status == 4 }">
											<td>무인대여</td>
										</c:when>
										<c:when test="${rent.rent_status == 5 }">
											<td>무인반납</td>
										</c:when>
										<c:when test="${rent.rent_status == 6 }">
											<td>연체</td>
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
							<c:if test="${member != null }">
								<tr>
									<th>수취인</th>
									<td>${name }</td>
									<th>연락처</th>
									<td>${member.mem_cell }</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${member.sample3_postcode },&nbsp; ${member.mem_address }</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>배송 메세지</th>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			
			
			<label>&nbsp;&nbsp;주문 도서정보</label>
			<div class="panel">
				<div class="panel-body">
					<table class="table table-bordered">
						<tbody>
							<c:if test="${book != null }">
								<tr>
									<th>배송구분</th>
									<th>
									<th>상품명</th>
									<th>수량</th>
									<th>가격</th>
									<th>처리상태</th>
									<th>배송관련</th>
									<th>배송추적</th>
								</tr>
								<tr>
									<th>기본배송</th>
									<td><img src="${book.list_filename }" width="60" height="100"></td>
									<td>${book.list_title }</td>
									<td>1</td>
									<td>3,000원</td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>도서 대여비용: 3,000원</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			
			<label>&nbsp;&nbsp;결제 정보</label>
			<div class="panel">
				<div class="panel-body">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th>결제방법</th>
								<th>결제금액</th>
								<th>비고</th>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>