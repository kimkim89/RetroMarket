<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	    background-color: white;
	    border: 3px solid red;
	    font-weight: bold;   
	}
	
	.btn_share {
		float: left;
		border: 3px solid;
	}
	
	.product_img {
		display: block;
    	margin: auto;
    	height: 340px;
	}
	
	.owl-carousel .owl-item img {
		width: 50%;
	}
	</style>
    
    
    <script type="text/javascript">
    $(document).ready(function() {
   		if(document.getElementById("btn_like").innerText == "찜취소") {
   			document.getElementById("btn_like").style.borderColor = "red";
   			document.getElementById("btn_like").style.color = "red";
   			document.getElementById("btn_like").style.fontWeight = "bold";
    	}			
    });
    </script>
</head>
<body>

    <header>
          <!-- Header Start -->
        <jsp:include page="../include/TopNavi.jsp" />
        <!-- Header End -->
    </header>
    <main>
        <!--=============== Subtitle 시작 ================-->
		<jsp:include page="../include/product_subtitle.jsp" />
		<!--=============== Subtitle 끝 ================-->
        <!--================Single Product Area =================-->
        <c:forEach var="productList" items="${productList}">
        <div class="product_image_area">
            <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                <div class="product_img_slide owl-carousel">
                <c:forEach var="prodImgList" items="${prodImgList}" varStatus="status">
                    <div class="single_product_img">
                        <img src="${contextPath}/resources/images/temporary/${prodImgList}" alt="#" class="img-fluid product_img">
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
	                    <div class="add_to_cart" style="margin-left: 30%;">
	                    	<form name="productForm" method="post" action="${contextPath}/cart/prCart">
	                    		<input type="hidden" name="productId" value="${productList.mk_idx}" />
	                    		<input type="hidden" name="productNum" id="productNum" value="1" />	
	                    		<input type="hidden" name="fromPrPg" id="fromPrPg" value="Y" />
	                    		<input type="hidden" name="invCnt" id="invCnt" value="${productList.mk_inventory}" /> 	                    	  
	                    		<input type="submit" class="btn_3 ${prBtnClassName} btn_share" ${prBtnBlock} value="${prBtnName}" />	
	                    	</form>
	                    	<!-- 찜 기능 추가 -->
	                    	<a href="javascript:likeProduct('${productList.mk_idx}');" class="btn_3 btn_share btn_like" id="btn_like" style="margin-left: 5%;">${dupLikeBtb}</a>	                        
	                    </div>
                    </div>
                    <br><br><br>
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
	let checkInvVal = document.getElementById("invCnt").value;

	//상품 수량, 가격 변경
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
															
					if(checkInvVal < totalCnt ) {// 선택한 수량이 재고량 보다 많을 경우 알림
						alert("현재 남은 수량은 " + checkInvVal + "개 입니다.");
						totalCnt--;
					}
				}
			}
			//alert(totalCnt);
			
			if(totalCnt >= 1 && totalCnt <= 50) {
			
				var productPrice = Number(parseInt(currentPrice[0])) * Number(totalCnt);
				document.getElementById('product_quantity').value = totalCnt;
				document.getElementById('prod_price').innerText = productPrice + "원";
				document.getElementById('productNum').value = totalCnt;
			}
	}
	
	//좋아요(찜하기) 기능 추가
	function likeProduct(productIndex) {
		
		 $.ajax({
				type: "post",
				url: "${contextPath}/product/ajaxLikeProduct",
				async: false,
				data: {"productIndex" : productIndex},
				success: function(data) {
					//alert(data);
					var successMsg = "";
					
					if(data == 1) {
						successMsg = "찜한 상품에 저장되었습니다.";
						location.reload();
					}else if(data == 2) {
						successMsg = "로그인 후 이용하실 수 있습니다.";
						location.href = "${contextPath}/member/login";
					}else {						
						successMsg = "취소되었습니다.";
						location.reload();
					}					
						alert(successMsg);							

				},//success function 끝 
				error: function(jqXHR, textStatus, errorThrown) {    					
					alert("ERROR: " + textStatus + " : " + errorThrown);
				}	
			});	
	}

</script> 

    <jsp:include page="../include/Footer.jsp" />

</body>
</html>