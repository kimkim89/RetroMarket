<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <%@ include file="../include/Top.jsp"%>
  
  <style type="text/css">
  
  .btn_com{
  	background-color: #3b98da;
    border: 2px solid #3b98da;
  }
  
  .fnt_dis {
  	font-size: 17px;
    font-weight: 500;
  
  }
  </style>
  
  <script type="text/javascript">
  
  const test = () => {
	  alert("하이용~~");
  }
  
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
                              <h2>과자 바구니</h2>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <!--================Cart Area =================-->
      <section class="cart_area section_padding">
        <div class="container">
          <div class="cart_inner">
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr class="fnt_dis">
                    <th style="font-size: 17px;" scope="col">상품</th>
                    <th scope="col">가격</th>
                    <th scope="col">수량</th>
                    <th scope="col">총 가격</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <div class="media">
                        <div class="d-flex">
                          <img src="${contextPath}/resources/assets/img/gallery/s1.GIF" alt="" />
                        </div>
                        <div class="media-body">
                          <p>아몬드 맛 뺴빼로 쿰척쿰척</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <h5>1,500</h5>
                    </td>
                    <td>
                      <div class="product_count">
                        <span class="input-number-decrement"> <i class="ti-minus"></i></span>
                        <input class="input-number" type="text" value="1" min="0" max="10">
                        <span class="input-number-increment"> <i class="ti-plus"></i></span>
                      </div>
                    </td>
                    <td>
                      <h5>1,500</h5>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="media">
                        <div class="d-flex">
                          <img src="${contextPath}/resources/assets/img/gallery/s2.GIF" alt="" />
                        </div>
                        <div class="media-body">
                          <p>보통맛 빼빼로 쿰척쿰척</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <h5>1500</h5>
                    </td>
                    <td>
                      <div class="product_count">
                          <span class="input-number-decrement"> <i class="ti-minus"></i></span>
                          <input class="input-number" type="text" value="1" min="0" max="10">
                          <span class="input-number-increment"> <i class="ti-plus"></i></span>
                      </div>
                    </td>
                    <td>
                      <h5>1,500</h5>
                    </td>
                  </tr>
                  <tr class="bottom_button">
                    <td>
                      <a class="btn_1 btn_com" href="#">Update Cart</a>
                    </td>
                    <td></td>
                    <td></td>
                    <td>
                      <div class="cupon_text float-right">
                        <a class="btn_1 btn_com" href="#">Close Coupon</a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td></td>
                    <td>
                      <h5>중간 토탈 </h5>
                    </td>
                    <td>
                      <h5>75,700</h5>
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
                        <a class="btn_1 btn_com" href="#">Update Details</a>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div class="checkout_btn_inner float-right">
                <a class="btn_1 btn_com" href="#">Continue Shopping</a>
                <a class="btn_1 btn_com checkout_btn_1 btn_com" href="#">Proceed to checkout</a>
              </div>
            </div>
          </div>
          </div>
      </section>
      <!--================End Cart Area =================-->
  </main>>
  <footer>
  </footer>
  <jsp:include page="../include/Footer.jsp" />
  

</body>
</html>