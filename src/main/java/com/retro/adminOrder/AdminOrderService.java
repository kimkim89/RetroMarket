package com.retro.adminOrder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.admin.PointVO;
import com.retro.customerOrder.CustomerOrderService;
import com.retro.customerOrder.CustomerOrderVO;
import com.retro.member.MemberVO;

@Service
public class AdminOrderService {

	@Autowired
	AdminOrderDAO admOrderDAO;
	
	@Autowired
	CustomerOrderVO csOrderVO;
	
	@Autowired
	CustomerOrderService csOrderService;
	
	
	public List<Map<String, Object>> selectAdminOrderList(String searchField, String keyword, int pageFirst, int pageSize) {
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchField", searchField);
			map.put("keyword", keyword);
			map.put("pageFirst", pageFirst);
			map.put("pageSize", pageSize);
		
		return admOrderDAO.selectAdminOrderList(map);
	}

	public int countOrderList(String searchField, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchField", searchField);
			map.put("keyword", keyword);
		
		return admOrderDAO.countOrderList(map);
	}

	public Map<String, Object> selectEachOrderList(int orderIdx) {
		return admOrderDAO.selectEachOrderList(orderIdx);		
	}

	public List<Map<String, Object>> selectOrderedProd(String orderCode) {
		return admOrderDAO.selectOrderedProd(orderCode);
	}
	
	public List<OrderStatusVO> selectOrderStatInfo() {
		return admOrderDAO.selectOrderStatInfo();
	}
	
	public int updateOrderInfo(CustomerOrderVO csOrderVO, HttpServletRequest request) {
	
	//주문자 아이디
	String userId = csOrderVO.getMember_id();
		
	//주문번호
	String orderNumber = request.getParameter("order_number");
	
	//회원 정보 조회
	MemberVO memberInfo = csOrderService.selectMyMemberId(userId);
	
	//해당 주문번호로 적립금이 저장되었는지 확인 하기 위해 포인트 테이블 정보 조회 
	PointVO pointInfo = selectOnePointList(userId, orderNumber, 1);
		
	//해당 주문건에 의해 발생한 포인트 적립되기 전 누적포인트
	int memberPoint = memberInfo.getPoint();
	//회원 누적 포인트 + 적립될 포인트 총액
	int totalPoint = csOrderVO.getAdded_point() + memberPoint;
	
	//배송완료 상태일 경우 상품구매에 따른 포인트 저장
	if(csOrderVO.getOrder_status() == 3 && pointInfo == null) {
		insertPointInfo(orderNumber, userId, csOrderVO.getAdded_point(), memberPoint, totalPoint);
		updateMemberPoint(totalPoint, userId);
	}
		return admOrderDAO.updateOrderInfo(csOrderVO);
	}
	
	
	//상품 구매시 포인트 테이블에 해당 데이터 저장
	public void insertPointInfo(String orderNumber, String userId, int purchasePoint, int memberPoint, int totalPoint) {
		
		PointVO pointVO = new PointVO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		pointVO.setId(userId);
		pointVO.setMp_point(purchasePoint);
		pointVO.setMp_point_type(1);
		pointVO.setMp_content("상품구매");
		pointVO.setMp_detail("주문번호: " + orderNumber);
		pointVO.setMp_option(orderNumber);
		pointVO.setMp_previous_point(memberPoint);
		pointVO.setCheck_point(1);
						
		map.put("memberPoint", totalPoint);
		map.put("userId", userId);
		
		//member테이블에 적립금 더한 누적 포인트 저장
		updateTotalMemberPoint(map);
		
		admOrderDAO.insertPointInfo(pointVO);
	}
	
	
	//배송완료 상태로 변경할 경우, member테이블에 누적 적립금 저장되도록 update 
	public void updateTotalMemberPoint(Map<String, Object> map) {
		admOrderDAO.updateTotalMemberPoint(map);
	}	
		
	//ID와 주문번호로 포인트 내역 조회 
	public PointVO selectOnePointList(String userId, String orderNumber, int checkPoint) {
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("orderNumber", orderNumber);
			map.put("checkPoint", checkPoint);		
		
		return admOrderDAO.selectOnePointList(map);
	}	
	
	//회원(member)테이블에 point컬럼 값 업데이트 
	public void updateMemberPoint(int totalPoint, String memberId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("totalPoint", totalPoint);
			map.put("memberId", memberId);
		
		admOrderDAO.updateMemberPoint(map);
	}
	
	
}
