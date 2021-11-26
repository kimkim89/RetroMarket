<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />   
	
<script>
// 관리자가 아닐 경우 접근 불가능하도록 추가
if("${checkUserStatus}" != 1) {
	alert("접근 불가능");
	location.href = "${contextPath}/main/index";
}
</script>	
	
	<nav id="sidebar" class="sidebar">
		<div class="sidebar-content js-simplebar">
			<a class="sidebar-brand" href="index.html">
          		<span class="align-middle">아맞다매점 :)</span>
        	</a>

				<ul class="sidebar-nav">
					<li class="sidebar-item">
						<a class="sidebar-link" href="${contextPath}/admin/adminMember">
			              <i class="align-middle" data-feather="user"></i> <span class="align-middle">회원관리</span>
			            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${contextPath}/admin/adminVisitorLog">
			              <i class="align-middle" data-feather="credit-card"></i> <span class="align-middle">방문자로그</span>
			            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${contextPath}/adminOrder/orderList">
			              <i class="align-middle" data-feather="settings"></i> <span class="align-middle">주문관리</span>
			            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${contextPath}/admin/adminPoint">
			              <i class="align-middle" data-feather="book"></i> <span class="align-middle">포인트 관리</span>
			            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="${contextPath}/adminProd/adminProduct">
              				<i class="align-middle" data-feather="coffee"></i> <span class="align-middle">상품 관리</span>
            			</a>
					</li>
<!-- 					<li class="sidebar-header"> -->
<!-- 						Tools & Components -->
<!-- 					</li> -->
<!-- 					<li class="sidebar-item"> -->
<!-- 						<a href="javascript::" data-target="#ui" data-toggle="collapse" class="sidebar-link collapsed"> -->
<!-- 			              <i class="align-middle" data-feather="briefcase"></i> <span class="align-middle">상품 관리</span> -->
<!-- 			            </a> -->
<!-- 						<ul id="ui" class="sidebar-dropdown list-unstyled collapse " data-parent="#sidebar"> -->
<%-- 							<li class="sidebar-item"><a class="sidebar-link" href="${contextPath}/adminProd/adminProduct">상품 관리</a></li> --%>
<%-- 							<li class="sidebar-item"><a class="sidebar-link" href="${contextPath}/adminProd/adminInventory">재고 관리</a></li> --%>
<!-- 						</ul> -->
<!-- 					</li> -->
					<li class="sidebar-item">
						<a class="sidebar-link" href="${contextPath}/admin/adminEvent">
              				<i class="align-middle" data-feather="coffee"></i> <span class="align-middle">이벤트 관리</span>
            			</a>
					</li>
				</ul>
			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle d-flex">
          			<i class="hamburger align-self-center"></i>
        		</a>
				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="">
							<a class="nav-icon " href="${contextPath}/main/index" id="messagesDropdown" >
								<div class="position-relative">
									<i class="align-middle" data-feather="home"></i>
								</div>
							</a>							
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                				<span class="text-dark">관리자</span>
              				</a>
							<div class="dropdown-menu dropdown-menu-right">
								<a class="dropdown-item" href="${contextPath}/member/logout">로그아웃</a>
							</div>
						</li>
					</ul>
				</div>
			</nav>