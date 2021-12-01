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
import com.retro.member.MemberVO;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {

	@Autowired
	BoardService boardService;
	@Autowired
	AdminService adminService;

	
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
												HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		
		
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
		
		if(memberExistChk == 0) {
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
		
		mav.addObject("boardInfoVO", boardInfoVO);
		mav.addObject("boardType", csType);
		mav.setViewName("board/cs_board_read");
		return mav;
	}
	
	
	
	
	
	
	//현재 로그인 되어있는 아이디 가져오기
	public String getCurrentUserId(HttpServletRequest request) {
		
		Object userIdObj = request.getSession().getAttribute("user_id");
		
		
		String userId = (String)request.getSession().getAttribute("user_id");
		
		System.out.println("아이디 확인: " + userId.isEmpty());
		return userId;
	}
	
}
