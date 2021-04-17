<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <%@ include file="../include/Top.jsp"%>
    <style type="text/css">
    
     #profile_img {
     	 display: block; margin: 0px auto; 
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
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                	<jsp:include page="./include/myPageSide.jsp" />
                    <div class="col-lg-8 mb-5 mb-lg-0">
							<div class="col-md-4" id="profile_img">
									<div class="single-gallery-image" style="background: url(${contextPath}/resources/assets/img/elements/g1.jpg); border-radius: 100px;" >
									</div>
							</div>
                    </div>
                </div>
            </div>
        </section>
        <!--================Blog Area =================-->
    </main>
    <footer>
        
    </footer>
    <jsp:include page="../include/Footer.jsp" />
</body>
</html>