<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>회원등록</title>
<%@ include file="./include/admin_top.jsp"%>	
	
<!-- 다음 우편 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${contextPath}/resources/assets/js/DaumApi/AddressApi.js"></script>
<script>
	//우편번호 , 주소 검색 API
	function addressFind() {
		execPostCode();
	};


	$(document).ready(function() {
		
		//ID 정규식
		$("#id").blur(function() {
			var id = $("#id").val().replace(/(\s*)/g, "");
			$(this).val(id);
			var str = "";
			var idCheck = /^[a-z]+[a-z0-9]{5,19}$/g;
			
		   if(id != "") {
		    if(!id.match(idCheck)) {
		    	$('#id').val("");
				$('#id').focus();
				$("#idCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.</p>");
		    } else {
			 $.ajax({ //ID 중복 체크
				url : "${contextPath}/member/idcheck",
				type : "post",
				data : {"id":id},
				success : function(result) {
					if (result == 0) { 
						str = "<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>사용 가능한 ID입니다.</p>"
					} else {
						$("#id").val("");
						str = "<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: red;'><b>"+id+"</b>는(은)이미 존재하는 ID입니다.</p>"
					}
					$("#idCheck-Reuslt").html(str);
				},
				error : function () {
					alert("통신 실패");
				}
			 }); 
		    }
		   } else {
			   
		   }
			
		});//ID중복체크 끝
		
		//닉네임 정규식
		$("#nickname").blur(function() {
			var nickname =$(this).val().replace(/(\s*)/g, "");
			$(this).val(nickname);
			var str = "";
			var nicknameCheck = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
			
			if(nickname != "") {
			 if(!nickname.match(nicknameCheck)) {
				 $('#nickname').val("");
				 $('#nickname').focus();
				 $("#nickNameCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>닉네임은 2 ~ 20 글자로 입력해 주세요 .</p");
			 } else {
				$.ajax({ //닉네임 중복 체크
					url : "${contextPath}/member/nicknameCheck",
					type : "post",
					data : {"nickname":nickname},
					success : function(result) {
						if (result == 0) { 
							str = "<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>사용 가능한 닉네임 입니다.</p>"
						} else {
							$("#nickname").val("");
							str = "<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: red;'><b>"+nickname+"</b>는(은) 이미 존재하는 닉네임 입니다.</p>"
						}
						$("#nickNameCheck-Reuslt").html(str);
					},
					error : function () {
						alert("통신 실패");
					}
				}); 
			  }	
			}
		});//닉네임 중복 체크 끝
		
		//이름 정규식 
		$("#name").blur(function() {
			if($("#name").val() != "") {
			var name = $("#name").val().replace(/(\s*)/g, "");
			$(this).val(name);
			var nameCheck =  /^[가-힣]{2,4}$/;
			if(!name.match(nameCheck)) {
				$("#name").val("");
				$("#name").focus();
				$("#nameCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>이름 형식을 확인해주세요.</p>");
			 } else {
				 $("#nameCheck-Reuslt").empty();
			 }
			}
		});
		
		//비밀번호 정규식
		$("#pwd").blur(function() {
			if($("#pwd").val() != "") {
			var pwd = $("#pwd").val().replace(/(\s*)/g, "");
			$(this).val(pwd);
			var pwdCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
			if(!pwd.match(pwdCheck)) {
				$("#pwd").val("");
				$("#pwd").focus();
				$("#pwdCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>비밀번호는 최소 8 자 이며, 최소 하나의 문자, 하나의 숫자 및 최소 하나의 특수문자를 포함해야 합니다.</p>");
			} else {
				$("#pwdCheck-Reuslt").empty();
			}
		  }
		});
		
		
		
		//이메일 정규식
		$("#email").blur(function() {
			if($("#email").val() != ""){
			var email = $("#email").val().replace(/(\s*)/g, "");
			var emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			$(this).val(email);
			if(!email.match(emailCheck)) {
				emailCheck = 0;
				$("#email").val("");
				$("#email").focus();
				$("#emailCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>이메일 형식이 잘못되었습니다.</p>");
		    } else {
				   $("#emailCheck-Reuslt").empty();
			   }
		   } 
			
		});
		
		//휴대폰번호 정규식
		$("#phone").blur(function() {
			if($("#phone").val() != "") {
			console.log("뭐야");
			var phone = $("#phone").val().replace(/(\s*)/g, "");
			var phoneCheck = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;
			$(this).val(phone);
			if(!phone.match(phoneCheck)) {
				$("#phone").val("");
				$("#phone").focus();
				$("#phoneCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>휴대폰 형식이 잘못되었습니다(숫자만 입력해 주세요).</p>");
			} else {
				$("#phoneCheck-Reuslt").empty();
			}

			}
		});
		
		function adminMemInsert() {
			

			if($("#level").val() == "") {
				alert("회원등급을 선택해주세요.");
				$("#level").focus();
				return false;
			} else if($("#id").val().replace(/(\s*)/g, "") == "") {
				alert("ID를 입력해주세요.");
				$("#id").focus();
				return false;
			} else if($("#name").val().replace(/(\s*)/g, "") == "") {
				alert("이름을 입력해주세요");
				$("#name").focus();
				return false;
			} else if($("#nickname").val().replace(/(\s*)/g, "") == "") {
				alert("닉네임을 입력해주세요.");
				$("#nickname").focus();
				return false;
			}  else if($("#pwd").val().replace(/(\s*)/g, "") == "") {
				alert("비밀번호를 입력해주세요.");
				$("#pwd").focus();
				return false;
			} else if($("#phone").val().replace(/(\s*)/g, "") == "") {
				alert("연락처를 입력해주세요.");
				$("#phone").focus();
				return false;
			} else if($("#email").val().replace(/(\s*)/g, "") == "") {
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;		
			} else if($("#address1").val().replace(/(\s*)/g, "") == "") {
				alert("우편번호를 입력해주세요.");
				$("#address1").focus();
				return false;
			} else if($("#address2").val().replace(/(\s*)/g, "") == "") {
				alert("주소를 입력해주세요.");
				$("#address2").focus();
				return false;
			} else if($("#address3").val().replace(/(\s*)/g, "") == "") {
				alert("상세주소를 입력해주세요.");
				$("#address3").focus();
				return false;
			}
						
			document.memberForm.action="${contextPath}/admin/adminMemInsert";
			document.getElementById('memberForm').submit();
			return false;				
		}			
		
		function adminMember() {
			document.memberForm.action="${contextPath}/admin/adminMember";
			document.getElementById('memberForm').submit();
			return false;
		}
		
		
	});
	
	// 회원 정보 수정
	function adminMemUpdate() {
		document.memberForm.action="${contextPath}/admin/adminMemUpdate";
		document.getElementById('memberForm').submit();
		return false;
	}
	
	
</script>	
	
</head>

<body>
	<div class="wrapper">
		<%@ include file="./include/sidebar.jsp" %>
			<main class="content">
				<div class="container-fluid p-0">
					<h1 class="h3 mb-3">회원등록/수정</h1>
					<div class="row">
						<div class="col-md-9 col-xl-10">
							<div class="tab-content">
								<div class="tab-pane fade show active" id="account" role="tabpanel">
									<div class="card">
										<div class="card-body">
											<form name="memberForm" id="memberForm" method="POST">
												<input type="hidden" name="regStatus" value="" >												
												<div class="row">
													<div class="mb-3 col-md-4"  style="display:inline-block;">
														<label class="form-label" for="level">회원등급</label>
														<select class="form-select" name="level" id="level">
														  <option value="" >회원등급선택</option>
														  <option value="1" <c:if test="${memInfo.level == 1}">selected</c:if>>일반회원</option>
														  <option value="2" <c:if test="${memInfo.level == 2}">selected</c:if>>VIP회원</option>
														  <option value="3" <c:if test="${memInfo.level == 3}">selected</c:if>>VVIP회원</option>
														</select>														
													</div>
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="point">적립금</label>
														<input type="text" class="form-control" name="point" id="point" placeholder="포인트" value="20000점">
													</div>
												</div>
												<div class="row">
													<div class="mb-3 col-md-6">
														<label class="form-label" for="id">아이디</label>
														<input type="text" class="form-control" name="id" id="id" value="${memInfo.id}" <c:if test="${wu=='u'}">readonly</c:if>>
													</div>
													<div id="idCheck-Reuslt">
													
													</div>
												</div>
												<div class="row">
													<div class="mb-3 col-md-6">
														<label class="form-label" for="name">이름</label>
														<input type="text" class="form-control" name="name" id="name" value="${memInfo.name}">
													</div>
												</div>
												<div class="row">
													<div class="mb-3 col-md-6">
														<label class="form-label" for="nickname">닉네임</label>
														<input type="text" class="form-control" name="nickname" id="nickname" value="${memInfo.nickname}">
													</div>
												</div>
												<div class="row">
													<div class="mb-3 col-md-6">
														<label class="form-label" for="pwd">비밀번호</label>
														<input type="password" class="form-control" name="pwd" id="pwd" >
													</div>
												</div>
												<div class="row">
													<div class="mb-3 col-md-6">
														<label class="form-label" for="phone">연락처</label>
														<input type="text" class="form-control" name="phone" id="phone" value="${memInfo.phone}">
													</div>
												</div>
												<div class="row">
													<div class="mb-3 col-md-6">
														<label class="form-label" for="email">이메일</label>
														<input type="text" class="form-control" name="email" id="email" value="${memInfo.email}">
													</div>
												</div>
												<div class="mb-3 col-md-2">
													<label class="form-label" for="address1">우편번호</label>
													<input type="text" class="form-control" name="address1" id="address1" placeholder="우편번호" value="${memInfo.address1}" readonly>
												</div>
												<div  class="mb-3 col-md-2" style="display:inline-block;">
													<a href="javascript:;" id="addressFind" class="btn btn-primary" onclick="addressFind();">주소 검색</a>
												</div>													
												 <div id="address1Check-Reuslt">
													
												 </div>
												<!-- 우편 번호 체크 -->
												<div class="mb-3">
													<label class="form-label" for="address2">주소</label>
													<input type="text" class="form-control" name="address2" id="address2" placeholder="주소" value="${memInfo.address2}" readonly>
													<!-- 주소1 체크 -->
													 <div id="address2Check-Reuslt">
														
													 </div>													
												</div>
												<div class="mb-3">
													<label class="form-label" for="address3">상세주소</label>
													<input type="text" class="form-control" name="address3" id="address3" placeholder="상세주소" value="${memInfo.address3}">
													<!-- 상세 주소 체크 -->
													 <div id="address3Check-Reuslt">
														
													 </div>	
												</div>
											<c:choose>
												<c:when test="${wu=='u'}">
													<button type="button" class="btn btn-primary" id="testt" onclick="adminMemUpdate()">수정</button>
												</c:when>	
												<c:when test="${wu=='i'}">											
													<button type="button" class="btn btn-primary" onclick="adminMemInsert()">등록</button>
												</c:when>	
											</c:choose>
													<button type="button" class="btn btn-primary" onclick="adminMember()">목록</button>	
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-left">
							<p class="mb-0">
								<a href="index.html" class="text-muted"><strong>AdminKit Demo</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-right">
							<ul class="list-inline">
								<li class="list-inline-item">
									<a class="text-muted" href="#">Support</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="#">Help Center</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="#">Privacy</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="#">Terms</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
	</div>
	
	<script src="${contextPath}/resources/admin/js/app.js"></script>

</body>

</html>