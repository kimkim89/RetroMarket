package com.retro.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.member.MemberService;

@Service
public class BoardService {
	
	@Autowired
	BoardDAO boardDAO;
	@Autowired
	MemberService memberService;
	
	//고객센터 내 게시판 게시글 조회
	public List<BoardVO> selectCsBoardList(int csType, String searchField, String keyword, int pageFirst, int pageSize) {
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("csType", csType);
			map.put("searchField", searchField);
			map.put("keyword", keyword);
			map.put("pageFirst", pageFirst);
			map.put("pageSize", pageSize);
		
		return boardDAO.selectCsBoardList(map);
	}
	
	//고객센터 내 게시판 게시글 개수 조회
	public int countCsBoardList(int csType, String searchField, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("csType", csType);
			map.put("searchField", searchField);
			map.put("keyword", keyword);
		
		return boardDAO.countCsBoardList(map);
	} 
	
	//문의 사항 및 그 외 정보 저장 
	public int insertInquiryInfo(BoardVO boardVO, HttpServletRequest request, Integer csType) {
		
		if(boardVO.getCs_writer_id() == null) {
			boardVO.setCs_writer_id("비회원");
		}
		
		String writerIP = memberService.getMemberCurrentIP(request);
		boardVO.setCs_ip(writerIP);
		boardVO.setCs_type(csType);
		
		return boardDAO.insertInquiryInfo(boardVO);
	}

	//문의 내역 조회
	public BoardVO selectEachBoardInfo(Integer csIdx) {
		return boardDAO.selectEachBoardInfo(csIdx);
	} 
	
	
	
	
	
}
