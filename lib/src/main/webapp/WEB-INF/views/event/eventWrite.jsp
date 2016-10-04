<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!-- Content -->
<div>
	<h1>이벤트 등록하기</h1>
	<div style="width:70%;margin:0 auto;"> 
	<form:form id="register-form" name="register-form" class="nobottommargin" action="write.do" commandName="command" enctype="multipart/form-data">
		<form:errors element="div" class="error-color"/>
		<div class="form-group">
			<label for="event_title">제목:</label> 
			<form:input path="event_title" class="form-control"/>
			<form:errors path="event_title" class="error-color"/>
		</div>

		<div class="form-group">
			<label for="event_content">내용:</label>
			<form:textarea path="event_content" rows="8" class="form-control" />
			<form:errors path="event_content" class="error-color"/>
		</div>

		<div class="form-group">
			<label for="event_upload">파일:</label> 
			<div id="imagePreview"></div><br>
			<input type="file" name="event_upload" id="upload" value="" class="form-control" onchange="ImagePreview();"/>
		</div>

		<div class="form-group">
			<label for="event_startdate">이벤트 시작일:</label> 
			<form:input path="event_startdate" class="datepicker form-control" id="event_startdate"/>
			<form:errors path="event_startdate" class="error-color"/>
		</div>

		<div class="form-group">
			<label for="event_enddate">이벤트 종료일:</label> 
			<form:input path="event_enddate" class="datepicker form-control" id="event_enddate"/>
			<form:errors path="event_enddate" class="error-color"/>
		</div>

		<div class="col_full nobottommargin" align="center">
			<input type="submit" id="register-form-submit" name="register-form-submit" value="등록" class="btn btn-primary"/> 
			<input type="button" id="register-form-submit" name="register-form-submit" value="목록" onclick="location.href='list.do'" class="btn btn-default"/>
		</div>
	</form:form>
	</div>
</div> 
<!-- #content end -->
