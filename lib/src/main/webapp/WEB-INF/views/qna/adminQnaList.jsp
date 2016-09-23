<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<h1 class="page-header">
	QnA 글 목록
	</h1>
	<form action="list.do" id="search_form" method="get">
		<div align="center">
				<select name="keyfield" id="marathonSearch">
					<option value="mem_id">ID</option>
					<option value="marathon_status">완주혜택상태</option>
				</select>
				<span id="output">
					<input type="text" size="16" name="keyword" id="textbox">
				</span>
				<input type="submit" value="찾기">
		</div>
	</form>
	<c:if test="${count == 0}">
	<div align="center">QnA에 등록된 글이 없습니다.</div>
	</c:if>
	
	
	<c:if test="${count > 0}">
	<div class="table-responsive">
		<table class="table table-hover">
			<thead> 
				<tr>
					<th style="text-align:center;">번호</th>
					<th style="text-align:center;">제목</th>
					<th style="text-align:center;">ID</th>
					<th style="text-align:center;">작성일</th>
					<th style="text-align:center;">답변여부</th>
					<th style="text-align:center;">조회수</th>
					<th style="text-align:center;">삭제</th>
				</tr>
			</thead>
			<c:forEach var="article" items="${list}">
			<tbody style="text-align:center;">
				<tr>
					<td>${article.qna_num}</td>
					<td><a href="detail.do?qna_num=${article.qna_num}">${article.qna_title}</a></td>
					<td>${article.mem_id}</td>
					<td>${article.qna_regdate}</td>
					<td>
					<c:if test="${article.qna_replyCount>0 }">
					답변 완료
					</c:if>
					<c:if test="${article.qna_replyCount==0 }">
					답변 대기
					</c:if>
					</td>
					<td>${article.qna_hit}</td>
					<td><input type="button" value="삭제"></td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
	</div>
	<div align="center">${pagingHtml}</div>
	</c:if>
</div>