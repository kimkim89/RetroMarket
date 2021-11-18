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
        <!-- Hero Area Start-->
        <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>상품 목록</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Area End-->
        <!-- Latest Products Start -->
        <section class="popular-items latest-padding">        
            <div class="container">
                <div class="row product-btn justify-content-between mb-40">
                    <div class="properties__button">
                        <!--Nav Button  -->
                        <nav>                                                                             
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">             
                            	<a class="nav-item nav-link" name="pr-tab" id="pr-new-tab"  href="javascript:void(0);" role="tab" aria-controls="nav-home" aria-selected="true" onclick="selProdTypeList('${prCode}','new', 'pr-new-tab');">신상품</a>
                                <a class="nav-item nav-link" name="pr-tab" id="pr-pop-tab"  href="javascript:void(0);" role="tab" aria-controls="nav-profile" aria-selected="false" onclick="selProdTypeList('${prCode}','pop', 'pr-pop-tab');">인기상품</a>
                                <a class="nav-item nav-link" name="pr-tab" id="pr-dis-tab"  href="javascript:void(0);" role="tab" aria-controls="nav-contact" aria-selected="false" onclick="selProdTypeList('${prCode}','dis', 'pr-dis-tab');">할인상품</a>               	
<%--                                 <a class="nav-item nav-link active" id="new-prod-tab" data-toggle="tab" href="${contextPath}/product/prList?prCode=${prCode}&prType=new" role="tab" aria-controls="nav-home" aria-selected="true" >신상품</a> --%>
<%--                                 <a class="nav-item nav-link" id="pop-prod-tab" data-toggle="tab" href="${contextPath}/product/prList?prCode=${prCode}&prType=pop" role="tab" aria-controls="nav-profile" aria-selected="false">인기상품</a> --%>
<%--                                 <a class="nav-item nav-link" id="dis-prod-tab" data-toggle="tab" href="${contextPath}/product/prList?prCode=${prCode}&prType=dis" role="tab" aria-controls="nav-contact" aria-selected="false">할인상품</a> --%>
                            </div>
                        </nav>
                        <!--End Nav Button  -->
                    </div>
                    <!-- Grid and List view -->
                    <div class="grid-list-view">
                    </div>
                    <!-- Select items -->
<!--                     <div class="select-this"> -->
<!--                     	<form action="" style="float: right;" > -->
<!--                             <div class="select-itms"> -->
<!--                                 <select name="select" id="select1"> -->
<!--                                     <option value="new">신상품</option> -->
<!--                                     <option value="pop">인기상품</option> -->
<!--                                     <option value="dis">할인상품</option> -->
<!--                                 </select> -->
<!--                             </div> -->
<!--                         </form> -->
<!--                         <form action="#" style="float: right;" > -->
<!--                             <div class="select-itms "> -->
<!--                                 <select name="select" id="select1"> -->
<!--                                     <option value="">스낵류</option> -->
<!--                                     <option value="">젤리류</option> -->
<!--                                     <option value="">캔디류</option> -->
<!--                                     <option value="">기타</option> -->
<!--                                 </select> -->
<!--                             </div> -->
<!--                         </form> -->
<!--                     </div> -->
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
                                <img src="${contextPath}/resources/images/temporary/${productList.mk_stored_thumb}" alt="">
                                <div class="img-cap">
                                    <a href="${contextPath}/product/productDetail?product_id=${productList.mk_idx}"><span>상품 보기</span></a>
                                </div>
                                <div class="favorit-items">
                                    <span class="flaticon-heart"></span>
                                </div>
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
        <!--? Shop Method Start-->
        <div class="shop-method-area">
            <div class="container">
                <div class="method-wrapper">
                    <div class="row d-flex justify-content-between">
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single-method mb-40">
                                <i class="ti-package"></i>
                                <h6>빠르고 정확한 배송</h6>
                                <p>하루라도 빨리 동심의 세계로 들어갈 수 있도록 빠른 배송 물론 정확하게.</p>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single-method mb-40">
                                <i class="fas fa-cheese"></i>
                                <h6>달콤 쌉싸름한 추억의 간식</h6>
                                <p>이 가격에 이 맛이!?.</p>
                            </div>
                        </div> 
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single-method mb-40">
                                <i class="far fa-grin"></i>
                                <h6>옛 추억을 생각하며 함박웃음</h6>
                                <p>너도 나도 하하호호하하하하호호하하하.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Shop Method End-->
    </main>
    
   
   <script type="text/javascript">

   sessionStorage.setItem("contextPath", "${contextPath}");
   var contextPath = getContextPath();
      
   //신상품, 인기상품, 할인상품 조회
   function selProdTypeList(prCode, prType, prTagId) {
	  
	   		prTagId = "#" + prTagId;
	   	var tagStr = "";
	   	var pagingStr = "";
	   
		   $.ajax({
				type: "post",
				url: "${contextPath}/product/ajaxProdList",
				async: false,
				data: {"prCode" : prCode, "prType" : prType},
				success: function(data) {		
					//alert("test: " + data[1][0].blockFirst);
					//console.log(data[a][0].blockLast);					
					
					$(prTagId).click(function() {
						$(prTagId).addClass("active");
						$("#nav-tab").not(prTagId).removeClass("active");
					})
					
					for(var a=0; a<data.length; a++) {	
						if(a==0) { 
							//배열1 - 상품 정보
							for(var i=0; i<data[a].length; i++) {	 					
								//상품 목록
								tagStr = '<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">';
			 	                tagStr += '<div class="single-popular-items mb-50 text-center">';
			 	                tagStr += '<div class="popular-img">';
			 	                tagStr += '<img src="' + contextPath + '/resources/images/temporary/' + data[a][i].mk_stored_thumb + '" alt="">';
			 	                tagStr += '<div class="img-cap">';
			 	                tagStr += '<a href="' + contextPath + '/product/productDetail?product_id=' + data[a][i].mk_idx + '"><span>상품 보기</span></a>';
			 	                tagStr += '</div>';
			 	                tagStr += '<div class="favorit-items">';
			 	                tagStr += '<span class="flaticon-heart"></span>';
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
							
						}else if(a==1) { 		console.log("들어왔음 3 ! : " + data[a][0].blockLast);					
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

	
   

		
   
   
   </script> 
    
    
    
    
   
    <jsp:include page="../include/Footer.jsp" />
    
</body>
</html>