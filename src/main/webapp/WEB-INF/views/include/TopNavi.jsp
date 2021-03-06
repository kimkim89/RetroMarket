<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- Header Start -->
        <div class="header-area">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="menu-wrapper">
                        <!-- Logo -->
                        <div class="logo" >
                            <a href="${contextPath}/main/index" id="zzz"><img src="${contextPath}/resources/assets/img/logo/MainLogo1.png" alt="" style="height: 75px; "></a>
                        </div>
                        <!-- Main-menu -->
                        <div class="main-menu d-none d-lg-block">
                            <nav>                                                
                                <ul id="navigation">  
                                	<li><a href="${contextPath}/main/index">메인</a></li>
                                    <li class="hot"><a href="${contextPath}/product/prList?prCode=all">모든 상품</a></li>
                                    <li><a href="${contextPath}/product/prList?prCode=snack">과자</a></li>
                                    <li><a href="${contextPath}/product/prList?prCode=jellycandy">젤리/캔디</a></li>
                                    <li><a href="${contextPath}/product/prList?prCode=etc">기타</a></li>
<!--                                     <li><a href="#">이벤트</a></li> -->
                                    <li><a href="${contextPath}/board/customerBoardList?board_type=1">고객센터</a></li>
                                    <li><a href="${contextPath}/product/temporary">Contact Developer</a></li>
                                </ul>
                            </nav>
                        </div>
                        <!-- Header Right -->
                        <div class="header-right">
                            <ul>
                             <c:choose>
                            	<c:when test="${user_id != null}">
                            	<li><b>${user_id}</b>님 반갑습니다.</li>
                            	<li> <a href="${contextPath}/member/mypage"><span class="flaticon-user"></span></a></li>
                            	<li><a href="${contextPath}/cart/prCart"><span class="flaticon-shopping-cart"></span></a> </li>
                            	</c:when>
                            	<c:otherwise>
                                <li> <a href="${contextPath}/member/login"><span class="flaticon-user"></span></a></li>
                                </c:otherwise>
                             </c:choose>
                            </ul>
                        </div>
                    </div>
                    <!-- Mobile Menu -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->