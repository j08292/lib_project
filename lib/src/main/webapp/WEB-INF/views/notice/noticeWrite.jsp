<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div>
	<h2><spring:message code="notice.write.title"/></h2>
	<form:form action="write.do" commandName="command" id="register_form">
		<form:errors element="div" class="error-color"/>					
			<div class="form-group">
				<label for="notice_title">제목</label>
				<form:input path="notice_title" class="form-control"/>
				<form:errors path="notice_title" class="error-color"/>
			</div>
			<div class="form-group">
				<label for="notice_content">내용</label>
				<form:textarea path="notice_content" class="form-control" width="150px"/>
				<form:errors path="notice_content" class="error-color"/>
			</div>
			<div class="form-group">
				<input type="submit" value="전송">
				<input type="button" value="목록" onclick="location.href='list.do'">
			</div>		
	</form:form>
</div>