<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 이벤트 Content -->
<section id="content">

	<!-- 이벤트 검색 -->
	
	<section id="page-title">

            <div class="container clearfix">
                <h3>[EVENT]이벤트</h3>               
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/board/eventList.do">Event List</a></li>
                </ol>
            </div>

        </section>
	<br><br>
		<div class="panel-body">
			<form action="list.do" id="search_form"  class="form-inline" method="get" style="text-align:center">
				<select name="keyfield" id="slectBox" class="form-control">
					<option value="event_title">제목</option>
					<option value="event_content">내용</option>
					<option value="all">전체</option>
				</select>
			
				<input type="text" size="25" name="keyword" id="keyword" class="form-control">
				<input type="submit" value="찾기" class="btn btn-default">
			</form>					
		</div>
	
				
							
		<!-- 이벤트 목록 -->
		<div id="event" class="clearfix" style="padding-left:150px;">
		
			<c:if test="${count == 0}">
				<div class="panel-body" >
					<h3>등록된 게시물이 없습니다.</h3>
				</div>
			</c:if>
	
			<c:if test="${count >0}">
				<c:forEach var="article" items="${list}">
					<div class="product clearfix">
						<div class="product-image">
							<a href="detail.do?event_num=${article.event_num}">
							<img src="${pageContext.request.contextPath}/event_upload/${article.event_filename}"
								alt="이벤트사진">
							</a>
	
	
							<div class="product-overlay">
								<a href="detail.do?event_num=${article.event_num}" class="item-quick-view">
									<i class="icon-zoom-in1"></i><span>바로가기</span></a>
							</div>
						</div>
						
						<div class="product-desc">
							<div class="product-title">
								<h3>
									<a href="detail.do?event_num=${article.event_num}">${article.event_title}</a>
								</h3>
							</div>
							<br>
							<div class="product-price">
								<ins>${article.event_startdate}</ins>
								<ins>~</ins>
								<ins>${article.event_enddate}</ins>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<br><br>
		<!-- pagingHtml -->	
		<div align="center">${pagingHtml}</div>

	<br><br><br><br><br><br>
	

</section>
<!-- 이벤트 content 끝 -->

<!-- Go To Top
    ============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>

<!-- Footer Scripts
    ============================================= -->
<script type="text/javascript" src="js/functions.js"></script>

</body>
</html>