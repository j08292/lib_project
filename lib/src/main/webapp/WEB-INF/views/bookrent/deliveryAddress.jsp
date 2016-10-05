<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 정보</title>
<link rel="stylesheet" href="/lib/resources/admin/css/bootstrap.min.css"/>
<!-- Morris Charts CSS -->
<link rel="stylesheet" href="/lib/resources/admin/css/plugins/morris.css"/>
</head>
<body>  
	<div>
	   <h1 class="page-header">&nbsp;${delivery.mem_id}님의 <spring:message code="bookrent.delivery.title"/></h1>
	   <div class="col-sm-4">
	         <ul class="list-group">
	             <li class="list-group-item">주문자 성명 : 
	             	<c:forTokens items="${delivery.delivery_name}" delims="," var="name">${name}</c:forTokens>
	             </li>
	             <li class="list-group-item">주문자 연락처 : 
	             	<c:forTokens items="${delivery.delivery_cell}" delims="," var="cell">${cell}</c:forTokens>
	             </li>
	             <li class="list-group-item">주문자 email : 
	             	<c:forTokens items="${delivery.delivery_email}" delims="," var="email">${email}</c:forTokens>
	             </li>
	             <c:if test="${!empty delivery.sample3_postcode}">
	                <li class="list-group-item">배송지 우편번호 : 
	                	<c:forTokens items="${delivery.sample3_postcode}" delims="," var="postcode">${postcode}</c:forTokens>
	             	</li>
	             </c:if>
	             <li class="list-group-item">배송지 주소 : 
	             	<c:forTokens items="${delivery.delivery_address}" delims="," var="address">${address}</c:forTokens>
	             </li>
	         </ul>
	    </div>
	</div>
</body>
</html>