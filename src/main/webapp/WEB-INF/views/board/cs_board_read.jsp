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
<!--  	<script type="text/javascript">
		<c:if test="${!(memberStatus == 1 || (memberStatus == 0 && user_id == boardInfoVO.cs_writer_id))}">
			alert("본인이 작성한 글만 확인할 수 있습니다.");
			location.href = "${contextPath}/board/customerBoardList?board_type=${boardType}";
		</c:if>
	</script> -->
	
	
	<header>
		<!-- Header Start -->
		<jsp:include page="../include/TopNavi.jsp" />
		<!-- Header End -->
		<script type="text/javascript">
		
		//답변 페이지로 이동
		function replyInquiry() {
			document.getElementById("write_form").action = "${contextPath}/board/csReplyUpdateForm?board_type=${boardType}&board_num=${csIdx}&wu=u";
			document.getElementById("write_form").submit();
		}
		
		//수정 페이지로 이동
		function writeInquiry() {
			if(document.getElementById("check_reply").value == 1) {
				document.getElementById("write_form").action = "${contextPath}/board/csReplyUpdateForm?board_type=${boardType}&board_num=${csIdx}&wu=u";
			}else {
				document.getElementById("write_form").action = "${contextPath}/board/csUpdateForm?board_type=${boardType}&board_num=${csIdx}&wu=u";
			}
			document.getElementById("write_form").submit();
		}
		
		//삭제 기능
		function deleteInquiry() {
			document.getElementById("write_form").action = "${contextPath}/board/deleteInquiryInfo";
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
										문의 내역 <c:if test="${boardInfoVO.cs_reply == 1}">답변</c:if> 확인
									</h4>
									<form id="write_form" action="" method="post">
										<input type="hidden" name="board_type" id="board_type" value="${boardType}" >
										<input type="hidden" name="board_num" id="board_num" value="${csIdx}" >
										<input type="hidden" name="check_reply" id="check_reply" value="${boardInfoVO.cs_reply}" >
											<div class="mt-10">
												<input type="text" id="cs_subject" name="cs_subject" value="${boardInfoVO.cs_subject}" readonly required class="single-input">
											</div> 
											
										<c:choose>
											<c:when test="${user_id == null}">
												<div class="mt-10">
													<input type="text" id="cs_writer_name" name="cs_writer_name" placeholder="작성자명"  value="${boardInfoVO.cs_writer_name}" readonly required class="single-input">
												</div>
												
												<div class="mt-10">
													<input type="text" id="cs_writer_email" name="cs_writer_email" placeholder="이메일"  value="${boardInfoVO.cs_writer_email}" readonly required class="single-input">
												</div>
											</c:when>
										</c:choose>
											<div class="mt-10">
												<textarea class="single-input" id="cs_content" name="cs_content" style="height:400px;" placeholder="문의 사항에 관하여 글을 남겨주세요!" readonly>${boardInfoVO.cs_content}</textarea>
											</div>
											<div align="center" style="margin-top: 15px;">
											<c:if test="${(user_id == boardInfoVO.cs_writer_id)}">
												<a href="javascript:writeInquiry();" class="genric-btn info-border radius" id="join-btn">수정</a>
											</c:if>
											<c:if test="${(checkUserStatus == 1 && boardInfoVO.cs_reply == 0)}">
												<a href="javascript:replyInquiry()" class="genric-btn warning-border radius" style="color:red;border:solid 1px red;">답변</a>
											</c:if>
												<a href="javascript:deleteInquiry()" class="genric-btn warning-border radius" style="color:green;border:solid 1px green;">삭제</a>
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