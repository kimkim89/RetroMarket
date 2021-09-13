<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>상품 상세 페이지</title>
    <%@ include file="./include/Top.jsp" %>

</head>
    
<body>
    <header>
          <!-- Header Start -->
        <jsp:include page="./include/TopNavi.jsp" />
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
                                <h2>Watch Shop</h2>
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
                                <span class="product_count_item inumber-decrement" id="quantity_minus_btn"> <i class="ti-minus"></i></span>
                                <input class="product_count_item input-number" type="text" value="1" min="1" max="999">
                                <span class="product_count_item number-increment" id="quantity_plus_btn"> <i class="ti-plus"></i></span>
                            </div>
                            <p id="prod_price">${productList.mk_product_price}원</p>
                        </div>
	                    <div class="add_to_cart">
	                        <a href="#" class="btn_3">과자바구니 담기</a>
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
	let subPrice = document.getElementById("quantity_minus_btn");
	let addPrice = document.getElementById("quantity_plus_btn");
	var totalCnt = 1;
	
	subPrice.addEventListener("click", function(){
		if(totalCnt == 1) {			
			alert("구매 최소 수량은 1개 입니다.");		
		}else {
			totalCnt--;
		}
	});	
	addPrice.addEventListener("click", function(){
		if(totalCnt == 999) {
			alert(totalCnt);
			alert("구매 최대 수량은 999개 입니다.");		
		}else {
			totalCnt++;
			changePrice();
		}
	});
	
	
	function changePrice() {
		let defaultPrice = document.getElementById('prod_price').innerText;
			currentPrice = defaultPrice.split("원");
			productPrice = parseInt(currentPrice[0]) * totalCnt;
			document.getElementById('prod_price').innerText = productPrice + "원";
			
			console.log("test데이터값: " + parseInt(currentPrice[0]) * totalCnt);
			console.log("currentPrice[0]: " + currentPrice[0]);
			console.log("totalCnt: " + totalCnt);
		/*var sendData = {"currentPrice": currentPrice[0], "totalCnt": totalCnt};
			
		$.ajax({
			type: "POST",
			url: "${contextPath}/product/ajaxProductPrice",
			//async: false,
			data: sendData,
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				alert(data);
				document.getElementById("prod_price").value = data;
			},
			error: function(jqXHR, textStatus, errorThrown) {				
				alert("ERROR: " + textStatus + " : " + errorThrown);
			}
		});	*/
	}

</script> 
    
 
    <footer>
        
    </footer>
    <jsp:include page="./include/Footer.jsp" />

</body>

</html>