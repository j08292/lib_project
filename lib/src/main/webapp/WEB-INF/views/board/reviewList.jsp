<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Stylesheets(지우면안됨X)-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<!--[if lt IE 9]>
    	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<!-- External JavaScripts(지우면안됨X) -->
<!-- Page Title(지우면안됨X) -->
<section id="page-title">
	<div class="container clearfix">
		<h1><spring:message code="review.list.title"/></h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
			<li class="active">Review List</li>
		</ol>	
	</div>
</section>
<!-- #page-title end -->

<!-- Content(지우면안됨X)-->
<div class="container clearfix">
	<br><br>
	<div class="panel-body">
	<form action="list.do" id="search_form" method="get" class="form-inline">
		<div align="center">
			<ul class="search">
				<li><select name="keyfield" class="form-control">
						<option value="review_title">제목</option>
						<option value="mem_id">ID</option>
						<option value="review_content">내용</option>
						<option value="all">전체</option>
				</select></li>
				<li><input type="text" size="16" name="keyword" class="form-control"></li>
				<li><input type="submit" class="btn btn-default" value="찾기"></li>
			</ul>
		</div>
	</form>
	</div>
	<table>
		<tr>
			<td class="align-right"><input type="button" value="글쓰기" 
				class="btn btn-primary btn-sm" onclick="location.href='write.do'">
			</td>
		</tr>
	</table><br>
	<c:if test="${count == 0 }">
		<div class="align-center">등록된 감상평이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0 }">
		<div class="table-responsive">
			<table class="table table-hover" style="text-align: center;">
				<tr>
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">ID</th>
					<th style="text-align: center;">날짜</th>
					<th style="text-align: center;">조회수</th>
					<th style="text-align: center;">좋아요</th>
					<th style="text-align: center;">싫어요</th>
				</tr>
				<c:forEach var="article" items="${list}">
					<tr>
						<td>${article.review_num}</td>
						<td><a href="detail.do?review_num=${article.review_num}">${article.review_title}
								<span class="badge">${article.review_replyCount}</span>
						</a></td>
						<td>${article.mem_id}</td>
						<td>${article.review_regdate}</td>
						<td>${article.review_hit}</td>
						<td>${article.review_like}</td>
						<td>${article.review_dislike}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="align-center">${pagingHtml}</div><br><br><br><br><br><br>
	</c:if>
</div>
<!-- #content end -->

<!-- Go To Top (지우면안됨X)-->
<div id="gotoTop" class="icon-angle-up"></div>
<!-- Footer Scripts (지우면안됨X) ============================================= -->
<script type="text/javascript" src="js/functions.js"></script>