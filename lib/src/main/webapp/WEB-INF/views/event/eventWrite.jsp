<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!-- Content -->
<section id="content">

	<div class="content-wrap">

		<div class="container clearfix">

			<div class="tabs divcenter nobottommargin clearfix"
				id="tab-login-register" style="max-width: 500px;">

				<div class="tab-content clearfix" id="tab-register">
					<div class="panel panel-default nobottommargin">
						<div class="panel-body" style="padding: 40px;">
							<h3>이벤트 등록하기</h3>

							<form:form id="register-form" name="register-form"
								class="nobottommargin" action="write.do" commandName="command"
								enctype="multipart/form-data">

								<div class="col_full">
									<label for="event_title">제목:</label> <input type="text"
										id="event_title" name="event_title" value=""
										class="form-control" />
								</div>

								<div class="col_full">
									<label for="event_content">내용:</label>
									<form:textarea path="event_content" class="form-control" />
								</div>

								<div class="col_full">
									<label for="event_upload">파일:</label> <input type="file"
										id="event_upload" name="event_upload" value=""
										class="form-control" />
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
									<input type="submit"
										class="button button-3d button-black nomargin"
										id="register-form-submit" name="register-form-submit"
										value="등록" /> <input type="button"
										class="button button-3d button-black nomargin"
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
