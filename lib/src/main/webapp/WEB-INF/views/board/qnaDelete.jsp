<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Stylesheets(지우면안됨X)-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<!--[if lt IE 9]>
    	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<!-- External JavaScripts(지우면안됨X) -->
<!-- Page Title(지우면안됨X) -->
<section id="page-title">
	<div class="container clearfix">
        <h1><spring:message code="qna.delete.title"/></h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/board/qnaList.do">QnA List</a></li>
            <li class="active">QnA Delete</li>
        </ol>
    </div>
</section>
<!-- #page-title end -->

<!-- Content(지우면안됨X)-->
<section id="content">
	<div class="content-wrap">
		<div class="container clearfix">
			<!-- 내용입력 시작-->
			<h2>
				<spring:message code="qna.delete.title" />
			</h2>
			<form:form action="qnaDelete.do" commandName="qnaCommand">
				<form:errors element="div" class="error-color" />
                   	비밀번호 : <form:password path="qna_passwd" />
				<form:errors path="qna_passwd" class="error" />
				<br>
				<input type="submit" class="btn btn-default btn-sm" value="전송">
				<input type="button" value="게시판 목록" class="btn btn-default btn-sm"
					onclick="location.href='qnaList.do'">
			</form:form>
			<!-- 내용입력 끝-->
		</div>
	</div>
</section>
<!-- #content end -->

<!-- Go To Top (지우면안됨X)-->
<div id="gotoTop" class="icon-angle-up"></div>
<!-- Footer Scripts (지우면안됨X)-->
<script type="text/javascript" src="js/functions.js"></script>