package com.retro.moonmarket;

import java.util.Locale;

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
	
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		
		
		mav.setViewName("index");
		return mav;
	}
	
	
	
	
	
	
}
