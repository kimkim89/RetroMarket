<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en-US" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>상품 목록</title>
    <%@ include file="../include/Top.jsp" %>       
</head>

<body>
    <header>
        <!-- Header Start -->
        <jsp:include page="../include/TopNavi.jsp" />
        <!-- Header End -->
    </header>
    <main>
        <!--=============== Subtitle 시작 ================-->
		<jsp:include page="../include/product_subtitle.jsp" />
		<!--=============== Subtitle 끝 ================-->
        <!-- Latest Products Start -->
        <section class="popular-items latest-padding">        
            <div class="container">
                <div class="row product-btn justify-content-between mb-40">
                    <div class="properties__button">
                        <!--Nav Button  -->
                        <nav>                                                                             
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">             
                            	<a class="nav-item nav-link" name="pr-tab" id="pr-new"  href="javascript:void(0);" role="tab" aria-controls="nav-home" aria-selected="true" onclick="selProdTypeList('${prCode}','new', 'pr-new');">신상품</a>
                                <a class="nav-item nav-link" name="pr-tab" id="pr-pop"  href="javascript:void(0);" role="tab" aria-controls="nav-profile" aria-selected="false" onclick="selProdTypeList('${prCode}','pop', 'pr-pop');">인기상품</a>
                                <a class="nav-item nav-link" name="pr-tab" id="pr-dis"  href="javascript:void(0);" role="tab" aria-controls="nav-contact" aria-selected="false" onclick="selProdTypeList('${prCode}','dis', 'pr-dis');">할인상품</a>
                            </div>
                        </nav>
                        <!--End Nav Button  -->
                    </div>
                    <!-- Grid and List view -->
                    <div class="grid-list-view">
                    </div>
                    <!-- Select items -->
                </div>
                <!-- Nav Card 상품리스트 시작 -->
                
                <div class="tab-content" id="nav-tabContent">
                    <!-- card one -->
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <div class="row" id="prLineStart">
		                    <c:forEach var="productList" items="${productList}" varStatus="status">
		                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
		                        <div class="single-popular-items mb-50 text-center">
		                            <div class="popular-img">
		                                <img src="${contextPath}/resources/images/temporary/${productList.mk_stored_thumb}" alt="" style="height: 270px;">
		                                <div class="img-cap">
		                                    <a href="${contextPath}/product/productDetail?prCode=${prCode}&product_id=${productList.mk_idx}"><span>상품 보기</span></a>
		                                </div>
<!-- 		                                <div class="favorit-items"> -->
<!-- 		                                    <span class="flaticon-heart"></span> -->
<!-- 		                                </div> -->
		                            </div>
		                            <div class="popular-caption">
		                                <h3><a href="product_details.html">${productList.mk_product_name}</a></h3>
		                                <span>${productList.mk_product_price}원</span>
		                            </div>
		                        </div>
		                    </div>
		                    </c:forEach>
               			 </div>
                    </div>
                </div>
				<!-- 페이징 시작 -->				
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-md" id="pagination_id" style="margin: 0% 50%;">
						<c:if test="${pagingMap.blockFirst != 1}">
							<li class="page-item">
								<a class="page-link" href="${contextPath}/product/prList?prCode=${prCode}&prType=${prType}&nowPage=${pagingMap.blockFirst-1}">
									<i class="fas fa-angle-left"></i>
								</a>
							</li>
						</c:if>
						<c:forEach begin="${pagingMap.blockFirst}" end="${pagingMap.blockLast}" var="i">
							<li class="page-item">
								<a href="${contextPath}/product/prList?prCode=${prCode}&prType=${prType}&nowPage=${i}" class="page-link" >${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pagingMap.totalPage != pagingMap.blockLast}">
							<li class="page-item">
								<a class="page-link" href="${contextPath}/product/prList?prCode=${prCode}&prType=${prType}&nowPage=${pagingMap.blockLast+1}">
									<i class="fas fa-angle-right"></i>
								</a>
							</li>
						</c:if>
					</ul>
				</nav>
				<!-- 페이징 끝 -->                
                <!-- End Nav Card -->
            </div>
        </section>
        <!-- Latest Products End -->
    </main>
    
   
   <script type="text/javascript">

   sessionStorage.setItem("contextPath", "${contextPath}");
   var contextPath = getContextPath();

   $(document).ready(function() {
	   var prType = "#pr-${prType}";
	   getActiveProdCate(prType);			
	});
   
   
   
   //신상품, 인기상품, 할인상품 조회
   function selProdTypeList(prCode, prType, prTagId) {
	  
	   		prTagId = "#" + prTagId;
	   	var tagStr = "";
	   	var pagingStr = "";
	   	
	   		getActiveProdCate(prTagId);
		
		   $.ajax({
				type: "post",
				url: "${contextPath}/product/ajaxProdList",
				async: false,
				data: {"prCode" : prCode, "prType" : prType},
				success: function(data) {		
					//alert("test: " + data[1][0].blockFirst);
					//console.log(data[a][0].blockLast);					
		
					
					for(var a=0; a<data.length; a++) {	
						if(a==0) { 
							//배열1 - 상품 정보
							for(var i=0; i<data[a].length; i++) {	 					
								//상품 목록
								tagStr = '<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">';
			 	                tagStr += '<div class="single-popular-items mb-50 text-center">';
			 	                tagStr += '<div class="popular-img">';
			 	                tagStr += '<img src="' + contextPath + '/resources/images/temporary/' + data[a][i].mk_stored_thumb + '" alt="" style="height: 270px;">';
			 	                tagStr += '<div class="img-cap">';
			 	                tagStr += '<a href="' + contextPath + '/product/productDetail?product_id=' + data[a][i].mk_idx + '"><span>상품 보기</span></a>';
			 	                tagStr += '</div>';			 	                
			 	                tagStr += '</div>';
			 	                tagStr += '<div class="popular-caption">';
			 	                tagStr += '<h3><a href="product_details.html">' + data[a][i].mk_product_name + '</a></h3>';
			 	                tagStr += '<span>' + data[a][i].mk_product_price + '원</span>';
			 	                tagStr += '</div>';
			 	                tagStr += '</div>';
			 	                tagStr += '</div>';
			 	                
			 	               if(i<=0) { 
			 	               		$("#prLineStart").html(tagStr);
			 	               }else {
			 	            	  	$("#prLineStart").append(tagStr);
			 	               }
							}
							
						}else if(a==1) {					
							//페이징		 	               
		 	                if(data[a][0].blockFirst != 1) { 
			 	               	pagingStr = '<li class="page-item">';
			 	               	pagingStr += '<a class="page-link" href="' + contextPath + '/product/prList?prCode=' + prCode + '&prType=' + prType + '&nowPage=' + data[a][0].blockFirst-1 + '">';
			 	              	pagingStr += '<i class="fas fa-angle-left"></i>';
			 	             	pagingStr += '</a>';
			 	            	pagingStr += '</li>';
		 	                }
							
							for(var j=data[a][0].blockFirst; j<=data[a][0].blockLast; j++) { 								
								pagingStr += '<li class="page-item">';
								pagingStr += '<a href="' + contextPath + '/product/prList?prCode=' + prCode + '&prType=' + prType + '&nowPage=' + j + '" class="page-link" >' + j + '</a>';
								pagingStr += '</li>';
							}
							
							if(data[a][0].totalPage != data[a][0].blockLast) {
								pagingStr += '<li class="page-item">';
								pagingStr += '<a class="page-link" href="' + contextPath + '/product/prList?prCode=' + prCode + '&prType=' + prType + '&nowPage=' + data[a][0].blockLast+1 + '">';
			 	        		pagingStr += '<i class="fas fa-angle-right"></i>';
			 	       			pagingStr += '</a>';
			 	      			pagingStr += '</li>';
							}							
		 	               		$("#pagination_id").html(pagingStr);
						}
					}
				},//success function 끝 
				error: function(jqXHR, textStatus, errorThrown) {    					
					alert("ERROR: " + textStatus + " : " + errorThrown);
				}	
			});	
   } 
   
   
   function getContextPath() {
	   return sessionStorage.getItem("contextPath");
   }    


   function getActiveProdCate(prTagId) {
	   if($(prTagId).attr('class').indexOf("active") == -1) {
	   		$(prTagId).addClass("active");
	   		$("#nav-tab").find("a").not(prTagId).removeClass("active");
	   	}
   }
   
   </script> 
    
    <jsp:include page="../include/Footer.jsp" />
    
</body>
</html>