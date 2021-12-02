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
											@RequestParam(defaultValue = "") String keyword ) {
		
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
		String userId = "";
		int memberExistChk = Integer.parseInt((request.getParameter("memberExistChk").toString()));
				
		if(memberExistChk == 0) { //회원일 경우
			userId = getCurrentUserId(request);
			MemberVO memInfo = adminService.adminMemberInfo(userId);
			boardVO.setCs_writer_id(userId);
			boardVO.setCs_writer_name(memInfo.getName());
			boardVO.setCs_writer_email(memInfo.getEmail());
		}
		
		int resultCnt = boardService.insertInquiryInfo(boardVO, request, csType);
	
		if(resultCnt > 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('등록되었습니다.'); location.href='" + request.getContextPath() + "/board/customerBoardList?board_type=" + csType + "'; </script>");
			out.flush();
		}
	}
	
	//문의사항 읽기 페이지
	@RequestMapping(value = "customerBoardRead")
	public ModelAndView readBoardList (	@RequestParam(value="board_type") Integer csType,
										@RequestParam(value="board_num") Integer csIdx,
										HttpServletRequest request,
										HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		BoardVO boardInfoVO = boardService.selectEachBoardInfo(csIdx);
		
		//고객센터게시판명 가져오기
		String boardName = getBoardName(csType);
				
		mav.addObject("boardName", boardName);
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
											HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		//고객센터게시판명 가져오기
		String boardName = getBoardName(csType);
				
		mav.addObject("boardName", boardName);
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
												HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		String userId = getCurrentUserId(request);
		int userIdExistChk = 0;
		
		if(userId.isEmpty() == true) {
			userIdExistChk = 0;
		}else {
			userIdExistChk = 1;
		}
		
		//수정할 글의 저장된 데이터 불러오기
		BoardVO boardVO = boardService.selectEachBoardInfo(csIdx);
		
		//고객센터게시판명 가져오기
		String boardName = getBoardName(csType);
		
		mav.addObject("userIdExistChk", userIdExistChk);
		mav.addObject("wu", wu); //원본 수정페이지인지 새글 작성 페이지 인지 구분
		mav.addObject("board_num", csIdx);
		mav.addObject("boardVO", boardVO);
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
		int memberExistChk = Integer.parseInt((request.getParameter("memberExistChk").toString()));
		
		BoardVO oldBoardVO = boardService.selectEachBoardInfo(csIdx);
			
		
		
		if(memberExistChk == 0) { //회원일 경우
			userId = getCurrentUserId(request);
			MemberVO memInfo = adminService.adminMemberInfo(userId);
			boardVO.setCs_writer_id(userId);
			boardVO.setCs_writer_name(memInfo.getName());
			boardVO.setCs_writer_email(memInfo.getEmail());
		}//else { //비회원일 경우
			System.out.println("확인중::: ");
			System.out.println( "입력한 비번: " + boardVO.getCs_secret_num() + ", 원래 비번" + oldBoardVO.getCs_secret_num());
			//비회원 저장했던 비밀번호와 일치하지 않을 경우
			if(!boardVO.getCs_secret_num().equals(oldBoardVO.getCs_secret_num())) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('비밀번호를 다시 입력해 주세요.'); location.href='" + request.getContextPath() + "/board/csUpdateForm?board_type=" + csType + "&board_num=" + csIdx + "&wu=u'; </script>");
				out.flush();
			}
		//}
		
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
	
	
	//비밀번호 입력 페이지로 이동
	@RequestMapping(value = "checkPassPage")
	public ModelAndView showPassPage(	@RequestParam(value="board_type") Integer csType,
										@RequestParam(value="board_num") Integer csIdx,
										HttpServletRequest request,
										HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
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
										HttpServletRequest request,
										HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		//고객센터게시판명 가져오기
		String boardName = getBoardName(csType);
		
		BoardVO oldBoardVO = boardService.selectEachBoardInfo(csIdx);
		Object userIdObj = request.getSession().getAttribute("user_id");
		
		System.out.println("아이디 확인중: " + userIdObj);
		//**************** 20211203 : 수정 작업 예정! 
		if(userIdObj == null || userIdObj.toString() != oldBoardVO.getCs_writer_id()) { //로그인 하지 않았거나, 본인이 작성한 글이 아닐 경우
			if(!(enteredPw.equals(oldBoardVO.getCs_secret_num()))) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('비밀번호를 다시 입력해 주세요.'); location.href='" + request.getContextPath() + "/board/checkPassPage?board_type=" + csType + "&board_num=" + csIdx +"'; </script>");
				out.flush();
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script> location.href='" + request.getContextPath() + "/board/customerBoardRead?board_type=" + csType + "&board_num=" + csIdx +"'; </script>");
				out.flush();
			}
		}else { //본인 작성글일 경우
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script> location.href='" + request.getContextPath() + "/board/customerBoardRead?board_type=" + csType + "&board_num=" + csIdx +"'; </script>");
			out.flush();
		}
		
		mav.addObject("boardName", boardName);
		mav.setViewName("board/cs_board_secret");
		return mav;
	}
	
	
	
	
	
	
	
	
	
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
	
	
	
	//현재 로그인 되어있는 아이디 가져오기
	public String getCurrentUserId(HttpServletRequest request) {
		
		String userId = (String)request.getSession().getAttribute("user_id");
		
		System.out.println("아이디 확인: " + userId.isEmpty());
		return userId;
	}
	
}
