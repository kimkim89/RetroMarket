<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en-US" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>돼지 김민지</title>
    <%@ include file="../include/Top.jsp" %>
    
<script type="text/javascript">


if("${notice}" != "") {
 	alert("${notice}");
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
        <!--================login_part Area =================-->
        <section class="login_part section_padding " style="padding: 150px 0px;">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_text text-center" style="min-width: 100%; background-image: none; background-color: #3a4f77e8;">
                            <div class="login_part_text_iner" >
                                <h2>아직 회원이 아니신가요? ?</h2>
                                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지금 회원가입 하면 바삭바삭한 혜택이 한 가득!! &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>             
									1분만에 회원가입 하고!   간식사고!   적립받자!</p>
                                <a href="${contextPath}/member/joinPage" class="btn_3">가입하러 가기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_form">
                            <div class="login_part_form_iner">
                                <h3>로그인을 해주세요</h3>
                                <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="name" name="name" value=""
                                            placeholder="UserID">
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="password" class="form-control" id="password" name="password" value=""
                                            placeholder="Password">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <div class="creat_account d-flex align-items-center">
                                            <input type="checkbox" id="f-option" name="selector">
                                            <label for="f-option">ID 기억하기</label>
                                        </div>
                                        <button type="button" value="submit" class="btn_3">
                                            	로그인
                                        </button>
                                        <a class="lost_pass" href="${contextPath}/member/findPage">ID/비밀번호 찾기</a>
                                    </div>
                                </form>
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