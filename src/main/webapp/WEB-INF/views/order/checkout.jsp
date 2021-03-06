<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>아맞다매점 - 주문결제</title>
<%@ include file="../include/Top.jsp" %>

	<!-- 다음 우편 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${contextPath}/resources/assets/js/DaumApi/AddressApi.js"></script>
<script>
	//우편번호 , 주소 검색 API
	function addressFind() {
		execPostCode();
	};
	
	//뒤로가기X
	window.history.forward();
	function noBack(){window.history.forward();}	
	
</script>
   
<style type="text/css">
 		.nice-select {
 			width: 100%;
 		}
 		
 		.list {
 			width: 100%; 			
 		} 		
 		
 		.list>li>a { 			
 			pointer-events: none;
 		} 	
 		
 		#applyPointBtn {
 			color: black;
 			padding: 4px 7px;
    		margin-left: 20px;
 		}
 		
 		#addPointDiv {
			margin-top: 1px;
		    margin-left: 10px;
		    margin-right: 11px;
 		}
 			
</style>           
    
</head>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

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
                                <h2>주문/결제</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--================Checkout Area =================-->
        <section class="checkout_area section_padding">
          <div class="container">
            
<!--             <div class="cupon_area"> -->
<!--               <div class="check_title"> -->
<!--                 <h2> -->
<!--                   	쿠폰이 있나요 ? -->
<!--                 </h2> -->
<!--               </div> -->
<!--               <input type="text" placeholder="쿠폰을 입력해주세요" /> -->
<!--               <a class="tp_btn" href="#">쿠폰 적용</a> -->
<!--             </div> -->
            <div class="billing_details">
              <div class="row">
                <div class="col-lg-8">
                  <h3>배송정보</h3>
                  
                  <form class="row contact_form" name="order_form" action="${contextPath}/order/placeOrder" method="post" novalidate="novalidate">
                  	<input type="hidden" name="map_check" id="map_check" value="checkout" />
                  	<input type="hidden" name="delivery_fee" id="delivery_fee" value="${deliveryFee}" />
                  	<input type="hidden" name="order_price" id="order_price" value="${totalOrderPrice}"/>
                  	<input type="hidden" name="selected_index" id="selected_index" value="${selectedIndexStr}" />
                  	<input type="hidden" name="p_point" id="p_point" value="<fmt:parseNumber value="${purchasePoint}" integerOnly="true" />"/>
                  	<input type="hidden" name="u_point" id="u_point" value="0" />
                  	
                    <div class="col-md-6 form-group p_star">
                      <input type="text" class="form-control" id=receiver_name name="receiver_name" placeholder="받는사람 이름 *" maxlength="20"/>
<!--                       <span class="placeholder" data-placeholder="받는사람 이름"></span> -->
                    </div>
                    <div class="col-md-7 form-group p_star">
                      <input type="number" class="form-control" id="receiver_phone" name="receiver_phone" placeholder="연락처 *" maxlength="20"/>
<!--                       <span class="placeholder" data-placeholder="연락처"></span> -->
                    </div>
                    <div class="col-md-7 form-group p_star">
                      <input type="text" class="form-control" id="receiver_addr1" name="receiver_addr1" placeholder="우편번호 *" readonly/>
<!--                       <span class="placeholder" data-placeholder="우편번호"></span> -->
                    </div>
					<div class="col-md-2 form-group p_star">
						<button type="button" id="addr_btn" style="color: black; padding: 4px;" onclick="addressFind();">주소 검색</button>
					</div>                                        
                    <div class="col-md-12 form-group p_star">
                      <input type="text" class="form-control" id="receiver_addr2" name="receiver_addr2" placeholder="주소 *" readonly/>
<!--                       <span class="placeholder" data-placeholder="주소"></span> -->
                    </div>
                    <div class="col-md-12 form-group p_star">
                      <input type="text" class="form-control" id="receiver_addr3" name="receiver_addr3" placeholder="상세주소 *" maxlength="40"/>
<!--                       <span class="placeholder" data-placeholder="상세주소"></span> -->
                    </div>
                    <div class="col-md-12 form-group p_star">
                      <select class="country_select" name="delivery_choice" id="delivery_choice" onchange="chooseMsg(this.value);">
                      	<option value="" selected disabled>배송 요청사항을 선택해 주세요.</option>
                        <option value="1">배송 전 연락바랍니다.</option>
                        <option value="2">부재시 경비실에 맡겨주세요.</option>
                        <option value="3">부재시 문 앞에 놓아주세요.</option>
                        <option value="4">부재시 전화 주시거나 문자 남겨 주세요.</option>
                        <option value="5">요청사항 직접 입력</option>
                      </select>
                    </div>                    
                    <div class="col-md-12 form-group" id="hidden_d_msg" style="display:none;">
                    	<textarea class="form-control" name="delivery_msg" id="delivery_msg" rows="1" placeholder="Order Notes"></textarea>
                    </div>
                    <div class="col-md-12 form-group"></div>

 
<!--                     <div class="col-md-12 form-group"> -->
<!--                       <div class="creat_account"> -->
<!--                         <input type="checkbox" id="f-option2" name="selector" /> -->
<!--                         <label for="f-option2">Create an account?</label> -->
<!--                       </div> -->
<!--                     </div> -->

                    <div class="col-md-12 form-group">
                      <div class="creat_account">
                        <h3>결제수단</h3>
                        <input type="radio" id="payment_method" name="payment_method" value="1" checked />
                        <label for="pay_method">무통장 입금</label>
                      </div>                      
                    </div>
                    <div class="col-md-12 form-group p_star">
                      <select class="country_select" name="od_bank_code" id="od_bank_code">
                      	<option value="" selected disabled>무통장입금계좌의 은행명을 선택해 주세요.</option>
                      	<c:forEach var="bankNameList" items="${bankNameList}" varStatus="status">
                      		 <option value="${bankNameList.bank_code}">${bankNameList.bank_name}</option>
                      	</c:forEach>                     
                      </select>                      
                    </div>
                    <div class="col-md-12 form-group p_star">
                      <input type="number" class="form-control" id="bank_acct_num" name="bank_acct_num" placeholder="계좌번호 *" maxlength="50"/>
<!--                       <span class="placeholder" data-placeholder="계좌번호"></span> -->
                    </div> 
                    <div class="col-md-12 form-group p_star">
                      <input type="text" class="form-control" id="bank_acct_owner" name="bank_acct_owner" placeholder="예금주명 *" maxlength="20"/>
<!--                       <span class="placeholder" data-placeholder="예금주명"></span> -->
                    </div>    
                  </form>
                </div>
                <div class="col-lg-4">
                  <div class="order_box">
                    <h2>주문 상품</h2>
                    <ul class="list">
                      <li>
                        <a href="#" >상품명
                          <span>수량</span>
                        </a>
                      </li>
                      <c:forEach var="orderList" items="${orderList}" varStatus="status">
                      <li>
                        <a href="#" class="no_click">${orderList.pr_name}
                          <span class="middle"></span>
                          <span class="last">${orderList.total_num}개</span>
                        </a>
                      </li>
                      </c:forEach>                      
                    </ul>
                    <ul class="list list_2">
                      <li>
                        <a href="#">상품총액
                          <span><fmt:formatNumber value="${totalProdPrice}" pattern="#,###"/></span>
                        </a>
                      </li>
                      <li>
                        <a href="#">배송료
                          <span><fmt:formatNumber value="${deliveryFee}" pattern="#,###"/></span>
                        </a>
                      </li>
                      <li>
                        <a href="#">결제금액
                          <span id="total_order_price"><fmt:formatNumber value="${totalOrderPrice}" pattern="#,###"/></span>
                        </a>
                      </li>
                      <li>
                        <a href="#">적립예정포인트
                          <span id="add_point"><fmt:formatNumber value="${purchasePoint}" pattern="#,###"/></span>
                        </a>
                      </li>
                      <li>
                        <a href="#" >포인트 사용  [ 보유중인 포인트: <b id="myPoint" style="color:red;"><fmt:formatNumber value="${memberPoint}" pattern="#,###"/></b> ]</a>                        
                      </li>
                      <li>                      
                        <div class="col-md-7 form-group p_star" style="padding-left:0px; padding-right:0px;">
	                     	<input type="number" class="form-control" name="used_point" id="used_point" placeholder="0" value="" style="width:120%;" />
	                    </div>
						<div class="col-md-4 form-group p_star" id="addPointDiv">
							<button type="button" name="applyPointBtn" id="applyPointBtn" onclick="applyPoint();">사용</button>
						</div> 
                      </li>
<!--                       <li> -->
<!--                         <a href="#" style="pointer-">쿠폰 추가</a>                         -->
<!--                       </li> -->
<!--                       <li>                      	 -->
<!--                         <select name="coupon_price" id="coupon_price" style="width:100%;"> -->
<!-- 							<option value="" selected disabled>쿠폰을 선택해주세요.</option> -->
<!-- 							 <option value="0">내가 가지고 있는 쿠폰 종류</option>                     -->
<!-- 						</select> -->
						                   
<!--                       </li>                       -->
                                
                    </ul>
                    <br>
                    <a class="btn_3" href="javascript:orderProduct();">결제하기</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!--================End Checkout Area =================-->
    </main>
    
    <script type="text/javascript">
	
    //배송 요청 사항 메시지칸 추가
    function chooseMsg(deliOptValue) {
    	var selectMsg = document.getElementById("delivery_choice");	    	
    	
    	if(selectMsg.options[selectMsg.selectedIndex].value == 5) {
    		document.getElementById("hidden_d_msg").style.display = 'block';
    		document.getElementById("delivery_msg").value = "";
    	}else {
    		document.getElementById("hidden_d_msg").style.display = 'none'; 
    		
    		var target = document.getElementById("delivery_choice");
    		
    		var deliveryMsg = target.options[target.selectedIndex].text;
    		
    		document.getElementById("delivery_msg").value = deliveryMsg;    			   			
    	}    	   
    }
    
    
    //현재 보유중인 포인트 금액만큼 입력되도록 기능 추가
	function applyPoint() {
		
    	let usedPointId = document.getElementById("used_point");
		let memberPointId = document.getElementById("myPoint");
		//결제금액
		var totalOrderPrice = Number(document.getElementById("total_order_price").innerText.split(',').join(''));
		//사용된 포인트
    	var usedPoint = Number(usedPointId.value);
    	let memberPoint = Number(memberPointId.innerText.split(',').join('')); 
    	var applyPointButton = document.getElementById("applyPointBtn").innerText
    	
    	
    	if(usedPoint > memberPoint) {
    		alert("현재 보유중인 포인트 금액만큼 사용할 수 있습니다.");
    		usedPointId.focus();
    	}else {
    		
    		if(applyPointButton == "사용") {
        		
       			//포인트 적용 후 결제금액
       			totalOrderPrice = totalOrderPrice - usedPoint;
        		    	        		
        		ajaxAddPoint(totalOrderPrice, usedPoint);
    			        		
        		document.getElementById("used_point").readOnly = true;
				document.getElementById("applyPointBtn").innerText = "취소";
        		
    		}else if(applyPointButton == "취소") {
    			
    			totalOrderPrice = totalOrderPrice + usedPoint;
    			
    			ajaxAddPoint(totalOrderPrice, usedPoint);
    			
    			document.getElementById("u_point").value = 0;
    			document.getElementById("used_point").readOnly = false;
				document.getElementById("applyPointBtn").innerText = "사용";    			
    		}	
    	}
    }
    
    
	//회원 등급별 적립 예정 포인트 계산
	function ajaxAddPoint(totalOrderPrice, usedPoint) {
    	$.ajax({
			type: "POST",
			url: "${contextPath}/order/ajaxCheckMemberLevel",
			async: false,
			data: {"totalOrderPriceStr" : totalOrderPrice},
			success: function(data) {
				
				//결제금액 변경
				document.getElementById("total_order_price").innerText = totalOrderPrice;
				//적립예정포인트 금액 변경
				document.getElementById("add_point").innerText = data;
				document.getElementById("p_point").value = data;
				document.getElementById("order_price").value = totalOrderPrice;
				document.getElementById("u_point").value = usedPoint
			},
			error: function(jqXHR, textStatus, errorThrown) {    					
				alert("ERROR: " + textStatus + " : " + errorThrown);
			}    								
		});		        		
    }
    
	
	//유효성 검사 후 주문 결제 완료
    function orderProduct() {
		    	
    	if($("#receiver_name").val() == "") {
    		alert("받는 사람 이름을 입력해주세요.");
    		$("#receiver_name").focus();
    		return false;
    	}else if($("#receiver_phone").val() == "") {
    		alert("받는 사람 연락처를 입력해주세요.");
    		$("#receiver_phone").focus();
    		return false;
    	}else if($("#receiver_addr1").val() == "") {
    		alert("주소를 입력해주세요.");
    		$("#receiver_addr1").focus();
    		return false;
    	}else if($("#receiver_addr2").val() == "") {
    		alert("주소를 입력해주세요.");
    		$("#receiver_addr2").focus();
    		return false;
    	}else if($("#receiver_addr3").val() == "") {
    		alert("주소를 입력해주세요.");
    		$("#receiver_addr3").focus();
    		return false;
    	}else if($("#delivery_choice").val() == null) {
    		alert("배송 요청사항을 선택해주세요.");
    		$("#delivery_choice").focus();
    		return false;
    	}else if($("#od_bank_code").val() == null) {
    		alert("무통장 입금계좌의 은행명을 선택해주세요.");
    		$("#od_bank_code").focus();
    		return false;
    	}else if($("#od_bank_code").val() == null) {
    		alert("무통장 입금계좌의 은행명을 선택해주세요.");
    		$("#od_bank_code").focus();
    		return false;
    	}else if($("#bank_acct_num").val() == "") {
    		alert("계좌번호를 입력해주세요.");
    		$("#bank_acct_num").focus();
    		return false;
    	}else if($("#bank_acct_owner").val() == "") {
    		alert("예금주명을 입력해주세요.");
    		$("#bank_acct_owner").focus();
    		return false;
    	}
    	
    	document.order_form.submit();
    }
    
    
    
    </script>
    
    
    <footer>
        
    </footer>
    <jsp:include page="../include/Footer.jsp" />
    
  
</body>
</html>