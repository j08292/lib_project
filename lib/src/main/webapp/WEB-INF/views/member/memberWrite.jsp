<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Stylesheets
	============================================= -->
<link
	href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/bootstrap.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/layout.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/style.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/dark.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/font-icons.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/animate.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/magnific-popup.css"
	type="text/css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/responsive.css"
	type="text/css" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<!--[if lt IE 9]>
		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

<!-- External JavaScripts
	============================================= -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/user/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/user/js/confirmId.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/user/js/member.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/user/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/user/js/plugins.js"></script>

<!-- Document Title
	============================================= -->
<title>회원가입</title>


<!-- Page Title
		============================================= -->
<section id="page-title">

	<div class="container clearfix">
		<h1>My Account</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main.do" style = "font-size: 15pt;">Home</a></li>
			<li><a href = "${pageContext.request.contextPath}/member/login.do" style = "font-size: 15pt;">Login</a></li>
		</ol>
	</div>

</section>
<!-- #page-title end -->

<!-- Content
		============================================= -->
<section id="content">

	<div class="content-wrap">

		<div class="container clearfix">

			<div class="tabs divcenter nobottommargin clearfix"
				id="tab-login-register" style="max-width: 500px;">

				<ul class="tab-nav tab-nav2 center clearfix">
					<li class="inline-block"><a href="#tab-register">회원가입</a></li>
				</ul>

				<div class="tab-container">

					<%-- <div class="tab-content clearfix" id="tab-login">
						<div class="panel panel-default nobottommargin">
							<div class="panel-body" style="padding: 40px;">
								<form id="login-form" name="login-form" class="nobottommargin" action="write.do" method="post">

								<form:form action="login.do" commandName="command"
									id="login-form" class="nobottommargin">
									<form:errors element="div" class="error-color" />

									<h3>로그인</h3>

									<li class="col_full">
										<label for="login_mem_id">아이디:</label> 
										<input type = "text" id= "login_mem_id" class="form-control" />
									</li>

									<li class="col_full">
										<label for="login_mem_passwd">비밀번호:</label> 
										<input type = "password" id="login_mem_passwd" class="form-control" />
									</li>

									<li class="col_full nobottommargin">
										<input type="submit"
											class="button button-3d button-black nomargin" value="로그인">
										<a href="#" class="fright">비밀번호를 잊어버리셨나요?</a>
									</li>
									</form>
								</form:form>
							</div>
						</div>
					</div>
 --%>
					<div class="tab-content clearfix" id="tab-register">
						<div class="panel panel-default nobottommargin">
							<div class="panel-body" style="padding: 40px;">

								<%-- 	<form id="register-form" name="register-form" class="nobottommargin" action="#" method="post"> --%>
								<form:form action="write.do" commandName="command"
									id="register-form" class="nobottommargin" method = "post">

									<div class="col_full">
										<label for="mem_id">아이디:</label> 
										<form:input path="mem_id" class="form-control" maxlength="12" />
										<input type="button" id="confirmId" value="아이디 중복검사">
										<span id="id_signed" class="error-color"></span> 
										<img
											src="${pageContext.request.contextPath }/resources/user/images/ajax-loader.gif"
											width="16" height="16" id="loading" style="display: none;">
										<form:errors path="mem_id" class="error-color" />
									</div>

									<div class="col_full">
										<label for="mem_passwd">비밀번호:</label>
										<form:password path="mem_passwd" class="form-control" />
										<span id="passwd_signed" class="error-color"></span>
										<form:errors path="mem_passwd" class="error-color" />	
									</div>

									<!-- <div class="col_full">
										<label for="register-form-repassword">비밀번호 확인:</label> <input
											type="password" id="register-form-repassword"
											name="register-form-repassword" value="" class="form-control" />
									</div> -->

									<div class="col_full">
										<label for="mem_name">이름:</label> 
										<form:input path="mem_name" class="form-control" />
										<span id="name_signed" class="error-color"></span>
										<form:errors path="mem_name" class="error-color" />
									</div>

									<div class="col_full">
										<label for="mem_cell">전화번호:</label> 
										<form:input path="mem_cell" class="form-control" />
										<span id="cell_signed" class="error-color"></span>
										<form:errors path="mem_cell" class="error-color" />
									</div>

									<div class="col_full">
										<label for="mem_email">이메일 주소:</label> 
										<form:input path="mem_email" class="form-control" />
										<span id="email_signed" class="error-color"></span>
										<form:errors path="mem_email" class="error-color" />
									</div>
								
									<!-- daum 우편번호 시작 -->
									<div class="col_full">
										<label for="mem_address">우편번호:</label><br> 
										<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br> 
											<input type="text" id="sample3_postcode" placeholder="우편번호" class="form-control">	-
											<br>

										<div id="wrap"
											style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
											<img
												src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
												id="btnFoldWrap"
												style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
												onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>
										<input type="text" id="mem_address" name = "mem_address" class="form-control"
											placeholder="주소">
										<form:errors path="mem_address" class="error-color" />

									</div>
									
									<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
									<script>
										// 우편번호 찾기 찾기 화면을 넣을 element
										var element_wrap = document
												.getElementById('wrap');

										function foldDaumPostcode() {
											// iframe을 넣은 element를 안보이게 한다.
											element_wrap.style.display = 'none';
										}

										function sample3_execDaumPostcode() {
											// 현재 scroll 위치를 저장해놓는다.
											var currentScroll = Math
													.max(
															document.body.scrollTop,
															document.documentElement.scrollTop);
											new daum.Postcode(
													{
														oncomplete : function(
																data) {
															// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

															// 각 주소의 노출 규칙에 따라 주소를 조합한다.
															// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
															var fullAddr = data.address; // 최종 주소 변수
															var extraAddr = ''; // 조합형 주소 변수

															// 기본 주소가 도로명 타입일때 조합한다.
															if (data.addressType === 'R') {
																//법정동명이 있을 경우 추가한다.
																if (data.bname !== '') {
																	extraAddr += data.bname;
																}
																// 건물명이 있을 경우 추가한다.
																if (data.buildingName !== '') {
																	extraAddr += (extraAddr !== '' ? ', '
																			+ data.buildingName
																			: data.buildingName);
																}
																// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
																fullAddr += (extraAddr !== '' ? ' ('
																		+ extraAddr
																		+ ')'
																		: '');
															}

															// 우편번호와 주소 정보를 해당 필드에 넣는다.
															document
																	.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
															document
																	.getElementById('mem_address').value = fullAddr;

															// iframe을 넣은 element를 안보이게 한다.
															// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
															element_wrap.style.display = 'none';

															// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
															document.body.scrollTop = currentScroll;
														},
														// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
														onresize : function(
																size) {
															element_wrap.style.height = size.height
																	+ 'px';
														},
														width : '100%',
														height : '100%'
													}).embed(element_wrap);

											// iframe을 넣은 element를 보이게 한다.
											element_wrap.style.display = 'block';
										}
									</script>
									<!-- daum 우편번호 끝 -->
									
									<div class="col_full nobottommargin">
										<input type="submit"
											class="button button-3d button-black nomargin" value="등록">
									</div>

								</form:form>
								<%-- </form> --%>
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

