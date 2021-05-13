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

 .flex {
 	display: flex;
 	flex-direction: row;
 	align-items: flex-start;
 	justify-content: flex-start;
 	
 }

.flex-member {
	margin-left: 1%;
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
			<div class="single-slider slider-height2 d-flex align-items-center" >
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-center">
								<h2>Coupon Page</h2>
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
					<div class="col-lg-8 mb-5 mb-lg-0" style="margin: 3%; margin-top: 3%;" align="center"> 
						
						<!--? Shop Method Start-->
						<aside class="single_sidebar_widget search_widget col-lg-6 mb-5 mb-lg-0" style="border: solid 1px;">
                                <form action="#">
                                    <div class="form-group" style="padding-top: 12px;">
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" placeholder='Search Keyword'
                                                onfocus="this.placeholder = ''"
                                                onblur="this.placeholder = 'Search Keyword'" style="margin-right: 2%; height: 50px;">
                                            <div class="input-group-append">
                                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" type="button">
                                                쿠폰등록
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </aside>
						<!-- Shop Method End-->
						<br/><br/>
						<div class="col-md-4" id="profile_img">
							<h3>내가보유한 쿠폰</h3>
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