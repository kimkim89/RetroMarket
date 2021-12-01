<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<%@ include file="./include/admin_top.jsp" %>

<title>상품 관리</title>
<script src="${contextPath}/resources/lib/ckeditor/ckeditor.js"></script>
<script>
	function adminProdRegister() {
		location.href="${contextPath}/adminProd/adminProductRegister";
	}
	
	function adminProdModify(product_num) {
		location.href="${contextPath}/adminProd/adminProdModify/" + product_num + "?wu=u";
	}
	
	function adminProdDelete(product_num) {
		location.href="${contextPath}/adminProd/adminProdDelete/" + product_num;
	}
	
	function adminProductList() {
		document.getElementById('prodSearch').submit(); 
		return false;
	}
	
</script>
<link href="${contextPath}/resources/assets/admin/css/app.css" rel="stylesheet">
<style>
.form-control {
	width: 50%;
	height: auto;
}

.flex-container {
	display: inline-flex;
	flex-direction: row;
}

/*삭제버튼색*/
.btn_delete {background-color:red; border-color: red;}
.btn_blue {background-color: #2469ce; border-color: #2469ce;}

</style>
</head>

<body>
	<div class="wrapper">
		<%@ include file="./include/sidebar.jsp"%>

		<main class="content">	
				<h1 class="h3 mb-3">상품관리</h1>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<span class="btn btn-info" style="background-color:lightcoral; border:solid 1px lightcoral;pointer-events: none;">총상품수  ${prodCount}개</span>
								<form name="prodSearch" id="prodSearch" class="d-none d-sm-inline-block" action="${contextPath}/adminProd/adminProduct" method="get">
									<div class="input-group input-group-navbar">
										<select name="searchField" class="form-select" aria-label="Default select example">
											<option value="mk_product_name">상품명</option>
											<option value="mk_product_id">상품번호</option>
										</select>&nbsp;&nbsp; 
										<input type="text" name="keyword" class="form-control" placeholder="" aria-label="Search">
										<button type="button" class="btn" onclick="adminProductList();">
											<i class="align-middle" data-feather="search"></i>
										</button>
										&nbsp;&nbsp;
									</div>
								</form>
								<button type="button" class="btn btn-info btn_delete" style="float: right;" onclick="deleteAdminProd();">선택 삭제</button>
								<button type="button" class="btn btn-info btn_blue" style="float: right; margin: auto 10px;" onclick="adminProdRegister();">상품 등록</button>
							</div>
<br>
							<div>
								<div class="card">									
									<table class="table table-bordered">
										<thead>
											<tr>
												<th><input type="checkbox" name="del_check_all" id="del_check_all" onclick="chooseAllProd();" /></th>													
												<th style="text-align:center;">#</th>
												<th style="width: 60%;text-align:center;">상품정보</th>
												<th style="width: 22%;text-align:center;">가격/재고</th>	
												<th style="width: 12%;text-align:center;">설정</th>											
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
										<c:forEach var="prodList" items="${productList}" varStatus="status">								
												
											<tr>
												<td><input type="checkbox" name="del_check" id="del_check" value="${prodList.mk_product_id}"/></td>
												<td style="text-align:center;">${num}</td>
												<td style="vertical-align: middle;">
													<div class="flex-container">
														<div class="flex-item">
															<img src="${contextPath}/resources/images/temporary/${prodList.mk_stored_thumb}" style="width: 150px; height: 140px;">
														</div>
														<div class="flex-item">
															<input type="text" class="form-control" value="${prodList.mk_product_name}" readonly style="width:180%;height:auto;margin-left:10px;margin-bottom: -15px;"><br>
  															<input type="text" class="form-control" value="${prodList.ps_sort_name}" readonly style="width:180%;height:auto;margin-left:10px;margin-bottom: -15px;"><br>
															<input type="text" class="form-control" value="${prodList.pc_category_name}" readonly style="width:180%;height:auto;margin-left:10px;margin-bottom: -15px;"><br>
															<select name="" class="form-select" aria-label="Default select example" style="margin-left:10px;" disabled>
																<option value="">게시여부</option>
																<option value="1" <c:if test="${prodList.mk_status == 1}">selected</c:if>>O</option>
																<option value="0" <c:if test="${prodList.mk_status == 0}">selected</c:if>>X</option>											
															</select>
														</div>
													</div>
												</td>
												<td style="vertical-align: middle;">
													<div class="flex-item">
													<input type="text" class="form-control" value="${prodList.mk_inventory}개" readonly style="width:90%;height:auto;margin-bottom: -15px;"><br>
													<input type="text" class="form-control" value="${prodList.mk_product_price}원" readonly style="width:90%;height:auto;margin-bottom: -15px;"><br>
													<input type="text" class="form-control" value='<fmt:formatDate value="${prodList.mk_register_date}" pattern="yyyy-MM-dd hh:mm:ss"/>' readonly style="width:90%;height:auto;margin-bottom: -15px;"><br>
													<input type="text" class="form-control" value='<fmt:formatDate value="${prodList.mk_modified_date}" pattern="yyyy-MM-dd hh:mm:ss"/>' readonly style="width:90%;height:auto;margin-bottom: -15px;"><br>
													</div>
												</td>
												<td style="vertical-align: middle;">
<%-- 													<button type="button" class="btn btn-info btn_delete" style="margin-bottom:10px;margin-left:23px;" onclick="adminProdDelete(${prodList.mk_idx});">삭제</button><br> --%>
													<button type="button" class="btn btn-info btn_blue" style="margin-bottom:10px;margin-left:23px;" onclick="adminProdModify(${prodList.mk_idx});">수정</button>
												</td>
											</tr>
										<c:set var="num" value="${num+1}"/>
										</c:forEach>
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
							<li class="page-item"><a class="page-link"
								href="${contextPath}/adminProd/adminProduct?nowPage=${map.blockFirst-1}&searchField=${searchField}&keyword=${keyword}"><i
									class="fas fa-angle-left"></i></a></li>
						</c:if>
						<c:forEach begin="${map.blockFirst}" end="${map.blockLast}" var="i">
							<li class="page-item">
								<a href="${contextPath}/adminProd/adminProduct?nowPage=${i}&searchField=${searchField}&keyword=${keyword}" class="page-link" >${i}</a>
							</li>
						</c:forEach>
						<c:if test="${map.totalPage != map.blockLast}">
							<li class="page-item">
								<a class="page-link" href="${contextPath}/adminProd/adminProduct?nowPage=${map.blockLast+1}&searchField=${searchField}&keyword=${keyword}">
									<i	class="fas fa-angle-right"></i>
								</a>
							</li>
						</c:if>
					</ul>
				</nav>
		</main>
		
<script type="text/javascript">
	
	/*전체삭제 기능*/
	let clickCnt = 1;
	let delChkBoxArray = document.getElementsByName("del_check");	
	
	function chooseAllProd() {
	
		clickCnt++;
			
			if(clickCnt%2 == 0) {
				for(var j=0; j<delChkBoxArray.length; j++) {
					if(delChkBoxArray[j].disabled == false) {
						delChkBoxArray[j].checked = true;
					}
				}
			}else {
				for(var j=0; j<delChkBoxArray.length; j++) {
					delChkBoxArray[j].checked = false;
				}
			}			
	}//chooseAllProd()함수 끝

	/*선택삭제 기능 */
	function deleteAdminProd() {
		var checkedArray = [];
		
		alert("선택한 상품을 삭제하시겠습니까?");
		
		$("input:checkbox[name='del_check']:checked").each(function() {
			checkedArray.push($(this).val()); // 체크된 것 value만 배열에 push			
		})
		
		console.log(checkedArray);
		
		$.ajax({
			type : "POST",
			url : "${contextPath}/adminProd/delEachProdInfo",
			data : {"checkedArray" : checkedArray},			
			success: function(data) {
				console.log(data);
				alert(data);
				location.href = location.href;
			},
			error: function(xhr, status, error) {
				alert(error);
			}
		});//ajax끝
		
	}//deleteEachProd()함수 끝
</script>	


<%@ include file="./include/admin_bottom.jsp" %>

	<script src="${contextPath}/resources/admin/js/app.js"></script>

</body>

</html>