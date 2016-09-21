<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Content -->
<section id="content">

	<div class="content-wrap">

		<div class="container clearfix">

			<div class="tabs divcenter nobottommargin clearfix"
				id="tab-login-register" style="max-width: 500px;">

				<div class="tab-content clearfix" id="tab-register">
					<div class="panel panel-default nobottommargin">
						<div class="panel-body" style="padding: 40px;">
							<h3><spring:message code="event.update.title"/></h3>

							<form:form id="register-form" name="register-form"
								class="nobottommargin" action="update.do" commandName="command"
								enctype="multipart/form-data">

								<div class="col_full">
									<label for="event_title">제목:</label> 
									<input type="text" id="event_title" name="event_title" value="" class="form-control" />
								</div>

								<div class="col_full">
									<label for="event_content">내용:</label>
									<form:textarea path="event_content" class="form-control" />
								</div>

								<div class="col_full">
									<label for="event_upload">파일:</label>
									<input type="file" id="event_upload" name="event_upload" value="" class="form-control" />
									<c:if test="${!empty command.event_filename}">
									<br>
									<span>(${command.event_filename})파일이 등록되어 있습니다.
									다시 업로드하면 기존 파일은 삭제됩니다.</span>
									</c:if>
								</div>

								<div class="col_full">
									<label for="event_startdate">이벤트 시작일:</label> <input
										type="date" id="event_startdate" name="event_startdate"
										value="" class="form-control" />
								</div>

								<div class="col_full">
									<label for="event_enddate">이벤트 종료일:</label> <input type="date"
										id="event_enddate" name="event_enddate" value=""
										class="form-control" />
								</div>


								<div class="col_full nobottommargin" align="center">
									<input type="submit" class="button button-3d button-black nomargin"
											id="register-form-submit" name="register-form-submit" value="재등록" /> 
									<input type="button" class="button button-3d button-black nomargin"
										id="register-form-submit" name="register-form-submit"
										value="목록" onclick="location.href='list.do'" />
								</div>

							</form:form>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	</div>

</section>
<!-- #content end -->



<!-- Go To Top
   ============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>

<!-- Footer Scripts
   ============================================= -->
<script type="text/javascript" src="js/functions.js"></script>
