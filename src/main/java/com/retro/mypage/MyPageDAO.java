package com.retro.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.retro.customerOrder.CustomerOrderVO;
import com.retro.member.MemberVO;
import com.retro.product.WishlistVO;

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
	public List<Map<String, Object>> selectMyOrderHistory(Map<String, Object> map) {
		return sqlSession.selectList("mapper.MyPage.selectMyOrderHistory", map);
	}
	
	// My Page 주문 내역2
	public List<Map<String, Object>> selectMyOrderProdList(Map<String, Object> map) {
		return sqlSession.selectList("mapper.MyPage.selectMyOrderProdList", map);
	}
	
	//주문 목록 총 개수 구하기
	public int countMyPageOrderList(String userId) {
		return sqlSession.selectOne("mapper.MyPage.countMyPageOrderList", userId);
	}
	
	//마이페이지: 주문번호별 상세 내역 조회
	public OrderHistoryDTO selectOneOrderHistory(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.MyPage.selectOneOrderHistory", map);
	}
		
	//특정 주문번호에 관한 주문 상세 정보 조회
	public CustomerOrderVO selectOrderDetailInfo(String orderNumber) {
		return sqlSession.selectOne("mapper.MyPage.selectOrderDetailInfo", orderNumber);
	}
	
	//현재 로그인 한 아이디로 찜한 모든 상품 데이터 조회 
	public List<WishlistVO> selectLikeProdList(Map<String, Object> map) {
		return sqlSession.selectList("mapper.MyPage.selectLikeProdList", map);
	}
	
	//찜한 상품 정보 조회
	public List<Map<String, Object>> selectEachLikeProd(int productIdx) {
		return sqlSession.selectList("mapper.MyPage.selectEachLikeProd", productIdx);
	}
	
	//찜한 상품 개수 조회
	public int CountLikeList(String userId) {
		return sqlSession.selectOne("mapper.MyPage.CountLikeList", userId);
	}
	
	

}
