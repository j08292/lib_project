<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Page Title
		============================================= -->

<section id="page-title">

	<div class="container clearfix">
		<h1>강연 상세내역</h1>
		<ol class="breadcrumb">
		</ol>
	</div>

</section>
<!-- #page-title end -->

<!-- Content
		============================================= -->
<section id="content">
	<div class="content-wrap">
		<div class="container clearfix">

			<label>강연 정보</label>
			<div class="panel">
				<div class="panel-body">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th style = "width:20%">강연제목</th>
								<td style = "width:30%">${speech.speech_title }</td>
								<th style = "width:20%">강연가격</th>
								<td style = "width:30%">${speech.speech_price }</td>
							</tr>
							<tr>
								<th>강연날짜</th>
								<td>${speech.speech_regdate }</td>
								<th>강연 예약상태</th>
								<td>
								<c:choose>
									<c:when test="${speech.speech_reserve_num == 0}">
										예약 신청
									</c:when>
									<c:when test="${speech.speech_reserve_num == 1}">
										예약 완료
									</c:when>
									<c:when test="${speech.speech_reserve_num == 2}">
										취소 신청
									</c:when>
									<c:when test="${speech.speech_reserve_num == 3}">
										취소 완료
									</c:when>
								</c:choose>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<label>예약자 정보</label>
			<div class="panel">
				<div class="panel-body">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th style = "width:20%">이름</th>
								<td style = "width:30%">${member.mem_id }</td>
								<th style = "width:20%">전화번호</th>
								<td style = "width:30%">${member.mem_cell }</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${member.mem_email }</td>
								<th>주소</th>
								<td>${member.sample3_postcode}, ${member.mem_address }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<label>결제 정보</label>
			<div class="panel">
				<div class="panel-body">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th style = "width:20%">결제수단</th>
								<td style = "width:30%">무통장 입금</td>
								<th style = "width:20%">계좌번호</th>
								<td style = "width:30%">302-00084229-21</td>
							</tr>
							<tr>
								<th>입금자명</th>
								<td>${member.mem_name }</td>
								<th>입금 금액</th>
								<td>${speech.speech_price }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
</section>