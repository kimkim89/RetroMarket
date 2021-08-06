<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>비밀번호 변경</title>
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

	if("${notice}" != "") {
		alert("${notice}");
	}

	$(document).ready(function () {
		
		$("#pwChange_btn").click(function() {
			
			//비밀번호 유효성
			if($("#pwd").val() != "") {
				var pwd = $("#pwd").val().replace(/(\s*)/g, "");
				$("#pwd").val(pwd);
				var pwdCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
				if(!pwd.match(pwdCheck)) {
					$("#pwd").val("");
					$("#pwd").focus();
					$("#pwdCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>비밀번호는 최소 8 자 이며, 최소 하나의 문자, 하나의 숫자 및 최소 하나의 특수문자를 포함해야 합니다.</p>");
					$("#pwdCheck").val("");
					return false;
				} else {
					$("#pwdCheck-Reuslt").empty();
				}
			} else {
				alert("비밀번호를 입력해주세요.")
				return false;
			}
			
			if($("#pwdCheck").val() != "") {
				var pwd = $("#pwd").val();
				var pwdCheck = $("#pwdCheck").val();
				if(pwd != pwdCheck) {
				   $("#pwdCheck").val("");
				   $("#pwdCheck").focus();
				   $("#pwdCheckCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>비밀번호가 일치하지 않습니다.</p>");
				   return false;
				} else {
					$("#pwdCheckCheck-Reuslt").empty();
				}
			 } else {
				 alert("비밀번호확인을 입력해주세요.")
				 return false;
			 }
			
			 $("#pwChange_form").attr("action", "${contextPath}/member/pwChange")
			 $("#pwChange_form").submit();
			
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
		
		<!--================ 비밀번호 변경 =================-->
		<section class="cart_area section_padding" style="padding: 110px 0px;">
			<div class="container" style="max-width: 500px;">
				<div class="cart_inner" style="max-width: 92%; margin-left: 2%;">
					<h3 class="mb-30" style="text-align-last: center;">비밀번호 변경</h3>
					<hr style="margin-top: -1rem;">
					<form action="#" id="pwChange_form" method="post">
						<div class="mt-10">
							<input type="password" id="pwd" name="pwd" placeholder="비밀번호" onfocus="this.placeholder = ''"
								required class="single-input">
						</div>
						<div id="pwdCheck-Reuslt">
						
						</div>
						<div class="mt-10">
							<input type="password" id="pwdCheck" name="pwdCheck" placeholder="비밀번호 확인" onfocus="this.placeholder = ''"
								required class="single-input">
							<input type="hidden" id="email" name="email" value="${email}" onfocus="this.placeholder = ''"
								required class="single-input">
						</div>
						<div id="pwdCheckCheck-Reuslt">
						
						</div>
						<div align="center" style=" margin-top: 15px;">
							<a href="javascript:;" class="genric-btn info-border radius" id="pwChange_btn" style="width: 100%;">비밀번호 변경</a>
						</div>
					</form>
				</div>
			</div>
		</section>
		<!--================ ID 찾기 =================-->
	</main>
	
	<footer> </footer>
	<jsp:include page="../include/Footer2.jsp" />

</body>
</html>