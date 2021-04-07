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

if("${notice}" != "") {
	alert("${notice}");
}

//아이디 , 이메일 정규식 체크 20210406
$(document).ready(function () {
	
	//20210408 여기까지 작업함
	$("#find_btn").click(function() {
		
		if($("#id").val() != "") {
			var id = $("#id").val().replace(/(\s*)/g, "");
			$(this).val(id);
			var str = "";
			var idCheck = /^[a-z]+[a-z0-9]{5,19}$/g;
			
			//아이디 정규식 체크 
			if(!id.match(idCheck)) {
				$("#id").val("");
				$("#id").focus();
				$("#idCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>아이디 형식이 잘못되었습니다.</p>");
				return false;
			} else {
				$("#idCheck-Reuslt").empty();
			}
		} else {
			alert("아이디 입력란을 작성해주세요.");
			$("#id").focus();
			return false;
		}
			
		if($("#email").val() != "") {
			var email = $("#email").val().replace(/(\s*)/g, "");
			var emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			$(this).val(email);
			if(!email.match(emailCheck)) {
				$("#email").val("");
				$("#email").focus();
				$("#emailCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>이메일 형식이 잘못되었습니다.</p>");
				return false;
			} else {
				$("#emailCheck-Reuslt").empty();
			}
		} else {
			alert("이메일 입력란을 작성해주세요.");
			$("#email").focus();
			return false;
		}
		//아이디, 이메일 가입여부 체크 20210408		
		$.ajax({
			url : "${contextPath}/member/idemailCheck",
			type : "post",
			data : {"id":id,
					"email":email},
			success : function(result) {
				alert(result.notice);
				if(result.resultNumber == 1) {
					$("#verification_code").html("<input type='email' id='email' name='email' placeholder='인증번호를 입력해주세요'class='single-input'>");
					$("#find_btn").attr("id", "pwFind_btn");
					$("#pwFind_btn").text("비밀번호 찾기");
				}
			},
			error : function() {
				alert("통신 실패");
			}
			
		});
		
		
	});
	
	$(document).on("click", "#pwFind_btn", function() {
		alert("오예");
	});
//		$("#pwFind_form").attr("action", "${contextPath}/member/pwFindExecute");
//		$("#pwFind_form").submit();
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
					<form action="#" method="post" id="pwFind_form">
						<div class="mt-10">
							<input type="text" name="id" placeholder="Id" id="id"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Id'" required
								class="single-input">
						</div>
						<div id="idCheck-Reuslt">
						
						</div>
						<div class="mt-10">
							<input type="email" id="email" name="email" placeholder="Email"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Email'" required
								class="single-input">
						</div>
						<div id="emailCheck-Reuslt">
						
						</div>
						<div id= "verification_code" style="margin-top: 1%;">
						
						</div>
						<div align="center" style=" margin-top: 15px;">
							<a href="javascript:;" class="genric-btn info-border radius" id="find_btn" style="width: 100%; ">인증번호 보내기</a>
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