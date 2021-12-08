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

	<title>회원 포인트 관리</title>

	<link href="${contextPath}/resources/assets/admin/css/app.css" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<jsp:include page="./include/sidebar.jsp" />
			<main class="content">
				<div class="container-fluid p-0">
					<h1 class="mb-3">포인트 관리</h1>
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
								<span class="btn btn-info" style="background-color:lightcoral; border:solid 1px lightcoral;pointer-events: none;">포인트내역  ${pointRows}개</span>
								<form name="memList" class="d-none d-sm-inline-block" action="${contextPath}/admin/adminPoint" method="get">
																					
									<div class="input-group input-group-navbar">
										<select name="searchField" class="form-select" aria-label="Default select example">										  
										  <option value="id">아이디</option>
										  <option value="name">이름</option>
										  <option value="phone">연락처</option>
										  <option value="email">이메일</option>
										</select>&nbsp;&nbsp; 
										<input type="text" name="keyword" class="form-control" placeholder="" aria-label="Search">																				
										<button type="submit" class="btn btn-info" onclick="">
				              				<i class="align-middle" data-feather="search"></i>
				            			</button>&nbsp;&nbsp; 				            			
									</div>																	
								</form>											
								</div>
								<div class="table-responsive">
									<table class="table mb-0">
										<thead>
											<tr>												
												<th scope="col">#</th>
												<th scope="col">회원ID</th>
												<th scope="col">종류</th>
												<th scope="col">내용</th>
												<th scope="col">적립금</th>
												<th scope="col">일시</th>																																			
											</tr>
										</thead>
										<tbody>
									<c:choose>
										<c:when test="${map.nowPage!=1}">
											<c:set var="num" value="${map.nowPage+(10*(map.nowPage-1))-(map.nowPage-1)}" />
										</c:when>
										<c:when test="${map.nowPage == 1}">
											<c:set var="num" value="1"/>
										</c:when>
									</c:choose>
										<c:forEach var="List" items="${pointList}" varStatus="status">	
											<tr>												
												<td scope="row">${num}</td>
												<td>${List.id}</td>
												<td>
													<c:choose>
														<c:when test="${List.mp_point_type==1}">상품구매</c:when>
														<c:when test="${List.mp_point_type==2}">상품평</c:when>
														<c:when test="${List.mp_point_type==3}">이벤트</c:when>
														<c:when test="${List.mp_point_type==4}">기타</c:when>
													</c:choose>
												</td>
												<td>${List.mp_detail}</td>
												<td>${List.mp_point}</td>
												<td><fmt:formatDate value="${List.mp_datetime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>																							
											</tr>
											<c:set var="num" value="${num+1}"/>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<nav aria-label="Page navigation example">
						<ul class="pagination pagination-md">
							<c:if test="${map.blockFirst != 1}">								
							<li class="page-item"><a class="page-link" href="${contextPath}/admin/adminPoint?nowPage=${map.blockFirst-1}&searchField=${searchField}&keyword=${keyword}"><i class="fas fa-angle-left"></i></a></li>								
							</c:if>
							<c:forEach begin="${map.blockFirst}" end="${map.blockLast}" var="i">
							<li class="page-item"><a href="${contextPath}/admin/adminPoint?nowPage=${i}&searchField=${searchField}&keyword=${keyword}" class="page-link" >${i}</a></li>
							</c:forEach>
							<c:if test="${map.totalPage != map.blockLast}">
							<li class="page-item"><a class="page-link" href="${contextPath}/admin/adminPoint?nowPage=${map.blockLast+1}&searchField=${searchField}&keyword=${keyword}"><i class="fas fa-angle-right"></i></a></li>
							</c:if>
						</ul>
					</nav>	
				</div>
			</main>

<%@ include file="./include/admin_bottom.jsp" %>	

	<script src="${contextPath}/resources/admin/js/app.js"></script>

</body>

</html>