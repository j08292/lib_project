<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div>
	<h2>
		<spring:message code="bookrent.list.title" />
	</h2>
	<form action="list.do" id="search_form" method="get">
		<div class="form-group input-group">
			<select name="keyfield" id="bookrentSearch">
				<option value="rent_num">대출번호</option>
				<option value="list_title">제목</option>
				<option value="list_code">ISBN</option>
				<option value="mem_id">대출자</option>
				<option value="rent_status">도서상태</option>
				<option value="all">전체</option>
			</select>
			<span id="output">
				<input type="text" size="16" name="keyword" id="textbox">
			</span>
			<input type="submit" value="찾기">
		</div>
	</form>

	<c:if test="${count==0}">
		<div class="align-center">대출된 도서가 없습니다.</div>
	</c:if>
	<c:if test="${count>0}">
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>대출번호</th>
						<th>제목</th>
						<th>ISBN</th>
						<th>대출자</th>
						<th>대출일</th>
						<th>반납예정일</th>
						<th>연체일</th>
						<th>도서상태</th>
						<th>반납처리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${list}">
						<tr>
							<td>${article.rent_num}</td>
							<td>${article.list_title}</td>
							<td>${article.list_code}</td>
							<td>${article.mem_id}</td>
							<td>${article.rent_regdate}</td>
							<td><c:choose>
									<c:when test="${article.rent_status == 0}">
									${article.return_regdate}
								</c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose></td>
							<td><c:choose>									
									<c:when test="${article.rent_status == 0}">
										<!-- 대출중 도서의 연체일 구하기 -->
										<jsp:useBean id="toDay" class="java.util.Date" />
										<fmt:parseDate var="returnDate"
											value="${article.return_regdate}" pattern="yyyy-MM-dd" />
										<fmt:parseNumber value="${toDay.time / (1000*60*60*24)}"
											integerOnly="true" var="nowDays" scope="request" />
										<fmt:parseNumber value="${returnDate.time / (1000*60*60*24)}"
											integerOnly="true" var="oldDays" scope="request" />
										<c:if test="${toDay > article.return_regdate}">
											<font color="red"> ${nowDays - oldDays} </font>
										</c:if>
									</c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose></td>
							<td><c:if test="${article.rent_status == 0}">대출중</c:if> <c:if
									test="${article.rent_status == 2}">예약중</c:if></td>
							<td>
								<c:if test="${article.rent_status == 0}">									
									<c:if test="${(nowDays - oldDays) > 0}"><!-- 연체 도서 -->
										<input type="button" onclick="javascript:updatePenalty_event(${article.rent_num},${nowDays - oldDays},'${article.list_title}','${article.mem_id}');" value="반납">
									</c:if>
									<c:if test="${(nowDays - oldDays) <= 0}">
										<input type="button" onclick="javascript:bookReturn_event(${article.rent_num},'${article.list_title}');" value="반납">
									</c:if>
								</c:if>
								<c:if test="${article.rent_status == 2}">
									<input type="button" onclick="javascript:bookReturn_event(${article.rent_num},'${article.list_title}');" value="승인">	
								</c:if>
							</td>									
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="align-center">${pagingHtml}</div>
	</c:if>
</div>