<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container clearfix">
	<c:if test="${member.mrt_status eq 1}">
	<h2>내 마라톤 현황</h2>
	<div>
	<c:set var="sumPage" value="0"/>
	
	<c:forEach var="page" items="${pageList}">
		<c:set var="sum" value="${sum + page.list_page}"/>
	</c:forEach>
	현재 <strong><fmt:formatNumber type="currency" value="${sum}" pattern="###,###"/></strong>페이지 읽음(<fmt:formatNumber value="${(sum/42195) - (sum/42195%1)}" type="number"/>회 완주)<br>
	<br>
	완주까지 남은 페이지 <strong><fmt:formatNumber type="currency" value="${42195-sum}" pattern="###,###"/></strong>페이지
	</div>
	<br>
	<hr size="100%">
	<h4>달성률</h4>
	
	<ul class="skills">
	    <li data-percent="${sum/42192 * 100}">
	        <div class="progress" style="width: ${sum/42192 * 100}%;">
	            <div class="progress-percent"><div class="counter counter-inherit counter-instant"><span data-from="0" data-to="${sum/42192 * 100}" data-refresh-interval="50" data-speed="1100">${sum/42192 * 100}</span>%</div></div>
	        </div>
	    </li>
	</ul>
	
	<div class="rounded-skill nobottommargin easyPieChart 6500 animated" data-color="#3F729B" data-size="200" data-percent="${sum/42192 * 100}" data-width="3" data-animate="6500" style="width: 200px; height: 200px; line-height: 200px;">
	<div class="counter counter-inherit">
	<span data-from="0" data-to="${sum/42192 * 100}" data-refresh-interval="50" data-speed="6000">${sum/42192 * 100}</span>%</div>
	<canvas width="200" height="200"></canvas>
	</div>
	
	
	<br>
	<hr size="100%">
	<h4>[대출내역]</h4>
	<br>
	<c:if test="${count == 0}">
	<div align="center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table class="table table-hover"  style="text-align:center;">
		<thead>
				<tr>
					<th style="text-align:center;">책번호</th>
					<th style="text-align:center;">책제목</th>
					<th style="text-align:center;">페이지 수</th>
					<th style="text-align:center;">반납날짜</th>
					<th style="text-align:center;">한줄평</th>
				</tr>
			</thead>
		
		<c:forEach var="article" items="${rentedList}">
		<tbody>
			<tr>
				<td>${article.list_num}</td>
				<td>${article.list_title}</td>
				<td>${article.list_page}</td>
				<td>${article.rent_regdate}</td>
				<td>
				<c:if test="${article.gradecheck eq 1}">
				한줄평을 남기셨습니다.
				</c:if>
				<c:if test="${article.gradecheck eq 0}">
				<input type="button" value="한줄평쓰기" onclick="location.href=''">
				</c:if>
				</td>
			</tr>
		</tbody>
		</c:forEach>
	</table>
	
	</c:if>
	
	</c:if>
	
</div>