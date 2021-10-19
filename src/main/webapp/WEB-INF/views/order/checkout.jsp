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
	</script>
    
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
                                <h2>Checkout</h2>
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
                  
                  <form class="row contact_form" action="${contextPath}/order/placeOrder" method="post" novalidate="novalidate">
                  	<input type="hidden" name="map_check" id="map_check" value="checkout" />
                  	<input type="hidden" name="delivery_fee" id="delivery_fee" value="${deliveryFee}" />
                  	
                    <div class="col-md-6 form-group p_star">
                      <input type="text" class="form-control" id=receiver_name name="receiver_name" placeholder="받는사람 이름 *"/>
<!--                       <span class="placeholder" data-placeholder="받는사람 이름"></span> -->
                    </div>
                    <div class="col-md-7 form-group p_star">
                      <input type="text" class="form-control" id="receiver_phone" name="receiver_phone" placeholder="연락처 *"/>
<!--                       <span class="placeholder" data-placeholder="연락처"></span> -->
                    </div>
                    <div class="col-md-7 form-group p_star">
                      <input type="text" class="form-control" id="receiver_addr1" name="receiver_addr1" placeholder="우편번호 *"/>
<!--                       <span class="placeholder" data-placeholder="우편번호"></span> -->
                    </div>
					<div class="col-md-2 form-group p_star">
						<button type="button" id="addr_btn" style="color: black; padding: 4px;" onclick="addressFind();">주소 검색</button>
					</div>                                        
                    <div class="col-md-12 form-group p_star">
                      <input type="text" class="form-control" id="receiver_addr2" name="receiver_addr2" placeholder="주소 *"/>
<!--                       <span class="placeholder" data-placeholder="주소"></span> -->
                    </div>
                    <div class="col-md-12 form-group p_star">
                      <input type="text" class="form-control" id="receiver_addr3" name="receiver_addr3" placeholder="상세주소 *"/>
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
                      <select class="country_select" name="od_bank_name" id="od_bank_name">
                      	<option value="" selected disabled>무통장입금계좌의 은행명을 선택해 주세요.</option>
                      	<c:forEach var="bankNameList" items="${bankNameList}" varStatus="status">
                      		 <option value="${bankNameList.bank_code}">${bankNameList.bank_name}</option>
                      	</c:forEach>                     
                      </select>                      
                    </div>
                    <div class="col-md-12 form-group p_star">
                      <input type="text" class="form-control" id="bank_acct_num" name="bank_acct_num" placeholder="계좌번호 *"/>
<!--                       <span class="placeholder" data-placeholder="계좌번호"></span> -->
                    </div> 
                    <div class="col-md-12 form-group p_star">
                      <input type="text" class="form-control" id="bank_acct_owner" name="bank_acct_owner" placeholder="예금주명 *"/>
<!--                       <span class="placeholder" data-placeholder="예금주명"></span> -->
                    </div>    
                  </form>
                </div>
                <div class="col-lg-4">
                  <div class="order_box">
                    <h2>주문 상품</h2>
                    <ul class="list">
                      <li>
                        <a href="#">상품명
                          <span>수량</span>
                        </a>
                      </li>
                      <c:forEach var="orderList" items="${orderList}" varStatus="status">
                      <li>
                        <a href="#">${orderList.pr_name}
                          <span class="middle"></span>
                          <span class="last">${orderList.total_num}개</span>
                        </a>
                      </li>
                      </c:forEach>                      
                    </ul>
                    <ul class="list list_2">
                      <li>
                        <a href="#">상품총액
                          <span><fmt:formatNumber value="${totalProdPrice}" pattern="#,###"/>원</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">배송료
                          <span><fmt:formatNumber value="${deliveryFee}" pattern="#,###"/>원</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">결제금액
                          <span><fmt:formatNumber value="${totalOrderPrice}" pattern="#,###"/>원</span>
                        </a>
                      </li>
                      
                      <li>
                        <a href="#">쿠폰
                        <span>쿠폰추가</span>
                        </a>                        
                      </li>
                     
                    </ul>
<!--                     <div class="payment_item"> -->
<!--                       <div class="radion_btn"> -->
<!--                         <input type="radio" id="f-option5" name="selector" /> -->
<!--                         <label for="f-option5">Check payments</label> -->
<!--                         <div class="check"></div> -->
<!--                       </div> -->
<!--                       <p> -->
<!--                         Please send a check to Store Name, Store Street, Store Town, -->
<!--                         Store State / County, Store Postcode. -->
<!--                       </p> -->
<!--                     </div> -->
<!--                     <div class="payment_item active"> -->
<!--                       <div class="radion_btn"> -->
<!--                         <input type="radio" id="f-option6" name="selector" /> -->
<!--                         <label for="f-option6">Paypal </label> -->
<!--                         <img src="img/product/single-product/card.jpg" alt="" /> -->
<!--                         <div class="check"></div> -->
<!--                       </div> -->
<!--                       <p> -->
<!--                         Please send a check to Store Name, Store Street, Store Town, -->
<!--                         Store State / County, Store Postcode. -->
<!--                       </p> -->
<!--                     </div> -->
<!--                     <div class="creat_account"> -->
<!--                       <input type="checkbox" id="f-option4" name="selector" /> -->
<!--                       <label for="f-option4">I’ve read and accept the </label> -->
<!--                       <a href="#">terms & conditions*</a> -->
<!--                     </div> -->
                    <a class="btn_3" href="${contextPath}/order/placeOrder">결제하기</a>
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
    	}else {
    		document.getElementById("hidden_d_msg").style.display = 'none';
    	}
    	   
    }
    
    
    
    
    </script>
    
    
    <footer>
        
    </footer>
    <jsp:include page="../include/Footer.jsp" />
    
  
</body>
</html>