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
	<script src="${contextPath}/resources/lib/ckeditor/ckeditor.js"></script>
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
						
						<div class="col-md-9 col-xl-10">
							<div class="tab-content">
								<div class="tab-pane fade show active" id="account" role="tabpanel">
									<div class="card">
										<div class="card-header">

											<h5 class="card-title mb-0"><font style="color:red;">*상품 정보를 등록해주세요.</font></h5>
										</div>
										<div class="card-body">
											<form name="product_form" action="${contextPath}/adminProd/adminProdInsert" enctype="multipart/form-data" method="post">
												<div class="row">
													<div class="mb-3 col-md-4"  style="display:inline-block;">
														<label class="form-label" for="mk_status">게시 여부</label>
														<select class="form-select" name="mk_status" id="mk_status">
														  <option value="1" >O</option>
														  <option value="0">X</option>														  													   
														</select>														
													</div>
												</div>
												<div class="row">
													<div class="mb-3 col-md-4"  style="display:inline-block;">
														<label class="form-label" for="mk_product_type">상품 분류</label>
														<select class="form-select" name="mk_product_type" id="mk_product_type">
														  <option value="" >상품 분류</option>
														  <option value="1">신상품</option>
														  <option value="2">인기상품</option>
														  <option value="3">할인상품</option>														   
														</select>														
													</div>
												</div>
												<div class="row">
													<div class="mb-3 col-md-4"  style="display:inline-block;">
														<label class="form-label" for="mk_product_category">상품 종류</label>
														<select class="form-select" name="mk_product_category" id="mk_product_category">
														  <option value="" >상품 종류</option>
														  <option value="1">스낵</option>
														  <option value="2">젤리</option>
														  <option value="3">캔디</option>
														  <option value="4">기타</option>
														</select>														
													</div>
												</div>
												<div class="mb-3">
													<label class="form-label" for="mk_product_name">상품명</label>
													<input type="text" class="form-control" name="mk_product_name" id="mk_product_name" value="">
												</div>
												<div class="mb-3">
													<label class="form-label" for="mk_product_id">상품코드</label>
													<input type="text" class="form-control" name="mk_product_id" id="mk_product_id" value="">
												</div>
												<div class="mb-3">
													<label class="form-label" for="mk_product_price">상품 가격(원)</label>
													<input type="text" class="form-control" name="mk_product_price" id="mk_product_price" value="">
												</div>
												<div class="mb-3">
													<label class="form-label" for="mk_inventory">재고량</label>
													<input type="number" class="form-control" name="mk_inventory" id="mk_inventory" value="">
												</div>
												<div class="mb-3">
													<label class="form-label" for=mk_original_thumb>상품 썸네일(상품목록용)</label>
													<input type="file" class="form-control" name="mk_original_thumb" id="mk_original_thumb" value="">
												</div>		
												<div class="mb-3">
													<label class="form-label" for="mk_original_upfile">상품 이미지(상품상세보기)</label>
													<input type="file" class="form-control" name="mk_upfile" id="mk_original_upfile" value="">
												</div>							
												<div class="mb-3">
													<label class="form-label" for="mk_content">상품 설명</label>
													<textarea class="form-control" name="mk_content" id="mk_content"></textarea>
													<script>
														CKEDITOR.replace('mk_content');
													</script>
												</div>	
												<input type="button" class="btn btn-primary" value="등록"/>
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