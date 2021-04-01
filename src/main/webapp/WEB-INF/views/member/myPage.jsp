<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/Top.jsp"%>
<script type="text/javascript">

	$(document).ready(function() {
		$("#logout_btn").click(function() {
			location.href = "${contextPath}/member/logout";
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
	<div align="center">
		<h2>업데이트 중입니다.</h2>
	</div>
	<div align="center">
		${user_id}님의 마이페이지입니다. 
	</div>
	<div align="center">
	<button id="logout_btn" type="button" style="color: black;"> 로그아웃</button>
	</div>

	<footer> </footer>
	<jsp:include page="../include/Footer2.jsp" />
</body>
</html>