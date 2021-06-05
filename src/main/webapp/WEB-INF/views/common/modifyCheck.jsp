<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
$(document).ready(function () {
	
	var idCheck = 0;
	var emailCheck = 0;
	if("${notice}" != "") {
		alert("${notice}");
	}
	
	//메일 인증
	$("#emailCheck").click(function() {
		var email = $("#email").val().replace(/(\s*)/g, "");
	 if($("#email").val() == "") {
		 $("#emailCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>이메일을 입력해주세요!</p>");
	 }	else {
		 $.ajax({ //메일 중복 체크
				url : "${contextPath}/member/emailcheck",
				type : "post",
				data : {"email":email},
				success : function(result) {
					if (result == 0) { 
						emailCheck = 1;
						str = "<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>사용 가능한 Email입니다.</p>"
					} else {
						$("#id").val("");
						str = "<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: red;'><b>"+email+"</b>는(은)이미 존재하는 Email입니다.</p>"
					}
					$("#emailCheck-Reuslt").html(str);
				},
				error : function () {
					alert("통신 실패");
				}
			 }); 
		 }
		
	});
	
	//우편번호 , 주소 검색 API
	$("#addressFind").click(function() {
		execPostCode();
	});
	
	//공백 체크 및 가입 완료
	$("#join-btn").click(function () {
		
		if($("#name").val().replace(/(\s*)/g, "") == "") {
			alert("이름을 입력해주세요");
			$("#name").focus();
			return false;
		} else if($("#id").val().replace(/(\s*)/g, "") == "") {
			alert("ID를 입력해주세요.");
			$("#id").focus();
			return false;
		} else if($("#nickname").val().replace(/(\s*)/g, "") == "") {
			alert("닉네임을 입력해주세요.");
			$("#nickname").focus();
			return false;
		}   else if($("#email").val().replace(/(\s*)/g, "") == "") {
			alert("이메일을 입력해주세요.");
			emailCheck = 0;
			$("#email").focus();
			return false;
		} else if($("#address1").val().replace(/(\s*)/g, "") == "") {
			alert("우편번호를 입력해주세요.");
			$("#address1").focus();
			return false;
		} else if($("#address2").val().replace(/(\s*)/g, "") == "") {
			alert("상세주소를 입력해주세요.");
			$("#address2").focus();
			return false;
		} else if($("#phone").val().replace(/(\s*)/g, "") == "") {
			alert("휴대폰번호를 입력해주세요.");
			$("#phone").focus();
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
		} else {
			submitf();
		}
	});
	
	function submitf() {
		
		if($("#pwd").val().replace(/(\s*)/g, "") == "" && $("#pwdCheck").val().replace(/(\s*)/g, "") == "") {
			//비밀번호 변경 x 
	 		$("#modifyForm").attr("action", "${contextPath}/mypage/modifyAction/1");
	 		$("#modifyForm").submit();
		} else {
			if($("#pwd").val().replace(/(\s*)/g, "") == "") {
				alert("비밀번호 수정란을 작성해주세요")
				$("#pwd").focus();
			} else if($("#pwdCheck").val().replace(/(\s*)/g, "") == "") {
				alert("비밀번호 확인 수정란을 작성해주세요")
				$("#pwdCheck").focus();
			} else {
				//비밀번호 변경 o
				$("#modifyForm").attr("action", "${contextPath}/mypage/modifyAction/2");
		 		$("#modifyForm").submit();
			}
		}
		
	}
	
// 	//ID 정규식
// 	$("#id").blur(function() {
// 		var id = $("#id").val().replace(/(\s*)/g, "");
// 		$(this).val(id);
// 		var str = "";
// 		var idCheck = /^[a-z]+[a-z0-9]{5,19}$/g;
		
// 	   if(id != "") {
// 	    if(!id.match(idCheck)) {
// 	    	$('#id').val("");
// 			$('#id').focus();
// 			$("#idCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.</p>");
// 	    } else {
// 		 $.ajax({ //ID 중복 체크
// 			url : "${contextPath}/member/idcheck",
// 			type : "post",
// 			data : {"id":id},
// 			success : function(result) {
// 				if (result == 0) { 
// 					str = "<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>사용 가능한 ID입니다.</p>"
// 				} else {
// 					$("#id").val("");
// 					str = "<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: red;'><b>"+id+"</b>는(은)이미 존재하는 ID입니다.</p>"
// 				}
// 				$("#idCheck-Reuslt").html(str);
// 			},
// 			error : function () {
// 				alert("통신 실패");
// 			}
// 		 }); 
// 	    }
// 	   } else {
		   
// 	   }
		
// 	});//ID중복체크 끝
	
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
	
	//비밀번호 확인
	$("#pwdCheck").blur(function() {
		if($("#pwdCheck").val() != "") {
		var pwd = $("#pwd").val();
		var pwdCheck = $(this).val();
		if(pwd != pwdCheck) {
		   $("#pwdCheck").val("");
		   $("#pwdCheck").focus();
		   $("#pwdCheckCheck-Reuslt").html("<p style='padding: 0 20px; font-size: 15px; margin-bottom: 0px; color: #66b1e6;'>비밀번호가 일치하지 않습니다.</p>");
		} else {
			$("#pwdCheckCheck-Reuslt").empty();
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
	
});

</script>