<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">

	<%@ include file="../include/Top.jsp"%>
	<link href="${contextPath}/resources/assets/admin/css/app.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
		.list { width: 100%; }
		.btn::before {background:transparent;}
		.form-select {background-image: url("")}
	</style>
</head>

<body style="background-color:white;">
	<header>
		<!-- Header Start -->
		<jsp:include page="../include/TopNavi.jsp" />
		<!-- Header End -->
	</header>
	<main style="background-color: white;">
	
		<!--=============== Subtitle 시작 ================-->
		<jsp:include page="../include/subtitle.jsp" />
		<!--=============== Subtitle 끝 ================-->
		
		<!--================Blog Area =================-->
		<section class="blog_area section-padding" style="margin: 0% 0% 0% 8%;;">
			<div class="gallery-area">
				<div class="row">
					<jsp:include page="./include/boardSide.jsp" />
					<div class="col-lg-8 mb-5 mb-lg-0"
						style="margin: 3%; margin-top: 1%;">
						<!--================ 고객센터 게시판 목록 시작 =================-->
						
						<div class="col-12">
							<div class="card">
								<div class="card-header">
								<span class="btn btn-info" style="background-color:lightcoral; border:solid 1px lightcoral;pointer-events: none;">Total : ${dataCnt}</span>
								<form name="searchForm" id="searchForm" class="d-none d-sm-inline-block" action="${contextPath}/board/customerBoardList?board_type=${boardType}" method="post">									
									<div class="input-group input-group-navbar">
										<select name="searchField" id="searchField" class="form-select" aria-label="Default select example" >
											<option value="cs_writer_id">작성자ID</option>
											<option value="cs_subject">제목</option>
											<option value="cs_content">내용</option>
										</select>&nbsp;&nbsp; 
										<input type="text" name="keyword" class="form-control" placeholder="검색어를 입력하세요!" aria-label="Search">
										<button type="button" class="btn" id="searchBtn" onclick="searchList();">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</form>
								<c:if test="${accChk == 1}">
									<button type="button" class="btn btn-info" style="float:right;" onclick="writePage();">글쓰기</button>
								</c:if>
							</div>
								<div class="table-responsive">
									<table class="table mb-0">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">제목</th>
												<th scope="col">작성자</th>												
												<th scope="col">작성일</th>
											</tr>
										</thead>
										<tbody>
										<c:choose>
										<c:when test="${pagingMap.nowPage!=1}">
											<c:set var="num" value="${pagingMap.nowPage+(10*(pagingMap.nowPage-1))-(pagingMap.nowPage-1)}" />
										</c:when>
										<c:when test="${pagingMap.nowPage == 1}">
											<c:set var="num" value="1"/>
										</c:when>
										</c:choose>
										<c:forEach var="boardList" items="${boardList}" varStatus="status">
											<tr>
												<th scope="row">${num}</th>
												<td><a href="${contextPath}/board/customerBoardRead?board_type=${boardType}&board_num=${boardList.cs_idx}" style="color:black;">${boardList.cs_subject}</a></td>
<%-- 													<td><a href="${contextPath}/board/checkPassPage?board_type=${boardType}&board_num=${boardList.cs_idx}" style="color:black;">${boardList.cs_subject}</a></td> --%>
												<td>
													<c:choose>
														<c:when test="${boardList.cs_reply == 1}">
															${boardList.cs_writer_name}
														</c:when>
														<c:otherwise>
															<c:set var="writer_name" value="${boardList.cs_writer_name}" />
															${fn:substring(writer_name, 0,1) }○○
														</c:otherwise>
													</c:choose>
												</td>					
												<td><fmt:formatDate value="${boardList.cs_wdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
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
										href="${contextPath}/board/customerBoardList?board_type=${boardType}&nowPage=${pagingMap.blockFirst-1}&searchField=${searchField}&keyword=${keyword}"><i
											class="fas fa-angle-left"></i></a></li>
								</c:if>
								<c:forEach begin="${pagingMap.blockFirst}" end="${pagingMap.blockLast}" var="i">
									<li class="page-item">
										<a href="${contextPath}/board/customerBoardList?board_type=${boardType}&nowPage=${i}&searchField=${searchField}&keyword=${keyword}" class="page-link" >${i}</a>
									</li>
								</c:forEach>
								<c:if test="${pagingMap.totalPage != pagingMap.blockLast}">
									<li class="page-item">
										<a class="page-link" href="${contextPath}/board/customerBoardList?board_type=${boardType}&nowPage=${pagingMap.blockLast+1}&searchField=${searchField}&keyword=${keyword}">
											<i class="fas fa-angle-right"></i>
										</a>
									</li>
								</c:if>
							</ul>
						</nav>
						<!--================ 고객센터 게시판 목록 끝 =================-->
					</div>
				</div>
			</div>
		</section>
	<script>
		function writePage() {
			location.href="${contextPath}/board/customerBoardForm?board_type=${boardType}&wu=i";
		}
		
		function searchList() {
			document.getElementById('searchForm').submit();
		}
		
		
	</script>	
		
		<!--================Blog Area =================-->
	</main>
	<footer> </footer>
	<jsp:include page="../include/Footer.jsp" />
</body>
</html>