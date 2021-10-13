<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>장바구니</title>
  <%@ include file="../include/Top.jsp" %>
  
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
  
  <style>
  	.delete_box {
  		vertical-align: top !important;
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
                    <th scope="col">총액</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="cartList" items="${cartList}" varStatus="status">
                  <tr>          	
                    <td>
                      <div class="media">  
                      <input type="checkbox" class="delete_box" name="del_check" id="del_check${status.index}" value="${cartList.cart_idx}" />                    	
                        <div class="d-flex">
                          <img src="${contextPath}/resources/images/temporary/${cartList.mk_stored_thumb}" alt="" />
                        </div>
                        <div class="media-body">
                          <p>${cartList.mk_product_name}</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <h5 name="product_price" id="product_price${status.index}">${cartList.mk_product_price}</h5>
                    </td>
                    <td>
                      <div class="product_count" id="product_count${status.index}">
                        <span class="input-number-decrement" name="minus_btn${status.index}" id="minus_btn${status.index}" onclick="changePrice('minus_btn${status.index}', ${status.index}, '${cartList.total_num}', 'product_num${status.index}', 'minus', 'product_price${status.index}')">
                        	<i class="ti-minus"></i>
                        </span>
                        <input class="" id="product_num${status.index}" type="text" value="${cartList.total_num}" min="0" max="10">
                        <span class="input-number-increment" name="plus_btn${status.index}" id="plus_btn${status.index}" onclick="changePrice('plus_btn${status.index}', ${status.index}, '${cartList.total_num}', 'product_num${status.index}', 'plus', 'product_price${status.index}')">
                        	<i class="ti-plus"></i>
                        </span>
                      </div>
                    </td>
                    <td>
                      <h5 name="product_total" id="product_total${status.index}"></h5>
                    </td>
                  </tr>
                 </c:forEach>
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
                  <tr class="bottom_button">
                    <td>
                      <a class="btn_1" href="javascript:chooseAllProd();">전체선택</a>	
                    </td>
                    <td></td>
                    <td>                    	
                    </td>
                    <td>
                      <div class="cupon_text float-right">
                        <a class="btn_1" href="javascript:deleteProd();">선택삭제</a>
                      </div>
                    </td>
                  </tr>

                </tbody>
              </table>
              <div class="checkout_btn_inner float-right">	
    	        <a class="btn_1" href="javascript:deleteAllProd();">선택상품주문</a>
                <a class="btn_1 checkout_btn_1" href="${contextPath}/buy/buyPage">전체상품주문</a>
              </div>
            </div>
          </div>
          </div>
      </section>
      <!--================End Cart Area =================-->
  </main>
  
  
  <script type="text/javascript">
	//상품수량변경 ---> test중
	function changePrice(nameType, tagNumber, totalNumber, inputId, keyType, prPrice) {
		
		let totalCnt = Number(totalNumber);
		let buttonName = "";
		let quantityCode = "";
		let productNumValue = document.getElementById(inputId).value;
		let prodPrice = document.getElementById(prPrice).innerText; 		
		var epTotalPrice = 0;
		var prTotalPrice = document.getElementById("total_price").innerText;
			prTotalPrice = Number(prTotalPrice);
			

		//alert(eachTotalPrice);
		

		if(keyType == "plus") {
			if(totalCnt >= 999) {
				//alert(totalCnt);
				alert("구매 최대 수량은 999개 입니다.");	
				
			}else {
				totalCnt++;					
				productNumValue = totalCnt;
				
				//개별 상품 * 수량 총액
				epTotalPrice = prodPrice * totalCnt;
				
				//장바구니 모든 상품 총액
				prTotalPrice += epTotalPrice;
				
				//onclick plus
				onclickPlusFunc = "changePrice(" + "'" + nameType + "', " + tagNumber + ", " + totalCnt + ", '" + inputId + "' , " + "'"  +  keyType + "', '" + prPrice + "'" + ")";
				//onclick minus
				onclickMinusFunc = "changePrice(" + "'" + nameType + "', " + tagNumber + ", " + totalCnt + ", '" + inputId + "', 'minus', '" + prPrice + "'" + ")";
								
				buttonName = "minus" + tagNumber;
				
				//onclick 클릭 시 해당 코드로 변경되도록 작업				
				quantityCode = '<span class="input-number-decrement" name="'+ buttonName + '" id="' + buttonName + '" onclick="' + onclickMinusFunc + '">';
				quantityCode += '<i class="ti-minus"></i></span>';
				quantityCode += '<input class="" id="' + inputId + '" type="text" value="' + totalCnt + '" min="0" max="10">';
				quantityCode += '<span class="input-number-increment" name="'+ nameType + '" id="' + nameType + '" onclick="' + onclickPlusFunc + '">';
				quantityCode += '<i class="ti-plus"></i></span>';
			
				document.getElementById("product_total" + tagNumber).innerText = epTotalPrice;
				document.getElementById("total_price").innerText = prTotalPrice;
				document.getElementById("product_count" + tagNumber).innerHTML = quantityCode;
				
			}		
			
		}else if(keyType == "minus") {				
			if(totalCnt <= 1) {
				alert("구매 최소 수량은 1개 입니다.");		
			}else {
				totalCnt--;
				productNumValue = totalCnt;
				
				//개별 상품 * 수량 총액
				epTotalPrice = prodPrice * totalCnt;
				
				//장바구니 모든 상품 총액
				prTotalPrice += epTotalPrice;
				
				//onclick minus
				onclickMinusFunc = "changePrice(" + "'" + nameType + "', " + tagNumber + ", " + totalCnt + ", '" + inputId + "' , " + "'"  +  keyType + "', '" + prPrice + "'" + ")";
				//onclick plus
				onclickPlusFunc = "changePrice(" + "'" + nameType + "', " + tagNumber + ", " + totalCnt + ", '" + inputId + "', 'plus', '" + prPrice + "'" + ")";
						
				buttonName = "plus" + tagNumber;
				
				//onclick 속성값
				onclickFunc = "changePrice(" + nameType + ", " + tagNumber + ", " + totalCnt + ", " + inputId + ", " + keyType + ")";
				
				//onclick 클릭 시 해당 코드로 변경되도록 작업				
				quantityCode = '<span class="input-number-decrement" name="'+ nameType + '" id="' + nameType + '" onclick="' + onclickMinusFunc + '">';
				quantityCode += '<i class="ti-minus"></i></span>';
				quantityCode += '<input class="" id="' + inputId + '" type="text" value="' + totalCnt + '" min="0" max="10">';
				quantityCode += '<span class="input-number-increment" name="'+ buttonName + '" id="' + buttonName + '" onclick="' + onclickPlusFunc + '">';
				quantityCode += '<i class="ti-plus"></i></span>';
				
				document.getElementById("product_total" + tagNumber).innerText = epTotalPrice;
				document.getElementById("total_price").innerText = prTotalPrice;
				document.getElementById("product_count" + tagNumber).innerHTML = quantityCode;
		
			}
		}//onclick함수에서 plus/minus값 넘어오는지 확인하는 if문 끝
		
	}//changePrice()함수 끝

	
	/*전체선택 시작*/
	let clickCnt = 1;
		
	function chooseAllProd() {
			
		let delChkBoxArray = document.getElementsByName("del_check");
		
		clickCnt++;
			
			if(clickCnt%2 == 0) {
				for(var j=0; j<delChkBoxArray.length; j++) {
					document.getElementsByName("del_check")[j].checked = true;
				}
			}else {
				for(var j=0; j<delChkBoxArray.length; j++) {
					document.getElementsByName("del_check")[j].checked = false;
				}
			}			
	}//chooseAllProd()함수 끝
	
	
	/*선택삭제 기능 시작*/
	function deleteProd() {
		var checkedArray = [];
		
		alert("선택한 상품을 삭제하시겠습니까?");
		
		$("input:checkbox[name='del_check']:checked").each(function() {
			checkedArray.push($(this).val()); // 체크된 것 value만 배열에 push			
		})
		
		console.log(checkedArray);
		
		$.ajax({
			type : "POST",
			url : "${contextPath}/cart/delEachCartProd",
			data : {"checkedArray" : checkedArray},			
			success: function(data) {
				alert(data);
				location.href = location.href;
			},
			error: function(xhr, status, error) {
				alert(error);
			}
		});//ajax끝
		
	}//deleteEachProd()함수 끝
	
	
	
	
  </script>
  
  <footer>
      
  </footer>
   <jsp:include page="../include/Footer.jsp" />

</body>
</html>