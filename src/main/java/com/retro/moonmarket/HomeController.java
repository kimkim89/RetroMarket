package com.retro.moonmarket;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
@RequestMapping("/index/*")
public class HomeController {
	
	
		@Autowired
		HomeMainService homeMainService;
		
		ModelAndView mav = new ModelAndView();
		
		@RequestMapping(value = "main", method = RequestMethod.GET)
		public ModelAndView home(Locale locale, Model model) {

			
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
		
		//이력서 용(히어로)
		@RequestMapping(value = "beHero", method = RequestMethod.GET)
		public ModelAndView beHero(Locale locale, Model model) {
			System.out.println("여기 와쓰");
			mav.setViewName("beHero");
			return mav;
		}
		
		//이력서 용(히어로)
		@RequestMapping(value = "hero", method = RequestMethod.GET)
		public ModelAndView hero(Locale locale, Model model) {
			mav.setViewName("hero");
			return mav;
		}	
		
	
	
}
