<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
//---------------------DatePicker--------------------------------
	$(function(){
		$('#datepicker').datepicker({
			showMonthAfterYear:true, //'default : 월 년'을 '년 월'로 바꿈
			changeYear:true, //년도 선택할 수 있게
			changeMonth:true,
			dateFormat:'yy-mm-dd',
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토']
		});
	});

</script>
<div>
	<h2 class="page-header"><spring:message code="speech.write.title"/></h2>
	<form:form action="write.do" commandName="command" id="register_form">
		<form:errors element="div" class="error-color"/>
			<div class="form-group">
				<label for="speech_title">강연 제목</label>
				<form:input path="speech_title" class="form-control"/>
				<form:errors path="speech_title" class="error-color"/>
			</div>
			<div class="form-group">
				<label for="speech_date">강연 날짜</label>
				<form:input path="speech_date" class="form-control" id="datepicker"/>
				<form:errors path="speech_date" class="error-color"/>
			</div>
			<div class="form-group">
				<label for="speech_price">강연 가격</label>
				<form:input path="speech_price" class="form-control"/>
				<form:errors path="speech_price" class="error-color"/>
			</div>
			<div class="form-group">
				<label for="speech_location">강연 장소</label>
				<form:input path="speech_location" class="form-control"/>
				<form:errors path="speech_location" class="error-color"/>
			</div>
			<div class="form-group">
				<label for="speech_content">강연 내용</label>
				<form:textarea path="speech_content" class="form-control"/>
				<form:errors path="speech_content" class="error-color"/>
			</div>
			<div>
				<input type="submit" value="전송" class="btn btn-primary">
				<input type="button" value="목록" class="btn btn-default" onclick="location.href='list.do'">
			</div>
	</form:form>
</div>