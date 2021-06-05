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
<!-- 공백 및 유효성 체크 -->
<%@include file="../common/modifyCheck.jsp" %>
</head>
<body>
	<header>
		<!-- Header Start -->
		<jsp:include page="../include/TopNavi.jsp" />
		<!-- Header End -->
		
		<script type="text/javascript">
		
			
		
		
		</script>
		
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
					<div class="col-lg-8 mb-5 mb-lg-0"
						style="margin: 3%; margin-top: 1%;">
						<!--================ 회원가입 =================-->
						<section class="cart_area section_padding"
							style="padding: 0px;">
							<div class="container" style="max-width: 830px;">
								<div class="cart_inner" style="max-width: 92%; margin-left: 2%;">
									<h3 class="mb-30">회원 정보 수정</h3>
									<form id="joinForm" action="#" method="post">
										<div class="mt-10">
											<input type="text" id="name" name="name" placeholder="이름"
												readonly="readonly" value="${myInfo.name}" required class="single-input">
											<!-- 이름 체크 -->
											<div id="nameCheck-Reuslt"></div>
										</div>
										<div class="mt-10">
											<input type="text" id="id_pk"  readonly="readonly" name="id_pk" placeholder="아이디" readonly="readonly" value="${myInfo.id}"
												required class="single-input">
											<!-- ID 중복 체크 -->
											<div id="idCheck-Reuslt"></div>
										</div>
										<div class="mt-10">
											<input type="text" id="nickname" name="nickname"
												placeholder="닉네임" required class="single-input" >
											<!-- 닉네임 중복 체크 -->
											<div id="nickNameCheck-Reuslt"></div>
										</div>
										<div class="mt-10">
											<input type="password" id="pwd" name="pwd" placeholder="비밀번호"
												required class="single-input">
											<!-- 비밀번호 체크 -->
											<div id="pwdCheck-Reuslt"></div>
										</div>
										<div class="mt-10">
											<input type="password" id="pwdCheck" name="pwdCheck"
												placeholder="비밀번호 확인" required class="single-input">
											<!-- 비밀번호확인 체크 -->
											<div id="pwdCheckCheck-Reuslt"></div>
										</div>
										
										<!-- 우편 번호 -->
										<div class="flex">
											<div class="input-group-icon mt-10" style="width: 60%;">
												<div class="icon">
													<i class="fa fa-thumb-tack" aria-hidden="true"></i>
												</div>
												<input type="text" id="address1" name="address1"
													placeholder="우편 번호" required class="single-input"
													readonly="readonly">

												<!-- 우편 번호 체크 -->
												<div id="address1Check-Reuslt"></div>
											</div>

											<div class="mt-10 flex-member">
												<a href="javascript:;" id="addressFind"
													class="genric-btn success-border radius">주소 검색</a>
											</div>
										</div>
										<!-- 우편 번호 -->

										<!-- 주소1 -->
										<div class="input-group-icon mt-10">
											<div class="icon">
												<i class="fa fa-thumb-tack" aria-hidden="true"></i>
											</div>
											<input type="text" id="address2" name="address2"
												placeholder="주소" required class="single-input"
												readonly="readonly">
											<!-- 주소1 체크 -->
											<div id="address2Check-Reuslt"></div>

										</div>
										<!-- 주소1 -->

										<!-- 상세 주소 -->
										<div class="input-group-icon mt-10">
											<div class="icon">
												<i class="fa fa-thumb-tack" aria-hidden="true"></i>
											</div>
											<input type="text" id="address3" name="address3"
												placeholder="상세 주소" required class="single-input">
											<!-- 상세 주소 체크 -->
											<div id="address3Check-Reuslt"></div>

										</div>
										<div class="mt-10">
											<input type="text" id="phone" name="phone"
												placeholder="휴대폰 번호" required class="single-input">
											<!-- 휴대폰번호 체크 -->
											<div id="phoneCheck-Reuslt"></div>
										</div>
										<div align="center" style="margin-top: 15px;">
											<a href="javascript:;" class="genric-btn info-border radius"
												id="join-btn">수정하기</a> 
												<a href="javascript:history.back()"
												class="genric-btn warning-border radius">돌아가기</a>
												
										</div>
									</form>
								</div>
							</div>
						</section>
						<!--================ 회원 가입 끝 =================-->
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