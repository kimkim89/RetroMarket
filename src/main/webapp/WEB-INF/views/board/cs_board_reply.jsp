<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<%@ include file="../include/Top.jsp"%>
<style type="text/css">
	.single-input {
		border: solid 1px #3a3a3a;
	}
</style>
</head>
<body>
	
	<script>
	<c:if test="${(memberStatus != 1 && user_id != boardInfoVO.cs_writer_id)}">
		alert("접근할 수 없습니다.");
		location.href = "${contextPath}/board/customerBoardList?board_type=${boardType}";
	</c:if>
	</script>


	<header>
		<!-- Header Start -->
		<jsp:include page="../include/TopNavi.jsp" />
		<!-- Header End -->
		<script type="text/javascript">
		function writeInquiry() {
			if(document.getElementById("cs_content").value == "") {
				alert("문의 사항 내용을 작성해 주세요.");
				document.getElementById("cs_content").focus();
				return false;
			}
			
			document.getElementById("write_form").submit();
		}
	</script>
	</header>
	<main>
		<!--=============== Subtitle 시작 ================-->
		<jsp:include page="../include/subtitle.jsp" />
		<!--=============== Subtitle 끝 ================-->
		<!--================Blog Area =================-->
		<section class="blog_area section-padding" style="margin: 0% 7% 0% 8%;;">
			<div class="gallery-area">
				<div class="row">
					<jsp:include page="./include/boardSide.jsp" />
					<div class="col-lg-8 mb-5 mb-lg-0"
						style="margin: 3%; margin-top: 1%;">
						<!--================ 문의글 작성 =================-->
						<section class="cart_area section_padding"
							style="padding: 0px;">
							<div class="container" style="max-width: 830px;">
								<div class="cart_inner" style="max-width: 92%; margin-left: 2%;">
									<h4 class="mb-30" style="text-align: center;font-weight:bold;">
										<c:if test="${wu == 'i'}">
										문의 사항 답변 작성
										</c:if>
										<c:if test="${wu == 'u'}">
										문의 사항 답변 수정
										</c:if>
									</h4>
									<form id="write_form" action="${contextPath}/board/registerInquiry" method="post">
										
										<input type="hidden" name="board_type" id="board_type" value="${boardType}" >
										<input type="hidden" name="board_num" id="board_num" value="${boardNum}" >
										<input type="hidden" name="reply_check" id="reply_check" value="reply" >
										
											<div class="mt-10">
												<input type="text" id="cs_subject" name="cs_subject" value="${boardInfoVO.cs_subject}" required class="single-input">
											</div> 
											
											<div class="mt-10">
												<textarea class="single-input" id="cs_content" name="cs_content" style="height:400px;" placeholder="문의 사항에 관하여 글을 남겨주세요!"></textarea>
											</div>
												
											<div align="center" style="margin-top: 15px;">
												<a href="javascript:writeInquiry();" class="genric-btn info-border radius" id="join-btn">등록</a> 
												<a href="javascript:history.back()" class="genric-btn warning-border radius">목록</a>
											</div>
									</form>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</section>
		<!--================Blog Area =================-->
	</main>
	
	
	
	<footer> </footer>
	<jsp:include page="../include/Footer.jsp" />
</body>
</html>