<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en-US" dir="ltr">
<head>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Geeks in the Purple</title>
    
    <%@ include file="./include/Top.jsp" %>
    
    <script type="text/javascript">
     $(document).ready(function() {
    	
	});
     

    </script>
    
    <style type="text/css">
    	.indexPrDesign {
    		padding-bottom: 50px;
    	}
    </style>
	
	
</head>

<body>
    <!--? Preloader Start -->
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <jsp:include page="./include/TopNavi.jsp" />
        <!-- Header End -->
    </header>
    <main>
        <!--? slider Area Start -->
        <div class="slider-area " style="height: 721px;">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider slider-height d-flex align-items-center slide-bg" style="background-color: #F3DCAA;">
                    <div class="container" style="margin-bottom: 270px;">
                        <div class="row justify-content-between align-items-center" style="margin-right: 228px;">
                            <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8">
                                <div class="hero__caption">
                                    <h1 data-animation="fadeInLeft" data-delay=".4s" data-duration="2000ms">
                                    <font style="color:#1187CF">그 때</font> 
                                    <font style="color:#D23460">그시절</font>  <br><font style="color:#D23460">추억의</font> 
                                    <font style="color:#1187CF">매점</font> </h1>
<!--                                     <p data-animation="fadeInLeft" data-delay=".7s" data-duration="2000ms">브이콘 먹는 소리 내지마라.</p> -->
                                    <div class="hero__btn" data-animation="fadeInLeft" data-delay=".8s" data-duration="2000ms">
                                        <a href="${contextPath}/product/prList?prCode=all" class="btn hero-btn">간식 메뉴 보러가기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-3 col-md-4 c이ol-sm-4 d-none d-sm-block">
                                <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                    <img src="${contextPath}/resources/assets/img/newtro/mainewtro.jpg" style="width: 630px; height: 720px;" alt="" class=" heartbeat">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
 
        
        <!--? New Updated Items Start -->
        <div class="popular-items section-padding30 indexPrDesign" style="padding-top:60px;">
            <div class="container">
                <!-- Section tittle -->
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-8 col-md-10">
                        <div class="section-tittle mb-70 text-center">
                            <h2>신상품</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                <c:forEach var="listByRegDate" items="${listByRegDate}" varStatus="status">	
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-popular-items mb-50 text-center">
                            <div class="popular-img">
                                <img class="snack-img" src="${contextPath}/resources/images/temporary/${listByRegDate.mk_stored_thumb}" alt="" style="height: 270px;">
                                <div class="img-cap">
                                    <a href="${contextPath}/product/temporary"><span>상품 보기</span></a>
                                </div>
                            </div>
                            <div class="popular-caption">
                                <h3><a href="product_details.html">${listByRegDate.mk_product_name}</a></h3>
                                <span>${listByRegDate.mk_product_price}</span>
                            </div>
                        </div>
                    </div>
                 </c:forEach>
                </div>
            </div>
        </div>
        <!--? New Updated Items End -->
                
                
        <!--? Popular Items Start -->
        <div class="popular-items section-padding30 indexPrDesign" style="padding-top:30px;">
            <div class="container">
                <!-- Section tittle -->
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-8 col-md-10">
                        <div class="section-tittle mb-70 text-center">
                            <h2>인기상품</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                <c:forEach var="listBySoldNum" items="${listBySoldNum}" varStatus="status">	
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-popular-items mb-50 text-center">
                            <div class="popular-img">
                                <img class="snack-img" src="${contextPath}/resources/images/temporary/${listBySoldNum.mk_stored_thumb}" alt="" style="height: 270px;">
                                <div class="img-cap">
                                    <a href="${contextPath}/product/temporary"><span>상품 보기</span></a>
                                </div>
                            </div>
                            <div class="popular-caption">
                                <h3><a href="product_details.html">${listBySoldNum.mk_product_name}</a></h3>
                                <span>${listBySoldNum.mk_product_price}</span>
                            </div>
                        </div>
                    </div>
                 </c:forEach>
                </div>
            </div>
        </div>
        <!-- Popular Items End -->
       
        <!--? On Sale Items Start -->
        <div class="popular-items section-padding30" style="padding-top:30px;">
            <div class="container">
                <!-- Section tittle -->
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-8 col-md-10">
                        <div class="section-tittle mb-70 text-center">
                            <h2>할인상품</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                <c:forEach var="listByDiscount" items="${listByDiscount}" varStatus="status">	
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-popular-items mb-50 text-center">
                            <div class="popular-img">
                                <img class="snack-img" src="${contextPath}/resources/images/temporary/${listByDiscount.mk_stored_thumb}" alt="" style="height: 270px;">
                                <div class="img-cap">
                                    <a href="${contextPath}/product/temporary"><span>상품 보기</span></a>
                                </div>
                            </div>
                            <div class="popular-caption">
                                <h3><a href="product_details.html">${listByDiscount.mk_product_name}</a></h3>
                                <span>${listByDiscount.mk_product_price}</span>
                            </div>
                        </div>
                    </div>
                 </c:forEach>
                </div>
            </div>
        </div>
        <!-- On Sale Items End -->   
    </main>
    

    <jsp:include page="./include/Footer.jsp" />
    
</body>
</html>