<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div>
	<div align="center">
	<h2>${speech.speech_title} 예약자 현황</h2>
	</div>
	<div align="right">
	<input type="button" value="목록으로" onclick="location.href='list.do'" class="btn btn-sm btn-info">
	</div>
	<br>
	강연 참가금액: <fmt:formatNumber type="currency" value="${speech.speech_price}" pattern="###,###"/>원<br>
	
	<!-- 검색 PagingUtil 수정해야함 -->
	
	<form action="reservationList.do" id="search_form" method="get">
		<div align="center">
				<select name="keyfield">
					<option value="memid">ID</option>
					<option value="speech_reserve_status">신청상태</option>
				</select>
				<input type="text" size="16" name="keyword">
				<input type="submit" value="찾기">
		</div>
	</form>
	<c:if test="${count == 0}">
	<div align="center">강연을 신청한 사람이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<div class="table-responsive">
		<table class="table table-hover">
			<thead> 
				<tr>
					<th style="text-align:center;">예약번호</th>
					<th style="text-align:center;">예약자</th>
					<th style="text-align:center;">아이디</th>
					<th style="text-align:center;">예약일</th>
					<th style="text-align:center;">신청현황</th>
					<th style="text-align:center;">상태변경</th>
				</tr>
			</thead>
			<c:forEach var="article" items="${list}">
			<tbody style="text-align:center;">
				<tr>
					<td>${article.speech_reserve_num}</td>
					<td>${article.mem_name}</td>
					<td>${article.mem_id}</td>
					<td>${article.speech_reserve_date}</td>
					<td>
					<c:if test="${article.speech_reserve_status eq 0}">
						신청중
					</c:if>
					<c:if test="${article.speech_reserve_status eq 1}">
						신청 확정
					</c:if>
					<c:if test="${article.speech_reserve_status eq 2}">
						취소신청
					</c:if>
					<c:if test="${article.speech_reserve_status eq 3}">
						취소완료
					</c:if>
					</td>
					<td>
					<form action="updateReserve.do" id="search_form" method="get">
						<select name="status">
							<option value="0" <c:if test="${article.speech_reserve_status eq 0}">selected</c:if>>신청중</option>
							<option value="1" <c:if test="${article.speech_reserve_status eq 1}">selected</c:if>>신청 확정</option>
							<option value="2" <c:if test="${article.speech_reserve_status eq 2}">selected</c:if>>취소 신청</option>
							<option value="3" <c:if test="${article.speech_reserve_status eq 3}">selected</c:if>>취소 완료</option>
						</select>
						<a href="updateReserve.do?speech_num=${article.speech_reserve_num}&speech_reserve_num=${article.speech_reserve_num}" class="btn btn-xs btn-success">저장</a>
					</form>
					</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
	</div>
	<div align="center">${pagingHtml}</div>
	</c:if>
</div>