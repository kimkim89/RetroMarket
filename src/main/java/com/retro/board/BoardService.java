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
		//답변글 저장 시 해당 답변글의 원글 번호를 저장할 변수
		Integer csIdx = 0;
		
		String writerIP = memberService.getMemberCurrentIP(request);
		boardVO.setCs_ip(writerIP);
		boardVO.setCs_type(csType);
		
		if(request.getParameter("reply_check").equals("reply")) { //답변글 저장할 경우*************
			csIdx = Integer.parseInt(request.getParameter("board_num"));
			//특정 게시글의 최신 답변글 조회
			BoardVO checkBoardVO = selectMaxOriginIdx(csType, csIdx);
			
			if(checkBoardVO.getGroup_order() <= 0) { //답변글이 없을 경우
				boardVO.setGroup_order(0);
				boardVO.setGroup_layer_check(0);
			}else { //답변글이 있을 경우
				boardVO.setGroup_order(checkBoardVO.getGroup_order() + 1);
				boardVO.setGroup_layer_check(0);
			}
			boardVO.setOrigin_idx(csIdx);
			
			return boardDAO.insertReplyInfo(boardVO);
			
		}else { //원글 저장할 경우 ******* 
			boardDAO.insertInquiryInfo(boardVO);
			//게시글 List배열 선언
			BoardVO newBoardVO = selectNewestCsIdx(csType);
			return updateOriginIdx(newBoardVO.getCs_idx());
		}
	}
	
	
	//원글 insert 후에 origin_idx를 cs_idx와 동일하게 update -->
	public int updateOriginIdx(Integer csIdx) {
		return boardDAO.updateOriginIdx(csIdx);
	}
	

	//문의 내역 조회
	public BoardVO selectEachBoardInfo(Integer csIdx) {
		return boardDAO.selectEachBoardInfo(csIdx);
	} 
	
	//특정 게시글의 최신 답변글 조회
	public BoardVO selectMaxOriginIdx(int csType, int originIdx) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("csType", csType);
		map.put("originIdx", originIdx);
		
		return boardDAO.selectMaxOriginIdx(map);
	} 
	
	
	//원글: 문의 사항 및 그 외 정보 수정 update
	public int updateInquiryInfo(BoardVO boardVO) {
		return boardDAO.updateInquiryInfo(boardVO);
	}

	//게시글 삭제
	public int deleteInquiry(Integer csIdx) {
		return boardDAO.deleteInquiry(csIdx);
	}
	
	//답변글 달려 있는지 확인
	public int checkReplyExist(Integer csIdx) {
		return boardDAO.checkReplyExist(csIdx);
	}
	
	//각 고객센터게시판별 최신글 조회 
	public BoardVO selectNewestCsIdx(Integer csType) {
		return boardDAO.selectNewestCsIdx(csType);
	}
	
}
