package com.retro.adminOrder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.customerOrder.CustomerOrderVO;

@Service
public class AdminOrderService {

	@Autowired
	AdminOrderDAO admOrderDAO;
	
	@Autowired
	CustomerOrderVO csOrderVO;
	
	public List<CustomerOrderVO> selectAdminOrderList(String searchField, String keyword, int pageFirst, int pageSize) {
		
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
	
	public int updateOrderInfo(CustomerOrderVO csOrderVO) {
		return admOrderDAO.updateOrderInfo(csOrderVO);
	}
	
	
}
