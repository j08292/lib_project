<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Page Title ============================================= -->
<section id="page-title">
	<div class="container clearfix">
		<h1><spring:message code="wishlist.write.title"/></h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/wishlist/list.do">My Wish Books</a></li>
			<li class="active">Request for Wish Books</li>
		</ol>
	</div>
</section>
<!-- #page-title end -->
<div>
	<section id="content">
		<div class="content-wrap">
			<div class="container clearfix ">
				<div>
					<form:form action="write.do" commandName="command" id="register_form" class="form-horizontal align-center">
						<form:errors element="div" class="error-color" />
						<div class="form-group">
							<label for="wish_title" class="control-label col-sm-4">제목</label>
							<div class="col-sm-4">
								<form:input path="wish_title" class="form-control" id="wish_title"/>
								<form:errors path="wish_title" class="error-color" />
							</div>
						</div>
						<div class="form-group">
							<br> <label for="wish_writer" class="control-label col-sm-4">지은이</label>
							<div class="col-sm-4">
								<form:input path="wish_writer" class="form-control" id="wish_writer" />
								<form:errors path="wish_writer" class="error-color" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="wish_publish" class="control-label col-sm-4">출판사</label>
							<div class="col-sm-4">
								<form:input path="wish_publish" class="form-control" id="wish_publish" />
								<form:errors path="wish_publish" class="error-color" />
							</div>
						</div>
						<br><br><br>
						<div align="center">
							<input type="submit" value="신청" class="btn btn-primary" onclick="javascript:confirm_event();">
						</div>
					</form:form>
				</div>
			</div>
			<br>
			<br>
		</div>
	</section>
</div>