<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Page Title ============================================= -->
<section id="page-title">
	<div class="container clearfix">
		<h1><spring:message code="wishlist.list.title"/></h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/wishlist/write.do">Request for Wish Books</a></li>
			<li class="active">My Wish Books</li>
		</ol>
	</div>
</section>
<!-- #page-title end -->
<section id="content">
	<div class="content-wrap">
		<div class="container clearfix">
			<form action="list.do" id="search_form" method="get">
				<select id="selectBox" class="form-control"
					style="width: 120px; float: left;">
					<option
						value="${pageContext.request.contextPath}/wishlist/list.do?wish_status=9">전체</option>
					<option
						value="${pageContext.request.contextPath}/wishlist/list.do?wish_status=0">신청중</option>
					<option
						value="${pageContext.request.contextPath}/wishlist/list.do?wish_status=1">처리중</option>
					<option
						value="${pageContext.request.contextPath}/wishlist/list.do?wish_status=2">취소됨</option>
					<option
						value="${pageContext.request.contextPath}/wishlist/list.do?wish_status=3">소장중</option>
				</select>
			</form>
			<br>
			<c:if test="${param.wish_status != null }">
				<script type="text/javascript">
					$('#selectBox').change(function() {
						location.href = $(this).val();
					});
					$(function() {
						$('#selectBox').val('${pageContext.request.contextPath}/wishlist/list.do?wish_status=${param.wish_status}');
					});
				</script>
			</c:if>
			<c:if test="${param.wish_status == null }">
				<script type="text/javascript">
					$('#selectBox').change(function() {
						location.href = $(this).val();
					});
					$(function() {
						$('#selectBox').val('${pageContext.request.contextPath}/wishlist/list.do?wish_status=9');
					});
				</script>
			</c:if>

			<label>희망도서 신청내역</label>
			<form:form action="list.do">
				<div class="panel panel-default">
					<div class="panel-body">
						<table class="table table-hover provideList">
							<thead>
								<tr>
									<th style="text-align:center;">신청번호</th>
									<th style="text-align:center;">책제목</th>
									<th style="text-align:center;">신청날짜</th>
									<th style="text-align:center;">진행상태</th>
									<th style="text-align:center;">비고</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${count == 0 }">
									<td colspan="5">
										<p style="text-align: center; font-size: 20px; margin: 0 auto;"> 검색하신 진행상태 내역이 없습니다.</p>
									</td>
								</c:if>
								<c:if test="${count > 0 }">
									<c:forEach var="article" items="${list}">
										<tr>
											<td style="text-align:center;">${article.wish_num}</td>
											<td style="text-align:center;"><a href="#">${article.wish_title}</a></td>
											<td style="text-align:center;">${article.wish_regdate}</td>
											<td style="text-align:center;"><c:if test="${article.wish_status == 0}">신청중</c:if>
												<c:if test="${article.wish_status == 1}">처리중</c:if> <c:if
													test="${article.wish_status == 2}">취소됨</c:if> <c:if
													test="${article.wish_status == 3}">소장중</c:if></td>
											<td style="text-align:center;"></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<div align="center">${pagingHtml}</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</section>