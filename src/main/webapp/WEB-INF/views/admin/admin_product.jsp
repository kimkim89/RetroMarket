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
		
		.flex-container {
			display: inline-flex;
			flex-direction: row;
		}
		
		
	</style>
</head>

<body>
	<div class="wrapper">
		<%@ include file="./include/sidebar.jsp" %>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3">상품관리</h1>

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
								<form name="memList" class="d-none d-sm-inline-block" action="${contextPath}/admin/adminMember" method="get">																				
									<div class="input-group input-group-navbar">
										<select name="searchField" class="form-select" aria-label="Default select example">
										  
										  <option value="id">아이디</option>
										  <option value="name">이름</option>
										  <option value="phone">연락처</option>
										  <option value="email">이메일</option>
										</select>&nbsp;&nbsp; 
										<input type="text" name="keyword" class="form-control" placeholder="" aria-label="Search">																				
										<button type="button" class="btn" onclick="adminMemberList();">
				              			<i class="align-middle" data-feather="search"></i>
				            			</button>&nbsp;&nbsp; 				            			
									</div>									
								</form>
								<button type="button" class="btn btn-info" style="float:right;" onclick="registerPage();">선택 삭제</button>						
								<button type="button" class="btn btn-info" style="float:right; margin: auto 10px;" onclick="registerPage();">상품 등록</button>
								</div>


								<div>
								<div class="card">
									<div class="card-header">
										<h5 class="card-title">Bordered Table</h5>
										<h6 class="card-subtitle text-muted">Add <code>.table-bordered</code> for borders on all sides of the table and cells.</h6>
									</div>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th><input type="checkbox" name="del_check_all" id="del_check_all"/></th>
												<th>#</th>
												<th style="width:40%;">상품정보</th>
												<th style="width:25%">상품가격 및 재고량</th>
												<th class="d-none d-md-table-cell" style="width:25%">등록날짜</th>
												<th>Actions</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="checkbox" name="del_check" id="del_check"/></td>
												<td>1</td>
												<td style="vertical-align: middle;">
													
																											
															<div class="flex-container">															
																<div class= "flex-item">
																	<img src="${contextPath}/resources/assets/img/blog/blog_2.png" style="width:150px;">
																</div>
																<div class= "flex-item" >
																
																  	상품명: 하리보 젤리																
																  	
																</div>							
															</div>
													
												</td>
												
												<td>5000원 / 500개</td>
												<td class="d-none d-md-table-cell">2021.04.28</td>
												<td class="table-action">
													<a href="#"><i class="align-middle" data-feather="edit-2"></i></a>
													<a href="#"><i class="align-middle" data-feather="trash"></i></a>
												</td>
											</tr>											
										</tbody>
									</table>
								</div>
							</div>
							</div>
							</div>
							
							
						</div>						
						<nav aria-label="Page navigation example">
							<ul class="pagination pagination-md">
								<c:if test="${map.blockFirst != 1}">								
								<li class="page-item"><a class="page-link" href="${contextPath}/admin/adminMember?nowPage=${map.blockFirst-1}&searchField=${searchField}&keyword=${keyword}"><i class="fas fa-angle-left"></i></a></li>								
								</c:if>
								<c:forEach begin="${map.blockFirst}" end="${map.blockLast}" var="i">
								<li class="page-item"><a href="${contextPath}/admin/adminMember?nowPage=${i}&searchField=${searchField}&keyword=${keyword}" class="page-link" >${i}</a></li>
								</c:forEach>
								<c:if test="${map.totalPage != map.blockLast}">
								<li class="page-item"><a class="page-link" href="${contextPath}/admin/adminMember?nowPage=${map.blockLast+1}&searchField=${searchField}&keyword=${keyword}"><i class="fas fa-angle-right"></i></a></li>
								</c:if>
							</ul>
						</nav>	
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