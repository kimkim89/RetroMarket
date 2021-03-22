<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Watch shop | eCommers</title>
<%@ include file="./include/Top.jsp"%>

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

</head>

<body>
	<header>
		<!-- Header Start -->
		<jsp:include page="./include/TopNavi.jsp" />
		<!-- Header End -->
	</header>
	<main>
		
		<!--================ 회원가입 =================-->
		<section class="cart_area section_padding">
			<div class="container">
				<div class="cart_inner" style="max-width: 92%; margin-left: 2%;">
					<h3 class="mb-30">회원 가입 하기</h3>
					<form action="#">
						<div class="mt-10">
							<input type="text" name="first_name" placeholder="이름"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '이름'" required
								class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="first_name" placeholder="아이디"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '아이디'" required
								class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="first_name" placeholder="비밀번호"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '비밀번호'" required
								class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="first_name" placeholder="비밀번호 확인"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '비밀번호 확인'" required
								class="single-input">
						</div>
				<!-- 이메일 -->
					<div class="flex">
						<div class="mt-10" style="width: 60%;" >
							<input type="email" name="EMAIL" placeholder="이메일" 
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '이메일'" required
								class="single-input">
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
							<input type="text" name="address" placeholder="우편 번호"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '주소'" required
								class="single-input">
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
							<input type="text" name="address" placeholder="상세 주소"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '상세 주소'" required
								class="single-input">
					</div>
						<div class="mt-10">
							<input type="text" name="first_name" placeholder="휴대폰 번호"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '휴대폰 번호'" required
								class="single-input">
						</div>
						<div align="center" style=" margin-top: 15px;">
							<a href="#" class="genric-btn info-border radius">가입하기</a>
							<a href="#" class="genric-btn warning-border radius">돌아가기</a>
						</div>
					</form>
				</div>
			</div>
		</section>
		<!--================ 회원 가입 끝 =================-->
	</main>
	
	<footer> </footer>
	<jsp:include page="./include/Footer2.jsp" />

</body>
</html>