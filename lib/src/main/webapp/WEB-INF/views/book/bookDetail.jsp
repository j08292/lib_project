<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section id="page-title">

	<div class="container clearfix">
		<h1>Page</h1>
		<span>A Blank Page</span>
		<ol class="breadcrumb">
			<li><a href="#">Home</a></li>
			<li><a href="#">Library</a></li>
			<li class="active">Data</li>
		</ol>
	</div>

</section>
<!-- #page-title end -->

<!-- Content
		============================================= -->
<section id="content">

	<div class="content-wrap">
		<div class="container clearfix">

			<div class="panel-group">
				<div class="panel panel-default">
					<div class="panel-heading" style="text-align: left;">도서 상세정보</div>

					<div class="panel-body">
							<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${book.list_title }</h3>
							<table style="font-size: 10pt;">
								<tr>
									<td><img
										src="${book.list_filename }" width="200" alt="도서 이미지" /></td>
									<td style = "text-align:center;">
										<dl>
											<dt style = "text-align:left;">표제/책임표시.</dt>
											<dd style = "text-align:left;">${book.list_title }</dd>
											<dt style = "text-align:left;">작가</dt>
											<dd style = "text-align:left;">${book.list_writer }</dd>
											<dt style = "text-align:left;">발행사항.</dt>
											<dd style = "text-align:left;">${book.list_publish }</dd>
											<dt style = "text-align:left;">표준번호/부호.</dt>
											<dd style = "text-align:left;">${book.list_code }</dd>
											<dt style = "text-align:left;">분류기호.</dt>
											<dd style = "text-align:left;">한국십진분류법 -> 005.135</dd>
										</dl>
									</td>
								</tr>
							</table>

							<p style="margin: 0 auto; text-align: right;">
								<input type="button" value="목록으로" onclick="history.go(-1)">
							</p>

						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading" style="text-align: left;">소장정보</div>
					<div class="panel-body">
						<form action="basket.do" id="detail-form" method = "post">
							<table class="table table-hover provideList">
								<tr>
									<th style = "width:20%; text-align:center;">상태</th>
									<th style = "width:20%; text-align:center;">도서정보</th>
									<th style = "width:20%; text-align:center;">자료실</th>
									<th style = "width:20%; text-align:center;">반납예정</th>
									<th style = "width:20%; text-align:center;">예약</th>
								</tr>	
								<tr>
									<td style = "width:20%; text-align:center;">
										<c:if test="${book.list_status == 0 }">
											대여 가능
										</c:if> <c:if test="${book.list_status == 1 }">
											대여 불가
										</c:if>
									</td>
									<td style = "width:20%; text-align:center;">${book.list_title}</td>
									<td style = "width:20%; text-align:center;">북수원도서관<br>서수원도서관
									</td>
									<td style = "width:20%; text-align:center;"></td>
										<!-- 대출중일때 -->
									<td style = "width:20%; text-align:center;">
										<c:if test="${book.list_status == 1 }">
											대여불가										
										</c:if>
										<c:if test="${book.list_status == 0 }">
										<c:if test="${book.rent_status == 3 || book.rent_status == 0}">
										<input type = "hidden" id = "list_title" name = "list_title" value = "${book.list_title }">
										<input type = "hidden" id = "list_num" name = "list_num" value = "${book.list_num }">
											<input type="button" value="예약" id="reserve-button" class = "btn btn-primary"><br>
										</c:if>
											<c:if test="${book.rent_status != 2 && book.rent_status == 0 || book.rent_status == 3 }">
											<span>예약 가능</span>
											</c:if>
											<c:if test="${book.rent_status == 2 }">
											<span>허용인원 초과</span>
											</c:if>
										<!-- 비치중일때 -->
										<c:if test="${book.rent_status == 7 || book.rent_status == 1 || book.rent_status == 4 }">
											<input type = "hidden" id = "list_num" name = "list_num" value = "${book.list_num }">
											<input type = "hidden" id = "list_title" name = "list_title" value = "${book.list_title }"> 
											<input type = "hidden" id = "list_filename" name = "list_filename" value = "${book.list_filename }">

											<a id="checkbasket-button" onclick="formSubmit()" class="btn btn-primary"
											href="${pageContext.request.contextPath}/book/basket.do">대여</a>
											<input class="btn btn-primary" type="button" value="무인">
										<script type="text/javascript">
												function formSubmit() {
													document.getElementById("detail-form").submit();
												}
										</script>
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
							${book.list_contents }
						</div>
					</div>
				</div>
				<!--별점 및 한줄평 -->
				<div class="panel panel-default">
					<div class="panel-heading" align="center">별점 및 한줄평</div>
					<div class="panel-body">
						<form id="grade_form">
							<input type="hidden" name="list_num" value="${book.list_num}">
							<input type="hidden" name="mem_id" value="${userId}" id="userId">

							<div class="fb-like"
								data-href="http://www.your-domain.com/your-page.html"
								data-layout="standard" data-action="like" data-share="true"
								data-show-faces="true"></div>

							<!-- 별점 -->
							<div class="col-md-2">
								<span class="star-input"> <span class="input"> <input
										type="radio" name="grade_star" id="p1" value="1"><label
										for="p1">1</label> <input type="radio" name="grade_star"
										id="p2" value="2"><label for="p2">2</label> <input
										type="radio" name="grade_star" id="p3" value="3"><label
										for="p3">3</label> <input type="radio" name="grade_star"
										id="p4" value="4"><label for="p4">4</label> <input
										type="radio" name="grade_star" id="p5" value="5"><label
										for="p5">5</label> <input type="radio" name="grade_star"
										id="p6" value="6"><label for="p6">6</label> <input
										type="radio" name="grade_star" id="p7" value="7"><label
										for="p7">7</label> <input type="radio" name="grade_star"
										id="p8" value="8"><label for="p8">8</label> <input
										type="radio" name="grade_star" id="p9" value="9"><label
										for="p9">9</label> <input type="radio" name="grade_star"
										id="p10" value="10"><label for="p10">10</label>
								</span> <output for="star-input">
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
	</div>

</section>
<!-- #content end -->

<!-- Go To Top
	============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>