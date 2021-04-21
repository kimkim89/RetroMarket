<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<div class="col-lg-2 mypage-table" >
	<div class="blog_right_sidebar">
		<aside class="single_sidebar_widget post_category_widget">
			<h4 class="widget_title">회원 정보</h4>
			<ul class="list cat-list">
				<li><a href="${contextPath}" class="d-flex">
						<p>회원 정보 수정</p>
				</a></li>
				<li><a href="#" class="d-flex">
						<p>주문 내역 조회</p>
				</a></li>
				<li><a href="#" class="d-flex">
						<P>결제 내역 조회</P>
				</a></li>
				<li><a href="#" class="d-flex">
						<p>할인 쿠폰</p>
				</a></li>
				<li><a href="#" class="d-flex">
						<p>최근 본 상품</p>
				</a></li>
				<li><a href="#" class="d-flex">
						<p>장바구니 조회</p>
				</a></li>
			</ul>
		</aside>

	</div>
</div>