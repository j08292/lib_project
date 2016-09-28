<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div>

	 <section id="content">

            <div class="content-wrap">

                <div class="container clearfix ">
	<h2><p style="text-align:center;">&lt; <spring:message code="wishlist.write.title"/> &gt;</p></h2>
	
	<br><br><br>
	<div>
	<form:form action="write.do" commandName="command" id="register_form" class="form-horizontal align-center">
	
		<form:errors element="div" class="error-color"/>					
			<div class="form-group">
				<label for="wish_title" class="control-label col-sm-4">제목</label>
				<div class="col-sm-4">
				<form:input path="wish_title" class="form-control"/>
				<form:errors path="wish_title" class="error-color"/>
				</div>
			</div>
			
			<div class="form-group"><br>
				<label for="wish_writer" class="control-label col-sm-4">지은이</label>
				<div class="col-sm-4">
				<form:input path="wish_writer" class="form-control"/>
				<form:errors path="wish_writer" class="error-color"/>
				</div>
			</div>
			<br>
			<div class="form-group">
				<label for="wish_publish" class="control-label col-sm-4">출판사</label>
				<div class="col-sm-4">
				<form:input path="wish_publish" class="form-control"/>
				<form:errors path="wish_publish" class="error-color"/>
				<br>
				<input type="submit" value="신청" class="btn btn-primary" onclick="javascript:confirm_event();">
				</div>
			</div>
			
				
					
	</form:form>
	</div>
</div>

    </div>
    </section>

            </div>

        
		