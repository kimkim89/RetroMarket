package com.retro.adminOrder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.customerOrder.CustomerOrderVO;

@Service
public class adminOrderService {

	@Autowired
	adminOrderDAO admOrderDAO;
	
	public CustomerOrderVO selectAdminOrderList() {
		return admOrderDAO.selectAdminOrderList();
	}
}
