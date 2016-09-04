<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/style.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/dark.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/animate.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/magnific-popup.css" type="text/css" />

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<!--[if lt IE 9]>
		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

	<!-- External JavaScripts
	============================================= -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/plugins.js"></script>

	<!-- Document Title
	============================================= -->
	<title>Canvas | The Multi-Purpose HTML5 Template</title>

</head>

<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">
		<!-- 헤더 시작 -->
		<tiles:insertAttribute name="header"/>
		<!-- 헤더 끝 -->
		<!-- 바디 시작 -->
		<tiles:insertAttribute name="body"/>
		<!-- 바디 끝 -->
		<!-- #content end -->
		<!-- 푸터 시작 -->
		<tiles:insertAttribute name="footer"/>
		<!-- 푸터 끝 -->
	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/functions.js"></script>

</body>
</html>