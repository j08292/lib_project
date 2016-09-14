<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/notice.reply.js"></script>
<div>
	<h2 class="align-center">${notice.notice_title}</h2>
	<ul>
		<li>번호 : ${notice.notice_num}</li>
		<li>작성자 : 운영자</li>
		<li>조회수 : ${notice.notice_hit}</li>
		<li>등록날짜 : ${notice.notice_regdate}</li>
	</ul>
	<hr size="1" width="100%">
	<p>${notice.notice_content}</p>
	<hr size="1" width="100%">	
	<!-- 목록 출력 -->
	<div id="output"></div>
	<div class="paging_button" style="display: none;">
		<input type="button" value="다음글 보기">
	</div>
</div>