package com.retro.product;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.retro.moonmarket.HomeMainService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	HomeMainService homeMainService;
	
	private ModelAndView mav = new ModelAndView();
	
	
	
	//상품 게시판 이동 및 상품리스트 조회
	@RequestMapping(value = "productList")
	public ModelAndView productList(Locale locale, Model model) {
		
		
		ModelAndView mav = new ModelAndView();
		
		
		List<HashMap<String, Object>> ListByRegDate = homeMainService.selectImageByRegDate();
		List<HashMap<String, Object>> ListByDiscount = homeMainService.selectImageByDiscountRate();
		List<HashMap<String, Object>> ListBySoldNum = homeMainService.selectImageBySoldNum();
		
		mav.addObject("ListByRegDate", ListByRegDate);
		mav.addObject("ListByDiscount", ListByDiscount);
		mav.addObject("ListBySoldNum", ListBySoldNum);

		
		mav.setViewName("product");
		return mav;
	}
	
	//임시
	@RequestMapping(value = "temporary")
	public ModelAndView temporary(Locale locale, Model model) {
		
		mav.setViewName("temporary");
		return mav;
	}
	
	//임시
	@RequestMapping(value = "temporary2")
	public ModelAndView temporary2(Locale locale, Model model) {
		
		mav.setViewName("temporary2");
		return mav;
	}	
	
	//상품 상세보기
	@RequestMapping(value = "productDetail")
	public ModelAndView productDetail() {
		mav.setViewName("product-detatils");
		return mav;
	}
	
}
