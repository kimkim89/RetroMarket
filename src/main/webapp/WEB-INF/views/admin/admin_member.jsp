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

	<title>회원관리</title>

<link href="${contextPath}/resources/assets/admin/css/app.css" rel="stylesheet">

<script type="text/javascript">
	//알림 메시지
	if("${msg}" != "") {
	 	alert("${msg}");
	 }
	
	function adminMemberList() {
		document.getElementById('memList').submit();
		return false;
	}
</script>

</head>
<body>
	<div class="wrapper">
		<jsp:include page="./include/sidebar.jsp" />
			<main class="content">
				<div class="container-fluid p-0">
					<h1 class="h3 mb-3">회원정보관리</h1><br>
					<h2 class="h3 mb-3">Total: ${memCount}</h2>
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
								<button type="button" class="btn btn-info" style="float:right;" onclick="registerPage();">회원등록</button>						
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
												<th scope="col">회원등급</th>
												<th scope="col">포인트</th>										
												<th class="col">수정</th>
												<th class="col">삭제</th>
											</tr>
										</thead>
										<tbody>
									<c:choose>
										<c:when test="${map.nowPage!=1}">
											<c:set var="num" value="${map.nowPage+(3*(map.nowPage-1))}" />
										</c:when>
										<c:when test="${map.nowPage == 1}">
											<c:set var="num" value="1"/>
										</c:when>
									</c:choose>
										<c:forEach var="List" items="${memberList}" varStatus="status">	
											<tr>
												<th scope="row">${num}</th>
												<td>${List.id}</td>
												<td>${List.name}</td>
												<td>${List.nickname}</td>
												<td>${List.phone}</td>
												<td>${List.email}</td>
												<td>
													<c:choose>
														<c:when test="${List.level == 1}">
															일반회원
														</c:when>
														<c:when test="${List.level == 2}">
															VIP회원
														</c:when>
														<c:when test="${List.level == 3}">
															VVIP회원
														</c:when>
													</c:choose>
												</td>
												<td>POINT</td>											
												<td><a href="${contextPath}/admin/adminMemberInfo?wu=u&id=${List.id}"><i class="align-middle" data-feather="edit-2"></i></a></td>
												<td><a href="${contextPath}/admin/adminMemDel?id=${List.id}"><i class="align-middle" data-feather="trash"></i></a></td>
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

	<script src="${contextPath}/resources/admin/js/app.js"></script>
	<!-- 20210403 페이지 이동 -->
	<script>
	function registerPage() {
		location.href="${contextPath}/admin/adminRegister";
	}
	</script>

</body>

</html>