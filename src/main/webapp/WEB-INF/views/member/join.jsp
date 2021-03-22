<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>돼지 김민지</title>
<%@ include file="../include/Top.jsp"%>

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
<script type="text/javascript">

	$(document).ready(function () {
		
		$("#join-btn").click(function() {
			
			$("#joinForm").attr("action", "${contextPath}/member/userJoin");
			$("#joinForm").submit();
			
		});
		
	});

</script>


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
							<input type="text" name="name" placeholder="이름" required class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="id" placeholder="아이디" required class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="nickname" placeholder="닉네임" required class="single-input">
						</div>
						<div class="mt-10">
							<input type="password" name="pwd" placeholder="비밀번호" required class="single-input">
						</div>
						<div class="mt-10">
							<input type="password" name="pwdCheck" placeholder="비밀번호 확인" required class="single-input">
						</div>
				<!-- 이메일 -->
					<div class="flex">
						<div class="mt-10" style="width: 60%;" >
							<input type="email" name="email" placeholder="이메일" required class="single-input">
						</div>
						<div  class="mt-10 flex-member" >
							<a href="#" class="genric-btn success-border radius" >메일 인증</a>
						</div>
					</div>	
				<!-- 이메일 -->
				
				<!-- 주소 -->		
					<div class="flex">
						<div class="input-group-icon mt-10" style="width: 60%;">
							<div class="icon">
								<i class="fa fa-thumb-tack" aria-hidden="true"></i>
							</div>
							<input type="text" name="address1" placeholder="우편 번호" required class="single-input">
						</div>
						<div  class="mt-10 flex-member" >
							<a href="#" class="genric-btn success-border radius" >주소 검색</a>
						</div>
					</div>	
				<!-- 주소 -->
					
					<div class="input-group-icon mt-10" >
							<div class="icon">
								<i class="fa fa-thumb-tack" aria-hidden="true"></i>
							</div>
							<input type="text" name="address2" placeholder="상세 주소" required class="single-input">
					</div>
						<div class="mt-10">
							<input type="text" name="phone" placeholder="휴대폰 번호" required class="single-input">
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