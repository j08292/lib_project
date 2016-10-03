<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="slider" class="slider-parallax swiper_wrapper full-screen clearfix">

			<div class="swiper-container swiper-parent">
				<div class="swiper-wrapper">
					
					<div class="swiper-slide dark">
						<div class="container clearfix">
							<div class="slider-caption slider-caption-center">
								<h2 data-caption-animate="fadeInUp">Book Search</h2>
								<div data-caption-animate="fadeInUp" data-caption-delay="200">
									<form action="${pageContext.request.contextPath}/book/search.do" method="get" role="form" class="divcenter nobottommargin">
					                    <div class="input-group input-group-lg">
					                        <input type="hidden" name="keyfield" id="keyfield" value="all">
					                        <input type="text" name="keyword" id="keyword" class="form-control" placeholder="Search for Books...">
					                        <span class="input-group-btn">
					                            <button class="btn btn-danger" type="submit">Search</button>
					                        </span>
					                    </div>
					                </form>
								</div>
							</div>
						</div>
						<div class="video-wrap">
							<video id="slide-video" poster="images/videos/explore-poster.jpg" preload="auto" loop autoplay muted>
								<source src='${pageContext.request.contextPath}/resources/user/images/videos/explore.webm' type='video/webm' />
								<source src='${pageContext.request.contextPath}/resources/user/images/videos/explore.mp4' type='video/mp4' />
							</video>
							<div class="video-overlay" style="background-color: rgba(0,0,0,0.55);"></div>
						</div>
					</div>
					
				</div>
				
			</div>

			<script>
				jQuery(document).ready(function($){
					var swiperSlider = new Swiper('.swiper-parent',{
						paginationClickable: false,
						slidesPerView: 1,
						grabCursor: true,
						loop: true,
						onSwiperCreated: function(swiper){
							$('[data-caption-animate]').each(function(){
								var $toAnimateElement = $(this);
								var toAnimateDelay = $(this).attr('data-caption-delay');
								var toAnimateDelayTime = 0;
								if( toAnimateDelay ) { toAnimateDelayTime = Number( toAnimateDelay ) + 750; } else { toAnimateDelayTime = 750; }
								if( !$toAnimateElement.hasClass('animated') ) {
									$toAnimateElement.addClass('not-animated');
									var elementAnimation = $toAnimateElement.attr('data-caption-animate');
									setTimeout(function() {
										$toAnimateElement.removeClass('not-animated').addClass( elementAnimation + ' animated');
									}, toAnimateDelayTime);
								}
							});
							SEMICOLON.slider.swiperSliderMenu();
						},
						onSlideChangeStart: function(swiper){
							$('[data-caption-animate]').each(function(){
								var $toAnimateElement = $(this);
								var elementAnimation = $toAnimateElement.attr('data-caption-animate');
								$toAnimateElement.removeClass('animated').removeClass(elementAnimation).addClass('not-animated');
							});
							SEMICOLON.slider.swiperSliderMenu();
						},
						onSlideChangeEnd: function(swiper){
							$('#slider').find('.swiper-slide').each(function(){
								if($(this).find('video').length > 0) { $(this).find('video').get(0).pause(); }
								if($(this).find('.yt-bg-player').length > 0) { $(this).find('.yt-bg-player').pauseYTP(); }
							});
							$('#slider').find('.swiper-slide:not(".swiper-slide-active")').each(function(){
								if($(this).find('video').length > 0) {
									if($(this).find('video').get(0).currentTime != 0 ) $(this).find('video').get(0).currentTime = 0;
								}
								if($(this).find('.yt-bg-player').length > 0) {
									$(this).find('.yt-bg-player').getPlayer().seekTo( $(this).find('.yt-bg-player').attr('data-start') );
								}
							});
							if( $('#slider').find('.swiper-slide.swiper-slide-active').find('video').length > 0 ) { $('#slider').find('.swiper-slide.swiper-slide-active').find('video').get(0).play(); }
							if( $('#slider').find('.swiper-slide.swiper-slide-active').find('.yt-bg-player').length > 0 ) { $('#slider').find('.swiper-slide.swiper-slide-active').find('.yt-bg-player').playYTP(); }

							$('#slider .swiper-slide.swiper-slide-active [data-caption-animate]').each(function(){
								var $toAnimateElement = $(this);
								var toAnimateDelay = $(this).attr('data-caption-delay');
								var toAnimateDelayTime = 0;
								if( toAnimateDelay ) { toAnimateDelayTime = Number( toAnimateDelay ) + 300; } else { toAnimateDelayTime = 300; }
								if( !$toAnimateElement.hasClass('animated') ) {
									$toAnimateElement.addClass('not-animated');
									var elementAnimation = $toAnimateElement.attr('data-caption-animate');
									setTimeout(function() {
										$toAnimateElement.removeClass('not-animated').addClass( elementAnimation + ' animated');
									}, toAnimateDelayTime);
								}
							});
						}
					});

					$('#slider-arrow-left').on('click', function(e){
						e.preventDefault();
						swiperSlider.swipePrev();
					});

					$('#slider-arrow-right').on('click', function(e){
						e.preventDefault();
						swiperSlider.swipeNext();
					});
				});
			</script>

			<a href="#" data-scrollto="#content" data-offset="100" class="dark one-page-arrow"><i class="icon-angle-down infinite animated fadeInDown"></i></a>

		</section>

		<!-- Content ============================================= -->
		<!-- 홈페이지 주요 서비스 간단 설명/바로가기 -->
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">
					<div class="row topmargin-lg bottommargin-sm">
						<div class="col-md-4 col-sm-6 bottommargin">
							<div class="feature-box fbox-right topmargin" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="${pageContext.request.contextPath }/board/operationGuide.do"><i class="icon-ok"></i></a>
								</div>
								<h3>이용안내</h3>
								<p>온라인 도서관 이용안내 및 규칙</p>
							</div>
							<br>
							<div class="feature-box fbox-right topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="${pageContext.request.contextPath}/book/search.do"><i class="icon-line-paper"></i></a>
								</div>
								<h3>도서대출</h3>
								<p>읽고싶은 도서를 편리하게 만나보세요.</p>
							</div>
							<br>
							<div class="feature-box fbox-right topmargin" data-animate="fadeIn" data-delay="400">
								<div class="fbox-icon">
									<a href="${pageContext.request.contextPath }/wishlist/write.do"><i class="icon-line-layers"></i></a>
								</div>
								<h3>희망도서신청</h3>
								<p>원하는 도서가 소장되어 있지 않을 경우<br>
								도서를 신청 하실 수 있는 서비스입니다.</p>
							</div>
						</div>
						<div class="col-md-4 hidden-sm bottommargin center">
							<img src="${pageContext.request.contextPath}/resources/user/images/book/ㄷ.png" >
						</div>
						<div class="col-md-4 col-sm-6 bottommargin">
							<div class="feature-box topmargin" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="${pageContext.request.contextPath }/event/marathonInfo.do"><i class="icon-line-heart"></i></a>
								</div>
								<h3>[EVENT] 독서 마라톤</h3>
								<p>독서 활동을 마라톤에 접목시켜<br> 42.195페이지를 읽으면 완주!</p>
							</div>
							<div class="feature-box topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-check"></i></a>
								</div>
								<h3>출석체크</h3>
								<p>매일매일 출석도장 찍고 다양한 혜택을<br> 받아보세요</p>
							</div>
							<div class="feature-box topmargin" data-animate="fadeIn" data-delay="400">
								<div class="fbox-icon">
									<a href="${pageContext.request.contextPath }/board/qnaList.do"><i class="icon-bulb"></i></a>
								</div>
								<h3>문의 게시판</h3>
								<p>온라인 도서관 이용 관련 문의 내용은<br> 해당 게시판을 이용해 주세요.</p>
							</div>
						</div>
					</div>
				
				<!-- 신규 강연 안내 -->
				</div>
					<hr size="1" width="100%">
					<hr size="1" width="100%">
					<br><br>
					<div>
					<div class="center">
					<div class="fbox-icon">
						<h3>[Speech] 최신강연 안내</h3>	
					</div>	
					</div>
					</div>
					<br>
				<div class="container clearfix">
					<a href="${pageContext.request.contextPath }/speech/list.do"><p style="text-align:right">▶더보기</p></a>	
					<div class="clear"></div>
					<div class="col_one_third bottommargin-sm">
					<img src="${pageContext.request.contextPath}/resources/user/images/book/a.png" alt="Clients"><br>
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="600">
							<div class="fbox-icon">
								<a href="${pageContext.request.contextPath }/speech/list.do"><i class="icon-bulb"></i></a>
							</div>
							<h3>[서민교수 기생충 콘서트 ]<br> 작가 초청 강연회</h3>
							<p>▶ 그들은 어떻게 지구의 2인자가 됐을까?<br>  서민교수의 기생충에 관한 유쾌한 강연!</p>
						</div>
					</div>
					<div class="col_one_third bottommargin-sm">
					<img src="${pageContext.request.contextPath}/resources/user/images/book/b.png" alt="Clients"><br>
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="800">
							<div class="fbox-icon">
								<a href="${pageContext.request.contextPath }/speech/list.do"><i class="icon-heart2"></i></a>
							</div>
							<h3>「바람이 우리를 데려다 주겠지」의 저자 오/소/희 작가와의 만남 </h3>
							<p>▶ 여행은 어떻게 삶을 변화시키는가?<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
							&<br>&nbsp; &nbsp;  &nbsp; &nbsp;아이와 함께 여행하기 </p>
						</div>
					</div>
					<div class="col_one_third bottommargin-sm col_last">
					<img src="${pageContext.request.contextPath}/resources/user/images/book/c.png" alt="Clients"><br>
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="1000">
							<div class="fbox-icon">
								<a href="${pageContext.request.contextPath }/speech/list.do"><i class="icon-note"></i></a>
							</div>
							<h3>독서모임 & 작가와의 만남<br>PQR BOOKS X 이광호 작가</h3>
							<p>▶ PQR BOOKS에 입점한 독립/소규모/1인출판물 중 하나를 선정해서 함께 읽고 이야기를 나누는 독서모임입니다.</p>
						</div>
						<br><br><br>
					</div>
					<div class="clear"></div>
				</div>
				
				<!-- 신규 도서 안내 -->
				<div class="section">
					<div class="container clearfix">
						<div class="row topmargin-sm">
							<div class="center">
								<h3>[new] 신간도서 안내</h3>
							</div>
							<a href="${pageContext.request.contextPath }/book/search.do"><p style="text-align:right">▶더보기</p></a>
						<c:if test="${newBookCount == 0}"> 현재 등록된 신규 도서가 없습니다. </c:if>
						<c:if test="${newBookCount > 0}">
							<c:forEach var="article" items="${mainNewBooklist}">
								<div class="col-md-3 col-sm-6 bottommargin">
									<div class="team">
										<div class="team-image">
											<a href="${pageContext.request.contextPath}/book/detail.do?list_title=${article.list_title}&list_filename=${article.list_filename}&list_num=${article.list_num}">
												<c:choose>
													<c:when test="${!empty article.list_filename}">
														<img src="${pageContext.request.contextPath}/upload/${article.list_filename}" style="width: 460px; height: 315;">
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath}/upload/NoImage.jpg" style="width: 460px; height: 315;">
													</c:otherwise>
												</c:choose>
											</a>
										</div>
										<div class="team-desc team-desc-bg">
											<div class="team-title">
												<h4>${article.list_title}</h4>
												<br> <span>${article.list_writer}</span>
											</div>
											<p>${article.list_comment}</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
						</div>
					</div>
				</div>
				
				<!-- 인기 도서 안내 -->
				<div class="container clearfix">
					<div class="row topmargin-sm">
							<div class="center">
								<h3>[best] 인기도서 안내</h3>
							</div>
				
				<!-- 화살표 시작 -->
				&nbsp; &nbsp;<span class="glyphicon glyphicon-chevron-left"></span>
				<span class="glyphicon glyphicon-chevron-left">
				  	<span class="glyphicon glyphicon-chevron-left"></span>
				  	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
				</span>
				<span class="glyphicon glyphicon-chevron-right"></span>
				<span class="glyphicon glyphicon-chevron-right"></span>
				<span class="glyphicon glyphicon-chevron-right"></span>
				<!-- 화살표 끝 -->
				<c:if test="${mainBookCount == 0}"> 현재 인기 도서가 없습니다. </c:if>
				<c:if test="${mainBookCount > 0}">
					<div id="oc-clients" class="owl-carousel image-carousel">
					<c:forEach var="article" items="${mainBooklist}">
						 
								<%-- <c:choose>
									<c:when test="${!empty article.list_filename}">
										<div class="oc-item">
											<img src="${pageContext.request.contextPath}/upload/${article.list_filename}">
											${article.list_title}
										</div>
									</c:when>
									<c:otherwise>
										<div class="oc-item">
											<img src="${pageContext.request.contextPath}/upload/NoImage.jpg">${article.list_title}
										</div>
									</c:otherwise>
								</c:choose> --%>
								
								<%-- <img src="${pageContext.request.contextPath}/upload/${article.list_filename}"alt="Clients">${article.list_title}</div> --%>
								<div class="oc-item"><img src="${pageContext.request.contextPath}/upload/${article.list_filename}" alt="Clients">${article.list_title}</div>
								<%-- <div class="oc-item"><img src="${pageContext.request.contextPath}/resources/user/images/book/7.jpg"alt="Clients"></div>
								<div class="oc-item"><img src="${pageContext.request.contextPath}/resources/user/images/book/8.png"alt="Clients"></div>
								<div class="oc-item"><img src="${pageContext.request.contextPath}/resources/user/images/book/9.png"alt="Clients"></div>
								<div class="oc-item"><img src="${pageContext.request.contextPath}/resources/user/images/book/10.png"alt="Clients"></div>
								<div class="oc-item"><img src="${pageContext.request.contextPath}/resources/user/images/book/11.png"alt="Clients"></div>
								<div class="oc-item"><img src="${pageContext.request.contextPath}/resources/user/images/book/12.png"alt="Clients"></div>
								<div class="oc-item"><img src="${pageContext.request.contextPath}/resources/user/images/book/13.png"alt="Clients"></div>
								<div class="oc-item"><img src="${pageContext.request.contextPath}/resources/user/images/book/14.png"alt="Clients"></div> --%>
						
					</c:forEach>
					</div>
				</c:if>
					<script type="text/javascript">
						jQuery(document).ready(function($) {
							var ocClients = $("#oc-clients");
							ocClients.owlCarousel({
								margin: 60,
								loop: true,
								nav: false,
								autoplay: true,
								dots: false,
								autoplayHoverPause: true,
								responsive:{
									0:{ items:2 },
									480:{ items:3 },
									768:{ items:4 },
									992:{ items:5 },
									1200:{ items:6 }
								}
							});
						});
					</script>
				</div>
			</div>