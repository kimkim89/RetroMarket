<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>상품 상세 페이지</title>
    <%@ include file="../include/Top.jsp" %>
    
    <style type="text/css">
	.outStock {
		color: red;
	    background-color: lightgray;
	    border: 3px solid #2577fd;
	    font-weight: bold;   
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
        <!-- Hero Area Start-->
        <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>상품 상세보기</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Area End-->
        <!--================Single Product Area =================-->
        <c:forEach var="productList" items="${productList}">
        <div class="product_image_area">
            <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                <div class="product_img_slide owl-carousel">
                <c:forEach var="prodImgList" items="${prodImgList}" varStatus="status">
                    <div class="single_product_img">
                        <img src="${contextPath}/resources/images/temporary/${prodImgList}" alt="#" class="img-fluid">
                    </div>
                </c:forEach>
                </div>
                </div>
                <div class="col-lg-8">
                <div class="single_product_text text-center">
                    <h3>${productList.mk_product_name}</h3>
                    <div class="card_area">
                        <div class="product_count_area">
                            <p>수량</p>
                            <div class="product_count d-inline-block">
                                <span class="product_count_item inumber-decrement" id="quantity_minus_btn" onclick="changePrice('minus');"> <i class="ti-minus"></i></span>
                                <input class="product_count_item input-number" id="product_quantity" type="text" value="1" min="1" max="999">
                                <span class="product_count_item number-increment" id="quantity_plus_btn" onclick="changePrice('plus');"> <i class="ti-plus"></i></span>
                            </div>
                            <p id="prod_price">${productList.mk_product_price}원</p>
                        </div>
	                    <div class="add_to_cart">
	                    	<form name="productForm" method="post" action="${contextPath}/cart/prCart">
	                    		<input type="hidden" name="productId" value="${productList.mk_idx}" />
	                    		<input type="hidden" name="productNum" id="productNum" value="1" />	
	                    		<input type="hidden" name="fromPrPg" id="fromPrPg" value="Y" />
	                    		<input type="hidden" name="invCnt" id="invCnt" value="${productList.mk_inventory}" /> 	                    	  
	                    		<input type="submit" class="btn_3 ${prBtnClassName}" ${prBtnBlock} value="${prBtnName}" />	
	                    	</form>	                        
	                    </div>
                    </div>
                    <p>
                    	${productList.mk_content}
                    </p>                    
                </div>
                </div>
            </div>
            </div>
        </div>
        </c:forEach>
        
    </main>
    
    
        
<script>
	let defaultPrice = document.getElementById('prod_price').innerText;
	let	currentPrice = defaultPrice.split("원");
	var totalCnt = document.getElementById('product_quantity').value;

		
	function changePrice(msg) {
											
			if(msg == "minus") {
				if(totalCnt <= 1) {			
					alert("구매 최소 수량은 1개 입니다.");
					return false;
				}else {
					totalCnt--;									
				}
			}else if(msg == "plus") {
				if(totalCnt >= 50) {
					alert(totalCnt);
					alert("구매 최대 수량은 50개 입니다.");	
					return false;
				}else {
					totalCnt++;					
				}
			}
			alert(totalCnt);
			if(totalCnt >= 1 && totalCnt <= 50) {
				
				let checkInvVal = document.getElementById("invCnt").value;
				
				if(checkInvVal < totalCnt ) {// 선택한 수량이 재고량 보다 많을 경우 알림
					alert("현재 남은 수량은 " + checkInvVal + "개 입니다.");					
				}else {
					var productPrice = Number(parseInt(currentPrice[0])) * Number(totalCnt);
					document.getElementById('product_quantity').value = totalCnt;
					document.getElementById('prod_price').innerText = productPrice + "원";
					document.getElementById('productNum').value = totalCnt;
				}
				
				
			}
	}
	
</script> 
    
 
    <footer>
        
    </footer>
    <jsp:include page="../include/Footer.jsp" />

</body>

</html>