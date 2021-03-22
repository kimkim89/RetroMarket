<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Watch shop | eCommers</title>
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
                  <h3>Billing Details</h3>
                  <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                    <div class="col-md-6 form-group p_star">
                      <input type="text" class="form-control" id="first" name="name" />
                      <span class="placeholder" data-placeholder="First name"></span>
                    </div>
                    <div class="col-md-6 form-group p_star">
                      <input type="text" class="form-control" id="last" name="name" />
                      <span class="placeholder" data-placeholder="Last name"></span>
                    </div>
                    <div class="col-md-12 form-group">
                      <input type="text" class="form-control" id="company" name="company" placeholder="Company name" />
                    </div>
                    <div class="col-md-6 form-group p_star">
                      <input type="text" class="form-control" id="number" name="number" />
                      <span class="placeholder" data-placeholder="Phone number"></span>
                    </div>
                    <div class="col-md-6 form-group p_star">
                      <input type="text" class="form-control" id="email" name="compemailany" />
                      <span class="placeholder" data-placeholder="Email Address"></span>
                    </div>
                    <div class="col-md-12 form-group p_star">
                      <select class="country_select">
                        <option value="1">Country</option>
                        <option value="2">Country</option>
                        <option value="4">Country</option>
                      </select>
                    </div>
                    <div class="col-md-12 form-group p_star">
                      <input type="text" class="form-control" id="add1" name="add1" />
                      <span class="placeholder" data-placeholder="Address line 01"></span>
                    </div>
                    <div class="col-md-12 form-group p_star">
                      <input type="text" class="form-control" id="add2" name="add2" />
                      <span class="placeholder" data-placeholder="Address line 02"></span>
                    </div>
                    <div class="col-md-12 form-group p_star">
                      <input type="text" class="form-control" id="city" name="city" />
                      <span class="placeholder" data-placeholder="Town/City"></span>
                    </div>
                    <div class="col-md-12 form-group p_star">
                      <select class="country_select">
                        <option value="1">District</option>
                        <option value="2">District</option>
                        <option value="4">District</option>
                      </select>
                    </div>
                    <div class="col-md-12 form-group">
                      <input type="text" class="form-control" id="zip" name="zip" placeholder="Postcode/ZIP" />
                    </div>
                    <div class="col-md-12 form-group">
                      <div class="creat_account">
                        <input type="checkbox" id="f-option2" name="selector" />
                        <label for="f-option2">Create an account?</label>
                      </div>
                    </div>
                    <div class="col-md-12 form-group">
                      <div class="creat_account">
                        <h3>Shipping Details</h3>
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
    <jsp:include page="./include/Footer.jsp" />
    
  
</body>
</html>