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
	<link href="${contextPath}/resources/assets/admin/css/app.css" rel="stylesheet">
	<%@ include file="./include/admin_top.jsp" %>
	<title>상품 관리</title>
	
	<script src="${contextPath}/resources/lib/ckeditor/ckeditor.js"></script>
	
	<script type="text/javascript">
		function adminProdInsert() {
			var form = document.product_form;
			form.action="${contextPath}/adminProd/adminProdInsert"
			form.submit();
			//location.href="${contextPath}/adminProd/adminProdInsert";
		}
		
		function adminProdUpdate() {
			var form = document.product_form;
			form.action="${contextPath}/adminProd/adminProdUpdate"
			form.submit();
			//location.href="${contextPath}/adminProd/adminProdUpdate";
		}
		
		/*20210624 상품종류 select 박스 선택 시 상품 코드 자동으로 만들어지도록 작업 진행 중*/
		function addProdCode(optionValue, totalCategories) {
			//console.log(optionValue);
			var productCode = document.getElementById("mk_product_id").value;
			var prodAlphabetCode = 64;
			var alphabetArray = [];
			
			
			$.ajax({
				type: "POST",
				contentType: 'application/json; charset=UTF-8',
				url: "${contextPath}/adminProd/ajaxProductCode",
				async: false,
				data: JSON.stringify({ categoryOptionValue : optionValue }),
				dataType: "text",
				success: function(jdata) {
					if(jdata.length == 0) {
						alert("error 발생");
					}else {
						$(jdata).each(function(i){
							productCode == jdata[i].productCode;
						});
					}
				}, error: function(xhr) {
					console.log(xhr.responseText);
					alert("처리할 수 없음");
					return;
				}
			});		
			
			
			
			for(i=1; i<=26; i++) {
				productCategoryCode = prodAlphabetCode+i;
							
				alphabetArray[i] = productCategoryCode;				
				
				if(i==productCode) {
					
				}
				//console.log(String.fromCharCode(alphabetArray[i]));
			}
			
			
			
			
			
			
			
			console.log(totalProdCategory);
		}
		
		
	</script>
	
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
											<form name="product_form" id="product_form" enctype="multipart/form-data" method="post">
												<input type="hidden" name="mk_idx" id="mk_idx" value="${prodList.mk_idx}"/>												
													<div class="row">
														<div class="mb-3 col-md-4"  style="display:inline-block;">
															<label class="form-label" for="mk_status">게시 여부</label>
															<select class="form-select" name="mk_status" id="mk_status">
															  <option value="1" <c:if test="${prodList.mk_status==1}">selected</c:if>>O</option>
															  <option value="0" <c:if test="${prodList.mk_status==0}">selected</c:if>>X</option>													  													   
															</select>														
														</div>
													</div>
													<div class="row">
														<div class="mb-3 col-md-4"  style="display:inline-block;">
															<label class="form-label" for="mk_product_type">상품 분류</label>
															<select class="form-select" name="mk_product_type" id="mk_product_type">
																<option value="" >상품 분류</option>
															
															<c:forEach var="sortList" items="${prodSortList}" varStatus="status">														  
															  	<option value="${sortList.ps_sort_id}" <c:if test="${prodList.mk_product_type==sortList.ps_sort_id}">selected</c:if>>${sortList.ps_sort_name}</option>														  
															
															</c:forEach>													   
															</select>														
														</div>
													</div>
													<div class="row">
														<div class="mb-3 col-md-4"  style="display:inline-block;">
															<label class="form-label" for="mk_product_category">상품 종류</label>
															<select class="form-select" name="mk_product_category" id="mk_product_category" onchange="addProdCode(this.value, ${totalProdCategories});">
															  <option value="" >상품 종류</option>
															  <c:set var="num" value="1"/>															  
															 <c:forEach var="categoryList" items="${prodCategoryList}" varStatus="status">														  
															  	<option value="${categoryList.pc_category_id}" <c:if test="${prodList.mk_product_category==categoryList.pc_category_id}">selected</c:if>>${categoryList.pc_category_name}</option>														  
															</c:forEach>													   
															</select>														
														</div>
													</div>
													<div class="mb-3">
														<label class="form-label" for="mk_product_name">상품명</label>
														<input type="text" class="form-control" name="mk_product_name" id="mk_product_name" value="${prodList.mk_product_name}">
													</div>
													<div class="mb-3">
														<label class="form-label" for="mk_product_id">상품코드</label>
														<input type="text" class="form-control" name="mk_product_id" id="mk_product_id" value="${prodList.mk_product_id}">
													</div>
													<div class="mb-3">
														<label class="form-label" for="mk_product_price">상품 가격(원)</label>
														<input type="number" class="form-control" name="mk_product_price" id="mk_product_price" value="${prodList.mk_product_price}">
													</div>
													<div class="mb-3">
														<label class="form-label" for="mk_inventory">재고량</label>
														<input type="number" class="form-control" name="mk_inventory" id="mk_inventory" value="${prodList.mk_inventory}">
													</div>
													<div class="mb-3">
														<label class="form-label" for=mk_original_thumb>상품 썸네일(상품목록용)</label>
														<input type="file" class="form-control" name="original_thumb" id="original_thumb">
														<span>저장된 상품 썸네일: </span>
														<a href="${contextPath}/adminProd/downloadImg?imgFileName=${prodList.mk_stored_thumb}&imgRealName=${prodList.mk_original_thumb}">${prodList.mk_original_thumb}</a>
													</div>		
													<div class="mb-3">
														<label class="form-label" for="mk_original_upfile">상품 이미지(상품상세보기)</label>
														<input type="file" class="form-control" name="original_upfile" id="original_upfile">
														<span>저장된 상품 상세 이미지: </span>
														<a href="${contextPath}/adminProd/downloadImg?imgFileName=${prodList.mk_stored_upfile}&imgRealName=${prodList.mk_original_upfile}">${prodList.mk_original_upfile}</a>
													</div>							
													<div class="mb-3">
														<label class="form-label" for="mk_content">상품 설명</label>
														<textarea class="form-control" name="mk_content" id="mk_content">${prodList.mk_content}</textarea>
														<script>														
															CKEDITOR.replace('mk_content', {filebrowserUploadUrl: '${contextPath}/adminProd/editorFileUpload'});
															//console.log('${contextPath}/adminProd/editorFileUpload');														
														</script>
													</div>
													<c:choose>
													<c:when test="${wu=='u'}">
														<button type="button" class="btn btn-primary" onclick="adminProdUpdate();">수정</button>
													</c:when>	
													<c:when test="${wu=='i'}">	
														<button type="button" class="btn btn-primary" onclick="adminProdInsert();">등록</button>
													</c:when>	
												</c:choose>
											
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