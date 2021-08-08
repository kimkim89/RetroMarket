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
import com.retro.moonmarket.HomeMainVO;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	HomeMainService homeMainService;
	HomeMainVO homeMainVO;
	
	private ModelAndView mav = new ModelAndView();
	
	
	
	//모든 상품 페이지로 이동 및 상품 리스트 조회
	@RequestMapping(value = "allProducts")
	public ModelAndView selectAllProducts(Locale locale, Model model) {
					
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
	
	//스낵 상품 페이지로 이동 및 상품 리스트 조회
	@RequestMapping(value = "snack")
	public ModelAndView selectSnack(Locale locale, Model model) {
					
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
	
	// 젤리/사탕 상품 페이지로 이동 및 상품 리스트 조회
	@RequestMapping(value = "jellyandcandy")
	public ModelAndView selectJellyCandy(Locale locale, Model model) {
					
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
	
	// 기타 상품 페이지로 이동 및 상품 리스트 조회
	@RequestMapping(value = "etc")
	public ModelAndView selectEtc(Locale locale, Model model) {
					
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
