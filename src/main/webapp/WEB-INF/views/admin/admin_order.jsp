<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<title>주문 내역</title>
	<link href="${contextPath}/resources/assets/admin/css/app.css" rel="stylesheet">

	<script type="text/javascript">
		function searchOrderList() {
			document.getElementById('prodSearch').submit(); 
			return false;
		}
	</script>

</head>

<body>
	<div class="wrapper">
		<%@ include file="./include/sidebar.jsp" %>

			<main class="content">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
								<form name="prodSearch" id="prodSearch" class="d-none d-sm-inline-block" action="${contextPath}/adminOrder/orderList" method="post">									
									<div class="input-group input-group-navbar">
										<select name="searchField" class="form-select" aria-label="Default select example">
											<option value="order_name">주문자명</option>
											<option value="order_code">주문번호</option>
											<option value="member_id">아이디</option>
										</select>&nbsp;&nbsp; 
										<input type="text" name="keyword" class="form-control" placeholder="" aria-label="Search">
										<button type="button" class="btn" onclick="searchOrderList();">
											<i class="align-middle" data-feather="search"></i>
										</button>
										&nbsp;&nbsp;
									</div>
								</form>
								<button type="button" class="btn btn-info btn_delete" style="float: right;" onclick="">Later</button>								
							</div>
<br>
								<div class="table-responsive">
									<table class="table mb-0">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">주문번호</th>
												<th scope="col">주문자</th>
<!-- 												<th scope="col">아이디</th> -->												
												<th scope="col">주문금액</th>
												<th scope="col">입금액</th>
<!-- 												<th scope="col">적립금 추가</th> -->
												<th scope="col">적립금 사용</th>
												<th scope="col">주문일시</th>
												<th scope="col">수정</th>
											</tr>
										</thead>
										<tbody>
										<c:choose>
										<c:when test="${pagingMap.nowPage!=1}">
											<c:set var="num" value="${pagingMap.nowPage+(3*(pagingMap.nowPage-1))}" />
										</c:when>
										<c:when test="${pagingMap.nowPage == 1}">
											<c:set var="num" value="1"/>
										</c:when>
										</c:choose>
										<c:forEach var="odList" items="${csOrderList}" varStatus="status">
											<tr>
												<th scope="row">${num}</th>
												<td>${odList.order_code}</td>
												<td>${odList.order_name}</td>
<%-- 												<td>${odList.member_id}</td> --%>												
												<td><fmt:formatNumber value="${odList.total_order_price}" pattern="#,###"/>원</td>
												<td><fmt:formatNumber value="${odList.paid_price}" pattern="#,###"/>원</td>												
<%-- 												<td><fmt:formatNumber value="${odList.added_point}" pattern="#,###"/>원</td> --%>
												<td><fmt:formatNumber value="${odList.used_point}" pattern="#,###"/>원</td>
												<td><fmt:formatDate value="${odList.order_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td>
													<a href="${contextPath}/adminOrder/orderForm?wu=u&id=${odList.order_idx}">
														<i class="align-middle" data-feather="edit-2"></i>
													</a>
												</td>
											</tr>
										<c:set var="num" value="${num+1}"/>	
										<input type="hidden" name="order_number" id="order_number" value="${odList.order_code}" />
										</c:forEach>												
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<nav aria-label="Page navigation example">
							<ul class="pagination pagination-md">
								<c:if test="${pagingMap.blockFirst != 1}">
									<li class="page-item"><a class="page-link"
										href="${contextPath}/adminOrder/orderList?nowPage=${pagingMap.blockFirst-1}&searchField=${searchField}&keyword=${keyword}"><i
											class="fas fa-angle-left"></i></a></li>
								</c:if>
								<c:forEach begin="${pagingMap.blockFirst}" end="${pagingMap.blockLast}" var="i">
									<li class="page-item">
										<a href="${contextPath}/adminOrder/orderList?nowPage=${i}&searchField=${searchField}&keyword=${keyword}" class="page-link" >${i}</a>
									</li>
								</c:forEach>
								<c:if test="${pagingMap.totalPage != pagingMap.blockLast}">
									<li class="page-item">
										<a class="page-link" href="${contextPath}/adminOrder/orderList?nowPage=${pagingMap.blockLast+1}&searchField=${searchField}&keyword=${keyword}">
											<i	class="fas fa-angle-right"></i>
										</a>
									</li>
								</c:if>
							</ul>
						</nav>						
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-left">
							<p class="mb-0">
								<a href="index.html" class="text-muted"><strong>AdminKit Demo</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-right">
							<ul class="list-inline">
								<li class="list-inline-item">
									<a class="text-muted" href="#">Support</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="#">Help Center</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="#">Privacy</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="#">Terms</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="${contextPath}/resources/admin/js/app.js"></script>

</body>

</html>