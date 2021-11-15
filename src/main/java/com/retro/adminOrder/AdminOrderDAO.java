package com.retro.adminOrder;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.retro.admin.PointVO;
import com.retro.customerOrder.CustomerOrderVO;

@Repository
public class AdminOrderDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<CustomerOrderVO> selectAdminOrderList(Map<String, Object> map) {
		return sqlSession.selectList("mapper.AdminOrder.selectAdminOrderList", map);
	}

	public int countOrderList(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.AdminOrder.countOrderList", map);
	}

	public Map<String, Object> selectEachOrderList(int orderIdx) {
		return sqlSession.selectOne("mapper.AdminOrder.selectEachOrderList", orderIdx);
	}

	public List<Map<String, Object>> selectOrderedProd(String orderCode) {		
		return sqlSession.selectList("mapper.AdminOrder.selectOrderedProd", orderCode);
	}
	
	public List<OrderStatusVO> selectOrderStatInfo() {
		return sqlSession.selectList("mapper.AdminOrder.selectOrderStatInfo");
	}
	
	public int updateOrderInfo(CustomerOrderVO csOrderVO) {
		return sqlSession.update("mapper.AdminOrder.updateOrderInfo", csOrderVO);
	}
	
	//상품 구매시 포인트 테이블에 해당 데이터 저장
	public void insertPointInfo(PointVO pointVO) {
		sqlSession.insert("mapper.AdminOrder.insertPointInfo", pointVO);
	}
	
	//배송완료 상태로 변경할 경우, member테이블에 누적 적립금 저장되도록 update 
	public void updateTotalMemberPoint(Map<String, Object> map) {
		sqlSession.update("mapper.AdminOrder.updateTotalMemberPoint", map);
	}
	
	//ID와 주문번호로 포인트 내역 조회 
	public PointVO selectOnePointList(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.AdminOrder.selectOnePointList", map);
	}
	
	//회원(member)테이블에 point컬럼 값 업데이트 
	public void updateMemberPoint(Map<String, Object> map) {
		sqlSession.update("mapper.CustomerOrder.updateMemberPoint", map);
	}
	
}
