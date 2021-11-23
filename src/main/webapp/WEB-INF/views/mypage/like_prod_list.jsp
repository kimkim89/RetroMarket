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

#pr_name {
	font-weight: bold;
}

.od_detail_click {
	color: blue;
}

.btn_like {
	padding: 25px 17px;
	background-color: #2577fd;
	border-radius: 5px;
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
								<h2>찜한 상품 목록</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--? Hero Area End-->
		<!--================Blog Area =================-->
		<section class="blog_area section-padding" style="margin: 0% 7% 0% 8%;">
			<div class="gallery-area">
				<div class="row">
					<jsp:include page="./include/myPageSide.jsp" />
						<div class="col-lg-8 mb-5 mb-lg-0" style="margin-left: 3%;">
							<form name="like_form" id="like_form" action="" method="post" >
								<input type="hidden" name="productId" id="productId" value="" /> 
								<input type="hidden" name="productNum" id="productNum" value="1" />
								<input type="hidden" name="fromPrPg" id="fromPrPg" value="y_like" />
								<table class="table">
									<thead style="background: background: #fbf9ff;">
										<tr align="center">
											<th style="width:45%; text-align: left;">
												찜한 상품
											</th>
											<th class="d-none d-md-table-cell" style="width:20%"></th>
											<th></th>
											<th></th>
										</tr>
									</thead>
										<c:forEach var="myProductList" items="${myLikeProdList}" varStatus="status1">		
											<c:forEach var="myLikeProdList" items="${myProductList}" varStatus="status2">											
										<tbody>																			
											<tr>
												<td style="vertical-align: middle;">
													<div class="flex-container">
														<div class= "flex-item">
															<a href="${contextPath}/product/productDetail?product_id=${myLikeProdList.mk_idx}">
																<img src="${contextPath}/resources/images/temporary/${myLikeProdList.mk_stored_thumb}" style="border: solid lightgray; 1px; width: 110px; height: 110px;"/>
															</a>
														</div>
														&nbsp;&nbsp;
														<div class= "flex-item" style="margin: 5%; width: 380px">
															<a href="${contextPath}/product/productDetail?product_id=${myLikeProdList.mk_idx}">
																<input type="text" name="pr_name" id="pr_name" class="single-input-secondary info-attribute" value="${myLikeProdList.mk_product_name}" >
															</a>
														</div>
													</div>												
												</td>
												<td align="center" class="d-none d-md-table-cell" style="vertical-align: middle;">
													<div>
														<p><b style="color: #dc1c87;;"><fmt:formatNumber value="${myLikeProdList.mk_product_price}" pattern="#,###"/>원</b></p>
													</div>
												</td>
												<td align="center" class="table-action" style="vertical-align: middle;">
													<div>
														<button class="btn btn_like" onclick="deleteLikeProduct('${myLikeProdList.mk_idx}');">삭제</button>
													</div>
												</td>
												<td align="center" class="table-action" style="vertical-align: middle;">
													<div>
														<button class="btn btn_like" onclick="addToCart('${myLikeProdList.mk_idx}');">장바구니</button>
													</div>
												</td>
											</tr>
											</c:forEach>
										</c:forEach>
									</tbody>									
								</table>
								<hr>
								<br>								
								<!-- 페이징 시작 -->				
								<nav aria-label="Page navigation example">
									<ul class="pagination pagination-md">
										<c:if test="${pagingMap.blockFirst != 1}">
											<li class="page-item"><a class="page-link"
												href="${contextPath}/mypage/likeProd?nowPage=${pagingMap.blockFirst-1}"><i
													class="fas fa-angle-left"></i></a></li>
										</c:if>
										<c:forEach begin="${pagingMap.blockFirst}" end="${pagingMap.blockLast}" var="i">
											<li class="page-item">
												<a href="${contextPath}/mypage/likeProd?nowPage=${i}" class="page-link" >${i}</a>
											</li>
										</c:forEach>
										<c:if test="${pagingMap.totalPage != pagingMap.blockLast}">
											<li class="page-item">
												<a class="page-link" href="${contextPath}/mypage/likeProd?nowPage=${pagingMap.blockLast+1}">
													<i	class="fas fa-angle-right"></i>
												</a>
											</li>
										</c:if>
									</ul>
								</nav>
								<!-- 페이징 끝 -->
							</form>									
						</div>
					</div>
				</div>
		</section>
		
		
		<script type="text/javascript">
		
			function deleteLikeProduct(productId) {
					document.getElementById("productId").value = productId;
					document.getElementById("like_form").action = "${contextPath}/mypage/deleteLikeProd";
					document.getElementById("like_form").submit();
			}
			
			function addToCart(productId) {
				document.getElementById("productId").value = productId;
				document.getElementById("like_form").action = "${contextPath}/cart/prCart";
				document.getElementById("like_form").submit();
			}
		
		</script>
		
		<!--================Blog Area =================-->	
	</main>

	<jsp:include page="../include/Footer.jsp" />
</body>
</html>