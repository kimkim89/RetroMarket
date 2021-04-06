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
	
	$("#find_btn").click(function() {
		
		if($("#id").val() != "") {
			var id = $("#id").val().replace(/(\s*)/g, "");
			$(this).val(id);
			var str = "";
			var idCheck = /^[a-z]+[a-z0-9]{5,19}$/g;
			
			if(!id.match(idCheck)) {
				$("#id").val("");
				$("#id").focus();
				$("#id-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>아이디 형식이 잘못되었습니다.</p>");
			} else {
				alert("오케이");
				return false;
				$("#idCheck-Reuslt").empty();
				$("#id_find").attr("action", "${contextPath}/member/idFindExecute");
				$("#id_find").submit();
			}
		} else {
			alert("이메일 입력란을 작성해주세요.");
		}
		
		if($("#email").val() != "") {
			var email = $("#email").val().replace(/(\s*)/g, "");
			var emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			$(this).val(email);
			if(!email.match(emailCheck)) {
				$("#email").val("");
				$("#email").focus();
				$("#emailCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>이메일 형식이 잘못되었습니다.</p>");
			} else {
				$("#emailCheck-Reuslt").empty();
				$("#id_find").attr("action", "${contextPath}/member/idFindExecute");
				$("#id_find").submit();
			}
		} else {
			alert("이메일 입력란을 작성해주세요.");
		}
		
		
		
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
			<div class="container" style="max-width: 500px;">
				<div class="cart_inner" style="max-width: 92%; margin-left: 2%;">
					<h3 class="mb-30" style="text-align-last: center;">비밀번호 찾기</h3>
					<hr style="margin-top: -1rem;">
					<form action="#">
						<div class="mt-10">
							<input type="text" name="first_name" placeholder="Id" id="id"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Id'" required
								class="single-input">
						</div>
						<div id="idCheck-Result">
						
						</div>
						<div class="mt-10">
							<input type="email" id="email" name="first_name" placeholder="Email"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Email'" required
								class="single-input">
						</div>
						<div id="emailCheck-Reuslt">
						
						</div>
						<div align="center" style=" margin-top: 15px;">
							<a href="javascript:;" class="genric-btn info-border radius" id="find_btn" style="width: 100%; ">비밀번호 찾기</a>
							<a href="${contextPath}/member/idFind" style="color: black; float: left; font-size: 15px;">아이디가가 기억나지 않으세요??</a>
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