<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container clearfix">
	<section id="page-title" class="page-title-center">
	<div class="page-title-center">
		<h2>${speech.speech_title}</h2>
	</div>
	</section>
	<table>
		<tr>
			<td><h5>입금은행</h5></td>
			<td>신한은행</td>
		</tr>
		<tr>
			<td><h5>계좌번호</h5></td>
			<td>123-456-78910</td>
		</tr>
		<tr>
			<td><h5>입금금액</h5></td>
			<td>${speech.speech_price}</td>
		</tr>
		<tr>
			<td><h5>입금기한</h5></td>
			<td>${speechReserve.speech_reserve_date }</td>
		</tr>
		<tr>
			<td><h5>승인여부</h5></td>
			<td>
				<c:if test="${speechReserve.speech_reserve_status eq 0}">입금 확인중입니다.</c:if>
				<c:if test="${speechReserve.speech_reserve_status eq 1}">신청되었습니다.(입금완료)</c:if>
				<c:if test="${speechReserve.speech_reserve_status eq 2}">취소 신청되었습니다.</c:if>
				<c:if test="${speechReserve.speech_reserve_status eq 3}">취소 확정되었습니다.(취소완료)</c:if>
			</td>
		</tr>
	</table>
	<input type="button" value="신청 취소하기" onclick="location.href=''">
	<input type="button" value="목록으로" onclick="location.href='list.do'">
</div>