<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<%@ include file="../include/Top.jsp"%>
</head>
<body>
	<header>
		<!-- Header Start -->
		<jsp:include page="../include/TopNavi.jsp" />
		<!-- Header End -->
		<script type="text/javascript">
		
		//답변 페이지로 이동
		function replyInquiry() {
			document.getElementById("write_form").submit();
		}
		
		//비밀글 확인 여부 페이지로 이동
		function writeInquiry() {
			document.getElementById("write_form").action = "${contextPath}/board/checkPass?board_type=${boardType}&board_num=${csIdx}";
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
									<h4 class="mb-30" style="text-align: center;font-weight:bold;">비밀글 보기</h4>
									<form id="write_form" action="${contextPath}/board/replyInquiryForm" method="post">
										<input type="hidden" name="board_type" id="board_type" value="${boardType}" >
										<input type="hidden" name="board_num" id="board_num" value="${csIdx}" >
											
											<div class="mt-10">
												<input type="password" id="entered_pw" name="entered_pw" value="" placeholder="비밀번호를 입력해 주세요." required class="single-input" style="border: solid 1px gray;width: 45%;margin: 0% 26%;">
											</div> 
											<div align="center" style="margin-top: 15px;">
												<a href="javascript:history.back()" class="genric-btn warning-border radius">목록</a>
												<a href="javascript:writeInquiry();" class="genric-btn info-border radius" id="join-btn">확인</a>
											</div>
									</form>
								</div>
							</div>
						</section>
						<!--================ 회원 가입 끝 =================-->
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