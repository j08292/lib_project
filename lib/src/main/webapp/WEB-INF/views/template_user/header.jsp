<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header ============================================ -->
<header id="header" class="transparent-header full-header" data-sticky-class="not-dark">
	<div id="header-wrap">
		<div class="container clearfix">
			<div id="primary-menu-trigger">
				<i class="icon-reorder"></i>
			</div>
			<!-- Logo ============================================= -->
			<div id="logo">
				<a href="${pageContext.request.contextPath}/main/main.do"
					class="standard-logo"
					data-dark-logo="${pageContext.request.contextPath}/resources/user/images/logo-dark_1.png"><img
					src="${pageContext.request.contextPath}/resources/user/images/logo_1.png"
					alt="Canvas Logo"></a> <a
					href="${pageContext.request.contextPath}/main/main.do"
					class="retina-logo"
					data-dark-logo="${pageContext.request.contextPath}/resources/user/images/logo-dark@2x_1.png"><img
					src="${pageContext.request.contextPath}/resources/user/images/logo@2x_1.png"
					alt="Canvas Logo"></a>
			</div>
			<!-- #logo end -->

			<!-- Primary Navigation ============================================= -->
			<nav id="primary-menu" class="dark">
				<ul>
					<li class="speech"><a href="${pageContext.request.contextPath}/board/operationGuide.do"><i class="icon-ok"></i>이용안내</a></li>					
					<li><a href="#"><i class="icon-book3"></i>도서</a>
						<ul>
							<li><a href="${pageContext.request.contextPath }/book/search.do"><i class="icon-bookmark2"></i>도서검색</a></li>
							<li class="wishlist"><a href="${pageContext.request.contextPath}/wishlist/write.do"><i class="icon-bookmark2"></i>희망도서 신청</a></li>
						</ul>
					</li>
					<li class="speech"><a href="${pageContext.request.contextPath}/speech/list.do"><i class="icon-signal"></i>강연</a></li>

					<li><a href="#"><i class="icon-inbox"></i>게시판</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/board/list.do"><i class="icon-inbox"></i>감상평게시판</a></li>
							<li><a href="${pageContext.request.contextPath}/board/qnaList.do"><i class="icon-inbox"></i>QnA</a></li>
						</ul>
					</li>
					<li class="notice"><a href="${pageContext.request.contextPath}/notice/list.do"><i class="icon-bookmark2"></i>공지사항</a></li>
					<li><a href="#"><i class="icon-line-heart"></i>EVENT</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/event/list.do"><i class="icon-line-heart"></i>이벤트</a></li>
							<li><a href="${pageContext.request.contextPath}/event/marathonInfo.do"><i class="icon-line-heart"></i>독서마라톤</a></li>
						</ul>
					</li>
				</ul>
				<ul>
					<c:if test="${empty userId }">
						<li><a href="${pageContext.request.contextPath }/member/write.do"><i class="icon-line-paper"></i>회원가입</a></li>
						<li><a href="${pageContext.request.contextPath }/member/login.do"><i class="icon-off"></i>로그인</a></li>
					</c:if>
					<c:if test="${!empty userId && mem_level == 2 }">
						<li><a href="#" style="text-transform: lowercase;">[관리자 ${userId}님 로그인 중]</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/main.do">관리자	페이지</a></li>
						<li><a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
					</c:if>
					<c:if test="${!empty userId && mem_level == 0 }">
						<li><a href="#" style="text-transform: lowercase;">[일반회원 ${userId}님 로그인 중]</a></li>

						<li><a href="#"><i class="icon-tags"></i>MY PAGE</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/book/basket.do"><i class="icon-shopping-cart"></i>책 바구니</a>
								<li><a href="${pageContext.request.contextPath }/member/myOrder.do">도서 대여내역</a></li>
								<li><a href="${pageContext.request.contextPath}/wishlist/list.do">희망도서신청내역</a>
								<li><a href="${pageContext.request.contextPath }/member/update.do">회원정보 수정</a></li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath }/member/logout.do"><i class="icon-off"></i>로그아웃</a></li>
					</c:if>
				</ul>
			</nav>
			<!-- #primary-menu end -->
		</div>
	</div>
</header>
<!-- #header end -->