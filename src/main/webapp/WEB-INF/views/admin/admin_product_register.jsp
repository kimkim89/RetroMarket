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
			
		function adminProdSubmit(type) {
			var form = document.product_form;			
			
			//유효성 검사
			if($("#mk_product_type").val() == "") {
	    		alert("상품 분류를 선택해 주세요.");
	    		$("#mk_product_type").focus();
	    		return false;
	    	}else if($("#mk_product_category").val() == "") {
	    		alert("상품 종류를 선택해 주세요.");
	    		$("#mk_product_category").focus();
	    		return false;
	    	}else if($("#mk_product_name").val() == "") {
	    		alert("상품명을 입력해 주세요.");
	    		$("#mk_product_name").focus();
	    		return false;
	    	}else if($("#mk_product_price").val() == "") {
	    		alert("상품 가격을 입력해 주세요.");
	    		$("#mk_product_price").focus();
	    		return false;
	    	}else if($("#mk_product_price").val() == "") {
	    		alert("상품 가격을 입력해 주세요.");
	    		$("#mk_product_price").focus();
	    		return false;
	    	}else if($("#mk_inventory").val() == "") {
	    		alert("상품 재고량을 입력해 주세요.");
	    		$("#mk_inventory").focus();
	    		return false;
	    	}
			
			if(type == "register") {
				form.action="${contextPath}/adminProd/adminProdInsert";
				form.submit();
			}else if(type == "update") {
				form.action="${contextPath}/adminProd/adminProdUpdate";
				form.submit();
			}
				
		}
		
		
		
		function addProdCode(optionValue, totalCategories) {
			//console.log(optionValue);
			var productCode = document.getElementById("mk_product_id");			
			
			/*상품수정 페이지에서 이미 선택 되어있는 상품종류는 재선택 불가능하도록 작업 */
			var wuStatus = document.getElementById("wu").value;
			var prCate = document.getElementById("prCategory").value;
			var prCode = document.getElementById("prCode").value;
			
			/*console.log("wuStatus: " + wuStatus);
			console.log("optionValue: " + optionValue);
			console.log("prCate: " + prCate);
			console.log("prCode: " + prCode);*/
					
			$.ajax({
				type: "POST",
				url: "${contextPath}/adminProd/ajaxProductCode",
				async: false,
				data: {"prodCategory" : optionValue},
				contentType: "application/json; charset=UTF-8",
				success: function(data) {
					//alert(data);
					if(wuStatus == 'u' && prCate == optionValue) {
						$("#mk_product_id").val(prCode);
					}
					if(prCate != optionValue) {
						$("#mk_product_id").val(data);
					}
				},
				error: function(jqXHR, textStatus, errorThrown) {
					alert("ERROR: " + textStatus + " : " + errorThrown);
				}
			});										
		}
				
		//상품상세이미지 추가 기능
		/*function createPrDetailImg(fileNum) {
			var parentDivTag = document.getElementById("pr_detail_img");
			
			var totalFileNum = 0;
			
			if(fileNum==2){
				
			}
			
			var	newFileTag = '<div class="mb-3">';
				//newfileTag += '<label class="form-label" for="mk_original_upfile">상품 이미지(상품상세보기)</label>';
				newFileTag += '<input type="file" class="form-control" name="original_upfile' + fileNum + '" id="original_upfile' + fileNum + '">';
				newFileTag += '<span>저장된 상품 상세 이미지: </span>';
				newFileTag += '<a href="${contextPath}/adminProd/downloadImg?imgFileName=${prodList.mk_stored_upfile}&imgRealName=${prodList.mk_original_upfile}">${prodList.mk_original_upfile}</a>';
				newFileTag += '</div>';
				
		
				parentDivTag.innerHTML = newFileTag;
				
				
				fileNum++;
				
				console.log(newFileTag);
		}*/
		
		//첨부파일 삭제
		function deletePrImg(imageType, imageFileName, prodCode) {
			
			var dataArr = {"imageType" : imageType, "imageFileName" : imageFileName, "prodCode" : prodCode};
		
			$.ajax({
				type: "POST",
				url: "${contextPath}/adminProd/ajaxDelProdImg",
				async: false,
				data: dataArr,
				success: function(data) {
					alert(data);
					location.reload();
				},
				error: function(jqXHR, textStatus, errorThrown) {
					alert("ERROR: " + textStatus + " : " + errorThrown);
				}
			});							
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
											<c:if test="${wu=='u'}">
												<input type="hidden" name="mk_idx" id="mk_idx" value="${prodList.mk_idx}"/>
											</c:if>	
												<input type="hidden" name="wu" id="wu" value="${wu}" />
												<input type="hidden" name="prCategory" id="prCategory" value="${prodList.mk_product_category}" />		
												<input type="hidden" name="prCode" id="prCode" value="${prodList.mk_product_id}" />
																						
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
														<input type="text" class="form-control" name="mk_product_id" id="mk_product_id" value="${prodList.mk_product_id}" readonly>
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
														<c:if test="${prodList.mk_stored_thumb != null}">
															<span class="image_download">저장된 상품 썸네일: </span>
																<a href="${contextPath}/adminProd/downloadImg?imgFileName=${prodList.mk_stored_thumb}&imgRealName=${prodList.mk_original_thumb}">${prodList.mk_original_thumb}</a>
															<span style="font-weight: bold;" id="delPrImg0">
																<a href="javascript:deletePrImg('thumbnail', '${prodList.mk_stored_thumb}', '${prodList.mk_product_id}');">[삭제]</a>
 															</span>
														</c:if>
													</div>								
													<div class="mb-3">
														<label class="form-label" for="mk_original_upfile1">상품 이미지1(상품상세보기)</label>														
														<input type="file" class="form-control" name="original_upfile1" id="original_upfile1">
														<c:if test="${prodImgList.mk_stored_upfile1 != null}">
															<span>저장된 상품 상세 이미지: </span>
																<a href="${contextPath}/adminProd/downloadImg?imgFileName=${prodImgList.mk_stored_upfile1}&imgRealName=${prodImgList.mk_original_upfile1}">${prodImgList.mk_original_upfile1}</a>
															<span style="font-weight: bold;" id="delPrImg1">
																<a href="javascript:deletePrImg('upfile1', '${prodImgList.mk_stored_upfile1}', '${prodList.mk_product_id}');">[삭제]</a>
															</span>
														</c:if>
													</div>
													<div class="mb-3">
														<label class="form-label" for="mk_original_upfile2">상품 이미지2(상품상세보기)</label>														
														<input type="file" class="form-control" name="original_upfile2" id="original_upfile2">
														<c:if test="${prodImgList.mk_stored_upfile2 != null}">
															<span>저장된 상품 상세 이미지: </span>
																<a href="${contextPath}/adminProd/downloadImg?imgFileName=${prodImgList.mk_stored_upfile2}&imgRealName=${prodImgList.mk_original_upfile2}">${prodImgList.mk_original_upfile2}</a>
															<span style="font-weight: bold;" id="delPrImg2" >
																<a href="javascript:deletePrImg('upfile2', '${prodImgList.mk_stored_upfile2}', '${prodList.mk_product_id}');">[삭제]</a>
															</span>																				
														</c:if>
													</div>
													<div class="mb-3">
														<label class="form-label" for="mk_original_upfile3">상품 이미지3(상품상세보기)</label>														
														<input type="file" class="form-control" name="original_upfile3" id="original_upfile3">
														<c:if test="${prodImgList.mk_stored_upfile3 != null}">
															<span>저장된 상품 상세 이미지: </span>
															<a href="${contextPath}/adminProd/downloadImg?imgFileName=${prodImgList.mk_stored_upfile3}&imgRealName=${prodImgList.mk_original_upfile3}">${prodImgList.mk_original_upfile3}</a>
															<span style="font-weight: bold;" id="delPrImg3">
																<a href="javascript:deletePrImg('upfile3', '${prodImgList.mk_stored_upfile3}', '${prodList.mk_product_id}');">[삭제]</a>
															</span>
														</c:if>
													</div>
													<div class="mb-3">
														<label class="form-label" for="mk_original_upfile4">상품 이미지4(상품상세보기)</label>														
														<input type="file" class="form-control" name="original_upfile4" id="original_upfile4">
														<c:if test="${prodImgList.mk_stored_upfile4 != null}">
															<span>저장된 상품 상세 이미지: </span>
															<a href="${contextPath}/adminProd/downloadImg?imgFileName=${prodImgList.mk_stored_upfile4}&imgRealName=${prodImgList.mk_original_upfile4}">${prodImgList.mk_original_upfile4}</a>
															<span style="font-weight: bold;" id="delPrImg4">
																<a href="javascript:deletePrImg('upfile4', '${prodImgList.mk_stored_upfile4}', '${prodList.mk_product_id}');">[삭제]</a>
															</span>
														</c:if>
													</div>
													<div class="mb-3">
														<label class="form-label" for="mk_original_upfile5">상품 이미지5(상품상세보기)</label>														
														<input type="file" class="form-control" name="original_upfile5" id="original_upfile5">
														<c:if test="${prodImgList.mk_stored_upfile5 != null}">
															<span>저장된 상품 상세 이미지: </span>
																<a href="${contextPath}/adminProd/downloadImg?imgFileName=${prodImgList.mk_stored_upfile5}&imgRealName=${prodImgList.mk_original_upfile5}">${prodImgList.mk_original_upfile5}</a>
															<span style="font-weight: bold;" id="delPrImg5" onclick="deletePrImg('upfile5');">
																<a href="javascript:deletePrImg('upfile5', '${prodImgList.mk_stored_upfile5}', '${prodList.mk_product_id}');">[삭제]</a>
															</span>
														</c:if>
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
														<button type="button" class="btn btn-primary" onclick="adminProdSubmit('update');">수정</button>
<!-- 														<button type="button" class="btn btn-primary" onclick="adminProdUpdate();">수정</button> -->
													</c:when>	
													<c:when test="${wu=='i'}">	
														<button type="button" class="btn btn-primary" onclick="adminProdSubmit('register');">등록</button>
<!-- 														<button type="button" class="btn btn-primary" onclick="adminProdInsert();">등록</button> -->
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

		<%@ include file="./include/admin_bottom.jsp" %>

	<script src="${contextPath}/resources/admin/js/app.js"></script>

</body>

</html>