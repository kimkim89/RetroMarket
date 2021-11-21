<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<%@ include file="../../include/Top.jsp"%>
<style type="text/css">
#profile_img {
	display: block;
	margin: 0px auto;
}
</style>
</head>
<body>
	<header>
		<!-- Header Start -->
		<jsp:include page="../../include/TopNavi.jsp" />
		<!-- Header End -->
	</header>
	<main>
		<!--? Hero Area Start-->
		<div class="slider-area ">
			<div class="single-slider slider-height2 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-center">
								<h2>My Page</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--? Hero Area End-->
		<!--================Blog Area =================-->
		<section class="blog_area section-padding"
			style="margin: 0% 7% 0% 8%;">
			<div class="gallery-area">
				<div class="row">
					<jsp:include page="../include/myPageSide.jsp" />
					<div class="col-lg-8 mb-5 mb-lg-0"
						style="margin: 3%; margin-top: 1%;">
						<section class="cart_area section_padding" style="padding: 0px;">
							<div class="container" style="max-width: 830px;">
								<div class="cart_inner">
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th scope="col">Product</th>
													<th scope="col">Price</th>
													<th scope="col">Quantity</th>
													<th scope="col">Total</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<div class="media">
															<div class="d-flex">
																<img src="assets/img/gallery/card1.png" alt="" />
															</div>
															<div class="media-body">
																<p>Minimalistic shop for multipurpose use</p>
															</div>
														</div>
													</td>
													<td>
														<h5>$360.00</h5>
													</td>
													<td>
														<div class="product_count">
															<span class="input-number-decrement"> <i
																class="ti-minus"></i></span> <input class="input-number"
																type="text" value="1" min="0" max="10"> <span
																class="input-number-increment"> <i
																class="ti-plus"></i></span>
														</div>
													</td>
													<td>
														<h5>$720.00</h5>
													</td>
												</tr>
												<tr>
													<td>
														<div class="media">
															<div class="d-flex">
																<img src="assets/img/gallery/card2.png" alt="" />
															</div>
															<div class="media-body">
																<p>Minimalistic shop for multipurpose use</p>
															</div>
														</div>
													</td>
													<td>
														<h5>$360.00</h5>
													</td>
													<td>
														<div class="product_count">
															<span class="input-number-decrement"> <i
																class="ti-minus"></i></span> <input class="input-number"
																type="text" value="1" min="0" max="10"> <span
																class="input-number-increment"> <i
																class="ti-plus"></i></span>
														</div>
													</td>
													<td>
														<h5>$720.00</h5>
													</td>
												</tr>
												<tr class="bottom_button">
													<td><a class="btn_1" href="#">Update Cart</a></td>
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
																<li>Flat Rate: $5.00 <input type="radio"
																	aria-label="Radio button for following text input">
																</li>
																<li>Free Shipping <input type="radio"
																	aria-label="Radio button for following text input">
																</li>
																<li>Flat Rate: $10.00 <input type="radio"
																	aria-label="Radio button for following text input">
																</li>
																<li class="active">Local Delivery: $2.00 <input
																	type="radio"
																	aria-label="Radio button for following text input">
																</li>
															</ul>
															<h6>
																Calculate Shipping <i class="fa fa-caret-down"
																	aria-hidden="true"></i>
															</h6>
															<select class="shipping_select">
																<option value="1">Bangladesh</option>
																<option value="2">India</option>
																<option value="4">Pakistan</option>
															</select> <select class="shipping_select section_bg">
																<option value="1">Select a State</option>
																<option value="2">Select a State</option>
																<option value="4">Select a State</option>
															</select> <input class="post_code" type="text"
																placeholder="Postcode/Zipcode" /> <a class="btn_1"
																href="#">Update Details</a>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
										<div class="checkout_btn_inner float-right">
											<a class="btn_1" href="#">Continue Shopping</a> <a
												class="btn_1 checkout_btn_1" href="#">Proceed to
												checkout</a>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</section>
		<!--================Blog Area =================-->
	</main>
	<footer> </footer>
	<jsp:include page="../../include/Footer.jsp" />
</body>
</html>