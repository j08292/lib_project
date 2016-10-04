<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section id="page-title">

	<div class="container clearfix">
		<h1>도서 상세정보</h1>
	</div>

</section>
<!-- #page-title end -->

<!-- Content
		============================================= -->
<section id="content">

	<div class="content-wrap">
		<div class="container clearfix">

			<div class="panel-group">
			<label style = "font-size:18px;">도서 상세정보</label>
				<div class="panel panel-default">
					<div class="panel-heading"></div>

					<div class="panel-body">
							<h3>&nbsp;${book.list_title }</h3>
							<table style="font-size: 11pt;">
								<tr>
									<td style = "width:30%;"">
									<img src="/lib/upload/${book.list_filename }" alt="도서 이미지" style = "width:250px;height:350px;">
									</td>
									
									<td style = "width:70%;">
										<dl style = "margin:0 50px;">
											<dt style = "text-align:left; margin:7px 20px;">표제/책임표시.</dt>
											<dd style = "text-align:left; margin:10px 20px;">${book.list_title }</dd>
											<dt style = "text-align:left; margin:7px 20px;">저자</dt>
											<dd style = "text-align:left; margin:10px 20px;">${book.list_writer }</dd>
											<dt style = "text-align:left; margin:7px 20px;">발행사항.</dt>
											<dd style = "text-align:left; margin:10px 20px;">${book.list_publish }</dd>
											<dt style = "text-align:left; margin:7px 20px;">표준번호/부호.</dt>
											<dd style = "text-align:left; margin:10px 20px;">${book.list_code }</dd>
											<dt style = "text-align:left; margin:7px 20px;">분류기호.</dt>
											<dd style = "text-align:left; margin:7px 20px;">한국십진분류법 -> 005.135</dd>
										</dl>
									</td>
								</tr>
							</table>

							<p style="margin: 0 auto; text-align: right;">
								<input type="button" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/book/search.do'">
							</p>

						</div>
					</div>
				</div>

			<label style = "font-size:18px;">소장정보</label>
				<div class="panel panel-default">
					<div class="panel-heading" style="text-align: left;"></div>
					<div class="panel-body">
						<form action="basket.do" id="detail-form" method = "post">
							<table class="table table-hover provideList">
								<tr>
									<th style = "width:20%; text-align:center;">상태</th>
									<th style = "width:20%; text-align:center;">도서명</th>
									<th style = "width:20%; text-align:center;">자료실</th>
									<th style = "width:20%; text-align:center;">반납예정</th>
									<th style = "width:20%; text-align:center;">예약</th>
								</tr>	
								<tr>
									<td style = "width:20%; text-align:center;">
										<c:if test="${book.list_status == 0 }">
											비치된 도서
										</c:if> <c:if test="${book.list_status == 1 }">
											파손된 도서
										</c:if>
									</td>
									<td style = "width:20%; text-align:center;">${book.list_title}</td>
									<td style = "width:20%; text-align:center;">북수원도서관</td>
									<td style = "width:20%; text-align:center;">${date }</td>
										<!-- 대출중일때 -->
									<td style = "width:20%; text-align:center;">
										
										<c:if test="${book.list_status == 1 }">
											<span>대여불가</span>										
										</c:if>
										<c:if test="${book.list_status == 0 }">
										<c:if test="${book.rent_status == 3 || book.rent_status == 0 || book.rent_status == 5}">
											<input type = "hidden" id = "cih_list_title" name = "cih_list_title" class = "list_title" value = "${book.list_title }">
											<input type = "hidden" id = "cih_list_num" name = "cih_list_num" class = "list_num" value = "${book.list_num }">
											<input type="button" value="도서 예약" id="reserve-button" class = "btn btn-primary reserve-button"><br>
										</c:if>
										<script type="text/javascript">
										$(document).ready(function(){
											$('.reserve-button').click(function(){
												$.ajax({
													url:'reserveBook.do',
													type:'post',
													data:{list_title:$('.list_title').val(), list_num:$('.list_num').val()},
													dataType:'json',
													timeout:30000,
													success:function(data){
														if(data.result=="success"){
															alert("예약되었습니다.");
															history.go(0);
														}else if(data.result=="fail"){
															alert("예약 허용인원 초과했습니다.");
														}else if(data.result=="duplicated"){
															alert("이미 대여한 책입니다.");
														}else if(data.result == "noUserId"){
															alert("로그인을 해주세요.")
															location.href="http://localhost:8080/lib_cih/member/login.do";
														}
													},
													error:function(data) {
														if(data.result=="failure"){
														alert('네트워크 오류 발생.');
														}
													}	
												})
											});
										});
										</script>
										
										
										<c:if test="${book.rent_status == 2}">
											<span>예약 불가</span>
										</c:if>

										<!-- 비치중일때 -->
										<c:if test="${book.rent_status == 9 || book.rent_status == 1 || book.rent_status == 4 }">
											<input type = "hidden" id = "cih_list_num" name = "cih_list_num" value = "${book.list_num }">
											<input type = "hidden" id = "cih_list_title" name = "cih_list_title" value = "${book.list_title }"> 
											<input type = "hidden" id = "cih_list_filename" name = "cih_list_filename" value = "${book.list_filename }">

											<input type = "submit" class = "btn btn-primary" value = "책 바구니">	
											
											<a id="unmanned-button" class="btn btn-primary"
											onclick = "location.href='${pageContext.request.contextPath}/book/unmanned.do?list_num=${book.list_num}'">무인 대여</a>											
										</c:if>
										</c:if>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading" style="text-align: left;">목차</div>

					<div class="panel-body">
						<div>
							${book.list_content }
						</div>
					</div>
				</div>
				
				
				<!--별점 및 한줄평 -->
				<div class="panel panel-default">
					<div class="panel-heading" align="center">별점 및 한줄평</div>
					<div class="panel-body">
						<form id="grade_form">
							<input type="hidden" name="list_num" id="list_num" value="${book.list_num}">
							<input type="hidden" name="mem_id" id="mem_id" value="${userId}" id="userId">

							<div class="fb-like"
								data-href="http://www.your-domain.com/your-page.html"
								data-layout="standard" data-action="like" data-share="true"
								data-show-faces="true"></div>

							<!-- 별점 -->
							<div class="col-md-2">
								<span class="star-input"> 
									<span class="input"> 
									<input type="radio" name="grade_star" id="p1" value="1">
									<label for="p1">1</label> 
									<input type="radio" name="grade_star" id="p2" value="2">
									<label for="p2">2</label> 
									<input type="radio" name="grade_star" id="p3" value="3">
									<label for="p3">3</label> 
									<input type="radio" name="grade_star" id="p4" value="4">
									<label for="p4">4</label> 
									<input type="radio" name="grade_star" id="p5" value="5">
									<label for="p5">5</label> 
									<input type="radio" name="grade_star" id="p6" value="6">
									<label for="p6">6</label> 
									<input type="radio" name="grade_star" id="p7" value="7">
									<label for="p7">7</label> 
									<input type="radio" name="grade_star" id="p8" value="8">
									<label for="p8">8</label> 
									<input type="radio" name="grade_star" id="p9" value="9">
									<label for="p9">9</label> 
									<input type="radio" name="grade_star" id="p10" value="10">
									<label for="p10">10</label>
									</span> 
									<output for="star-input">
										<b id="star_point">0</b>점
									</output>
								</span>
							</div>





							<textarea rows="2" cols="70" name="grade_content"
								id="grade_content" maxlength="140" class="col-md-8"></textarea>

							<c:if test="${!empty userId}">
								<div id="grade_first">
									<span class="letter-count">140/140</span>
								</div>
								<div id="grade_second" align="right">
									<input type="submit" class="col-md-2" value="등록">
								</div>
							</c:if>
						</form>


					</div>

					<!-- 목록 출력 -->
					<div class="panel-body">
						<div id="output"></div>
						<div class="paging_button" style="display: none;">
							<input type="button" value="다음글보기	">
						</div>

						<div id="loading" style="display: none;">
							<img
								src="${pageContext.request.contextPath}/resources/event/images/ajax-loader.gif">
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