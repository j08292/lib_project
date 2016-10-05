<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- Page Title ============================================= -->
<section id="page-title">
	<div class="container clearfix">
		<h1><spring:message code="speech.list.title"/></h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/member/myOrderS.do">My Speech Reservation</a></li>
			<li class="active">Speech List</li>
		</ol>		
	</div>
</section>
<!-- #page-title end -->
<!-- Content ============================================= -->
<div class="container clearfix">
	<br><br>
	<div class="panel-body">
	<form action="list.do" id="search_form" method="get" class="form-inline">
		<div align="center">
				<select name="keyfield" id="speechSearch" class="form-control">
					<option value="speech_title">제목</option>
					<option value="speech_content">내용</option>
					<option value="speech_location">장소</option>
					<!-- <option value="speech_date">날짜</option> -->
				</select>
				
					<input type="text" size="16" name="keyword" id="textbox" class="form-control">
				
				<input type="submit" value="찾기" class="btn btn-default">
				
		</div>
		
	</form>
	</div>
	<c:if test="${count == 0}">
	<div align="center">등록된 강연이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<div class="table-responsive">
		<table class="table table-hover"  style="text-align:center;">
			<thead>
				<tr>
					<th style="text-align:center;">강연번호</th>
					<th style="text-align:center;">강연제목</th>
					<th style="text-align:center;">강연날짜</th>
					<th style="text-align:center;">장소</th>
					<th style="text-align:center;">참여금액</th>
					<th style="text-align:center;">최대 참가인원</th>
					<th style="text-align:center;">조회수</th>
				</tr>
			</thead>
			<c:forEach var="article" items="${list}">
			<tbody>
				<tr>
					<td>${article.speech_num}</td>
					<td><c:if test="${article.speech_status eq 0}">
						<a href="detail.do?speech_num=${article.speech_num}">${article.speech_title}</a>
						</c:if>
						<c:if test="${article.speech_status eq 1}">
						<del>${article.speech_title}</del> (일정 취소)
						</c:if>
					</td>
					<td>${article.speech_date}</td>
					<td>${article.speech_location}</td>
					<td>
						<c:choose>
							<c:when test="${article.speech_price eq 0}">무료</c:when>
							<c:otherwise><fmt:formatNumber type="currency" value="${article.speech_price}" pattern="###,###"/>원</c:otherwise>
						</c:choose>
					</td>
					<td>${article.speech_people}</td>
					<td>${article.speech_hit}</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
	</div>
	<div align="center">${pagingHtml}</div><br><br><br><br><br><br>
	</c:if>
</div>
<!-- #content end -->

<!-- Go To Top ============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>
<!-- Footer Scripts ============================================= -->
<script type="text/javascript" src="js/functions.js"></script>