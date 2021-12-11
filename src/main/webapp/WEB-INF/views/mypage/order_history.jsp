<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<%@ include file="../include/Top.jsp"%>

<style type="text/css">

/* #profile_img { */
/* 	display: block; */
/* 	margin: 0px auto; */
/* } */

.flex-container {
	display: inline-flex;
	flex-direction: row;
}

.info-attribute {
  display:block;
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap; 
  background: #d9e1f4;
  height: 70px;
}

#pr_name {
	font-weight: bold;
}

.od_detail_click {
	color: black;
	pointer-events: none;
}


</style>

<script type="text/javascript">
	function moveToOrderDetail(orderId) {
		document.getElementById("order_history_form").action = "${contextPath}/mypage/orderInfoDetail?order_id=" + orderId;
		document.getElementById("order_history_form").submit();
	}

</script>
</head>
<body>
	<header>
		<!-- Header Start -->
		<jsp:include page="../include/TopNavi.jsp" />
		<!-- Header End -->
	</header>
	<main>
		<!--? Hero Area Start-->
		<div class="slider-area ">
			<div class="single-slider slider-height2 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-center">
								<h2>주문 상세 내역</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--? Hero Area End-->
		<!--================Blog Area =================-->
		<section class="blog_area section-padding" style="margin: 0% 7% 0% 8%;;">
			<div class="gallery-area">
				<div class="row">
					<jsp:include page="./include/myPageSide.jsp" />
						<div class="col-lg-8 mb-5 mb-lg-0" style="margin-left: 3%;">
						<h3><fmt:formatDate value="${csOrderInfo.order_date}" pattern="yyyy-MM-dd"/></h3>
								
<!-- 받는 사람 정보 시작 -->			
								<table class="table">
									<thead style="background: background: #fbf9ff;">
										<tr align="center">
											<th style="width:15%; text-align: left;">
												<b>배송정보</b>
											</th>	
											<th style="width:85%; text-align: left;">												
											</th>	
										</tr>
									</thead>
										<tbody>																			
											<tr>
												<td align="center" class="d-none d-md-table-cell" style="text-align:left;">
													<div>
														<p class="delivery_info">받는사람</p>
														<p class="delivery_info">연락처</p>
														<p class="delivery_info">배송지 주소</p>
														<p class="delivery_info">요청사항</p>
													</div>													
												</td>
												<td align="center" class="d-none d-md-table-cell" style="text-align:left;">
													<div>
														<p class="delivery_info">${csOrderInfo.receiver_name}</p>
														<p class="delivery_info">${csOrderInfo.receiver_phone}</p>
														<p class="delivery_info">
															(${csOrderInfo.receiver_addr1}) 
															${csOrderInfo.receiver_addr2}
															${csOrderInfo.receiver_addr3}														
														</p>
														<p class="delivery_info">${csOrderInfo.delivery_msg}</p>
													</div>													
												</td>												
											</tr>	
									</tbody>									
								</table>
								<hr>							
<br><br>							
<!-- 받는 사람 정보 끝 -->						
								<table class="table">
									<thead style="background: background: #fbf9ff;">
										<tr align="center">
											<th style="width:45%; text-align: left;">
												<a href="javascript:moveToOrderDetail('${myPageOrderList.order_code}');" class="od_detail_click">
													[주문번호] ${myPageOrderList.order_code}
												</a>
											</th>
											<th class="d-none d-md-table-cell" style="width:20%">상품 금액</th>
											<th>주문 상태</th>
										</tr>
									</thead>
																
									<c:forEach var="myPgOdProdList" items="${myPgOdProdList}" varStatus="status">			
										<tbody>																			
											<tr>
												<td style="vertical-align: middle;">
													<div class="flex-container">
														<div class= "flex-item">
															<a href="${contextPath}/product/productDetail?product_id=${myPgOdProdList.pr_idx}">
																<img src="${contextPath}/resources/images/temporary/${myPgOdProdList.mk_stored_thumb}" style="border: solid lightgray; 1px; width: 110px; height: 110px;"/>
															</a>
														</div>
														&nbsp;&nbsp;
														<div class= "flex-item" style="margin: 5%; width: 380px">
															<a href="${contextPath}/product/productDetail?product_id=${myPgOdProdList.pr_idx}">
																<input type="text" name="pr_name" id="pr_name" class="single-input-secondary info-attribute" value="${myPgOdProdList.pr_name}(${myPgOdProdList.total_num}개)" >
															</a>
														</div>
													</div>												
												</td>
												<td align="center" class="d-none d-md-table-cell" style="vertical-align: middle;">
													<div>
														<p><b style="color: #dc1c87;;"><fmt:formatNumber value="${myPgOdProdList.pr_price}" pattern="#,###"/>원</b></p>
													</div>
												</td>
												<td align="center" class="table-action" style="vertical-align: middle;">
													<div>
														<span><b>${myPageOrderList.order_status_name}</b></span>	 													
													</div>
												</td>
											</tr>										
									</c:forEach>									
									</tbody>									
								</table>
								<hr>
<br><br>						
<!-- 결제 정보 시작 -->
								<table class="table">
									<thead style="background: background: #fbf9ff;">
										<tr align="center">
											<th style="width:15%; text-align: left;">
												<b>결제정보</b>
											</th>	
											<th style="width:85%; text-align: left;">												
											</th>	
										</tr>
									</thead>
										<tbody>																			
											<tr>
												<td align="center" class="d-none d-md-table-cell" style="text-align:left;">
													<div>
														<p class="delivery_info">상품 가격</p>
														<p class="delivery_info">배송비</p>
														<p class="delivery_info">결제 종류</p>
														<p class="delivery_info">입금 계좌</p>
													<c:if test="${csOrderInfo.used_point > 0}">	
														<p class="delivery_info">포인트 사용</p>
													</c:if>	
														<p class="delivery_info">총 결제금액</p>
													</div>													
												</td>
												<td align="center" class="d-none d-md-table-cell" style="text-align:left;">
													<div>
														<p class="delivery_info"><fmt:formatNumber value="${csOrderInfo.total_order_price}" pattern="#,###"/>원</p>
														<p class="delivery_info"><fmt:formatNumber value="${csOrderInfo.delivery_fee}" pattern="#,###"/>원</p>
													<c:if test="${csOrderInfo.payment_method == 1}">
													<c:set var="payment" value="무통장입금"></c:set>
														<p class="delivery_info">${payment}</p>
														<p class="delivery_info">${csOrderInfo.bank_acct_num} (입금자명: ${csOrderInfo.bank_acct_owner})</p>
													</c:if>
													<c:if test="${csOrderInfo.used_point > 0}">
														<p class="delivery_info"><fmt:formatNumber value="${csOrderInfo.used_point}" pattern="#,###"/>원</p>
													</c:if>
														<p class="delivery_info"><fmt:formatNumber value="${csOrderInfo.total_order_price}" pattern="#,###"/>원</p>
													</div>													
												</td>												
											</tr>	
									</tbody>									
								</table>
								<hr>		
<br><br>
<!-- 결제 정보 끝 -->			
						</div>
					</div>
				</div>
		</section>
		<!--================Blog Area =================-->	
	</main>
	<footer> </footer>
	<jsp:include page="../include/Footer.jsp" />
</body>
</html>