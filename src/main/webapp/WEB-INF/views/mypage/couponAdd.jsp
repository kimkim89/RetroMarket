<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<%@ include file="../include/Top.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Raleway:200');

#profile_img {
	display: block;
	margin: 0px auto;
}

.flex {
	display: flex;
	flex-direction: row;
	align-items: flex-start;
	justify-content: flex-start;
}

.flex-member {
	margin-left: 1%;
}

.gradient-border { -
	-borderWidth: 5px;
	background: #1D1F20;
	position: relative;
	border-radius: var(- -borderWidth);
}

.gradient-border:after {
	content: '';
	position: absolute;
	top: calc(-1 * var(- -borderWidth));
	left: calc(-1 * var(- -borderWidth));
	height: calc(100% + var(- -borderWidth)* 2);
	width: calc(100% + var(- -borderWidth)* 2);
	background: linear-gradient(60deg, #f79533, #f37055, #ef4e7b, #a166ab, #5073b8,
		#1098ad, #07b39b, #6fba82);
	border-radius: calc(1.5 * var(- -borderWidth));
	z-index: -1;
	animation: animatedgradient 2s ease alternate infinite;
	background-size: 300% 300%;
}

@
keyframes animatedgradient { 0% {
	background-position: 0% 50%;
}
50


%
{
background-position


:


100
%


50
%;


}
100


%
{
background-position


:


0
%


50
%;


}
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
								<h2>쿠폰 페이지</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--? Hero Area End-->
		<!--================Blog Area =================-->
		<section class="blog_area section-padding"
			style="margin: 0% 7% 0% 8%;">
			<div class="gallery-area">
				<div class="row">
					<jsp:include page="./include/myPageSide.jsp" />
					<div class="col-lg-8 mb-5 mb-lg-0"
						style="margin: 3%; margin-top: 3%;" align="center">

						<!--? Shop Method Start-->

						<aside
							class="single_sidebar_widget search_widget col-lg-6 mb-5 mb-lg-0"
							style="border: solid 1px; border-color: #3b98da;">
							<form action="#">
								<div class="form-group" style="padding-top: 12px;">
									<div class="input-group mb-3">
										<input type="text" class="form-control"
											placeholder='쿠폰번호를 등록해주세요' onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Search Keyword'"
											style="margin-right: 2%; height: 50px;">
										<div class="input-group-append">
											<button
												style="background-color: #3b98da; border: 1px solid #3b98da;"
												class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
												type="button">쿠폰등록</button>
										</div>
									</div>
								</div>
							</form>
						</aside>
						<!-- Shop Method End-->
						<br /> <br />

						<div class="section-top-border">
							<h3>보유 쿠폰</h3>
							<div class="row gallery-item">
								<div class="col-md-4">
									<div class="single-gallery-image"
										style="background: url(${contextPath}/resources/assets/img/newtro/coupon1.png);"></div>
								</div>
								<div class="col-md-4">
									<div class="single-gallery-image"
										style="background: url(${contextPath}/resources/assets/img/newtro/coupon2.png);"></div>
								</div>
								<div class="col-md-4">
									<div class="single-gallery-image"
										style="background: url(${contextPath}/resources/assets/img/newtro/coupon3.png);"></div>

								</div>
							</div>
						</div>
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