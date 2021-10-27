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

	<title>Settings | AdminKit Demo</title>

	<link href="${contextPath}/resources/assets/admin/css/app.css" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<%@ include file="./include/sidebar.jsp" %>

			<main class="content">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h5 class="card-title">Always responsive</h5>
									<h6 class="card-subtitle text-muted">Across every breakpoint, use <code>.table-responsive</code> for horizontally scrolling tables.</h6>
								</div>
								<div class="table-responsive">
									<table class="table mb-0">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">주문번호</th>
												<th scope="col">주문자</th>
												<th scope="col">아이디</th>
												<th scope="col">쿠폰</th>
												<th scope="col">주문금액</th>
												<th scope="col">입금액</th>
												<th scope="col">주문일시</th>
												<th scope="col">미수금</th>
												<th scope="col">수정</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>Cell</td>
												<td>Cell</td>
												<td>Cell</td>
												<td>Cell</td>
												<td>Cell</td>
												<td>Cell</td>
												<td>Cell</td>
												<td>Cell</td>
												<td>Cell</td>
											</tr>											
										</tbody>
									</table>
								</div>
							</div>
						</div>
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