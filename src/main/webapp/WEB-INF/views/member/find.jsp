<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en-US" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>아이디/비밀번호 찾기</title>
    <%@ include file="../include/Top.jsp" %>
</head>
<body>
    <header>
        <!-- Header Start -->
        <jsp:include page="../include/TopNavi.jsp" />
        <!-- Header End -->
    </header>
    <main>
        <!--================login_part Area =================-->
        <section class="login_part section_padding " style="padding: 150px 0px;">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_text text-center" style="width: 100%; height: 50px; margin-bottom: 5%; background-image: none; background-color: #bf1f78fa;">
                            <div class="login_part_text_iner">
                                <h2>아이디가 뭐였지?</h2>
                                <a href="${contextPath}/member/idFind" class="btn_3">아이디 찾기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_text text-center" style="width: 100%; height: 50px; margin-bottom: 5%; background-image: none; background-color: #5a749afa;">
                            <div class="login_part_text_iner">
                                <h2>비밀번호가 뭐였지?</h2>
                                <a href="${contextPath}/member/pwFind" class="btn_3">비밀번호 찾기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================login_part end =================-->
    </main>
    <footer>
        
    </footer>
    	<jsp:include page="../include/Footer2.jsp" />
</body>
    
</html>