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
@RequestMapping("/index/*")
public class HomeController {
	
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
//		String notice = "";
//		mav.addObject("notice", notice);
		mav.setViewName("index");
		return mav;
	}
	
	//이력서 용
	@RequestMapping(value = "challenge", method = RequestMethod.GET)
	public ModelAndView challenge(Locale locale, Model model) {
		mav.setViewName("challenge");
		return mav;
	}
	
	//이력서 용
	@RequestMapping(value = "choice", method = RequestMethod.GET)
	public ModelAndView choice(Locale locale, Model model) {
		mav.setViewName("choice");
		return mav;
	}
	
	
	
	
	
	
}
