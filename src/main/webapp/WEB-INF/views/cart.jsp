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
                <c:forEach var="productList" items="${productList}" varStatus="status">
                  <tr>
                    <td>
                      <div class="media">
                        <div class="d-flex">
                          <img src="${contextPath}/resources/images/temporary/${productList.mk_stored_thumb}" alt="" />
                        </div>
                        <div class="media-body">
                          <p>${productList.mk_product_name}</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <h5>${productList.mk_product_price}원</h5>
                    </td>
                    <td>
                      <div class="product_count">
                        <span class="input-number-decrement"> <i class="ti-minus"></i></span>
                        <input class="input-number" type="text" value="1" min="0" max="10">
                        <span class="input-number-increment"> <i class="ti-plus"></i></span>
                      </div>
                    </td>
                    <td>
                      <h5>$720.00</h5>
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
                      <h5>Subtotal</h5>
                    </td>
                    <td>
                      <h5>$2160.00</h5>
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
  
  <script>
	let defaultPrice = document.getElementById('prod_price').innerText;
	var totalCnt = 1;
		
	function changePrice(msg) {
			currentPrice = defaultPrice.split("원");
			productPrice = parseInt(currentPrice[0]) * totalCnt;
			document.getElementById('prod_price').innerText = productPrice + "원";
			
			if(msg == "minus") {
				if(totalCnt == 1) {			
					alert("구매 최소 수량은 1개 입니다.");		
				}else {
					totalCnt--;
				}
			}else if(msg == "plus") {
				if(totalCnt == 999) {
					alert(totalCnt);
					alert("구매 최대 수량은 999개 입니다.");		
				}else {
					totalCnt++;
					changePrice();
				}
			}
	}
</script> 

  <footer>
      
  </footer>
   <jsp:include page="./include/Footer.jsp" />

</body>
</html>