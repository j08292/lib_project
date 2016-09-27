<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="slider" class="slider-parallax swiper_wrapper full-screen clearfix">

			<div class="swiper-container swiper-parent">
				<div class="swiper-wrapper">
					<div class="swiper-slide dark" style="background-image: url('images/slider/swiper/1.jpg');">
						<div class="container clearfix">
							<div class="slider-caption slider-caption-center">
								<h2 data-caption-animate="fadeInUp">Welcome to Canvas</h2>
								<p data-caption-animate="fadeInUp" data-caption-delay="200">Create just what you need for your Perfect Website. Choose from a wide range of Elements &amp; simply put them on your own Canvas.</p>
							</div>
						</div>
					</div>
					<div class="swiper-slide dark">
						<div class="container clearfix">
							<div class="slider-caption slider-caption-center">
								<h2 data-caption-animate="fadeInUp">Beautifully Flexible</h2>
								<p data-caption-animate="fadeInUp" data-caption-delay="200">Looks beautiful &amp; ultra-sharp on Retina Screen Displays. Powerful Layout with Responsive functionality that can be adapted to any screen size.</p>
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
					<div class="swiper-slide" style="background-image: url('images/slider/swiper/3.jpg'); background-position: center top;">
						<div class="container clearfix">
							<div class="slider-caption">
								<h2 data-caption-animate="fadeInUp">Great Performance</h2>
								<p data-caption-animate="fadeInUp" data-caption-delay="200">You'll be surprised to see the Final Results of your Creation &amp; would crave for more.</p>
							</div>
						</div>
					</div>
				</div>
				<div id="slider-arrow-left"><i class="icon-angle-left"></i></div>
				<div id="slider-arrow-right"><i class="icon-angle-right"></i></div>
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

		<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				

				
				<div class="container clearfix">

					<div class="row topmargin-lg bottommargin-sm">

						

						<div class="col-md-4 col-sm-6 bottommargin">

							<div class="feature-box fbox-right topmargin" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-heart"></i></a>
								</div>
								<h3>이용안내</h3>
								<p>온라인 도서관 이용안내 및 규칙</p>
							</div>
							<br>
							<div class="feature-box fbox-right topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-paper"></i></a>
								</div>
								<h3>도서대출</h3>
								<p>읽고싶은 책을 편리하게 만나보세요.</p>
							</div>
							<br>
							<div class="feature-box fbox-right topmargin" data-animate="fadeIn" data-delay="400">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-layers"></i></a>
								</div>
								<h3>희망도서신청</h3>
								<p>원하는 도서가 소장되어 있지 않을 경우<br>
								도서를 신청 하실 수 있는 서비스입니다.</p>
								
							</div>

						</div>

						<div class="col-md-4 hidden-sm bottommargin center">
							<img src="${pageContext.request.contextPath}/resources/user/images/services/iphone7.png" alt="iphone 2">
						</div>

						<div class="col-md-4 col-sm-6 bottommargin">

							<div class="feature-box topmargin" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-power"></i></a>
								</div>
								<h3>[EVENT] 독서 마라톤</h3>
								<p>독서 활동을 마라톤에 접목시켜<br> 42.195페이지를 읽으면 완주!</p>
							</div>

							<div class="feature-box topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-check"></i></a>
								</div>
								<h3>출석체크</h3>
								<p>매일매일 출석도장 찍고 다양한 혜택을 받아보세요</p>
							</div>

							<div class="feature-box topmargin" data-animate="fadeIn" data-delay="400">
								<div class="fbox-icon">
									<a href="#"><i class="icon-bulb"></i></a>
								</div>
								<h3>문의 게시판</h3>
								<p>도서관 이용 관련 문의 내용은 해당 게시판을 이용해 주세요.</p>
							</div>

						</div>

					</div>

				</div>
					<hr size="1" width="100%">
					<hr size="1" width="100%">
					<br><br>
					<div class="center">
						<h3>최신강연 안내</h3>
						
					</div>
					<br><br>
				
				<div class="container clearfix">

					<div class="col_one_third">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn">
							<div class="fbox-icon">
								<a href="#"><i class="icon-line-monitor"></i></a>
							</div>
							<h3>Responsive Layout</h3>
							<p>Powerful Layout with Responsive functionality that can be adapted to any screen size.</p>
						</div>
					</div>

					<div class="col_one_third">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="200">
							<div class="fbox-icon">
								<a href="#"><i class="icon-line-eye"></i></a>
							</div>
							<h3>Retina Ready Graphics</h3>
							<p>Looks beautiful &amp; ultra-sharp on Retina Displays with Retina Icons, Fonts &amp; Images.</p>
						</div>
					</div>

					<div class="col_one_third col_last">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="400">
							<div class="fbox-icon">
								<a href="#"><i class="icon-line-star"></i></a>
							</div>
							<h3>Powerful Performance</h3>
							<p>Optimized code that are completely customizable and deliver unmatched fast performance.</p>
						</div>
					</div>

					<div class="clear"></div>

					<div class="col_one_third">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="600">
							<div class="fbox-icon">
								<a href="#"><i class="icon-line-play"></i></a>
							</div>
							<h3>HTML5 Video</h3>
							<p>Canvas provides support for Native HTML5 Videos that can be added to a Full Width Background.</p>
						</div>
					</div>

					<div class="col_one_third">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="800">
							<div class="fbox-icon">
								<a href="#"><i class="icon-params"></i></a>
							</div>
							<h3>Parallax Support</h3>
							<p>Display your Content attractively using Parallax Sections that have unlimited customizable areas.</p>
						</div>
					</div>

					<div class="col_one_third col_last">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="1000">
							<div class="fbox-icon">
								<a href="#"><i class="icon-line-circle-check"></i></a>
							</div>
							<h3>Endless Possibilities</h3>
							<p>Complete control on each &amp; every element that provides endless customization possibilities.</p>
						</div>
					</div>

					<div class="clear"></div>

					<div class="col_one_third bottommargin-sm">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="600">
							<div class="fbox-icon">
								<a href="#"><i class="icon-bulb"></i></a>
							</div>
							<h3>Light &amp; Dark Color Schemes</h3>
							<p>Change your Website's Primary Scheme instantly by simply adding the dark class to the body.</p>
						</div>
					</div>

					<div class="col_one_third bottommargin-sm">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="800">
							<div class="fbox-icon">
								<a href="#"><i class="icon-heart2"></i></a>
							</div>
							<h3>Boxed &amp; Wide Layouts</h3>
							<p>Stretch your Website to the Full Width or make it boxed to surprise your visitors.</p>
						</div>
					</div>

					<div class="col_one_third bottommargin-sm col_last">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="1000">
							<div class="fbox-icon">
								<a href="#"><i class="icon-note"></i></a>
							</div>
							<h3>Extensive Documentation</h3>
							<p>We have covered each &amp; everything in our Documentation including Videos &amp; Screenshots.</p>
						</div>
					</div>

					<div class="clear"></div>

				</div>
				<br><br>
				
				<hr size="1" width="100%">
				<hr size="1" width="100%">


			

				<div class="section">
					<div class="container clearfix">

						<div class="row topmargin-sm">
					
							<div class="center">
								<h3>[new]신간도서 안내</h3>
							</div>

							<div class="col-md-3 col-sm-6 bottommargin">

								<div class="team">
									<div class="team-image">
										<img src="${pageContext.request.contextPath}/resources/user/images/team/3.jpg" alt="John Doe">
									</div>
									<div class="team-desc team-desc-bg">
										<div class="team-title"><h4>John Doe</h4><span>CEO</span></div>
										<p>도서에 대한 간략한 소개</p>
									</div>
								</div>

							</div>

							<div class="col-md-3 col-sm-6 bottommargin">

								<div class="team">
									<div class="team-image">
										<img src="${pageContext.request.contextPath}/resources/user/images/team/2.jpg" alt="Josh Clark">
									</div>
									<div class="team-desc team-desc-bg">
										<div class="team-title"><h4>Josh Clark</h4><span>Co-Founder</span></div>
										<p>도서에 대한 간략한 소개</p>
									</div>
								</div>

							</div>

							<div class="col-md-3 col-sm-6 bottommargin">

								<div class="team">
									<div class="team-image">
										<img src="${pageContext.request.contextPath}/resources/user/images/team/8.jpg" alt="Mary Jane">
									</div>
									<div class="team-desc team-desc-bg">
										<div class="team-title"><h4>Mary Jane</h4><span>Sales</span></div>
										<p>도서에 대한 간략한 소개</p>
									</div>
								</div>

							</div>

							<div class="col-md-3 col-sm-6 bottommargin">

								<div class="team">
									<div class="team-image">
										<img src="${pageContext.request.contextPath}/resources/user/images/team/4.jpg" alt="Nix Maxwell">
									</div>
									<div class="team-desc team-desc-bg">
										<div class="team-title"><h4>책 이름</h4><span>작가명</span></div>
										<p>도서에 대한 간략한 소개</p>
									</div>
								</div>

							</div>

						</div>

					</div>
				</div>

				<div class="container clearfix">

					<div id="oc-clients" class="owl-carousel image-carousel">

						<div class="oc-item"><a href="#"><img src="${pageContext.request.contextPath}/resources/user/images/clients/1.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="${pageContext.request.contextPath}/resources/user/images/clients/2.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="${pageContext.request.contextPath}/resources/user/images/clients/3.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="${pageContext.request.contextPath}/resources/user/images/clients/4.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="${pageContext.request.contextPath}/resources/user/images/clients/5.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="${pageContext.request.contextPath}/resources/user/images/clients/6.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="${pageContext.request.contextPath}/resources/user/images/clients/7.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="${pageContext.request.contextPath}/resources/user/images/clients/8.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="${pageContext.request.contextPath}/resources/user/images/clients/9.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="${pageContext.request.contextPath}/resources/user/images/clients/10.png" alt="Clients"></a></div>

					</div>

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