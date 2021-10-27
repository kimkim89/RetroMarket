package com.retro.adminOrder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.retro.common.PagingService;
import com.retro.customerOrder.CustomerOrderVO;

@Controller
@RequestMapping(value="/adminOrder/*")
public class AdminOrderController {

	@Autowired
	AdminOrderService admOrderService;
	
	//주문 관리 목록 페이지 이동
	@RequestMapping(value = "orderList")
	public ModelAndView selectAdmOrderList( @RequestParam(defaultValue = "1") int nowPage,
											@RequestParam(defaultValue = "") String searchField, 
											@RequestParam(defaultValue = "") String keyword ) {
		
		ModelAndView mav = new ModelAndView();
		
		/*페이징처리*/
		PagingService pagingService = new PagingService();
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		
		int pageSizeToPaging = 4;
		int blockSizeToBlockSize = 3;
		
		int OrderCount = admOrderService.countOrderList(searchField, keyword);
		
		pagingMap = pagingService.pagingList(nowPage, OrderCount, pageSizeToPaging, blockSizeToBlockSize);
			int pageFirst = Integer.parseInt(pagingMap.get("pageFirst").toString());
			int pageSize = Integer.parseInt(pagingMap.get("pageSize").toString());
			
		List<CustomerOrderVO> csOrderList = admOrderService.selectAdminOrderList(searchField, keyword, pageFirst, pageSize);
		
		mav.addObject("pagingMap", pagingMap);
		mav.addObject("searchField", searchField);
		mav.addObject("keyword", keyword);
		mav.addObject("csOrderList", csOrderList);
		mav.setViewName("admin/admin_order");
		return mav;
	}
	
	
	// 주문 내역 수정 페이지
	@RequestMapping(value = "orderForm")
	public ModelAndView selectEachOrderInfo() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/admin_order_form");
		return mav;
	}
	

	
}
