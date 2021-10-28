<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>주문내역수정</title>
<%@ include file="./include/admin_top.jsp"%>	
	
<!-- 다음 우편 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${contextPath}/resources/assets/js/DaumApi/AddressApi.js"></script>
<script>
	//우편번호 , 주소 검색 API
	function addressFind() {
		execPostCode();
	};


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
					<h1 class="h3 mb-3">주문 내역 수정</h1>
					<div class="row">
						<div class="col-md-9 col-xl-10">
							<div class="tab-content">
								<div class="tab-pane fade show active" id="account" role="tabpanel">
									<div class="card">
										<div class="card-body">
											<form name="order_form" id="orderForm" method="POST">																							
												<div class="row">
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="point">주문자</label>
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="point">주문자 연락처</label>
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>
												</div>
												
												<div class="row">
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="point">받는 사람</label>
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>													
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="point">받는 사람 연락처</label>
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>
												</div>
												
												<div class="row">
													<h5> 배송지 주소</h5>
													<div class="mb-3 col-md-4" style="display:inline-block;">																										
														<input type="text" class="form-control" name="address1" id="address1" placeholder="우편번호" value="${memInfo.address1}" readonly>
													</div>
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<a href="javascript:;" id="addressFind" class="btn btn-primary" onclick="addressFind();">주소 검색</a>
													</div>
												</div>
												<div id="address1Check-Reuslt"></div>
												<!-- 우편 번호 체크 -->
												<div class="mb-3">
													<label class="form-label" for="address1"></label>														
													<input type="text" class="form-control" name="address2" id="address2" placeholder="주소" value="${memInfo.address2}" readonly>
													<!-- 주소1 체크 -->
													 <div id="address2Check-Reuslt"></div>													
												</div>
												<div class="mb-3">
													<label class="form-label" for="address1"></label>														
													<input type="text" class="form-control" name="address3" id="address3" placeholder="상세주소" value="${memInfo.address3}">
													<!-- 상세 주소 체크 -->
													 <div id="address3Check-Reuslt"></div>	
												</div>
												
												
												
												
												
												
												
												
												<div class="row">
													<div class="mb-3 col-md-6">
														<label class="form-label" for="id">아이디</label>
														<input type="text" class="form-control" name="id" id="id" value="${memInfo.id}" 
														<c:if test="${wu=='u'}">readonly="readonly"</c:if>>
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
												
											<c:choose>
												<c:when test="${wu=='u'}">
													<button type="button" class="btn btn-primary" id="testt" onclick="adminMemUpdate();">수정</button>
												</c:when>	
												<c:when test="${wu=='i'}">											
													<button type="button" class="btn btn-primary" onclick="adminMemInsert();">등록</button>
												</c:when>	
											</c:choose>
													<button type="button" class="btn btn-primary" onclick="adminMember();">목록</button>	
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