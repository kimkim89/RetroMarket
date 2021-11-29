package com.retro.moonmarket;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/main/*")
public class HomeMainController {
	
	
	@Autowired
	HomeMainService homeMainService;
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		
		//최신상품 정렬 by 신상품
		List<HashMap<String, Object>> listByRegDate = homeMainService.selectImageByRegDate();
		
		//최신상품 정렬 by 인기상품 
		List<HashMap<String, Object>> listBySoldNum = homeMainService.selectImageBySoldNum();
				
		//최신상품 정렬 by 할인상품
		List<HashMap<String, Object>> listByDiscount = homeMainService.selectImageByDiscountRate();
		
		
		mav.addObject("listByRegDate", listByRegDate);
		mav.addObject("listBySoldNum", listBySoldNum);
		mav.addObject("listByDiscount", listByDiscount);
		mav.setViewName("index");
		return mav;
		
	}
	
	
	
	
	
	
}
