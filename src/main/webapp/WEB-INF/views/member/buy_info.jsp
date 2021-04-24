<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<%@ include file="../include/Top.jsp"%>
<style type="text/css">
#profile_img {
	display: block;
	margin: 0px auto;
}


</style>
</head>
<body>
	<header>
		<!-- Header Start -->
		<jsp:include page="../include/TopNavi.jsp" />
		<!-- Header End -->
	</header>
	<main>
		<!--? Hero Area Start-->
		<div class="slider-area ">
			<div class="single-slider slider-height2 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-center">
								<h2>My Page</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--? Hero Area End-->
		<!--================Blog Area =================-->
		<section class="blog_area section-padding" style="margin: 0% 7% 0% 8%;;">
			<div class="gallery-area">
				<div class="row">
					<jsp:include page="./include/myPageSide.jsp" />
						<div class="col-lg-8 mb-5 mb-lg-0" style="margin: 3%; margin-top: 1%;">
								<table class="table">
									<thead>
										<tr>
											<th style="width:25%;">주문 정보</th>
											<th style="width:45%">결제/취소/환불 내역</th>
											<th class="d-none d-md-table-cell" style="width:20%">결제/환불 금액</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<tr >
											<td align="center">
												<div>
													<p>요청일</p>
													<strong>2021.11.05</strong> 
													<hr class="line">
													<p>주문번호</p>
													<strong>2308829074</strong> <br>
													<button style="color: black;">바로가기</button>
												</div>
											</td>
											<td>864-348-0485</td>
											<td class="d-none d-md-table-cell">June 21, 1961</td>
											<td class="table-action">
												<a href="#"><i class="align-middle" data-feather="edit-2"></i></a>
												<a href="#"><i class="align-middle" data-feather="trash"></i></a>
											</td>
										</tr>
									
										
										<tr class="table-primary">
											<td>William Harris</td>
											<td>914-939-2458</td>
											<td class="d-none d-md-table-cell">May 15, 1948</td>
											<td class="table-action">
												<a href="#"><i class="align-middle" data-feather="edit-2"></i></a>
												<a href="#"><i class="align-middle" data-feather="trash"></i></a>
											</td>
										</tr>
										<tr class="table-success">
											<td>Christina Mason</td>
											<td>765-382-8195</td>
											<td class="d-none d-md-table-cell">April 2, 1971</td>
											<td class="table-action">
												<a href="#"><i class="align-middle" data-feather="edit-2"></i></a>
												<a href="#"><i class="align-middle" data-feather="trash"></i></a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
		</section>
		<!--================Blog Area =================-->
	</main>
	<footer> </footer>
	<jsp:include page="../include/Footer.jsp" />
</body>
</html>