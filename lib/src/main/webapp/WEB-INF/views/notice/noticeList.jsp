<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- Page Title ============================================= -->
<section id="page-title">
	<div class="container clearfix">
		<h1><spring:message code="notice.list.title"/></h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
			<li class="active">Notice List</li>
		</ol>
	</div>
</section>
<!-- #page-title end -->
<div class="container clearfix">
	<br><br>
	<div class="panel-body">
	<form action="list.do" id="search_form" method="get" class="form-inline">
		<div align="center">
			<select name="keyfield" class="form-control">
				<option value="notice_title">제목</option>
				<option value="notice_content">내용</option>
				<option value="all">전체</option>
			</select>
			<input type="text" size="16" name="keyword" class="form-control">
			<input type="submit" class="btn btn-default" value="찾기">
		</div>
	</form>
	</div>
	<br>
	<c:if test="${count == 0}">
		<div align="center">등록된 공지사항이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="text-align:center;">번호</th>
						<th style="text-align:center;">제목</th>
						<th style="text-align:center;">작성자</th>
						<th style="text-align:center;">작성일</th>
						<th style="text-align:center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${list}">
						<tr>
							<td style="text-align:center;">${article.notice_num}</td>
							<td><a href="detail.do?notice_num=${article.notice_num}">${article.notice_title}</a></td>
							<td style="text-align:center;">관리자</td>
							<td style="text-align:center;">${article.notice_regdate}</td>
							<td style="text-align:center;">${article.notice_hit}</td>							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div align="center">${pagingHtml}</div>
			<br><br><br>
	</c:if>
</div>