package com.retro.adminOrder;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	
	
}