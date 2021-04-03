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

	<title>Profile | AdminKit Demo</title>

<link href="${contextPath}/resources/assets/admin/css/app.css" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<jsp:include page="./include/sidebar.jsp" />
			<main class="content">
				<div class="container-fluid p-0">
					<h1 class="h3 mb-3">회원정보관리</h1>
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
								<form class="d-none d-sm-inline-block">				
									<div class="input-group input-group-navbar">
										<select class="form-select" aria-label="Default select example">
										  <option selected>회원정보</option>
										  <option value="1">아이디</option>
										  <option value="2">이름</option>
										  <option value="3">연락처</option>
										  <option value="3">이메일</option>
										</select>&nbsp;&nbsp; 
										<input type="text" class="form-control" placeholder="" aria-label="Search">																				
										<button class="btn" type="button">
				              			<i class="align-middle" data-feather="search"></i>
				            			</button>&nbsp;&nbsp; 				            			
									</div>									
								</form>		
								<button class="btn btn-info" style="float:right;">회원등록</button>						
								</div>
								<div class="table-responsive">
									<table class="table mb-0">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">아이디</th>
												<th scope="col">이름</th>
												<th scope="col">닉네임</th>
												<th scope="col">연락처</th>
												<th scope="col">이메일</th>												
												<th class="col">수정</th>
												<th class="col">삭제</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="List" items="${memberList}">
											<tr>
												<th scope="row">#</th>
												<td>${List.name}</td>
												<td>${List.phone }</td>
												<td>${List.email }</td>
												<td>${List.address1 }</td>
												<td>${List.address2 }</td>												
												<td><a href="#"><i class="align-middle" data-feather="edit-2"></i></a></td>
												<td><a href="#"><i class="align-middle" data-feather="trash"></i></a></td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
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