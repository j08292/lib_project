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
<title>Login</title>


<!-- Page Title
		============================================= -->
<section id="page-title">

	<div class="container clearfix">
		<h1>My Account</h1>
		<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/main/main.do" style = "font-size: 15pt">Home</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/member/write.do" style = "font-size: 15pt">Register</a></li>
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
					<!-- <li class="inline-block"><a href="#tab-login">Login</a></li> -->
					<li class="inline-block"><a href="#tab-register">Login</a></li>
				</ul>

				<div class="tab-container">

					<div class="tab-content clearfix" id="tab-login">
						<div class="panel panel-default nobottommargin">
							<div class="panel-body" style="padding: 40px;">
							<%-- 	<form id="login-form" name="login-form" class="nobottommargin"
									action="write.do" method="post"> --%>

									<form:form action="login.do" commandName="command"
										id="login-form" class="nobottommargin">
										<form:errors element="div" class="error-color" />

										<li class="col_full"><label for="mem_id">아이디:</label>
											<form:input path="mem_id" class="form-control" />
										</li>

										<li class="col_full"><label for="mem_passwd">비밀번호:</label>
											<form:password path="mem_passwd" class="form-control" /></li>

										<li class="col_full nobottommargin"><input type="submit"
											class="button button-3d button-black nomargin" value="로그인">
											<a href="#" class="fright">비밀번호를 잊어버리셨나요?</a></li>
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

