<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>주문내역수정</title>
<%@ include file="./include/admin_top.jsp"%>	
	
	<style>
		.each_title {
			font-weight: bold;
		}
				
	</style>
	
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
<!-- 2021.10.29 주문 정보 작업 진행 중 시작 -->	
											<h4 class="each_title">주문/결제 정보</h4>
											<div class="table-responsive">
												<table class="table mb-0">
													<thead>
														<tr>
															<th scope="col">주문번호</th>
															<th scope="col">결제방법</th>
															<th scope="col">주문총액</th>
															<th scope="col">배송비</th>
															<th scope="col">포인트결제</th>
															<th scope="col">쿠폰</th>
															<th scope="col">주문상태</th>
														</tr>
													</thead>
													<tbody>										
													<c:forEach var="eachOdList" items="${eachOrderList}" varStatus="status">
														<tr>
															<td>${eachOdList.order_code}</td>
															<td>${eachOdList.payment_method}</td>
															<td><fmt:formatNumber value="${eachOdList.total_order_price}" pattern="#,###"/>원</td>
															<td><fmt:formatNumber value="${eachOdList.delivery_fee}" pattern="#,###"/>원/td>
															<td><fmt:formatNumber value="${eachOdList.used_point}" pattern="#,###"/>원</td>
															<td><fmt:formatNumber value="${eachOdList.coupon_price}" pattern="#,###"/>원</td>
															<td>접수, 입금, 배송시작, 배송완료, 주문취소</td>
														</tr>													
													</c:forEach>												
													</tbody>
												</table>
											</div>				
<br><br><br><br><br><br><br><br><br>
												
<!-- 2021.10.29 주문 정보  작업 진행 중 끝 -->												
											
											
											
																																		
												<h4 class="each_title">주문자 정보</h4>
												<div class="row">
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="point">주문자</label>
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="point">주문자 연락처</label>
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="point">아이디</label>
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
												<br><br>
												
												<h4 class="each_title">받는 사람 정보</h4>
												<div class="row">
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="point">입금자명</label>
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
													<div class="mb-3">
														<label class="form-label" for="id">배송요청사항</label>
														<textarea class="form-control" name="delivery_msg" id="delivery_msg" rows="1" placeholder="" style="height:200px;"></textarea>
														<c:if test="${wu=='u'}">readonly="readonly"</c:if>
													</div>
													<div id="idCheck-Reuslt">
													
													</div>
												</div>
<br><br><br>												
								
<!-- 2021.10.29 결제 상세 정보 시작  -->				
												<h4 class="each_title">결제 상세 정보</h4>
												<div class="row">
													<div class="mb-3 col-md-6">
														<label class="form-label" for="id">입금자명</label>
														<input type="text" class="form-control" name="id" id="id" value="${memInfo.id}" 
														<c:if test="${wu=='u'}">readonly="readonly"</c:if>>
													</div>
												</div>												
												<div class="row">
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="point">은행명</label>
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>													
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="point">계좌번호</label>
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>													
												</div>
												<div class="row">
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="point">무통장 입금액</label>
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>													
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="point">입금 확인일시</label>
														<input type="checkbox" id="" name="" value="" /> 
														<span style="color:red;">*현재시간설정 시 체크박스 클릭</span>														
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>																								
												</div>
												<div class="row">
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="point">사용한 포인트</label>
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>													
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="point">결제취소/환불금액</label>
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>													
												</div>
<br><br><br>								
<!-- 2021.10.29 결제 상세 정보 끝 -->		


<!-- 2021.10.29 배송 정보 시작 -->	
												<h4 class="each_title">배송 정보</h4>
												<div class="row">
													<div class="mb-3 col-md-6">
														<label class="form-label" for="id">배송사</label>
														<input type="text" class="form-control" name="id" id="id" value="${memInfo.id}" 
														<c:if test="${wu=='u'}">readonly="readonly"</c:if>>
													</div>
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="point">운송장번호</label>
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>													
												</div>												
												<div class="row">
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="point">배송일시</label>
														<input type="checkbox" id="" name="" value="" /> 
														<span style="color:red;">*현재시간설정 시 체크박스 클릭</span>														
														<input type="text" class="form-control" name="point" id="point" value="">
													</div>													
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="point">메일 발송</label>
														<input type="checkbox" id="" name="" value="" /> 
														<span style="color:red;">*주문상태: 입금, 배송시작 시 이메일 전송</span>	
														<input type="text" class="form-control" name="point" id="point" value="" placeholder="주문자이메일">
													</div>													
												</div>
<br><br><br>
<!-- 2021.10.29 배송 정보 끝 -->	


<!-- 2021.10.29 주문한 상품 목록 작업 진행 중 시작 -->	
								<h4 class="each_title">주문한 상품</h4>					
								<div class="table-responsive">
									<table class="table mb-0">
										<thead>
											<tr>
												<th scope="col"><input type="checkbox" name="" id="" /></th>
												<th scope="col">상품명</th>
												<th scope="col">수량</th>
												<th scope="col">판매가</th>
												<th scope="col">적립포인트</th>
												<th scope="col">주문상태</th>
											</tr>
										</thead>
										<tbody>										
<%-- 										<c:forEach var="odList" items="${csOrderList}" varStatus="status"> --%>
											<tr>
												<th scope="row"><input type="checkbox" name="" id="" /></th>
												<td>${odList.order_code}test</td>
												<td><fmt:formatNumber value="${odList.paid_price}" pattern="#,###"/>원</td>
												<td>${odList.order_code}test</td>
												<td><fmt:formatNumber value="${odList.paid_price}" pattern="#,###"/>원</td>
												<td><fmt:formatNumber value="${odList.paid_price}" pattern="#,###"/>원</td>
											</tr>
										
<%-- 										</c:forEach>												 --%>
										</tbody>
									</table>
								</div>
<br><br><br><br><br><br><br><br><br>															
<!-- 2021.10.29 주문한 상품 목록 작업 진행 중 끝 -->												
											

												
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