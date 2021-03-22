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
	
	//상품 게시판 이동 및 상품리스트 조회
	@RequestMapping(value = "cartList")
	public ModelAndView cartList(Locale locale, Model model) {
		
		mav.setViewName("cart");
		return mav;
	}
	
	//구매 페이지 이동
	@RequestMapping(value = "buyPage")
	public ModelAndView buyPage() {
		
		mav.setViewName("checkout");
		return mav;
	}
	
}
