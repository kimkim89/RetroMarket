<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script>
// 관리자가 아닐 경우 접근 불가능하도록 추가
// if("${user_id}" == "") {
// 	alert("로그인 후 사용 가능합니다.");
// 	location.href = "${contextPath}/main/index";
// }
</script>


<div class="col-lg-2 mypage-table" >
	<div class="blog_right_sidebar">
		<aside class="single_sidebar_widget post_category_widget">
			<a href="${contextPath}/mypage/myPageR"><h4 class="widget_title">고객센터</h4></a>
			<ul class="list cat-list" style="padding-left: 0em;">
<!-- 				<li> -->
<%-- 					<a href="${contextPath}/board/customerBoardList" class="d-flex"> --%>
<!-- 							<p>고객센터</p> -->
<!-- 					</a> -->
<!-- 				</li> -->
				<li>
					<a href="${contextPath}/board/customerBoardList?board_type=1" class="d-flex">
							<p>상품문의</p>
					</a>
				</li>
				<li>
					<a href="${contextPath}/board/customerBoardList?board_type=2" class="d-flex">
							<p>배송문의</p>
					</a>
				</li>
				<li>
					<a href="${contextPath}/board/customerBoardList?board_type=3" class="d-flex">
							<p>변경/취소</p>
					</a>
				</li>
				<li>
					<a href="${contextPath}/board/customerBoardList?board_type=4" class="d-flex">
							<p>교환/반품</p>
					</a>
				</li>
				<li>
					<a href="${contextPath}/board/customerBoardList?board_type=5" class="d-flex">
							<p>입금확인</p>
					</a>
				</li>
				<li>
					<a href="${contextPath}/board/customerBoardList?board_type=6" class="d-flex">
							<p>기타</p>
					</a>
				</li>
			</ul>
		</aside>

	</div>
</div>