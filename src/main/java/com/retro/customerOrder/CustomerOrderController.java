package com.retro.customerOrder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/order/*")
public class CustomerOrderController {
	
	
	//구매 페이지 이동
		@RequestMapping(value = "orderForm")
		public ModelAndView buyPage() {
			
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("order/checkout");
			return mav;
		}
}
