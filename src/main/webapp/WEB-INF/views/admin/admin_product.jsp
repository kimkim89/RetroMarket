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

	<title>상품 관리</title>

	<link href="${contextPath}/resources/assets/admin/css/app.css" rel="stylesheet">
	<style>
		.form-control{ width:50%;height:auto; }
	</style>
</head>

<body>
	<div class="wrapper">
		<%@ include file="./include/sidebar.jsp" %>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3">상품관리</h1>

					<div class="row">
						<div class="col-md-3 col-xl-2">

							<div class="card">
								<div class="card-header">
									<h5 class="card-title mb-0">상품관리(동적으로 변경)</h5>
								</div>

								<div class="list-group list-group-flush" role="tablist">
									<a class="list-group-item list-group-item-action active" data-toggle="list" href="#account" role="tab">
							          	상품 목록
							        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#password" role="tab">
							          	상품 등록
							        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">
							          Privacy and safety
							        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">
							          Email notifications
							        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">
							          Web notifications
							        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">
          Widgets
        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">
          Your data
        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">
          Delete account
        </a>
								</div>
							</div>
						</div>

						<div class="col-md-9 col-xl-10">
							<div class="tab-content">
								<div class="tab-pane fade show active" id="account" role="tabpanel">
									<div class="card">
										<div class="card-header">

											<h5 class="card-title mb-0"><font style="color:red;">*상품 정보를 등록해주세요.</font></h5>
										</div>
										<div class="card-body">
											<form>
												<div class="row">
													<div class="mb-3 col-md-6">
														<label class="form-label" for="inputFirstName">상품 타입</label>
														<input type="text" class="form-control" id="mk_product_category">
													</div>
													<div class="mb-3 col-md-6">
														<label class="form-label" for="inputLastName">상품 종류</label>
														<select name="mk_product_type" id="mk_product_type">
															<option>과자</option>
															<option>사탕/초콜렛</option>
															<option>음료</option>															
														</select>
													</div>
												</div>
												<div class="mb-3">
													<label class="form-label" for="inputEmail4">상품명</label>
													<input type="email" class="form-control" id="mk_product_name">
												</div>
												<div class="mb-3">
													<label class="form-label" for="inputAddress">상품 가격(원)</label>
													<input type="text" class="form-control" id="mk_product_price">
												</div>
												<div class="mb-3">
													<label class="form-label" for="inputAddress2">재고량</label>
													<input type="text" class="form-control" id="mk_inventory">
												</div>
												
												<c:forEach var="i" begin="1" end="5"> 
												<div class="mb-3">
													<label class="form-label" for="inputAddress2">상품 이미지${i}</label>
													<input type="file" class="form-control" id="mk_upfile${i}">
												</div>							
												</c:forEach>
												
												
												<button type="submit" class="btn btn-primary">Save changes</button>
											</form>
										</div>
									</div>
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