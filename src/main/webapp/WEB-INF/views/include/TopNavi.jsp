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
                            <a href="${contextPath}/index/main" id="zzz"><img src="${contextPath}/resources/assets/img/logo/MainLogo1.png" alt="" style="height: 75px; "></a>
                        </div>
                        <!-- Main-menu -->
                        <div class="main-menu d-none d-lg-block">
                            <nav>                                                
                                <ul id="navigation">  
                                    <li><a href="${contextPath}/index/main">메인</a></li>
                                    <li class="hot"><a href="${contextPath}/product/productList">인기 코너</a></li>
                                    <li><a href="${contextPath}/product/productList">과자 코너</a></li>
                                    <li><a href="${contextPath}/product/productList">젤리 코너</a></li>
                                    <li><a href="${contextPath}/product/productList">캔디 코너</a></li>
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
                            	<li><a href="${contextPath}/buy/cartList"><span class="flaticon-shopping-cart"></span></a> </li>
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