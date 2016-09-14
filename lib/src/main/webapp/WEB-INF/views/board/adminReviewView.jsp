<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div>
	<h2>${review.review_title}</h2>
	<ul>
		<li>번호 : ${review.review_num}</li>
		<li>ID : ${review.mem_id }</li>
		<li>등록날짜 : ${review.review_regdate}</li>
		<c:if test="${!empty review.review_file}">
			<li>첨부파일 : <a href="file.do?review_file=${review.review_file}">${review.review_file}</a></li>
		</c:if>
	</ul>
	<input type="button" value="삭제" onclick="javascript:delete_event(${review.review_num});">
	<hr size="1" width="100%">	
	<p>
		<c:if test="${!empty review.review_file}">
			<img src="file.do?review_file=${review.review_file}" width=512 height=384></img>
		</c:if><br><br>
		${review.review_content}
	</p>
	<hr size="1" width="100%">
	
	<!-- review.reply.js에 넘겨주는 글번호,아이디 -->
	<input type="hidden" name="review_num" value="${review.review_num}" id="review_num">
	<input type="hidden" name="mem_id" value="${userId}" id="userId">
	
	<!-- 댓글 -->
	<%-- <form id="re_form" style="display: none;">
		<input type="hidden" name="review_num" value="${review.review_num}"
			id="review_num"> <input type="hidden" name="mem_id"
			value="${userId}" id="userId">
		<textarea rows="3" cols="50" name="review_re_content"
			id="review_re_content" maxlength="300" class="rep-content"
			<c:if test="${empty userId}">disabled="disabled"</c:if>><c:if
				test="${empty userId}">로그인해야 작성할 수 있습니다.</c:if></textarea>
		<c:if test="${!empty userId}">
			<div id="re_first">
				<span class="letter-count">300/300</span>
			</div>
			<div id="re_second" class="align-right">
				<input type="submit" value="전송">
			</div>
		</c:if>
	</form> --%>

	<!-- 목록출력 -->
	<div id="output"></div>
	<div class="paging_button" style="display: none;">
		<input type="button" value="다음글 보기">
	</div>
	<div id="loading" style="display: none;">
		<img src="${pageContext.request.contextPath}/resources/user/images/ajax-loader.gif">
	</div>
</div>