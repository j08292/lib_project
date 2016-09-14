<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div>
	<h2>
		<spring:message code="notice.list.title" />
	</h2>
	<form action="list.do" id="search_form" method="get">
		<div class="form-group input-group">
			<select name="keyfield">
				<option value="notice_title">제목</option>
				<option value="mem_id">작성자</option>
				<option value="notice_content">내용</option>
				<option value="all">전체</option>
			</select> <input type="text" size="16" name="keyword" class="form-control">
			<span class="input-group-btn"> <input type="submit" value="찾기"
				class="btn btn-default"> <i class="fa fa-search"></i>
			</span>
		</div>
	</form>
	<span><input type="button" value="글쓰기"
		onclick="location.href='write.do'"></span>
	<c:if test="${count==0}">
		<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count>0}">
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${list}">
						<tr>
							<td>${article.notice_num}</td>
							<td><a href="detail.do?notice_num=${article.notice_num}">${article.notice_title}</a></td>
							<td>${article.mem_id}</td>
							<td>${article.notice_regdate}</td>					
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="align-center">${pagingHtml}</div>
	</c:if>
</div>