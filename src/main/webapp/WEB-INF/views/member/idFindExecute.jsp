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
			<div class="container" style="max-width: 500px;">
			<br><br><br>
				<div class="cart_inner" style="max-width: 92%; margin-left: 2%;">
					<hr style="margin-top: -1rem;">
					<form action="#" id="id_find">
						<div class="mt-10">
							<h4 style="text-align-last: center;">${notion}</h4>
						</div>
						<div align="center" style=" margin-top: 15px;">
							<a href="${contextPath}/member/login" class="genric-btn info-border radius" id="join-btn" style="width: 100%;">로그인 하러가기!</a>
							<a href="${contextPath}/member/pwFind" style="color: black; float: left; font-size: 15px;">비밀번호가 기억나지 않으세요??</a>
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