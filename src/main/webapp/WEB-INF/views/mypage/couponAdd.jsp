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
								<h2>쿠폰 페이지</h2>
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
						
				<div class="section-top-border">
					<h3>보유 쿠폰</h3>
					<div class="row gallery-item">
						<div class="col-md-4">
								<div class="single-gallery-image" style="background: url(${contextPath}/resources/assets/img/elements/g1.jpg);"></div>
						</div>
						<div class="col-md-4">
								<div class="single-gallery-image" style="background: url(https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.imagetoday.co.kr%2Fxsearch%2Findex%2F%3Fmode%3Dsearch%26search%3D(%25EB%25A0%2588%25ED%258A%25B8%25EB%25A1%259C%252B%25EB%2589%25B4%25ED%258A%25B8%25EB%25A1%259C%252B-tid290%252B-tds005%252B-%25EC%259D%2598%25EB%25A3%258C%25EB%25B7%25B0%25ED%258B%25B0%252B-%25EC%25BD%2594%25EB%25A6%25AC%25EC%2595%2584%25EC%2584%25B8%25EC%259D%25BC%25ED%258E%2598%25EC%258A%25A4%25ED%2583%2580)%26multi_offer%3D2%257C%26offer_type%3D2%257C%26pre_offer_type%3D2%257C%26s_menu%3Dmembership%26sort%3D0%26view_type%3Dtotal%26search_type%3Dsingle%26parent_arr%3D0%26theme_year%3D0%26theme_month%3D0%26search_box%3D%26rank_by%3D%26rank_mode%3Dbalanced%26textspace_membership%3D%26adult%3DN%26substitute%3DN%26file_ext%3D%26shape%3D%26media_type%3D%26bm%3Dprmov_footage%26resolution%3Dall%26ae_version%3Dall%26sampling%3DN%26page%3D1%26perpage%3D10%26totalpage%3D%26theme_seq%3D&psig=AOvVaw2mZA0FUMlnM8WHjj-u4Pcj&ust=1621007849696000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJjw3P2Cx_ACFQAAAAAdAAAAABAK);"></div>
						</div>
						<div class="col-md-4">
								<div class="single-gallery-image" style="background: url(https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.imagetoday.co.kr%2Fxsearch%2Findex%2F%3Fmode%3Dsearch%26search%3D(%25EB%25A0%2588%25ED%258A%25B8%25EB%25A1%259C%252B%25EB%2589%25B4%25ED%258A%25B8%25EB%25A1%259C%252B-tid290%252B-tds005%252B-%25EC%259D%2598%25EB%25A3%258C%25EB%25B7%25B0%25ED%258B%25B0%252B-%25EC%25BD%2594%25EB%25A6%25AC%25EC%2595%2584%25EC%2584%25B8%25EC%259D%25BC%25ED%258E%2598%25EC%258A%25A4%25ED%2583%2580)%26multi_offer%3D2%257C%26offer_type%3D2%257C%26pre_offer_type%3D2%257C%26s_menu%3Dmembership%26sort%3D0%26view_type%3Dtotal%26search_type%3Dsingle%26parent_arr%3D0%26theme_year%3D0%26theme_month%3D0%26search_box%3D%26rank_by%3D%26rank_mode%3Dbalanced%26textspace_membership%3D%26adult%3DN%26substitute%3DN%26file_ext%3D%26shape%3D%26media_type%3D%26bm%3Dprmov_footage%26resolution%3Dall%26ae_version%3Dall%26sampling%3DN%26page%3D1%26perpage%3D10%26totalpage%3D%26theme_seq%3D&psig=AOvVaw2mZA0FUMlnM8WHjj-u4Pcj&ust=1621007849696000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJjw3P2Cx_ACFQAAAAAdAAAAABAK);"></div>
							
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