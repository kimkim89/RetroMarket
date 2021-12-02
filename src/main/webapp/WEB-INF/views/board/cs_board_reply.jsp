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
		function writeInquiry() {
			
			if(document.getElementById("memberExistChk").value == 1) {
				if(document.getElementById("cs_writer_name").value == "") {
					alert("작성자명을 입력해 주세요.");
					document.getElementById("cs_writer_name").focus();
					return false;
				}else if(document.getElementById("cs_writer_email").value == "") {
					alert("이메일을 입력해 주세요.");
					document.getElementById("cs_writer_email").focus();
					return false;
				}
			}
			
			if(document.getElementById("cs_content").value == "") {
				alert("문의 사항 내용을 작성해 주세요.");
				document.getElementById("cs_content").focus();
				return false;
			}else if(document.getElementById("cs_secret2").checked == true & document.getElementById("cs_secret_num").value == "") {
				alert("비밀번호를 입력해 주세요.");
				document.getElementById("cs_secret_num").focus();
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
									<h4 class="mb-30" style="text-align: center;font-weight:bold;">문의 사항 답변</h4>
									<form id="write_form" action="${contextPath}/board/registerInquiry" method="post">
										
										<input type="hidden" name="board_type" id="board_type" value="${boardType}" >
										<input type="hidden" name="board_num" id="board_num" value="${boardNum}" >
										<input type="hidden" name="reply_check" id="reply_check" value="reply" >
										
											<div class="mt-10">
												<input type="text" id="cs_subject" name="cs_subject" value="RE: ♥아맞다매점에 문의드립니다 !♥" required class="single-input">
											</div> 
											
										<c:choose>
											<c:when test="${user_id == null}">
												<input type="hidden" name="memberExistChk" id="memberExistChk" value="1" >
												<div class="mt-10">
													<input type="text" id="cs_writer_name" name="cs_writer_name" placeholder="작성자명"  value="" required class="single-input">
												</div>
												
												<div class="mt-10">
													<input type="text" id="cs_writer_email" name="cs_writer_email" placeholder="이메일"  value="" required class="single-input">
												</div>
											</c:when>
											<c:when test="${user_id != null}">
												<input type="hidden" name="memberExistChk" id="memberExistChk" value="0" >
												<input type="hidden" name="cs_writer_name" id="cs_writer_name" value="" >
											</c:when>
										</c:choose>
											<div class="mt-10">
												<textarea class="single-input" id="cs_content" name="cs_content" style="height:400px;" placeholder="문의 사항에 관하여 글을 남겨주세요!"></textarea>
											</div>
											
											<div class="mt-10">
												<input type="password" id="cs_secret_num" name="cs_secret_num" placeholder="비밀번호"  value="" required class="single-input">
											</div>					
											
											<div class="mt-10" style="border-bottom: solid 1px black;">
												<span><b>비밀글 설정</b></span>&nbsp;&nbsp;&nbsp;
												<input type="radio" id="cs_secret1" name="cs_secret" value="0" />공개글 &nbsp;&nbsp;&nbsp;
												<input type="radio" id="cs_secret2" name="cs_secret" value="1" checked/>비밀글
											</div>
											
	<!-- 										<div class="mt-10"> -->
	<%-- 											<input type="text" id="name" name="name" placeholder="이름" readonly="readonly" value="${myInfo.name}" required class="single-input"> --%>
	<!-- 										</div>					 -->
											<div align="center" style="margin-top: 15px;">
											
												<a href="javascript:writeInquiry();" class="genric-btn info-border radius" id="join-btn">등록</a> 
												<a href="javascript:history.back()" class="genric-btn warning-border radius">목록</a>
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