package com.retro.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.retro.admin.AdminService;
import com.retro.common.PagingService;
import com.retro.member.MemberService;
import com.retro.member.MemberVO;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {

	@Autowired
	BoardService boardService;
	@Autowired
	AdminService adminService;
	@Autowired
	MemberService memberService;

	
	@RequestMapping(value = "customerBoardList")
	public ModelAndView selectCsBoardList(	@RequestParam(value="board_type") Integer csType,
											@RequestParam(defaultValue = "1") int nowPage,
											@RequestParam(defaultValue = "") String searchField, 
											@RequestParam(defaultValue = "") String keyword,
											HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		/*페이징처리*/
		PagingService pagingService = new PagingService();
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		
		int pageSizeToPaging = 10;
		int blockSizeToBlockSize = 3;
		
		int dataCnt = boardService.countCsBoardList(csType, searchField, keyword);
		
		pagingMap = pagingService.pagingList(nowPage, dataCnt, pageSizeToPaging, blockSizeToBlockSize);
		int pageFirst = Integer.parseInt(pagingMap.get("pageFirst").toString());
		int pageSize = Integer.parseInt(pagingMap.get("pageSize").toString());
		
		//고객센터 내 게시판 게시글 조회
		List<BoardVO> boardList = boardService.selectCsBoardList(csType, searchField, keyword, pageFirst, pageSize);
		
		//고객센터게시판명 가져오기
		String boardName = getBoardName(csType);
		
		//20211203 수정 시작***********************************************************************************
		//비회원 접근 금지 확인을 위한 변수
		int accChk = 0;
		Object userIdObj = getCurrentUserIdObj(request);
		
		if(userIdObj != null) { //비회원이 아닐 경우
			accChk = 1;
		}
		//20211203 수정 끝***********************************************************************************
		
		mav.addObject("accChk", accChk);
		mav.addObject("boardName", boardName);
		mav.addObject("boardType", csType);
		mav.addObject("dataCnt", dataCnt);
		mav.addObject("pagingMap", pagingMap);
		mav.addObject("searchField", searchField);
		mav.addObject("keyword", keyword);
		mav.addObject("boardList", boardList);
		mav.setViewName("board/cs_board_list");
		return mav;
	}
	
	
	//고객센터 문의글 작성 페이지
	@RequestMapping(value = "customerBoardForm")
	public ModelAndView showCustomerBoardForm(	@RequestParam(value="board_type") Integer csType,
												@RequestParam(value="wu") String wu,
												HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		//고객센터게시판명 가져오기
		String boardName = getBoardName(csType);
		
		//===================접근 제한 작업 시작 ==============================
		//회원 or 관리자 확인용 변수
		int memberStatus = 0;
		Object userIdObj = getCurrentUserIdObj(request);
		
		//비회원 접근 금지 확인을 위한 변수
		int accChk = 0;
		
		if(userIdObj != null) { //비회원이 아닐 경우
			accChk = 1;
		}
		//===================접근 제한 작업 끝 ==============================		
		
		mav.addObject("accChk", accChk);
		mav.addObject("wu", wu); //원본 수정페이지인지 새글 작성 페이지 인지 구분
		mav.addObject("boardName", boardName);
		mav.addObject("boardType", csType);
		mav.setViewName("board/cs_board_form");
		return mav;
	}
	
	
	//문의사항 정보 저장
	@RequestMapping(value = "registerInquiry")
	public void insertInquiryInfo(	@RequestParam(value="board_type") Integer csType,
									BoardVO boardVO,
									HttpServletRequest request,
									HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();

		String userId = getCurrentUserId(request);
		
		MemberVO memInfo = adminService.adminMemberInfo(userId);
		boardVO.setCs_writer_id(userId);
		boardVO.setCs_writer_name(memInfo.getName());
		boardVO.setCs_writer_email(memInfo.getEmail());

		//게시글 저장
		int resultCnt = boardService.insertInquiryInfo(boardVO, request, csType);
				
		if(resultCnt > 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('등록되었습니다.'); location.href='" + request.getContextPath() + "/board/customerBoardList?board_type=" + csType + "'; </script>");
			out.flush();
		}
	}
	
	//고객센터게시판: 읽기 페이지
	@RequestMapping(value = "customerBoardRead")
	public ModelAndView readBoardList (	@RequestParam(value="board_type") Integer csType,
										@RequestParam(value="board_num") Integer csIdx,
										HttpServletRequest request,
										HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		//=================== 20211203 : 접근 제한 작업 시작 ============================================================================
			
		//회원 or 관리자 확인용 변수
		int memberStatus = 0;
		BoardVO boardInfoVO = boardService.selectEachBoardInfo(csIdx);
		Object userIdObj = getCurrentUserIdObj(request);
		//답변글일 경우, 원글 작성자의 정보 데이터를 찾아서 저장할 VO
		BoardVO anotherBoardVO = null;
		
		//비회원 접근 금지 확인을 위한 변수
		int accChk = 0;
		
		
		if(userIdObj != null) { //비회원 아닐 경우
			accChk = 1;
			//회원 or 관리자 확인
			memberStatus = memberService.checkUserStatus(userIdObj.toString());
		
			//답변글일 경우, 원글 작성자도 읽을 수 있도록 작업
			if(boardInfoVO.getCs_reply() == 1) {
				anotherBoardVO = boardService.selectEachBoardInfo(boardInfoVO.getOrigin_idx());
			}
			
			if(memberStatus == 0 ) { //회원일 경우
				if( boardInfoVO.getCs_reply() == 0 && !userIdObj.toString().equals(boardInfoVO.getCs_writer_id())) { //원글 클릭 시 현재 로그인한 아이디와 글 작성자의 아이디가 동일하지 않을 경우
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.print("<script> alert('본인이 작성한 글만 확인할 수 있습니다.'); location.href='" + request.getContextPath() + "/board/customerBoardList?board_type=" + csType + "'; </script>");
					out.flush();
				}else if(boardInfoVO.getCs_reply() == 1 && !userIdObj.toString().equals(anotherBoardVO.getCs_writer_id())) { //답변글 클릭 시 현재 로그인한 아이디가 원글의 작성자 아이디와 동일하지 않을 경우
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.print("<script> alert('본인이 작성한 글만 확인할 수 있습니다.'); location.href='" + request.getContextPath() + "/board/customerBoardList?board_type=" + csType + "'; </script>");
					out.flush();
				}
			}
		}else { //비회원일 경우
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script> alert('정상적인 경로를 통해 접근하여 주십시오.'); location.href='" + request.getContextPath() + "/board/customerBoardList?board_type=" + csType + "'; </script>");
			out.flush();
		}
		
		
		//=================== 20211203 : 접근 제한 작업 끝 ============================================================================

		//고객센터게시판명 가져오기
		String boardName = getBoardName(csType);
				
		mav.addObject("boardName", boardName);
		mav.addObject("memberStatus", memberStatus);
		mav.addObject("accChk", accChk);
		mav.addObject("boardInfoVO", boardInfoVO);
		mav.addObject("boardType", csType);
		mav.addObject("csIdx", csIdx);
		mav.setViewName("board/cs_board_read");
		return mav;
	}
	
	//답변 쓰기 페이지
	@RequestMapping(value = "replyInquiryForm")
	public ModelAndView showReplyInquiry (	@RequestParam(value="board_type") Integer csType,
											@RequestParam(value="board_num") Integer csIdx,
											HttpServletRequest request,
											HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		//원글에 대한 정보 조회
		BoardVO boardInfoVO = boardService.selectEachBoardInfo(csIdx);
		
		//문의사항답변 글제목
		boardInfoVO.setCs_subject("→ RE: " + boardInfoVO.getCs_subject());
		
		//고객센터게시판명 가져오기
		String boardName = getBoardName(csType);
		
		//=================== 20211203 : 접근 제한 작업 시작 ============================================================================
		//회원 or 관리자 확인용 변수
		int memberStatus = 0;
		Object userIdObj = getCurrentUserIdObj(request);
		
		//비회원 접근 금지 확인을 위한 변수
		int accChk = 0;
		
		if(userIdObj != null) { //비회원 아닐 경우
			accChk = 1;
			//회원 or 관리자 확인
			memberStatus = memberService.checkUserStatus(userIdObj.toString());
		
			if(!(userIdObj.toString().equals(boardInfoVO.getCs_writer_id()) || memberStatus == 1)) { 
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script> alert('본인이 작성한 글만 확인할 수 있습니다.'); location.href='" + request.getContextPath() + "/board/customerBoardList?board_type=" + csType + "'; </script>");
				out.flush();
			}
		}
		//=================== 20211203 : 접근 제한 작업 끝 ============================================================================
				
		mav.addObject("boardName", boardName);
		mav.addObject("memberStatus", memberStatus);
		mav.addObject("accChk", accChk);
		mav.addObject("boardInfoVO", boardInfoVO);
		mav.addObject("boardNum", csIdx);
		mav.addObject("boardType", csType);
		mav.setViewName("board/cs_board_reply");
		return mav;
	}
	
	
	//고객센터 원글 수정 페이지
	@RequestMapping(value = "csUpdateForm")
	public ModelAndView showCsBoardUpdateForm(	@RequestParam(value="board_type") Integer csType,
												@RequestParam(value="board_num") Integer csIdx,
												@RequestParam(value="wu") String wu,
												HttpServletRequest request,
												HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		//고객센터게시판명 가져오기
		String boardName = getBoardName(csType);
		BoardVO boardInfoVO;	
		//=================== 20211203 : 접근 제한 작업 시작 ============================================================================
		//회원 or 관리자 확인용 변수
		int memberStatus = 0;
		//수정할 글의 저장된 데이터 불러오기
		boardInfoVO = boardService.selectEachBoardInfo(csIdx);
		Object userIdObj = getCurrentUserIdObj(request);
		
		//비회원 접근 금지 확인을 위한 변수
		int accChk = 0;
		
		
		if(userIdObj != null) { //비회원 아닐 경우
			accChk = 1;
			//회원 or 관리자 확인
			memberStatus = memberService.checkUserStatus(userIdObj.toString());
		
//			System.out.println("확인중1: " + memberStatus);
//			System.out.println("확인중2: " + !(userIdObj.toString().equals(boardInfoVO.getCs_writer_id()) || memberStatus == 1));
//			System.out.println("확인중3: " + !(userIdObj.toString().equals(boardInfoVO.getCs_writer_id()) || memberStatus == 1));
		
			//작성자, 관리자만 수정 페이지 접근 가능
			if(!(userIdObj.toString().equals(boardInfoVO.getCs_writer_id()) || memberStatus == 1)) { 
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script> alert('접근이 불가능합니다.'); location.href='" + request.getContextPath() + "/board/customerBoardList?board_type=" + csType + "'; </script>");
				out.flush();
			}
		}
		//=================== 20211203 : 접근 제한 작업 끝 ============================================================================
		
		mav.addObject("memberStatus", memberStatus);
		mav.addObject("accChk", accChk);
		mav.addObject("wu", wu); //원본 수정페이지인지 새글 작성 페이지 인지 구분
		mav.addObject("board_num", csIdx);
		mav.addObject("boardInfoVO", boardInfoVO);
		mav.addObject("boardName", boardName);
		mav.addObject("boardType", csType);
		mav.setViewName("board/cs_board_form");
		return mav;
	}
	
	
	//문의사항 데이터 수정 후 저장
	@RequestMapping(value = "updateInquiry")
	public void updateInquiryInfo(	@RequestParam(value="board_type") Integer csType,
									@RequestParam(value="board_num") Integer csIdx,
									BoardVO boardVO,
									HttpServletRequest request,
									HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		String userId = "";
		
		
		BoardVO oldBoardVO = boardService.selectEachBoardInfo(csIdx);
		
			userId = getCurrentUserId(request);
			MemberVO memInfo = adminService.adminMemberInfo(userId);
			boardVO.setCs_writer_id(userId);
			boardVO.setCs_writer_name(memInfo.getName());
			boardVO.setCs_writer_email(memInfo.getEmail());
		
		
		String writerIP = memberService.getMemberCurrentIP(request);
		boardVO.setCs_ip(writerIP);
		boardVO.setCs_idx(csIdx);
				
		int resultCnt = boardService.updateInquiryInfo(boardVO);
	
		System.out.println(resultCnt);
		if(resultCnt > 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('수정되었습니다.'); location.href='" + request.getContextPath() + "/board/customerBoardList?board_type=" + csType + "'; </script>");
			out.flush();
		}
	}
	
	
	//===========================================================================================================
	//고객센터 원글 수정 페이지
	@RequestMapping(value = "csReplyUpdateForm")
	public ModelAndView showCsReplyForm(	@RequestParam(value="board_type") Integer csType,
											@RequestParam(value="board_num") Integer csIdx,
											@RequestParam(value="wu") String wu,
											HttpServletRequest request,
											HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		//수정할 글의 저장된 데이터 불러오기
		BoardVO boardInfoVO = boardService.selectEachBoardInfo(csIdx);
		
		//답변글 제목
		String csSubject = boardInfoVO.getCs_subject();
		boardInfoVO.setCs_subject("→RE: " + csSubject);
		
		//고객센터게시판명 가져오기
		String boardName = getBoardName(csType);
		
		//=================== 20211203 : 접근 제한 작업 시작 ============================================================================
		//회원 or 관리자 확인용 변수
		int memberStatus = 0;
		Object userIdObj = getCurrentUserIdObj(request);
		
		//비회원 접근 금지 확인을 위한 변수
		int accChk = 0;
		
		if(userIdObj != null) { //비회원 아닐 경우
			accChk = 1;
			//회원 or 관리자 확인
			memberStatus = memberService.checkUserStatus(userIdObj.toString());
		
			//본인 글일 경우 비밀번호 입력 페이지가 아닌 Read 페이지로 이동, 관리자는 모든 글 확인 가능
			if(!(userIdObj.toString().equals(boardInfoVO.getCs_writer_id()) || memberStatus == 1)) { 
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script> alert('본인이 작성한 글만 확인할 수 있습니다.'); location.href='" + request.getContextPath() + "/board/customerBoardList?board_type=" + csType + "'; </script>");
				out.flush();
			}
		}
		//=================== 20211203 : 접근 제한 작업 끝 ============================================================================
		
		mav.addObject("memberStatus", memberStatus);
		mav.addObject("accChk", accChk);
		mav.addObject("wu", wu); //원본 수정페이지인지 새글 작성 페이지 인지 구분
		mav.addObject("boardNum", csIdx);
		mav.addObject("boardInfoVO", boardInfoVO);
		mav.addObject("boardName", boardName);
		mav.addObject("boardType", csType);
		mav.setViewName("board/cs_board_reply");
		return mav;
	}

	
	//게시글 삭제
	@RequestMapping(value = "deleteInquiryInfo")
	public void deleteInquiryInfo(	@RequestParam(value="board_type") Integer csType,
									@RequestParam(value="board_num") Integer csIdx,
									HttpServletRequest request,
									HttpServletResponse response) throws IOException {
		int resultCnt = 0;
		
		//답변글 달려 있는지 확인
		int replyCnt = boardService.checkReplyExist(csIdx);
		
		System.out.println();
		System.out.println("replyCnt 확인 : " + replyCnt);
		System.out.println();
		
		if(replyCnt <= 0) {
			resultCnt = boardService.deleteInquiry(csIdx);
			if(resultCnt > 0) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('삭제 되었습니다.'); location.href='" + request.getContextPath() + "/board/customerBoardList?board_type=" + csType + "'; </script>");
				out.flush();
			}
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('답변글이 있는 경우 삭제가 불가합니다.'); location.href='" + request.getContextPath() + "/board/customerBoardRead?board_type=" + csType + "&board_num=" + csIdx + "'; </script>");
			out.flush();
		}
	}

		//===========================================================================================================
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	//고객센터 게시판명
	public String getBoardName(int csType) {
		//게시판명
		String boardName = "";
		
		if(csType == 1) {
			boardName = "상품문의";
		}else if(csType == 2) {
			boardName = "배송문의";
		}else if(csType == 3) {
			boardName = "변경/취소";
		}else if(csType == 4) {
			boardName = "교환/반품";
		}else if(csType == 5) {
			boardName = "입금확인";
		}else {
			boardName = "고객센터";
		}
		
		return boardName;
	}
	
	//현재 로그인 되어있는 아이디 Object타입으로 가져오기
	public Object getCurrentUserIdObj(HttpServletRequest request) {
		Object userId = request.getSession().getAttribute("user_id");
		return userId;
	}
	
	//현재 로그인 되어있는 아이디 가져오기
	public String getCurrentUserId(HttpServletRequest request) {
		String userId = (String)request.getSession().getAttribute("user_id");
		return userId;
	}
	
//===================비밀글 기능 보류=====================================================================
	/*
	//비밀번호 입력 페이지로 이동
	@RequestMapping(value = "checkPassPage")
	public ModelAndView showPassPage(	@RequestParam(value="board_type") Integer csType,
										@RequestParam(value="board_num") Integer csIdx,
										HttpServletRequest request,
										HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		int memberStatus = 0;
		BoardVO oldBoardVO = boardService.selectEachBoardInfo(csIdx);
		Object userIdObj = getCurrentUserIdObj(request);
		
		
		if(userIdObj != null) { //비회원 아닐 경우
			//회원 or 관리자 확인
			memberStatus = memberService.checkUserStatus(userIdObj.toString());
		
			//본인 글일 경우 비밀번호 입력 페이지가 아닌 Read 페이지로 이동, 관리자는 모든 글 확인 가능
			if(userIdObj.toString().equals(oldBoardVO.getCs_writer_id()) || memberStatus == 1) { 
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script> location.href='" + request.getContextPath() + "/board/customerBoardRead?board_type=" + csType + "&board_num=" + csIdx + "'; </script>");
				out.flush();
			}
		}
		//고객센터게시판명 가져오기
		String boardName = getBoardName(csType);
		
		mav.addObject("boardType", csType);
		mav.addObject("csIdx", csIdx);
		mav.addObject("boardName", boardName);
		mav.setViewName("board/cs_board_secret");
		return mav;
	}
	
	
	//비밀글 비밀번호 확인 페이지로 이동
	@RequestMapping(value = "checkPass")
	public ModelAndView checkPassword(	@RequestParam(value="board_type") Integer csType,
										@RequestParam(value="board_num") Integer csIdx,
										@RequestParam(value="entered_pw") String enteredPw,
										RedirectAttributes attributes,
										HttpServletRequest request,
										HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		//고객센터게시판명 가져오기
		String boardName = getBoardName(csType);
		
		BoardVO oldBoardVO = boardService.selectEachBoardInfo(csIdx);
		Object userIdObj = request.getSession().getAttribute("user_id");
		
		//System.out.println("아이디 확인중: " + userIdObj);
		
		//**************** 20211203 : 수정 작업 예정! 
		if(userIdObj == null || userIdObj.toString() != oldBoardVO.getCs_writer_id()) { //로그인 하지 않았거나, 본인이 작성한 글이 아닐 경우
//				if(!(enteredPw.equals(oldBoardVO.getCs_secret_num()))) {
//					response.setContentType("text/html; charset=UTF-8");
//					PrintWriter out = response.getWriter();
//					out.print("<script>alert('비밀번호를 다시 입력해 주세요.'); location.href='" + request.getContextPath() + "/board/checkPassPage?board_type=" + csType + "&board_num=" + csIdx +"'; </script>");
//					out.flush();
//				}else {
//					response.setContentType("text/html; charset=UTF-8");
//					PrintWriter out = response.getWriter();
//					out.print("<script> location.href='" + request.getContextPath() + "/board/customerBoardRead?board_type=" + csType + "&board_num=" + csIdx +"'; </script>");
//					out.flush();
//				}
//				System.out.println("비회원 or 내글 아님");
		}
		
		mav.addObject("boardName", boardName);
		mav.setViewName("board/cs_board_secret");
		return mav;
	} */
	
//===================비밀글 기능 보류=====================================================================
	
}
