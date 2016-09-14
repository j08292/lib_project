<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div>
	<h2>
		<spring:message code="booklist.list.title" />
	</h2>
	<form action="list.do" id="search_form" method="get">
		<div class="form-group input-group">
			<select name="keyfield" id="booklistSearch">
				<option value="list_title">제목</option>
				<option value="list_num">등록번호</option>
				<option value="list_code">ISBN</option>
				<option value="list_status">도서상태</option>
				<option value="all">전체</option>
			</select>
			<span id="output">
				<input type="text" size="16" name="keyword" id="textbox">
			</span>
			<input type="submit" value="찾기">
		</div>
	</form>
	<input type="button" value="도서등록" onclick="location.href='write.do'">
	<c:if test="${count==0}">
		<div class="align-center">등록된 도서가 없습니다.</div>
	</c:if>
	<c:if test="${count>0}">
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>등록번호</th>
						<th>제목</th>
						<th>지은이</th>
						<th>출판사</th>
						<th>ISBN</th>
						<th>페이지수</th>
						<th>책사진</th>
						<th>입고날짜</th>
						<th>도서상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${list}">
						<tr>
							<td>${article.list_num}</td>
							<td><a href="update.do?list_num=${article.list_num}">${article.list_title}</a></td>
							<td>${article.list_writer}</td>
							<td>${article.list_publish}</td>
							<td>${article.list_code}</td>
							<td>${article.list_page}</td>
							<td><c:choose>
									<c:when test="${!empty article.list_filename}">						
										<img src="/finalProject/upload/${article.list_filename}" class="adminListImage"  data-num="${article.list_num}" height="20px"/>
									</c:when>
									<c:otherwise>파일 없음</c:otherwise>
								</c:choose></td>
							<td>${article.list_regdate}</td>
							<td><c:if test="${article.list_status == 1}">대출정지</c:if>
								<c:if test="${article.list_status == 0}"></c:if></td>
						</tr>						
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="align-center">${pagingHtml}</div>
	</c:if>
</div>