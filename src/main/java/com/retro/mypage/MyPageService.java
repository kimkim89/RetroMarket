package com.retro.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.customerOrder.CustomerOrderVO;
import com.retro.member.MemberVO;
import com.retro.product.WishlistVO;

@Service
public class MyPageService {

	@Autowired
	MyPageDAO mypageDAO = new MyPageDAO();

	// 20210424 마이페이지 정보 들고오기
	public MemberVO getInfo(String id) {
		return mypageDAO.getInfo(id);
	}

	// 회원 정보 수정
	public int modifyAction(MyPageVO mypageVO, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mypageVO", mypageVO);
		map.put("type", type);
		System.out.println("맵"+map);
		
		return mypageDAO.modifyAction(map);
		
	}
	
	// My Page 주문 내역 조회1 - 주문TB, 주문상태TB
	public List<Map<String, Object>> selectMyOrderHistory(int pageFirst, int pageSize, String userId) {
		
		Map<String, Object> map = new HashMap<String, Object>();		
			map.put("pageFirst", pageFirst);
			map.put("pageSize", pageSize);
			map.put("userId", userId);
			
		return mypageDAO.selectMyOrderHistory(map);
	}
	
	
	// My Page 주문 내역2
	public List<Map<String, Object>> selectMyOrderProdList(String orderNumber) {
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("orderNumber", orderNumber);
		
		return mypageDAO.selectMyOrderProdList(map);
	}
	
	//주문 목록 총 개수 구하기
	public int countMyPageOrderList(String userId) {
		return mypageDAO.countMyPageOrderList(userId);
	}
	
	//마이페이지: 주문번호별 상세 내역 조회
	public OrderHistoryDTO selectOneOrderHistory(String userId, String orderCode) {
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("orderCode", orderCode);		
						
		return mypageDAO.selectOneOrderHistory(map);
	}
		
	//특정 주문번호에 관한 주문 상세 정보 조회
	public CustomerOrderVO selectOrderDetailInfo(String orderNumber) {
		return mypageDAO.selectOrderDetailInfo(orderNumber);
	}
	
	//현재 로그인 한 아이디로 찜한 모든 상품 데이터 조회 
	public List<WishlistVO> selectLikeProdList(String userId, int pageFirst, int pageSize) {
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("pageFirst", pageFirst);
			map.put("pageSize", pageSize);
		return mypageDAO.selectLikeProdList(map);
	}

	//찜한 상품 정보 조회
	public List<Map<String, Object>> selectEachLikeProd(int productIdx) {
		return mypageDAO.selectEachLikeProd(productIdx);		
	}
	
	//찜한 상품 개수 조회
	public int CountLikeList(String userId) {
		return mypageDAO.CountLikeList(userId);
	}
	
}
