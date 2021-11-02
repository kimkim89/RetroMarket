package com.retro.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.member.MemberVO;

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
	public List<OrderHistoryDTO> selectMyOrderHistory(int pageFirst, int pageSize, String userId) {
		
		Map<String, Object> map = new HashMap<String, Object>();		
			map.put("pageFirst", pageFirst);
			map.put("pageSize", pageSize);
			map.put("userId", userId);
			
		return mypageDAO.selectMyOrderHistory(map);
	}
	
	
	// My Page 주문 내역2
	public List<Map<String, Object>> selectMyOrderProdList(String orderNumber) {
		return mypageDAO.selectMyOrderProdList(orderNumber);
	}
	
	//주문 목록 총 개수 구하기
	public int countMyPageOrderList(String userId) {
		return mypageDAO.countMyPageOrderList(userId);
	}
	
	
	
	
	
}
