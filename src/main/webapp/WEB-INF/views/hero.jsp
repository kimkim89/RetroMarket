<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en-US" dir="ltr">
<head>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Moon</title>
    
    <%@ include file="./include/Top.jsp" %>
    
    <script type="text/javascript">
    
    	$(document).ready(function() {
			
    		$("#submit-btn").click(function() {
    			
    			var answer = $("#Anything").val();
    			
    			if(answer == "Confidence") {
    				alert("정답입니다! 감사합니다 🙂");
    				location.href="${contextPath}/index/beHero";
    			} else if(answer == "") {
    				alert("때론 정답이 아닌 믿음이 예상치 못한 기적을 만들어 내기도 하죠 🙂 감사합니다");
    				location.href="${contextPath}/index/beHero";
    			} else if(answer == "Just Do It") {
    				alert("Just Do It 👊");
    				location.href="${contextPath}/index/beHero";
    			} else {
    				alert("실패(패배)의 참 뜻은 다시 도전해보라는 의미 아닐까요? 🙂");
    				$("#Anything").val("");
    			}
				
			});
    		
		});
    
    </script>
    
</head>

<body>
    <!--? Preloader Start -->
    <!-- Preloader Start -->
    <header>
    </header>
    <main>
        <!--? slider Area Start -->
        <!-- slider Area End-->
        <!-- ? New Product Start -->
        <section class="new-product-area section-padding30">
            <div class="container">
                <!-- Section tittle -->
                <div class="row">
                    <div class="col-xl-12">
                        <div class="section-tittle mb-70">
                            <h2>안녕하세요 ?</h2>
                            <hr>
                        </div>
                    </div>
                </div>
                
                <div class="Greetings">
                	인생은 Birth에서 Death로가는 수많은<mark>Choice</mark> 연속이다.<br>
                	스타트업 ! 히어로(HERO)에 지원하는 엄성문 이라고합니다. <br><br>
                </div>
                
                <br>
                <div class="Choice">
                	Q1. 정답을 입력해주시면 이동합니다.!
                </div>
                <div class="Challenge" style="width: 50%;">
	                <form class="Funny">
	                	<div class="mt-10" >
							<input type="text" id="Anything" name="name" placeholder="정답을 입력해 주세요! Just Do It!" required class="single-input"> <br>
						</div>
	                	<a href="javascript:;" class="genric-btn info-border radius" id="submit-btn" style="float: right;">Submit!</a>
	                </form>
                </div>
            </div>
        </section>
        <!--  New Product End -->
       
        
    </main>
    <footer>
        <!-- Footer Start-->
        <div class="footer-area footer-padding">
            <div class="container">
                <!-- Footer bottom -->
                <div class="row align-items-center">
                    <div class="col-xl-7 col-lg-8 col-md-7">
                        <div class="footer-copy-right">
                            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Nice Meet You <b>Im Nothing But I Can Anything!!</b> | This Site is made 🙂  by <b><mark>Developer Moon</mark></b>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>                  
                        </div>
                    </div>
                    <div class="col-xl-5 col-lg-4 col-md-5">
                        <div class="footer-copy-right f-right">
                            <!-- social -->
                            <div class="footer-social">
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="https://www.facebook.com/sai4ull"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-behance"></i></a>
                                <a href="#"><i class="fas fa-globe"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End-->
    </footer>
   
   <!--? Search model Begin -->
    <div class="search-model-box">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-btn">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Searching key.....">
            </form>
        </div>
    </div>
    <!-- Search model end -->

    <!-- JS here -->

    <script src="${contextPath}/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="${contextPath}/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="${contextPath}/resources/assets/js/popper.min.js"></script>
    <script src="${contextPath}/resources/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="${contextPath}/resources/assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="${contextPath}/resources/assets/js/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/assets/js/slick.min.js"></script>

    <!-- One Page, Animated-HeadLin -->
    <script src="${contextPath}/resources/assets/js/wow.min.js"></script>
    <script src="${contextPath}/resources/assets/js/animated.headline.js"></script>
    <script src="${contextPath}/resources/assets/js/jquery.magnific-popup.js"></script>

    <!-- Scrollup, nice-select, sticky -->
    <script src="${contextPath}/resources/assets/js/jquery.scrollUp.min.js"></script>
    <script src="${contextPath}/resources/assets/js/jquery.nice-select.min.js"></script>
    <script src="${contextPath}/resources/assets/js/jquery.sticky.js"></script>
    
    <!-- contact js -->
    <script src="${contextPath}/resources/assets/js/contact.js"></script>
    <script src="${contextPath}/resources/assets/js/jquery.form.js"></script>
    <script src="${contextPath}/resources/assets/js/jquery.validate.min.js"></script>
    <script src="${contextPath}/resources/assets/js/mail-script.js"></script>
    <script src="${contextPath}/resources/assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="${contextPath}/resources/assets/js/plugins.js"></script>
    <script src="${contextPath}/resources/assets/js/main.js"></script>
    
</body>
</html>