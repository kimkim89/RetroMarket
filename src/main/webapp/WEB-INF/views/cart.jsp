<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>장바구니</title>
  <%@ include file="./include/Top.jsp" %>
  
  <script type="text/javascript">
	//알림 메시지
	if("${msg}" != "") {
	 	alert("${msg}");
	 	location.href='${contextPath}/' + '${locationUrl}';
	 }
	
	
	//상품별 총 금액 작업
	let productPriceArray = document.getElementsByName("product_price");	 
	let productTotalPrice = document.getElementsByName("product_total");
	let eachProdPrice = 100;
	let finalTotalPrice = 0;


	$(document).ready(function() {		
		calculateEachProduct();				
	});
	
	
	//상품별 금액 계산
	function calculateEachProduct() {
		
		for(var i=0; i<productPriceArray.length; i++) {
					
			let productNumName = "product_num" + i;
			let productNum = document.getElementById(productNumName).value;
			
			let productPrice = parseInt(productPriceArray[i].innerText);
		
			eachProdPrice = productPrice * productNum;
			productTotalPrice[i].innerText = eachProdPrice;
			
			finalTotalPrice += eachProdPrice;
			//document.write(typeof prodPrice);
		}
			document.getElementById("total_price").innerText = finalTotalPrice;	
	}
	
	
	
	
	
  </script>
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
                              <h2>과자 바구니</h2>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <!--================Cart Area =================-->
      <section class="cart_area section_padding">
        <div class="container" style="max-width: 110%;">
          <div class="cart_inner">
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">상품</th>
                    <th scope="col">가격</th>
                    <th scope="col">수량</th>
                    <th scope="col">총 가격</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="cartList" items="${cartList}" varStatus="status">
                  <tr>
                    <td>
                      <div class="media">
                        <div class="d-flex">
                          <img src="${contextPath}/resources/images/temporary/${cartList.mk_stored_thumb}" alt="" />
                        </div>
                        <div class="media-body">
                          <p>${cartList.mk_product_name}</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <h5 name="product_price">${cartList.mk_product_price}</h5>
                    </td>
                    <td>
                      <div class="product_count" id="product_count">
<%--                       	<span class="input-number-decrement" name="minus_btn${status.index}" onclick="changePrice('minus_btn${status.index}', this);"> <i class="ti-minus"></i></span> --%>
<%--                         <input type="text" class="" name="product_num${status.index}" id="product_num${status.index}" value="${cartList.total_num}" min="0" max="10" readonly> --%>
<%--                         <span class="input-number-increment" name="plus_btn${status.index}" onclick="changePrice('plus_btn${status.index}', this);"> <i class="ti-plus"></i></span> --%>
                        <span class="input-number-decrement" name="minus_btn${status.index}" id="minus_btn${status.index}" onclick="changePrice('minus_btn${status.index}', ${status.index}, '${cartList.total_num}', 'product_num${status.index}')">
                        	<i class="ti-minus"></i>
                        </span>
                        <input class="" id="product_num${status.index}" type="text" value="${cartList.total_num}" min="0" max="10">
                        <span class="input-number-increment" name="plus_btn${status.index}" id="plus_btn${status.index}" onclick="changePrice('plus_btn${status.index}', ${status.index}, '${cartList.total_num}', 'product_num${status.index}')">
                        	<i class="ti-plus"></i>
                        </span>
                      </div>
                    </td>
                    <td>
                      <h5 name="product_total"></h5>
                    </td>
                  </tr>
                  </c:forEach>
                  <tr class="bottom_button">
                    <td>
                      <a class="btn_1" href="#">Update Cart</a>
                    </td>
                    <td></td>
                    <td></td>
                    <td>
                      <div class="cupon_text float-right">
                        <a class="btn_1" href="#">Close Coupon</a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td></td>
                    <td>
                      <h5>총 상품금액</h5>
                    </td>
                    <td>
                      <h5 id="total_price"></h5>
                    </td>
                  </tr>
                  <tr class="shipping_area">
                    <td></td>
                    <td></td>
                    <td>
                      <h5>Shipping</h5>
                    </td>
                    <td>
                      <div class="shipping_box">
                        <ul class="list">
                          <li>
                            Flat Rate: $5.00
                            <input type="radio" aria-label="Radio button for following text input">
                          </li>
                          <li>
                            Free Shipping
                            <input type="radio" aria-label="Radio button for following text input">
                          </li>
                          <li>
                            Flat Rate: $10.00
                            <input type="radio" aria-label="Radio button for following text input">
                          </li>
                          <li class="active">
                            Local Delivery: $2.00
                            <input type="radio" aria-label="Radio button for following text input">
                          </li>
                        </ul>
                        <h6>
                          Calculate Shipping
                          <i class="fa fa-caret-down" aria-hidden="true"></i>
                        </h6>
                        <select class="shipping_select">
                          <option value="1">Bangladesh</option>
                          <option value="2">India</option>
                          <option value="4">Pakistan</option>
                        </select>
                        <select class="shipping_select section_bg">
                          <option value="1">Select a State</option>
                          <option value="2">Select a State</option>
                          <option value="4">Select a State</option>
                        </select>
                        <input class="post_code" type="text" placeholder="Postcode/Zipcode" />
                        <a class="btn_1" href="#">Update Details</a>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div class="checkout_btn_inner float-right">
                <a class="btn_1" href="#">과자 계속 담기</a>
                <a class="btn_1 checkout_btn_1" href="${contextPath}/buy/buyPage">구매 하기</a>
              </div>
            </div>
          </div>
          </div>
      </section>
      <!--================End Cart Area =================-->
  </main>
  
  
  <script type="text/javascript">
	//상품수량변경 ---> test중
	function changePrice(nameType, tagNumber, totalNumber, inputId) {
		
		let totalCnt = Number(totalNumber);
		
		let productNumName = "product_num" + tagNumber;
		let productNumValue = document.getElementById(productNumName).value;
		let buttonName = "";
		
		var nameType = nameType.toString();
		var quantityCode = "";
		//onclick 속성값
		var onclickFunc = "changePrice(" + nameType + ", " + tagNumber + ", " + totalNumber + ", " + inputId + ")";
		
		
		
//console.log();	
//console.log(nameType);

console.log("test중: " + nameType);
		if(nameType.indexOf('plus') != -1) {
			
			if(totalCnt >= 999) {
				//alert(totalCnt);
				alert("구매 최대 수량은 999개 입니다.");						
			}else {
				totalCnt++;	
				productNumValue = totalCnt;
				
				buttonName = "minus" + tagNumber;
				
				//onclick 클릭 시 해당 코드로 변경되도록 작업				
				quantityCode = '<span class="input-number-decrement" name="'+ buttonName + '" id="' + buttonName + '" onclick="' + onclickFunc + '">';
				quantityCode += '<i class="ti-minus"></i></span>';
				quantityCode += '<input class="" id="' + inputId + '" type="text" value="' + totalCnt + '" min="0" max="10">';
				quantityCode += '<span class="input-number-increment" name="'+ nameType + '" id="' + nameType + '" onclick="' + onclickFunc + '">';
				quantityCode += '<i class="ti-plus"></i></span>';
			
				document.getElementById("product_count").innerHTML = quantityCode;

				//alert("productNumValue확인++: " + productNumValue);				
				
				
			}				
		}else if(nameType.indexOf('minus') != -1) {				
			if(totalCnt < 1) {
				alert("구매 최소 수량은 1개 입니다.");		
			}else {
				totalCnt--;
				productNumValue = totalCnt;
												
				buttonName = "plus" + tagNumber;
				
				//onclick 클릭 시 해당 코드로 변경되도록 작업				
				quantityCode = '<span class="input-number-decrement" name="'+ nameType + '" id="' + nameType + '" onclick="' + onclickFunc + '">';
				quantityCode += '<i class="ti-minus"></i></span>';
				quantityCode += '<input class="" id="' + inputId + '" type="text" value="' + totalCnt + '" min="0" max="10">';
				quantityCode += '<span class="input-number-increment" name="'+ buttonName + '" id="' + buttonName + '" onclick="' + onclickFunc + '">';
				quantityCode += '<i class="ti-plus"></i></span>';
									
				document.getElementById("product_count").innerHTML = quantityCode;
	
				//console.log(quantityCode);
				
				//alert("productNumValue확인--: " + productNumValue);				
				
			}
		}//onclick함수에서 plus/minus값 넘어오는지 확인하는 if문 끝
		
	}//changePrice()함수 끝

	  
  </script>
  
  <footer>
      
  </footer>
   <jsp:include page="./include/Footer.jsp" />

</body>
</html>