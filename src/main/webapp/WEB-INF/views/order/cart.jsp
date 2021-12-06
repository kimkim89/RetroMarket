<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>장바구니</title>
  <%@ include file="../include/Top.jsp" %>
  
  <style type="text/css">
  	.img_size_class {
  		width: 150px;
    	height: 102px;
  	}
  </style>
  
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
		
		var chkInvStatArr = document.getElementsByName("checkInvStatus") 
		var prTrId = "";
		var delChkId = "";
		var plusBtnId = "";
		var minusBtnId = "";
		var chkInvIndexArr = [];
		
		for(var i=0; i<productPriceArray.length; i++) {
					
			let productNumName = "product_num" + i;
			let productNum = document.getElementById(productNumName).value;
			
			let productPrice = parseInt(productPriceArray[i].innerText);
		
			eachProdPrice = productPrice * productNum;
			productTotalPrice[i].innerText = eachProdPrice;
			
			
			//상품 품절일 경우 
			if(chkInvStatArr[i].value.indexOf("none") != -1 ) {
				chkInvIndexArr = chkInvStatArr[i].value.split("none");
				prTrId = "pr_tr" + chkInvIndexArr[1];
				delChkId = "del_check" + chkInvIndexArr[1];
				plusBtnId = "plus_btn" + chkInvIndexArr[1];
				minusBtnId = "minus_btn" + chkInvIndexArr[1];
				
				document.getElementById(prTrId).style.opacity = "0.3";				
				document.getElementById(delChkId).disabled = true;
				document.getElementById(plusBtnId).removeAttribute("onclick");
				document.getElementById(minusBtnId).removeAttribute("onclick");
				
			}else {
				finalTotalPrice += eachProdPrice;
				//document.write(typeof prodPrice);
				
			}
			
		}
			document.getElementById("total_price").innerText = finalTotalPrice;	
	}
	
			
  </script>
  
  <style>
  	.delete_box {
  		vertical-align: top !important;
  	}
  	
  	.prCheckColor {
  		color: red;
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
                              <h2>과자 바구니</h2>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <!--================Cart Area =================-->
      <section class="cart_area section_padding" style="padding: 125px 0px;">
      <form name="cart_form" id="cart_form" method="post">
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
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach var="cartList" items="${cartList}" varStatus="status">
                <input type="hidden" name="inventoryCnt" value="${cartList.mk_inventory }" /> 
                
                <c:choose>
                	<c:when test="${cartList.mk_inventory < 1}">
                		<c:set var="quantityMsg" value=" [품절]" /> 
                		<c:set var="prCheckColor" value="prCheckColor" /> 
                		<c:set var="checkInvStatus" value="none" />              		
                	</c:when>
                	<c:when test="${cartList.mk_inventory < cartList.total_num}">
<%--                 		<c:set var="quantityMsg" value=" 현재 구매 가능한 수량은  ${cartList.mk_inventory}개 입니다." />  --%>
                		<c:set var="prCheckColor" value="prCheckColor" />
                		<c:set var="checkInvStatus" value="few" />               		
                	</c:when>
                </c:choose>
                <input type="hidden" name="checkInvStatus" id="checkInvStatus" value="${checkInvStatus}${status.index}" />
                  <tr id="pr_tr${status.index}" name="pr_tr">          	
                    <td>
                      <div class="media">
                      <input type="hidden" name="cart_index" id="cart_index" value="${cartList.cart_idx}" />  
                      <input type="hidden" name="selected_index" id="selected_index" value="" />
                      <input type="checkbox" class="delete_box" name="del_check" id="del_check${status.index}" value="${cartList.cart_idx}" />                    	
                        <div class="d-flex">
                        
                        <c:choose>
                        	<c:when test="${cartList.mk_product_category == 1}">
                        		<c:set var="prCode" value="snack"></c:set>
                        	</c:when>
                        	<c:when test="${cartList.mk_product_category == 2}">
                        		<c:set var="prCode" value="jellycandy"></c:set>
                        	</c:when>
                        	<c:when test="${cartList.mk_product_category == 3}">
                        		<c:set var="prCode" value="etc"></c:set>
                        	</c:when>
                        </c:choose>
                        
                          <a href="${contextPath}/product/productDetail?prCode=${prCode}&product_id=${cartList.pr_idx}" >
                          	<img src="${contextPath}/resources/images/temporary/${cartList.mk_stored_thumb}" class="img_size_class" alt=""/>
                          </a>
                        </div>
                        <div class="media-body">
                          <a href="${contextPath}/product/productDetail?prCode=${prCode}&product_id=${cartList.pr_idx}" >
                          	<p>${cartList.mk_product_name}
                          		<span class="${prCheckColor}" id="pr_font_color">${quantityMsg}</span>
                          	</p>
                          </a>                          
<%--                           <c:if test="${fn:indexOf(quantityMsg,'품절') != -1}"> --%>
<%--                           	<a href="javascript:deleteProd('${cartList.cart_idx}');"><span class="${prCheckColor}" id="pr_font_color">삭제</span></a> --%>
<%--                           </c:if> --%>
                        </div>
                      </div>
                    </td>                    
                    <td>
                      <h5 name="product_price" id="product_price${status.index}">${cartList.mk_product_price}</h5>
                    </td>
                    <td>
                      <div class="product_count" id="product_count${status.index}">
                        <span class="input-number-decrement" name="minus_btn${status.index}" id="minus_btn${status.index}" onclick="changePrice('minus_btn${status.index}', ${status.index}, '${cartList.total_num}', 'product_num${status.index}', 'minus', 'product_price${status.index}', '${cartList.cart_idx}', '${cartList.mk_inventory}')">
                        	<i class="ti-minus"></i>
                        </span>
                        <input class="" name="product_num" id="product_num${status.index}" type="text" value="${cartList.total_num}" min="0" max="10" readonly>
                        <span class="input-number-increment" name="plus_btn${status.index}" id="plus_btn${status.index}" onclick="changePrice('plus_btn${status.index}', ${status.index}, '${cartList.total_num}', 'product_num${status.index}', 'plus', 'product_price${status.index}', '${cartList.cart_idx}', '${cartList.mk_inventory}')">
                        	<i class="ti-plus"></i>
                        </span>
                      </div>
                    </td>
                    <td>
                      <h5 name="product_total" id="product_total${status.index}"></h5>
                    </td>
                    <td style="border-bottom: 1px solid #dee2e6;">
                    <c:choose>
                    <c:when test="${fn:indexOf(quantityMsg,'품절') != -1}">                    
                      	<a href="javascript:deleteProd('${cartList.cart_idx}');"><span class="${prCheckColor}" id="pr_font_color">삭제</span></a>
                    </c:when>
                    <c:otherwise>
                      	<a href="javascript:deleteProd('${cartList.cart_idx}');"><span class="${prCheckColor}" id="pr_font_color"></span></a>
				    </c:otherwise>
                    </c:choose>
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
                    <td style="border-bottom: 1px solid #dee2e6;">
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
    	        <a class="btn_1" href="javascript:orderProds('selected');">선택상품주문</a>
                <a class="btn_1 checkout_btn_1" href="javascript:orderProds('all');">전체상품주문</a>
              </div>            
            </div>
          </div>
          </div>
      </form>
      </section>
      <!--================End Cart Area =================-->
  </main>
  
  
  <script type="text/javascript">
	//상품수량변경
	function changePrice(nameType, tagNumber, totalNumber, inputId, keyType, prPrice, cartIndex, currentInv) {
		
		let totalCnt = Number(totalNumber);
		let buttonName = "";
		let quantityCode = "";
		let productNumValue = document.getElementById(inputId).value;
		let prodPrice = Number(document.getElementById(prPrice).innerText); 		
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
				
				//장바구니 수량  > 상품 재고량 
				if(productNumValue > currentInv) { //장바구니 수량이 상품 재고량보다 클 때
					alert("현재 남은 수량은 " + currentInv + "개 입니다.");
					return false;
				}else { //장바구니 수량이 상품 재고량과 같거나 작을 때

					//개별 상품 * 수량 총액
					epTotalPrice = prodPrice * totalCnt;
					
					//장바구니 모든 상품 총액
					prTotalPrice += prodPrice;
					
					//onclick plus
					onclickPlusFunc = "changePrice(" + "'" + nameType + "', " + tagNumber + ", " + totalCnt + ", '" + inputId + "' , " + "'"  +  keyType + "', '" + prPrice + "', '" + cartIndex + "', '"  + currentInv + "')";
					//onclick minus
					onclickMinusFunc = "changePrice(" + "'" + nameType + "', " + tagNumber + ", " + totalCnt + ", '" + inputId + "', 'minus', '" + prPrice + "', '" + cartIndex  + "', '"  + currentInv + "')";
									
					buttonName = "minus" + tagNumber;
					
					//onclick 클릭 시 해당 코드로 변경되도록 작업				
					quantityCode = '<span class="input-number-decrement" name="'+ buttonName + '" id="' + buttonName + '" onclick="' + onclickMinusFunc + '">';
					quantityCode += '<i class="ti-minus"></i></span>';
					quantityCode += '<input class="" name="product_num" id="' + inputId + '" type="text" value="' + totalCnt + '" min="0" max="10" readonly>';
					quantityCode += '<span class="input-number-increment" name="'+ nameType + '" id="' + nameType + '" onclick="' + onclickPlusFunc + '">';
					quantityCode += '<i class="ti-plus"></i></span>';
				
					document.getElementById("product_total" + tagNumber).innerText = epTotalPrice;
					document.getElementById("total_price").innerText = prTotalPrice;
					document.getElementById("product_count" + tagNumber).innerHTML = quantityCode;
					
					//상품 수량 변경 시 장바구니 테이블 데이터 수정
					changeCartData(totalCnt, cartIndex);
				}
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
				prTotalPrice -= prodPrice;
				
				//onclick minus
				onclickMinusFunc = "changePrice(" + "'" + nameType + "', " + tagNumber + ", " + totalCnt + ", '" + inputId + "' , " + "'"  +  keyType + "', '" + prPrice + "', '" + cartIndex  + "', '"  + currentInv + "')";
				//onclick plus
				onclickPlusFunc = "changePrice(" + "'" + nameType + "', " + tagNumber + ", " + totalCnt + ", '" + inputId + "', 'plus', '" + prPrice + "', '" + cartIndex  + "', '"  + currentInv + "')";
						
				buttonName = "plus" + tagNumber;
				
				//onclick 속성값
				onclickFunc = "changePrice(" + nameType + ", " + tagNumber + ", " + totalCnt + ", " + inputId + ", " + keyType + ")";
				
				//onclick 클릭 시 해당 코드로 변경되도록 작업				
				quantityCode = '<span class="input-number-decrement" name="'+ nameType + '" id="' + nameType + '" onclick="' + onclickMinusFunc + '">';
				quantityCode += '<i class="ti-minus"></i></span>';
				quantityCode += '<input class="" name="product_num" id="' + inputId + '" type="text" value="' + totalCnt + '" min="0" max="10" readonly>';
				quantityCode += '<span class="input-number-increment" name="'+ buttonName + '" id="' + buttonName + '" onclick="' + onclickPlusFunc + '">';
				quantityCode += '<i class="ti-plus"></i></span>';
				
				document.getElementById("product_total" + tagNumber).innerText = epTotalPrice;
				document.getElementById("total_price").innerText = prTotalPrice;
				document.getElementById("product_count" + tagNumber).innerHTML = quantityCode;
				
								
				//상품 수량 변경 시 장바구니 테이블 데이터 수정
				changeCartData(totalCnt, cartIndex);
		
			}
		}//onclick함수에서 plus/minus값 넘어오는지 확인하는 if문 끝
		
	}//changePrice()함수 끝

	
	/*선택삭제 기능 */
	function deleteProd(cartProdId) {
		var checkedArray = [];
		
		alert("선택한 상품을 삭제하시겠습니까?");
		
		$("input:checkbox[name='del_check']:checked").each(function() {
			checkedArray.push($(this).val()); // 체크된 것 value만 배열에 push			
		})
		
		if(cartProdId) {
			checkedArray.push(cartProdId);
		}
		
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
	
	
	/*수량 변경 시 장바구니 테이블 내 데이터 수정*/
	function changeCartData(totalCount, cartId) {
						
		$.ajax({
			type : "POST",
			url : "${contextPath}/cart/updateCartList",
			data : { "totalCount" : totalCount, "cartId" : cartId },			
			success: function(data) {
				alert(data);
				location.href = location.href;
			},
			error: function(xhr, status, error) {
				alert(error);
			}
		});//ajax끝
	}
	

	/*전체선택 시작*/
	let clickCnt = 1;
	let delChkBoxArray = document.getElementsByName("del_check");	
	
	function chooseAllProd() {
	
		clickCnt++;
			
			if(clickCnt%2 == 0) {
				for(var j=0; j<delChkBoxArray.length; j++) {
					if(delChkBoxArray[j].disabled == false) {
						delChkBoxArray[j].checked = true;
					}
				}
			}else {
				for(var j=0; j<delChkBoxArray.length; j++) {
					delChkBoxArray[j].checked = false;
				}
			}			
	}//chooseAllProd()함수 끝
	
	
	/* 상품주문 페이지로 이동*/
	function orderProds(orderType) {
		
		var cartIndexValue = [];	
		
		$("input:checkbox[name='del_check']:checked").each(function() {
			cartIndexValue.push($(this).val()); // 체크된 것 value만 배열에 push				
		});
				
		if(orderType == "selected" && cartIndexValue.length == 0) {
			alert("상품을 선택해주세요.");
			return false;
		}
		
		if(orderType == "all") {
 			$("input:checkbox[name='del_check']:not(:disabled)").each(function() {
 				cartIndexValue.push($(this).val()); // 체크 안된 것들만 배열에 push				
 			});
		}
		
		document.getElementById("selected_index").value = cartIndexValue;
		
		document.cart_form.action = "${contextPath}/order/orderSomeProd";
		document.cart_form.submit();
	}
	
	
	
	
	
	
	
	
  </script>
  
  <footer>
      
  </footer>
   <jsp:include page="../include/Footer.jsp" />

</body>
</html>