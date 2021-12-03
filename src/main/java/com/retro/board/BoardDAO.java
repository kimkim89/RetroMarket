package com.retro.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	//고객센터 내 게시판 게시글 조회
	public List<BoardVO> selectCsBoardList(Map<String, Object> map) {
		return sqlSession.selectList("mapper.Board.selectCsBoardList", map);
	}
	
	//고객센터 내 게시판 게시글 개수 조회
	public int countCsBoardList(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.Board.countCsBoardList", map);
	} 
	
	//원글: 문의 사항 및 그 외 정보 저장 
	public int insertInquiryInfo(BoardVO boardVO) {
		return sqlSession.insert("mapper.Board.insertInquiryInfo", boardVO);
	}
	
	//답변글: 문의 사항 및 그 외 정보 저장
	public int insertReplyInfo(BoardVO boardVO) {
		return sqlSession.insert("mapper.Board.insertReplyInfo", boardVO);
	}
	
	//원글 insert 후에 origin_idx를 cs_idx와 동일하게 update -->
	public int updateOriginIdx(Integer csIdx) {
		return sqlSession.update("mapper.Board.updateOriginIdx", csIdx);
	}

	//문의 내역 조회
	public BoardVO selectEachBoardInfo(Integer csIdx) {
		return sqlSession.selectOne("mapper.Board.selectEachBoardInfo", csIdx);
	} 
	
	//특정 게시글의 최신 답변글 조회
	public BoardVO selectMaxOriginIdx(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.Board.selectMaxOriginIdx", map);
	} 
	
	//원글: 문의 사항 및 그 외 정보 수정 update
	public int updateInquiryInfo(BoardVO boardVO) {
		return sqlSession.insert("mapper.Board.updateInquiryInfo", boardVO);
	}

	//게시글 삭제
	public int deleteInquiry(Integer csIdx) {
		return sqlSession.delete("mapper.Board.deleteInquiry", csIdx);
	}

	//답변글 달려 있는지 확인
	public int checkReplyExist(Integer csIdx) {
		return sqlSession.selectOne("mapper.Board.checkReplyExist", csIdx);
	}
	
	//각 고객센터게시판별 최신글 조회 
	public BoardVO selectNewestCsIdx(Integer csType) {
		return sqlSession.selectOne("mapper.Board.selectNewestCsIdx", csType);
	}
	
	
	
	
}
