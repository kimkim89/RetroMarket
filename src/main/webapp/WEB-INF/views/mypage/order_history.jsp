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

.flex-container {
	display: inline-flex;
	flex-direction: row;
}

.info-attribute {
	display:block;
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap; 
  background: #d9e1f4;
  height: 70px;
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
								<h2>주문 내역</h2>
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
								<!-- 20210426 주문 정보-->
								<table class="table">
									<thead style="background: background: #fbf9ff;">
										<tr align="center">
											<th style="width:25%;">주문 정보</th>
											<th style="width:45%">결제/취소/환불 내역</th>
											<th class="d-none d-md-table-cell" style="width:20%">결제/환불 금액</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td align="center">
												<div>
													<p><b>요청일</b></p>
													<strong>2021.11.05</strong> 
													<hr class="line">
													<p><b>주문번호</b></p>
													<strong>2308829074</strong> <br>
													<a href="#" class="genric-btn info small">바로가기</a>
												</div>
											</td>
											<td style="vertical-align: middle;">
												<div class="flex-container">
													<div class= "flex-item"><img src="${contextPath}/resources/assets/img/Android.GIF" style="border: solid; 1px; width: 110px; height: 110px;"/></div>
													&nbsp;&nbsp;<div class= "flex-item" style="margin-top: 5%; width: 340px;">
													<input type="text" name="product_info" value="asdnkasdnklsdankladsnlkasd" readonly="readonly" class="single-input-secondary info-attribute">
													</div>
												</div>
												<div style="margin-top: 2%; max-width: 455px;">
													<input type="text" name="first_name" value="asdnkasdnklsdankladsnlkasd" readonly="readonly" class="single-input-secondary info-attribute">
												</div>
												
											</td>
											<td align="center" class="d-none d-md-table-cell" style="vertical-align: middle;">
												<div>
													<p><b style="color: #dc1c87;;">8730원</b></p>
												</div>
											</td>
											<td align="center" class="table-action" style="vertical-align: middle;">
												<div>
													<span><b>결제 완료</b></span><br>
													<span>완료일</span><br>
													<span>2100.12.30</span>
												</div>
											</td>
										</tr>
									
										<tr >
											<td align="center">
												<div>
													<p><b>요청일</b></p>
													<strong>2021.11.05</strong> 
													<hr class="line">
													<p><b>주문번호</b></p>
													<strong>2308829074</strong> <br>
													<a href="#" class="genric-btn info small">바로가기</a>
												</div>
											</td>
											<td style="vertical-align: middle;">
												<div class="flex-container">
													<div class= "flex-item"><img src="${contextPath}/resources/assets/img/Android.GIF" style="border: solid; 1px; width: 110px; height: 110px;"/></div>
													&nbsp;&nbsp;<div class= "flex-item" style="margin-top: 5%; width: 340px;">
													<input type="text" name="product_info" value="asdnkasdnklsdanklaffffffffffffffffffffffffffffffffffdsnlkasd" readonly="readonly" class="single-input-secondary info-attribute">
													</div>
												</div>
												<div style="margin-top: 2%; max-width: 455px;">
													<input type="text" name="first_name" value="asdnkasdnklsdankladsnlkasd" readonly="readonly" class="single-input-secondary info-attribute">
												</div>
												
											</td>
											<td align="center" class="d-none d-md-table-cell" style="vertical-align: middle;">
												<div>
													<p><b style="color: #dc1c87;;">8730원</b></p>
												</div>
											</td>
											<td align="center" class="table-action" style="vertical-align: middle;">
												<div>
													<span><b>취소 완료</b></span><br>
													<span>완료일</span><br>
													<span>2099.12.30</span>
												</div>
											</td>
										</tr>
										
									</tbody>
								</table>
								<!-- 20210426 주문 정보-->
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