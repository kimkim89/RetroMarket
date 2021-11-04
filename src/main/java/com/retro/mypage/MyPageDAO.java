package com.retro.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.retro.member.MemberVO;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 20210424 마이페이지 정보 들고오기
	public MemberVO getInfo(String id) {
		return sqlSession.selectOne("mapper.MyPage.MyInfo", id);
	}

	// 20210605 마이페이지 정보 수정
	public int modifyAction(Map<String, Object> map) {
		return sqlSession.update("mapper.MyPage.ModifyAction", map);
	}
	
	// My Page 주문 내역 조회1 - 주문TB, 주문상태TB
	public List<OrderHistoryDTO> selectMyOrderHistory(Map<String, Object> map) {
		return sqlSession.selectList("mapper.MyPage.selectMyOrderHistory", map);
	}
	
	// My Page 주문 내역2
	public List<Map<String, Object>> selectMyOrderProdList(String orderNumber) {
		return sqlSession.selectList("mapper.MyPage.selectMyOrderProdList", orderNumber);
	}
	
	//주문 목록 총 개수 구하기
	public int countMyPageOrderList(String userId) {
		return sqlSession.selectOne("mapper.MyPage.countMyPageOrderList", userId);
	}
	
	//마이페이지: 주문번호별 상세 내역 조회
	public OrderHistoryDTO selectOneOrderHistory(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.MyPage.selectOneOrderHistory", map);
	}

}
