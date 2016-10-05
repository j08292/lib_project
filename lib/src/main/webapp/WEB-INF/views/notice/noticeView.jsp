<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- Page Title(지우면안됨X) -->
<section id="page-title">
	<div class="container clearfix">
		<h1><spring:message code="qna.list.title"/></h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
			<li class="active">QnA List</li>
		</ol>	
	</div>
</section>
<!-- #page-title end -->

<!-- Content(지우면안됨X)-->
<div class="container clearfix">
	 <section id="content">
            <div class="content-wrap">
                <div class="container clearfix">
	 	<hr size="1" width="100%">
		<div>
			<h2 style="text-align:center;">&lt;${notice.notice_title}&gt;</h2>
			<ul style="list-style:none;">
				<li>번호 : ${notice.notice_num}</li>
				<li>작성자 : 관리자</li>
				<li>조회수 : ${notice.notice_hit}</li>
				<li>등록날짜 : ${notice.notice_regdate}</li>
			</ul>
					<hr size="1" width="100%">
			<br><br>
			<p>${notice.notice_content}</p>
		</div>
		<br><br><br><br><br><br>
			<div style="text-align:center;">
			<a href="list.do" class="btn btn-default btn-sm">목록으로</a>
			</div>
		    </div>
            </div>
        </section>
</div>
<!-- #content end -->

<!-- Go To Top (지우면안됨X)-->
<div id="gotoTop" class="icon-angle-up"></div>
<!-- Footer Scripts (지우면안됨X)-->
<script type="text/javascript" src="js/functions.js"></script>