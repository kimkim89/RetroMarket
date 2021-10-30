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
		
		.od_table {
			border: solid 2px #8C8C8C;
		}
		
		.memo_span {
			color:red;
		}
				
	</style>
	
<!-- 다음 우편 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${contextPath}/resources/assets/js/DaumApi/address_api_admin_order.js"></script>
<script>

	//우편번호 , 주소 검색 API
	function addressFind(type) {
		execPostCode(type);
	};

	
	
	
	// 주문 내역 수정
	function updateOrderList() {
		document.order_form.action="${contextPath}/adminOrder/updateOrderForm";
		document.getElementById('order_form').submit();
		return false;
	}
	
	// 주문 목록 페이지로 이동
	function moveToOrderList() {
		document.order_form.action="${contextPath}/adminOrder/orderList";
		document.getElementById('order_form').submit();
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
											<form name="order_form" id="order_form" method="POST">
											<input type="hidden" name="order_idx" id="order_idx" value="${eachOrderList.order_idx}" />
<!-- 2021.10.29 주문 정보 작업 진행 중 시작 -->	
											<h4 class="each_title">주문/결제 정보</h4>											
											<div class="table-responsive">
												<table class="table mb-0 od_table">
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
														<tr>
															<td>${eachOrderList.order_code}</td>
															<td>${paymentMethod}</td>
															<td><fmt:formatNumber value="${eachOrderList.total_order_price}" pattern="#,###"/>원</td>
															<td><fmt:formatNumber value="${eachOrderList.delivery_fee}" pattern="#,###"/>원</td>
															<td><fmt:formatNumber value="${eachOrderList.used_point}" pattern="#,###"/>원</td>
															<td><fmt:formatNumber value="${eachOrderList.coupon_price}" pattern="#,###"/>원</td>
															<td>
										                      <select class="country_select" name="order_status" id="order_status">
										                      	<c:forEach var="orderStatList" items="${orderStatList}" varStatus="status">
										                      		<option value="${status.index}" <c:if test="${eachOrderList.order_status_name == orderStatList.order_status_name}">selected</c:if>>${orderStatList.order_status_name}</option>
										                      	</c:forEach>										                        
										                      </select>											                    															
															
															</td>
														</tr>									
													</tbody>
												</table>
											</div>				
<br><br>		
<!-- 2021.10.29 주문 정보  작업 진행 중 끝 -->												
											
											
											
																																		
												<h4 class="each_title">주문자 정보</h4>
												<div class="row">
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="order_name">주문자</label>
														<input type="text" class="form-control" name="order_name" id="order_name" value="${eachOrderList.order_name}">
													</div>
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="order_phone">주문자 연락처</label>
														<input type="text" class="form-control" name="order_phone" id="order_phone" value="${eachOrderList.order_phone}">
													</div>
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="member_id">아이디</label>
														<input type="text" class="form-control" name="member_id" id="member_id" value="${eachOrderList.member_id}" readonly>
													</div>
												</div>
												
												<div class="row">
													<h5> 배송지 주소</h5>
													<div class="mb-3 col-md-4" style="display:inline-block;">																										
														<input type="text" class="form-control" name="order_addr1" id="order_addr1" placeholder="우편번호" value="${eachOrderList.order_addr1}" readonly>
													</div>
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<a href="javascript:;" id="addressFind" class="btn btn-primary" onclick="addressFind('type1');">주소 검색</a>
													</div>
												</div>
												<div id="address1Check-Reuslt"></div>
												<!-- 우편 번호 체크 -->
												<div class="mb-3">
													<label class="form-label" for="address1"></label>														
													<input type="text" class="form-control" name="order_addr2" id="order_addr2" placeholder="주소" value="${eachOrderList.order_addr2}" readonly>
													<!-- 주소1 체크 -->
													 <div id="address2Check-Reuslt"></div>													
												</div>
												<div class="mb-3">
													<label class="form-label" for="address1"></label>														
													<input type="text" class="form-control" name="order_addr3" id="order_addr3" placeholder="상세주소" value="${eachOrderList.order_addr3}">
													<!-- 상세 주소 체크 -->
													 <div id="address3Check-Reuslt"></div>	
												</div>
												<br><br>
												
												<h4 class="each_title">받는 사람 정보</h4>
												<div class="row">
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="receiver_name">입금자명</label>
														<input type="text" class="form-control" name="receiver_name" id="receiver_name" value="${eachOrderList.receiver_name}">
													</div>													
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<label class="form-label" for="receiver_phone">받는 사람 연락처</label>
														<input type="text" class="form-control" name="receiver_phone" id="receiver_phone" value="${eachOrderList.receiver_phone}">
													</div>
												</div>			
												<div class="row">
													<h5> 배송지 주소</h5>
													<div class="mb-3 col-md-4" style="display:inline-block;">																										
														<input type="text" class="form-control" name="receiver_addr1" id="receiver_addr1" placeholder="우편번호" value="${eachOrderList.receiver_addr1}" readonly>
													</div>
													<div class="mb-3 col-md-4" style="display:inline-block;">
														<a href="javascript:;" id="addressFind" class="btn btn-primary" onclick="addressFind('type2');">주소 검색</a>
													</div>
												</div>
												<div id="address1Check-Reuslt"></div>
												<!-- 우편 번호 체크 -->
												<div class="mb-3">
													<label class="form-label" for="address1"></label>														
													<input type="text" class="form-control" name="receiver_addr2" id="receiver_addr2" placeholder="주소" value="${eachOrderList.receiver_addr2}" readonly>
													<!-- 주소1 체크 -->
													 <div id="address2Check-Reuslt"></div>													
												</div>
												<div class="mb-3">
													<label class="form-label" for="address1"></label>														
													<input type="text" class="form-control" name="receiver_addr3" id="receiver_addr3" placeholder="상세주소" value="${eachOrderList.receiver_addr3}">
													<!-- 상세 주소 체크 -->
													 <div id="address3Check-Reuslt"></div>	
												</div>
												
												
												<div class="row">
													<div class="mb-3">
														<label class="form-label" for="id">배송요청사항</label>
														<textarea class="form-control" name="delivery_msg" id="delivery_msg" rows="1" style="height:200px;">${eachOrderList.delivery_msg}</textarea>
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
														<label class="form-label" for="bank_acct_owner">입금자명</label>
														<input type="text" class="form-control" name="bank_acct_owner" id="bank_acct_owner" value="${eachOrderList.bank_acct_owner}" />
													</div>
												</div>												
												<div class="row">
													<div class="mb-3 col-md-6"  style="display:inline-block;">
														<label class="form-label" for="od_bank_code">은행명</label>
														<select class="form-select" name="od_bank_code" id="od_bank_code">
															<c:forEach var="bankNameList" items="${bankNameList}" varStatus="status">
															  <option value="${bankNameList.bank_code}" <c:if test="${eachOrderList.od_bank_code == bankNameList.bank_code}">selected</c:if>>${bankNameList.bank_name}</option>															  
															</c:forEach>
														</select>														
													</div>									
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="bank_acct_num">계좌번호</label>
														<input type="text" class="form-control" name="bank_acct_num" id="bank_acct_num" value="${eachOrderList.bank_acct_num}">
													</div>													
												</div>
												<div class="row">
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="paid_price">무통장 입금액</label>
														<input type="text" class="form-control" name="paid_price" id="paid_price" value="${eachOrderList.paid_price}">
													</div>													
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="paid_date_ex">입금 확인일시</label>
														<input type="checkbox" id="add_p_date" name="add_p_date" onclick="addCurrentDate('dateTypeP');"/> 
														<span class="memo_span">*현재시간설정 시 체크박스 클릭</span>														
														<input type="text" class="form-control" name="paid_date_ex" id="paid_date_ex" value="${eachOrderList.paid_date}">
													</div>																								
												</div>
												<div class="row">
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="added_point">환불 포인트</label>
														<input type="text" class="form-control" name="added_point" id="added_point" value="${eachOrderList.added_point}">
													</div>													
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="refund_price">결제취소/환불금액</label>
														<input type="text" class="form-control" name="refund_price" id="refund_price" value="${eachOrderList.refund_price}">
													</div>													
												</div>
<br><br><br>								
<!-- 2021.10.29 결제 상세 정보 끝 -->		


<!-- 2021.10.29 배송 정보 시작 -->	
												<h4 class="each_title">배송 정보</h4>
												<div class="row">
													<div class="mb-3 col-md-6">
														<label class="form-label" for="delivery_company">배송사</label>
														<input type="text" class="form-control" name="delivery_company" id="delivery_company" value="${eachOrderList.delivery_company}" 
														<c:if test="${wu=='u'}">readonly="readonly"</c:if>>
													</div>
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="tracking_number">운송장번호</label>
														<input type="text" class="form-control" name="tracking_number" id="tracking_number" value="${eachOrderList.tracking_number}">
													</div>													
												</div>												
												<div class="row">
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="delivery_start_date_ex">배송일시</label>
														<input type="checkbox" id="add_d_date" name="add_d_date" onclick="addCurrentDate('dateTypeD');"/> 
														<span class="memo_span">*현재시간설정 시 체크박스 클릭</span>														
														<input type="text" class="form-control" name="delivery_start_date_ex" id="delivery_start_date_ex" value="${eachOrderList.delivery_start_date}">
													</div>													
													<div class="mb-3 col-md-6" style="display:inline-block;">
														<label class="form-label" for="point">메일 발송</label>
														<input type="checkbox" id="" name="" value="" /> 
														<span class="memo_span">*주문상태: 입금, 배송시작 시 이메일 전송</span>	
														<input type="text" class="form-control" name="order_email" id="order_email" value="${eachOrderList.order_email}" placeholder="주문자이메일">
													</div>													
												</div>
<br><br><br>
<!-- 2021.10.29 배송 정보 끝 -->	


<!-- 2021.10.29 주문한 상품 목록 작업 진행 중 시작 -->	
								<h4 class="each_title">주문한 상품</h4>					
								<div class="table-responsive">
									<table class="table mb-0 od_table">
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
										<c:forEach var="odProdList" items="${odProdList}" varStatus="status">
											<tr>
												<th scope="row"><input type="checkbox" name="" id="" /></th>
												<td>${odProdList.pr_name}</td>
												<td>${odProdList.total_num}</td>
												<td><fmt:formatNumber value="${odProdList.pr_price}" pattern="#,###"/>원</td>
												<td><fmt:formatNumber value="${odProdList.pr_point}" pattern="#,###"/>원</td>
												<td>${eachOrderList.order_status_name}</td>
											</tr>
										
										</c:forEach>												
										</tbody>
									</table>
								</div>
<br><br><br><br><br><br><br><br><br>															
<!-- 2021.10.29 주문한 상품 목록 작업 진행 중 끝 -->												
		
													<button type="button" class="btn btn-primary" onclick="updateOrderList();">수정</button>												
													<button type="button" class="btn btn-primary" onclick="moveToOrderList();">목록</button>	
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
	
	<script>
	// 현재 날짜 및 시간
	function addCurrentDate(dateType) {
		var currentDateTime = "";
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var hour = ('0' + today.getHours()).slice(-2);
		var minute = ('0' + today.getMinutes()).slice(-2);
		var second = ('0' + today.getSeconds()).slice(-2);
			currentDateTime = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
			
			
		
		if(dateType == "dateTypeP") {
			if(document.getElementById("add_p_date").checked == true) {
				document.getElementById("paid_date_ex").value = currentDateTime;
			}else {
				document.getElementById("paid_date_ex").value = "";
			}
		}
		
		if(dateType == "dateTypeD") {
			if(document.getElementById("add_d_date").checked == true) {
				document.getElementById("delivery_start_date_ex").value = currentDateTime;
			}else {
				document.getElementById("delivery_start_date_ex").value = "";
			}
		}
	
	}// addCurrentDate()함수 끝
	</script>
	
	<script src="${contextPath}/resources/admin/js/app.js"></script>

</body>

</html>