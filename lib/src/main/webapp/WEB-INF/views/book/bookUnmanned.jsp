<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Stylesheets ============================================= -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

<!-- Page Title ============================================= -->
<section id="page-title">
	<div class="container clearfix">
		<h1>도서 무인대여</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/book/search.do">Book List</a></li>
			<li class="active">My Unmanned Rent</li>
		</ol>
	</div>
</section>
<!-- #page-title end -->

<!-- Content ============================================= -->
<section id="content">
	<div class="content-wrap">
		<div class="container clearfix">

			<form action="unmanned.do" id="cart-form" method="post">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-body">
							<table class="table table-hover provideList">
								<thead>
									<tr>
										<th style="text-align:center;"></th>
										<th style="text-align:center;">도서명</th>
										<th style="text-align:center;">코드</th>
										<th style="text-align:center;">저자</th>
										<th style="text-align:center;">출판사</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="vertical-align:middle;text-align:center;">
											<img src="/lib/upload/${book.list_filename }" width="80" height="120" alt="도서 이미지">
										</td>
										<td style="vertical-align:middle;text-align:center;">${book.list_title }</td>
										<td style="vertical-align:middle;text-align:center;">${book.list_code }</td>
										<td style="vertical-align:middle;text-align:center;">${book.list_writer }</td>
										<td style="vertical-align:middle;text-align:center;">${book.list_publish }</td>
									</tr>
								</tbody>
							</table>
							<hr>
							<div class="CenterBox">
								<h3>가까운 지하철 무인기에서 원하는 책을 찾으실 수 있습니다.</h3>
								<ul
									style="text-align: left; padding: 15px 0 15px 20px; list-style-type: disc;">
									<li>신청한 도서는 예약한지 2일 후 약 하루동안 수령가능(도서투입 시 SMS 전송)</li>
									<li>단, 금, 토·일요일, 법정 공휴일,예약도서관이 휴관인 경우는 수령가능일이 연기될 수 있습니다.</li>
									<li style = "color:red;">연체시 연체일수 만큼 홈페이지 이용에 제한이 있을 수 있습니다.</li>
								</ul>
								<hr/>
								<br/>
								<p style = "text-align:left;">
									<select name = "selectBox" class = "form-control selectBox" style = "float:left; width:120px; text-align:center;"
									 id = "selectBox" name = "selectBox" onchange = "getSelectValue(this.form);" >
										<option value="s1" selected = "selected">수원역</option>
										<option value="s2">수원시청역</option>
										<option value="s3">성균관대역</option>
									</select>
									<span>&nbsp;&nbsp;(으)로 무인 예약 신청 하시겠습니까?</span>
								</p>
								<input type = "hidden" name = "textValue" class = "textValue">
							</div>
						</div>
					</div>
				</div>
				<p style="text-align: center;">
					<input type="hidden" id="list_num" name="list_num" value="${book.list_num }"> 
					<input type="submit" id="unmannedrent-button" class="btn btn-primary" value="대여하기">

					<script type="text/javascript">
						$(document).ready(function() {
							$('#unmannedrent-button').click(function() {
								alert("무인대여가 완료되었습니다.");
							});
						});
					</script>
					<input type="button" value="도서검색" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/book/search.do'">
				</p>
			</form>
		</div>
	</div>
</section>
<!-- #content end -->

<!-- Go To Top ============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>