package com.retro.moonmarket;

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
		
		
		List ListByRegDate = homeMainService.selectImageByRegDate();
		List ListByDiscount = homeMainService.selectImageByDiscountRate();
		List ListBySoldNum = homeMainService.selectImageBySoldNum();
				
		mav.setViewName("index");
		return mav;
	}
	
	
	
	
	
	
}
