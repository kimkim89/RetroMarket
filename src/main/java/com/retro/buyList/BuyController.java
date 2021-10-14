package com.retro.buyList;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.Getter;

@Controller
@RequestMapping("/buy/*")
public class BuyController {
	
	private ModelAndView mav = new ModelAndView();
	
	
	
	//구매 페이지 이동
	@RequestMapping(value = "orderForm")
	public ModelAndView buyPage() {
		
		mav.setViewName("order/checkout");
		return mav;
	}
	
}
