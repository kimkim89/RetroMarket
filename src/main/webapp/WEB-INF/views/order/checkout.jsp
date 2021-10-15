<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>아맞다매점 - 주문결제</title>
    <%@ include file="../include/Top.jsp" %>
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
            
            <div class="cupon_area">
              <div class="check_title">
                <h2>
                  	쿠폰이 있나요 ?
                </h2>
              </div>
              <input type="text" placeholder="쿠폰을 입력해주세요" />
              <a class="tp_btn" href="#">쿠폰 적용</a>
            </div>
            <div class="billing_details">
              <div class="row">
                <div class="col-lg-8">
                  <h3>배송정보</h3>
                  <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                    <div class="col-md-6 form-group p_star">
                      <input type="text" class="form-control" id="first" name="name" />
                      <span class="placeholder" data-placeholder="받는사람 이름"></span>
                    </div>
                    <div class="col-md-7 form-group p_star">
                      <input type="text" class="form-control" id="last" name="name" />
                      <span class="placeholder" data-placeholder="연락처"></span>
                    </div>
                    <div class="col-md-7 form-group p_star">
                      <input type="text" class="form-control" id="last" name="name" />
                      <span class="placeholder" data-placeholder="우편번호"></span>
                    </div>
					<div class="col-md-2 form-group p_star">
						<button type="button" id="addr_btn" style="color: black; padding: 4px;">주소찾기</button>
					</div>                                        
                    <div class="col-md-12 form-group p_star">
                      <input type="text" class="form-control" id="add1" name="add1" />
                      <span class="placeholder" data-placeholder="주소"></span>
                    </div>
                    <div class="col-md-12 form-group p_star">
                      <input type="text" class="form-control" id="add2" name="add2" />
                      <span class="placeholder" data-placeholder="상세주소"></span>
                    </div>
                    <div class="col-md-12 form-group p_star">
                      <select class="country_select">
                      	<option value="0" selected disabled>배송 요청사항을 선택해 주세요.</option>
                        <option value="1">배송 전 연락바랍니다.</option>
                        <option value="2">부재시 경비실에 맡겨주세요.</option>
                        <option value="3">부재시 문 앞에 놓아주세요.</option>
                        <option value="4">부재시 전화 주시거나 문자 남겨 주세요.</option>
                        <option value="5">요청사항 직접 입력</option>
                      </select>
                    </div>                    
                    <div class="col-md-12 form-group p_star">
                    	<textarea class="form-control" maxlength="50"></textarea>
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
                        <input type="checkbox" id="f-option3" name="selector" />
                        <label for="f-option3">Ship to a different address?</label>
                      </div>
                      <textarea class="form-control" name="message" id="message" rows="1"
                        placeholder="Order Notes"></textarea>
                    </div>
                  </form>
                </div>
                <div class="col-lg-4">
                  <div class="order_box">
                    <h2>Your Order</h2>
                    <ul class="list">
                      <li>
                        <a href="#">Product
                          <span>Total</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">Fresh Blackberry
                          <span class="middle">x 02</span>
                          <span class="last">$720.00</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">Fresh Tomatoes
                          <span class="middle">x 02</span>
                          <span class="last">$720.00</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">Fresh Brocoli
                          <span class="middle">x 02</span>
                          <span class="last">$720.00</span>
                        </a>
                      </li>
                    </ul>
                    <ul class="list list_2">
                      <li>
                        <a href="#">Subtotal
                          <span>$2160.00</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">Shipping
                          <span>Flat rate: $50.00</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">Total
                          <span>$2210.00</span>
                        </a>
                      </li>
                    </ul>
                    <div class="payment_item">
                      <div class="radion_btn">
                        <input type="radio" id="f-option5" name="selector" />
                        <label for="f-option5">Check payments</label>
                        <div class="check"></div>
                      </div>
                      <p>
                        Please send a check to Store Name, Store Street, Store Town,
                        Store State / County, Store Postcode.
                      </p>
                    </div>
                    <div class="payment_item active">
                      <div class="radion_btn">
                        <input type="radio" id="f-option6" name="selector" />
                        <label for="f-option6">Paypal </label>
                        <img src="img/product/single-product/card.jpg" alt="" />
                        <div class="check"></div>
                      </div>
                      <p>
                        Please send a check to Store Name, Store Street, Store Town,
                        Store State / County, Store Postcode.
                      </p>
                    </div>
                    <div class="creat_account">
                      <input type="checkbox" id="f-option4" name="selector" />
                      <label for="f-option4">I’ve read and accept the </label>
                      <a href="#">terms & conditions*</a>
                    </div>
                    <a class="btn_3" href="#">Proceed to Paypal</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!--================End Checkout Area =================-->
    </main>
    <footer>
        
    </footer>
    <jsp:include page="../include/Footer.jsp" />
    
  
</body>
</html>