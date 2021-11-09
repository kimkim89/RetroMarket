<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/Top.jsp"%>

<script type="text/javascript">
	
	//알림 메시지
	if("${msg}" != "") {
	 	alert("${msg}");
	 	location.href='${contextPath}/' + '${locationUrl}';
	 }

	
	$(document).ready(function() {
		
		$("#logout_btn").click(function() {
			location.href = "${contextPath}/member/logout";
		});
		
		$("#myPage_btn").click(function() {
			location.href = "${contextPath}/mypage/myPageR";
		});
		
		$("#admin_btn").click(function() {
			location.href = "${contextPath}/admin/adminIndex";
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
	<div align="center" style="margin-top: 5%;">
		<h2>업데이트 중입니다.</h2>
	</div>
	<div align="center">
		${user_id}님의 마이페이지입니다. 
	</div>
	<div align="center" style="margin-top: 1%;">
	<button id="logout_btn" type="button" style="color: black;"> 로그아웃</button>
	</div>
	<div align="center" style="margin-top: 1%;">
	<button id="admin_btn" type="button" style="color: black;"> 관리자 페이지 이동</button>
	</div>
	<div align="center" style="margin-top: 1%;">
	<button id="myPage_btn" type="button" style="color: black;"> 마이 페이지 이동</button>
	</div>

	<footer> </footer>
	<jsp:include page="../include/Footer2.jsp" />
</body>
</html>