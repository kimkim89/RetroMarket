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
								<h2>장바구니</h2>
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
						<div class="col-md-4" id="profile_img">
							<div class="single-gallery-image"
								style="background: url(${contextPath}/resources/assets/img/elements/g1.jpg); border-radius: 100px;">
							</div>
						</div>
						<!--? Shop Method Start-->
							<div class="container" style="margin-top: 3%; margin-left: 10%;">
								<div class="method-wrapper">
									<div class="row d-flex justify-content-between">
										<div class="col-xl-4 col-lg-4 col-md-6">
											<div class="single-method mb-40">
												<i class="ti-package"></i>
												<h6>아이디</h6>
												<p>z</p>
											</div>
										</div>
										<div class="col-xl-4 col-lg-4 col-md-6">
											<div class="single-method mb-40">
												<i class="fas fa-cheese"></i>
												<h6>닉네임</h6>
												<p>z</p>
											</div>
										</div>
										<div class="col-xl-4 col-lg-4 col-md-6">
											<div class="single-method mb-40">
												<i class="far fa-grin"></i>
												<h6>회원 등급</h6>
												<p>z</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						<!-- Shop Method End-->
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