<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<%@ include file="../include/Top.jsp"%>
<style type="text/css">
#profile_img {
	display: block;
	margin: 0px auto;
}

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

</style>
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
								<h2>주문 목록</h2>
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

								<c:forEach var="orderList" items="${myPageOrderList}">
								<table class="table">
									<thead style="background: background: #fbf9ff;">
										<tr align="center">
											<th style="width:45%; text-align: left;">[주문번호] ${orderList.order_code}</th>
											<th class="d-none d-md-table-cell" style="width:20%">결제 금액</th>
											<th>주문 상태</th>
										</tr>
									</thead>									
									<c:forEach var="myPgOdProdList" items="${myPgOdProdList}">																		
									<tbody>										
										<tr>
											<td style="vertical-align: middle;">
												<div class="flex-container">
													<div class= "flex-item"><img src="${contextPath}/resources/images/temporary/${myPgOdProdList.mk_stored_thumb}" style="border: solid lightgray; 1px; width: 110px; height: 110px;"/></div>
													&nbsp;&nbsp;<div class= "flex-item" style="margin-top: 5%; width: 340px;">
													<input type="text" name="product_info" value="${myPgOdProdList.pr_name}(${myPgOdProdList.total_num}개)" readonly="readonly" class="single-input-secondary info-attribute">
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
													<span><b>${orderList.order_status_name}</b></span><br>
<!-- 													<span>완료일</span><br> -->
<!-- 													<span>2100.12.30</span> -->
												</div>
											</td>
										</tr>
										</c:forEach>		
									</tbody>									
								</table>
								<br>								
								</c:forEach>
								<!-- 페이징 시작 -->				
								<nav aria-label="Page navigation example">
									<ul class="pagination pagination-md">
										<c:if test="${map.blockFirst != 1}">
											<li class="page-item"><a class="page-link"
												href="${contextPath}/mypage/orderInfo?nowPage=${pagingMap.blockFirst-1}&searchField=${searchField}&keyword=${keyword}"><i
													class="fas fa-angle-left"></i></a></li>
										</c:if>
										<c:forEach begin="${pagingMap.blockFirst}" end="${pagingMap.blockLast}" var="i">
											<li class="page-item">
												<a href="${contextPath}/mypage/orderInfo?nowPage=${i}&searchField=${searchField}&keyword=${keyword}" class="page-link" >${i}</a>
											</li>
										</c:forEach>
										<c:if test="${pagingMap.totalPage != pagingMap.blockLast}">
											<li class="page-item">
												<a class="page-link" href="${contextPath}/mypage/orderInfo?nowPage=${pagingMap.blockLast+1}&searchField=${searchField}&keyword=${keyword}">
													<i	class="fas fa-angle-right"></i>
												</a>
											</li>
										</c:if>
									</ul>
								</nav>
								<!-- 페이징 끝 -->	
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