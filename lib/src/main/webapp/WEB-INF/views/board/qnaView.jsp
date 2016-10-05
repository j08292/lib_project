
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>     
 <%@ taglib prefix = "c"	uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


        <!-- Page Title(지우면안됨X) -->
        <section id="page-title">

            <div class="container clearfix">
                <h1><spring:message code="qna.detail.title"/></h1>
                <span>Guest Relation</span>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/board/qnaList.do">Qna List</a></li>
                </ol>
            </div>

        </section><!-- #page-title end -->

        <!-- Content(지우면안됨X)-->
        <section id="content">

            <div class="content-wrap">

                <div class="container clearfix">

                   <!-- ============ 내용입력 시작============ -->
                  
                   <div>
                   	<h2 class="align-center">${qnaCommand.qna_title}</h2>
                   	<ul style="list-style:none;">
                   		<li >번호 : ${qnaCommand.qna_num}</li>
                   		<li>ID : ${qnaCommand.mem_id}</li>
                   		<li>조회수 : ${qnaCommand.qna_hit}</li>
                   		<li>등록날짜 : ${qnaCommand.qna_regdate}</li>
                   		
                   		
                   	</ul>
                   	<hr size="1" width="100%">
                   	<p>
                  	 
                   	  	<br>
                  	 	<br>                   		
                   		${qnaCommand.qna_content}
                   		
                   	</p>
                   	<hr size="1" width="100%">
                   	
                   	<p class="align-right">
	                   	<input type="button" value="목록으로" class="btn btn-primary btn-sm"
	                   			onclick="location.href='qnaList.do?qna_num=${qnaCommand.qna_num}'">
                   		<c:if test="${!empty userId && userId == qnaCommand.mem_id}">
                   		
                   		<input type="button" value="수정" class="btn btn-default btn-sm"
                   			onclick="location.href='qnaUpdate.do?qna_num=${qnaCommand.qna_num}'">
                   		<input type="button" value="삭제" class="btn btn-default btn-sm"
                   			onclick="location.href='qnaDelete.do?qna_num=${qnaCommand.qna_num}'">
                   	</c:if>
                   	</p>
                   	<!-- 댓글 -->
                   	<input type="hidden" name="qna_num" id="qna_num" value="${qnaCommand.qna_num}">
                   	<input type="hidden" name="mem_id" id="mem_id" value="${userId}">
                   	<!-- 목록출력 -->
                   	<div id="output"></div>
                   	<div class="paging_button" style="display:none;">
                   		<input type="button" value="다음글 보기">
                   	</div>
                   	<div id="loading" style="display:none;">
                   	<img src="${pageContext.request.contextPath}/resources/user/images/ajax-loader.gif">
                   	  	
                   	</div>
                   	<!-- 댓글수정 -->
                   </div> 	
                   	
                   	
                    <!--============ 내용입력 끝===============-->

                </div>

            </div>

        </section>
        <!-- #content end -->