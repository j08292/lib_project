<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
								<td style="width: 50%"><c:forTokens items="${delivery.delivery_name}" delims="," var="name">${name}</c:forTokens></td>
								<th style="width: 15%">연락처</th>
								<td style="width: 20%"><c:forTokens items="${delivery.delivery_cell}" delims="," var="cell">${cell}</c:forTokens></td>
							</tr>
							<tr>
								<th>주소 (도서 무인대여기)</th>
								<td><c:forTokens items="${delivery.sample3_postcode}" delims="," var="postcode">${postcode}</c:forTokens>&nbsp;
									<c:forTokens items="${delivery.delivery_address}" delims="," var="address">${address}</c:forTokens></td>
								<th>이메일</th>
								<td><c:forTokens items="${delivery.delivery_email}" delims="," var="email">${email}</c:forTokens></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<!-- 사진 미리보기 설정 -->
			<script type="text/javascript">
			$(document).on("mouseover",".adminListImage",function(e){ //마우스 오버시
				var xOffset = 10;
				var yOffset = 30;
				$("body").append("<p id='preview'><img src='"+ $(this).attr("src") +"' width='200px' /></p>"); //보여줄 이미지를 선언                       
				$("#preview")
				.css("top",(e.pageY - xOffset) + "px")
				.css("left",(e.pageX + yOffset) + "px")
				.fadeIn("fast"); //미리보기 화면 설정 셋팅
			});

			$(document).on("mouseout",".adminListImage",function(){ //마우스 아웃시
				$("#preview").remove();
			});
			</script>
			
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
								<td style="vertical-align: middle;">
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
								<td style="vertical-align: middle;">
								<div id = "up" style = "position:absolute; width:30%; left:700px; top:300px; display:none;">
								</div>
								<a href="${pageContext.request.contextPath}/book/detail.do?list_title=${book.list_title}&list_filename=${book.list_filename }&list_num=${book.list_num }">
								<img src="/lib/upload/${book.list_filename }" class="adminListImage" data-num="${book.list_num}" height="50px"></a></td>
								<td style="vertical-align: middle;">${book.list_title }</td>
								<td style="vertical-align: middle;">1 권</td>
									<c:choose>
										<c:when test="${rent.rent_status == 0 }">
											<td style="vertical-align: middle;">배송완료</td>
										</c:when>
										<c:when test="${rent.rent_status == 1 }">
											<td style="vertical-align: middle;">반납완료</td>
										</c:when>
										<c:when test="${rent.rent_status == 2 }">
											<td style="vertical-align: middle;">예약</td>
										</c:when>
										<c:when test="${rent.rent_status == 3}">
											<td style="vertical-align: middle;">배송전</td>
										</c:when>
										<c:when test="${rent.rent_status == 4 }">
											<td style="vertical-align: middle;">취소</td>
										</c:when>
										<c:when test="${rent.rent_status == 5 }">
											<td style="vertical-align: middle;">무인대여 대여</td>
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