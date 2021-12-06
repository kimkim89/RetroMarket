<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/Top.jsp"%>

<style type="text/css">
	.menu_align {
		display : block;
		margin : auto;
	}
</style>

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
			location.href = "${contextPath}/adminOrder/orderList";
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
	<br><br><br>
	<main class="menu_align">
	<div align="center">
		<h3><b style="color:blue;">${user_id}</b>님의 마이페이지입니다.</h3>
	</div>
	<div align="center" style="margin-top: 5%;">
		<img src="${contextPath}/resources/assets/img/logo/MainLogo1.png" alt="" style="height: ; ">
	</div>
	<div align="center" style="margin-top: 1%;">
		<button id="logout_btn" class="btn_3" type="button"> 로그아웃</button>
	</div>
	<c:choose>
		<c:when test="${checkUserStatus == 1 }">
			<div align="center" style="margin-top: 1%;">
				<button id="admin_btn" class="btn_3" type="button"> 관리자페이지</button>
			</div>
			<div align="center" style="margin-top: 1%;">
				<button id="myPage_btn" class="btn_3" type="button"> 마이페이지</button>
			</div>
		</c:when>
		<c:when test="${checkUserStatus == 0 }">
			<div align="center" style="margin-top: 1%;">
				<button id="myPage_btn" class="btn_3" type="button"> 마이페이지</button>
			</div>
		</c:when>	
	</c:choose>
	</main>
	
<br><br><br>
	<jsp:include page="../include/Footer2.jsp" />
<%-- 	<jsp:include page="../include/Footer.jsp" /> --%>
</body>
</html>