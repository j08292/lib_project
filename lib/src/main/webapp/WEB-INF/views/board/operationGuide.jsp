<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
 
   
    <!-- Stylesheets(지우면안됨X)-->
	

    <link rel="stylesheet" href="css/responsive.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <!--[if lt IE 9]>
    	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->

    <!-- External JavaScripts(지우면안됨X) -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>

        <!-- Page Title(지우면안됨X) -->
        <section id="page-title">

            <div class="container clearfix">
                <h1>온라인도서관 이용안내</h1>
                <span>Operation Guide</span>
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Shop</li>
                </ol>
            </div>

        </section><!-- #page-title end -->

        <!-- Content(지우면안됨X)-->
        <section id="content">

            <div class="content-wrap">

                <div class="container clearfix">

                   <!-- 내용입력 시작-->
                   <form:form action="operationGuide.do" enctype="multipart/form-data" id="register_form" method="get">
         			
					- 메뉴에서 공지사항을 앞으로 뺴기<br>
					- 이용안내 규정 정하기!<br>
					 1. 이용방법 - 가입, 대여방법<br>
					 2. 입금기한<br>
					 3. 연체규정?<br>
					 4. 문의사항이 있을 시 게시판으로 이동안내 문구<br>
					 5. 문의사항 - 전화번호, 이메일 안내 문구<br>
									(전화 이용시간 안내)<br>
					
					- 메인화면 사진 or 영상<br>
					
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

</body>
</html>