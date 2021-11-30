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
				<h1 class="mb-3">회원접속로그</h1>
						<div class="col-12">
							<div class="card">
								<div class="card-header">
								<span class="btn btn-info" style="background-color:lightcoral; border:solid 1px lightcoral;pointer-events: none;">접속로그결과: ${resultCnt}개</span>
								<form name="prodSearch" id="prodSearch" class="d-none d-sm-inline-block" action="" method="post">									
									<div class="input-group input-group-navbar">
										<select name="searchField" class="form-select" aria-label="Default select example">
											<option value="login_id">회원아이디</option>
											<option value="login_ip">회원IP</option>
										</select>&nbsp;&nbsp; 
										<input type="text" name="keyword" class="form-control" placeholder="" aria-label="Search">
										<button type="button" class="btn" onclick="searchOrderList();">
											<i class="align-middle" data-feather="search"></i>
										</button>
										&nbsp;&nbsp;
									</div>
								</form>

							</div>
								<div class="table-responsive">
									<table class="table mb-0">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">회원아이디</th>
												<th scope="col">회원IP</th>												
												<th scope="col">사용 브라우저</th>
												<th scope="col">방문자 접속경로</th>
												<th scope="col">방문 날짜</th>
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
										<c:forEach var="infoList" items="${infoList}" varStatus="status">
											<tr>
												<th scope="row">${num}</th>
												<td>${infoList.login_id}</td>
												<td>${infoList.login_ip}</td>											
												<td>${infoList.login_browser}</td>
												<td>${infoList.login_reference}</td>												
												<td><fmt:formatDate value="${infoList.login_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
											</tr>
										<c:set var="num" value="${num+1}"/>	
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
										href="${contextPath}/adminLog/loginInfoList?nowPage=${pagingMap.blockFirst-1}&searchField=${searchField}&keyword=${keyword}"><i
											class="fas fa-angle-left"></i></a></li>
								</c:if>
								<c:forEach begin="${pagingMap.blockFirst}" end="${pagingMap.blockLast}" var="i">
									<li class="page-item">
										<a href="${contextPath}/adminLog/loginInfoList?nowPage=${i}&searchField=${searchField}&keyword=${keyword}" class="page-link" >${i}</a>
									</li>
								</c:forEach>
								<c:if test="${pagingMap.totalPage != pagingMap.blockLast}">
									<li class="page-item">
										<a class="page-link" href="${contextPath}/adminLog/loginInfoList?nowPage=${pagingMap.blockLast+1}&searchField=${searchField}&keyword=${keyword}">
											<i	class="fas fa-angle-right"></i>
										</a>
									</li>
								</c:if>
							</ul>
						</nav>						
			</main>

	<script src="${contextPath}/resources/admin/js/app.js"></script>

<%@ include file="./include/admin_bottom.jsp" %>	

</body>

</html>