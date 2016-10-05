
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Stylesheets(지우면안됨X)-->
<link rel="stylesheet" href="css/responsive.css" type="text/css" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<!--[if lt IE 9]>
    	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<!-- External JavaScripts(지우면안됨X) -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/plugins.js"></script>
<!-- Page Title(지우면안됨X) -->
<section id="page-title">
	<div class="container clearfix">
		
		<b>&nbsp;&nbsp;<font color="E97878" size="6pt">체</font><font color="gray" size="5pt">험하고</font> <font color="E97878" size="6pt">감</font><font color="gray" size="5pt">상하는</font> <font color="E97878" size="6pt">On</font><font color="gray" size="5pt">line</font><font color="E97878" size="6pt">도</font><font color="gray" size="5pt">서관</font></b>
				<br><br>
		
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
			<li class="active">Library Use Guidance</li>
		</ol>
	</div>
</section>
<!-- #page-title end -->

<!-- Content(지우면안됨X)-->
<section id="content">
	<div class="content-wrap">
		<div class="container clearfix">
			<!-- 내용입력 시작-->
			<form:form action="operationGuide.do" enctype="multipart/form-data"
				method="get">
				
				<h3><b>체감On도 이용안내</b></h3>
         				 ▶  &nbsp;<b><font color="E97878">체감On도</font></b>는 희망하는 도서를 <b>온라인으로 예약 및 대여</b> 등의 서비스를 제공하는 홈페이지 입니다.<br>
         				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;또한 회원들을 대상으로 다양한 <b>강연
					및 이벤트</b> 등의 서비스가 제공됩니다.&nbsp;&nbsp;회원 가입 후 도서관의 다양한 서비스를 이용하시길 바랍니다.<br>
         				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;편리한 서비스를 제공하기 위해 최선의 노력을 다하고 있으며 사용 안내를 위해 필요한 내용과 변경사항은 본 페이지를 통해 안내해드립니다.
         				 
         				 
         			<br>
				<br>
				<br>
				<br>
				<br>

				<h4>1. 도서대여</h4>
         			
         				 ▶ &nbsp; 로그인 후 상단의<b> &lt;BOOK &gt;</b>메뉴의 <b>'도서검색'</b>을 통해 희망하는 책을 검색한 후 대여가 가능합니다.<br><br>
         				 ▶&nbsp; 대여한 도서의 분실 또는 훼손시 동일 도서로 구입 또는 해당 도서의 현시가로 변상해야 합니다.<br><br>
         				 ▶&nbsp; 1인당 최대 대여 권수는 5권으로 제한됩니다.<br><br>
         				 ▶&nbsp; 대여한 도서를 연체할 경우 연체한 기간만큼 도서대여가 정지됩니다.<br>
         				 &nbsp;&nbsp; 단, 금, 토·일요일, 법정 공휴일,예약도서관이 휴관인 경우는 수령가능일이 연기될 수 있습니다.<br><br>
						
						 ▶&nbsp; 도서대여·반납는 무인대여와 택배대여방법이 있습니다. <br>
						 	 &nbsp;&nbsp;-&nbsp;도서 대여가격은 무료입니다. 단 택배대여시 별도의 비용이 발생합니다.<br>
						 	 &nbsp;&nbsp;<b>-&nbsp;택배대여 이용시 배송비는 왕복배송비이며, 반납할 시 무인반납을 이용하더라도 택배비는 환불되지 않습니다.</b><br>
							 &nbsp;&nbsp;-&nbsp;도서무인대여서비스는 <b>수원역, 수원시청역, 성균관대역</b>에서 가능합니다.<br><br>
							 
						 ▶&nbsp; 서비스 제공을 통해 발생하는 수익금은 도서추가 및 서비스 발전을 위해 사용됩니다.<br><br>
						 ▶&nbsp; 반납할 도서는 무인반납, 택배반납을 통해 반납해주시길 바랍니다.<br><br>
						▶&nbsp; 서비스 제공을 통해 발생하는 수익금은 도서추가 및 서비스 발전을 위해 사용됩니다.<br><br>
         				 
         			<br>
				<br>
				<br>
				<br>
				<br>

				<h4>2. 그 밖의 문의사항</h4>	 
         				 ▶ &nbsp;홈페이지 이용에 관한 문의사항이 있을 경우 상단의 <b>&lt;BOARD&gt;</b>메뉴의 <span
					href="${pageContext.request.contextPath}/board/qnaList.do"><b>질문게시판</b></span>을 이용해주시길 바랍니다.<br>
         				 &nbsp; &nbsp; &nbsp;	-  &nbsp;전화 문의(09:00am ~ 18:00pm) :☎ 123-456-7890 
         				 
					<!--
					- 이용안내 규정 정하기!<br>
					 1. 이용방법 - 가입, 대여방법<br>
					 2. 입금기한<br>
					 3. 연체규정?<br>
					 4. 문의사항이 있을 시 게시판으로 이동안내 문구<br>
					 5. 문의사항 - 전화번호, 이메일 안내 문구<br>
									(전화 이용시간 안내)<br>
					
					- 메인화면 사진 or 영상<br> -->
			</form:form>
			<!-- 내용입력 끝-->
		</div>
	</div>
</section>
<!-- #content end -->

<!-- Go To Top (지우면안됨X)-->
<div id="gotoTop" class="icon-angle-up"></div>
<!-- Footer Scripts (지우면안됨X)-->
<script type="text/javascript" src="js/functions.js"></script>


OO