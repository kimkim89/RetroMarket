package com.retro.adminOrder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.retro.customerOrder.CustomerOrderVO;

@Controller
@RequestMapping(value="/adminOrder/*")
public class adminOrderController {

	@Autowired
	adminOrderService admOrderService;
	
	//주문 관리 목록 페이지 이동
	@RequestMapping(value = "orderList")
	public ModelAndView selectAdmOrderList() {
		
		ModelAndView mav = new ModelAndView();
		
		CustomerOrderVO orderList = admOrderService.selectAdminOrderList();
		
		mav.addObject("orderList", orderList);
		mav.setViewName("admin/admin_order");
		return mav;
	}
	
}
