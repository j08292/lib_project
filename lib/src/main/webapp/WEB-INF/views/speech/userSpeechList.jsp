<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div>
	<h2><spring:message code="speech.list.title"/></h2>
	<form action="list.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield">
					<option value="speech_title">제목</option>
					<option value="speech_content">내용</option>
					<option value="speech_location">장소</option>
					<option value="speech_date">날짜</option>
				</select>
			</li>
			<li>
				<input type="text" size="16" name="keyword">
			</li>
			<li>
				<input type="submit" value="찾기">
			</li>
		</ul>
	</form>
	<table>
		<tr>
			<td class="align-right">
				<input type="button" value="글쓰기" onclick="location.href='write.do'">
			</td>
		</tr>
	</table>
	<c:if test="${count == 0}">
	<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<div class="table-responsive">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>ID</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<c:forEach var="article" items="${list}">
			<tbody>
				<tr>
					<td>${article.seq}</td>
					<td><a href="detail.do?seq=${article.seq}">${article.title}</a></td>
					<td>${article.id}</td>
					<td>${article.regdate}</td>
					<td>${article.hit}</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
	</div>
	<div class="align-center">${pagingHtml}</div>
	</c:if>
</div>