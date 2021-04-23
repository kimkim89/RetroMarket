<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>회원가입</title>
<%@ include file="../include/Top.jsp"%>
<!-- 다음 우편 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${contextPath}/resources/assets/js/DaumApi/AddressApi.js"></script>

<style type="text/css">
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

<!-- 공백 및 유효성 체크 -->
<%@include file="../common/Check.jsp" %>

</head>

<body>
	<header>
		<!-- Header Start -->
		<jsp:include page="../include/TopNavi.jsp" />
		<!-- Header End -->
	</header>
	<main>
		<!--================ 회원가입 =================-->
		<section class="cart_area section_padding" style="padding: 110px 0px;">
			<div class="container" style="max-width: 830px;">
				<div class="cart_inner" style="max-width: 92%; margin-left: 2%;">
					<h3 class="mb-30">회원 가입 하기</h3>
					<form id="joinForm" action="#" method="post">
						<div class="mt-10">
							<input type="text" id="name" name="name" placeholder="이름" required class="single-input">
						<!-- 이름 체크 -->
						 <div id="nameCheck-Reuslt">
							
						 </div>
						</div>
						<div class="mt-10">
							<input type="text" id="id" name="id" placeholder="아이디" required class="single-input">
						<!-- ID 중복 체크 -->
						 <div id="idCheck-Reuslt">
							
						 </div>
						</div>
						<div class="mt-10">
							<input type="text" id="nickname" name="nickname" placeholder="닉네임" required class="single-input">
						<!-- 닉네임 중복 체크 -->
						 <div id="nickNameCheck-Reuslt">
							
						 </div>
						</div>
						<div class="mt-10">
							<input type="password" id="pwd" name="pwd" placeholder="비밀번호" required class="single-input">
						<!-- 비밀번호 체크 -->
						 <div id="pwdCheck-Reuslt">
							
						 </div>								
						</div>
						<div class="mt-10">
							<input type="password" id="pwdCheck" name="pwdCheck" placeholder="비밀번호 확인" required class="single-input">
						<!-- 비밀번호확인 체크 -->
						 <div id="pwdCheckCheck-Reuslt">
							
						 </div>								
						</div>
				<!-- 이메일 -->
					<div class="flex">
						<div class="mt-10" style="width: 60%;" >
							<input type="email" id="email" name="email" placeholder="이메일" required class="single-input">
						<!-- 이메일 체크 -->
						 <div id="emailCheck-Reuslt">
							
						 </div>							
						</div>
						<div  class="mt-10 flex-member" >
							<a href="javascript:;" id="emailCheck" class="genric-btn success-border radius">메일 체크</a>
						</div>
					</div>	
				<!-- 이메일 -->
				
				<!-- 우편 번호 -->		
					<div class="flex">
						<div class="input-group-icon mt-10" style="width: 60%;">
							<div class="icon">
								<i class="fa fa-thumb-tack" aria-hidden="true"></i>
							</div>
							<input type="text" id="address1" name="address1" placeholder="우편 번호" required class="single-input" readonly="readonly">
						
						<!-- 우편 번호 체크 -->
						 <div id="address1Check-Reuslt">
							
						 </div>								
						</div>
						
						<div  class="mt-10 flex-member" >
							<a href="javascript:;" id="addressFind" class="genric-btn success-border radius" >주소 검색</a>
						</div>
					</div>	
				<!-- 우편 번호 -->
				
					<!-- 주소1 -->
					<div class="input-group-icon mt-10" >
							<div class="icon">
								<i class="fa fa-thumb-tack" aria-hidden="true"></i>
							</div>
							<input type="text" id="address2" name="address2" placeholder="주소" required class="single-input" readonly="readonly">
						<!-- 주소1 체크 -->
						 <div id="address2Check-Reuslt">
							
						 </div>								
							
					</div>
					<!-- 주소1 -->
					
					<!-- 상세 주소 -->
					<div class="input-group-icon mt-10" >
							<div class="icon">
								<i class="fa fa-thumb-tack" aria-hidden="true"></i>
							</div>
							<input type="text" id="address3" name="address3" placeholder="상세 주소" required class="single-input">
						<!-- 상세 주소 체크 -->
						 <div id="address3Check-Reuslt">
							
						 </div>								
							
					</div>
						<div class="mt-10">
							<input type="text" id="phone" name="phone" placeholder="휴대폰 번호" required class="single-input">
						<!-- 휴대폰번호 체크 -->
						 <div id="phoneCheck-Reuslt">
							
						 </div>									
						</div>
						<div align="center" style=" margin-top: 15px;">
							<a href="javascript:;" class="genric-btn info-border radius" id="join-btn">가입하기</a>
							<a href="javascript:history.back()" class="genric-btn warning-border radius">돌아가기</a>
						</div>
					</form>
				</div>
			</div>
		</section>
		<!--================ 회원 가입 끝 =================-->
	</main>
	
	<footer> </footer>
	<jsp:include page="../include/Footer2.jsp" />

</body>
</html>