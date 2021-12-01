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
	
	//문의 사항 및 그 외 정보 저장 
	public int insertInquiryInfo(BoardVO boardVO) {
		return sqlSession.insert("mapper.Board.insertInquiryInfo", boardVO);
	}

	//문의 내역 조회
	public BoardVO selectEachBoardInfo(Integer csIdx) {
		return sqlSession.selectOne("mapper.Board.selectEachBoardInfo", csIdx);
	} 
	
	


}
