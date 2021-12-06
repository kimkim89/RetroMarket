<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html lang="en">

<head>

<%@ include file="./include/admin_top.jsp" %>

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
					<h1 class="mb-3">회원정보관리</h1>					
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
								<span class="btn btn-info" style="background-color:lightcoral; border:solid 1px lightcoral;pointer-events: none;">총회원수 ${memCount}명</span>
								<form name="memList" id="memList" class="d-none d-sm-inline-block" action="${contextPath}/admin/adminMember" method="get">
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
											<c:set var="num" value="${map.nowPage+(10*(map.nowPage-1))-(map.nowPage-1)}" />
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
														<c:otherwise>
															관리자
													</c:otherwise>
													</c:choose>
												</td>
												<td>${List.point}</td>											
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

	<script src="${contextPath}/resources/admin/js/app.js"></script>
	
	<script>
		function registerPage() {
			location.href="${contextPath}/admin/adminRegister";
		}
	</script>
	
<%@ include file="./include/admin_bottom.jsp" %>	

</body>

</html>