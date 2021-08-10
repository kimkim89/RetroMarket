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
	ProductService productService;
	
	private ModelAndView mav = new ModelAndView();
	
	
	
	//모든 상품 페이지로 이동 및 상품 리스트 조회
	@RequestMapping(value = "allProducts")
	public ModelAndView selectAllProducts(Locale locale, Model model) {
					
		ModelAndView mav = new ModelAndView();		
		
		List<HashMap<String, Object>> productList = productService.selectAllProducts();
		
		mav.addObject("productList", productList);				
		mav.setViewName("product");
		return mav;
	}
	
	//스낵 상품 페이지로 이동 및 상품 리스트 조회
	@RequestMapping(value = "snack")
	public ModelAndView selectSnack(Locale locale, Model model) {
					
		ModelAndView mav = new ModelAndView();
		
		List<HashMap<String, Object>> productList = productService.selectSnack();
		
		mav.addObject("productList", productList);
		mav.setViewName("product");
		return mav;
	}
	
	// 젤리/사탕 상품 페이지로 이동 및 상품 리스트 조회
	@RequestMapping(value = "jellyandcandy")
	public ModelAndView selectJellyCandy(Locale locale, Model model) {
					
		ModelAndView mav = new ModelAndView();
		
		List<HashMap<String, Object>> productList = productService.selectJellyCandy();
		
		mav.addObject("productList", productList);
		mav.setViewName("product");
		return mav;
	}	
	
	// 기타 상품 페이지로 이동 및 상품 리스트 조회
	@RequestMapping(value = "etc")
	public ModelAndView selectEtc(Locale locale, Model model) {
					
		ModelAndView mav = new ModelAndView();
		
		List<HashMap<String, Object>> productList = productService.selectEtc();
		
		mav.addObject("productList", productList);
		mav.setViewName("product");
		return mav;
	}	
	
	
	//모든 상품 페이지 - 인기상품 버튼 클릭 시
	@RequestMapping(value = "allPopularProducts")
	public ModelAndView selectallPopularProd(Locale locale, Model model) {
					
		ModelAndView mav = new ModelAndView();		
		
		List<HashMap<String, Object>> productList = productService.selectallPopularProd();
		
		mav.addObject("productList", productList);				
		mav.setViewName("product");
		return mav;
	}
	
	
	//모든 상품 페이지 - 신상품 버튼 클릭 시
	@RequestMapping(value = "allNewProducts")
	public ModelAndView selectallNewProd(Locale locale, Model model) {
					
		ModelAndView mav = new ModelAndView();		
		
		List<HashMap<String, Object>> productList = productService.selectallNewProd();
		
		mav.addObject("productList", productList);				
		mav.setViewName("product");
		return mav;
	}
	
	//모든 상품 페이지 - 할인상품 버튼 클릭 시
	@RequestMapping(value = "allDiscountProducts")
	public ModelAndView selectallDiscountProducts(Locale locale, Model model) {
					
		ModelAndView mav = new ModelAndView();		
		
		List<HashMap<String, Object>> productList = productService.selectallDiscountProducts();
		
		mav.addObject("productList", productList);				
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
