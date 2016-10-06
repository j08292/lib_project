<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Stylesheets ============================================= -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<!-- Page Title ============================================= -->
<section id="page-title">
	<div class="container clearfix">
		<h1>책 바구니</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
			<li class="active">My Book Basket</li>
		</ol>
	</div>
</section>
<!-- #page-title end -->

<!-- Content ============================================= -->
<section id="content">
	<div class="content-wrap">
		<div class="container clearfix">

			<div class="panel-group">
				<div class="panel panel-default">
					<div class="panel-body">
						<div>
							<form action="basket.do" id="cart-form" method="post">
								<table class="table table-hover provideList">
									<thead>
										<tr>
											<th style="text-align:center;"></th>
											<th style="text-align:center;">도서명</th>
											<th style="text-align:center;">ISBN</th>
											<th style="text-align:center;">저자</th>
											<th style="text-align:center;">출판사</th>
											<th style="text-align:center;">비고</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="basket" items="${list }">
											<tr>
												<td style="vertical-align:middle;text-align:center;"><a href = "${pageContext.request.contextPath}/book/detail.do?list_title=${basket.list_title}&list_filename=${basket.list_filename }&list_num=${basket.list_num }">
													<img src="/lib/upload/${basket.list_filename }" width="80" height="120"></a></td>
												<td style="vertical-align:middle;text-align:center;">${basket.list_title}</td>
												<td style="vertical-align:middle;text-align:center;">${basket.list_code}</td>
												<td style="vertical-align:middle;text-align:center;">${basket.list_writer }</td>
												<td style="vertical-align:middle;text-align:center;">${basket.list_publish }</td>
												<td style="vertical-align:middle;text-align:center;"><input type="hidden" id="basket_num" class = "basket_num"
													name="basket_num" value="${basket.basket_num }">
													<a id="delete-button" class="btn btn-primary delete-button" data-num= "${basket.basket_num }"
													href="${pageContext.request.contextPath}/book/basket.do">삭제</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			<p style="text-align: center;">
				<input type="hidden" name="list_title" id="list_title" value="${basket.list_title }"> 
				<input type="hidden" name="list" id="list" value="${list}"> 
				<a id="rent-button"	class="btn btn-primary rent-button"	href="${pageContext.request.contextPath}/book/rent.do">결제</a> 
				<input type="button" value="도서 검색" class="btn btn-primary"
					onclick="location.href='${pageContext.request.contextPath}/book/search.do'">
			</p>
			<input type = "hidden" id = "basket-count" class = "basket-count" name = "basket-count" value = "${count }">
			<script type="text/javascript">
			$('.rent-button').click(function(event){
				var value = $('#basket-count').val();
				if(value>5){
					alert("최대 5권까지 대여할 수 있습니다.");
					return false;
					}
				});
			</script>
		</div>
	</div>
</section>
<!-- #content end -->

<!-- Go To Top ============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>