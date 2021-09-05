package com.retro.product;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.retro.adminProduct.AdminProductImageVO;
import com.retro.adminProduct.AdminProductService;
import com.retro.moonmarket.HomeMainService;
import com.retro.moonmarket.HomeMainVO;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	ProductService productService;
	AdminProductService admProdService;
	
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
	
	
	//상품 상세보기
	@RequestMapping(value = "productDetail", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView productDetail(@RequestParam("product_id") String product_id,
									  @RequestParam("product_code") String product_code) {
		
		ModelAndView mav = new ModelAndView();
		
		List<HashMap<String, Object>> productList = productService.selectEachProd(product_id);
		
		
		//개별 상품상세이미지 select
		AdminProductImageVO prodImgList = admProdService.selectProdImage(product_code);
		
		mav.addObject("productList", productList);		
		mav.setViewName("product_detail");
		return mav;
	}
	
	
	
	//모든 상품 페이지 - 인기상품 버튼 클릭 시
	@RequestMapping(value = "allPopularProducts")
	public ModelAndView selectAllPopularProd(Locale locale, Model model) {
					
		ModelAndView mav = new ModelAndView();		
		
		List<HashMap<String, Object>> productList = productService.selectAllPopularProd();
		
		mav.addObject("productList", productList);				
		mav.setViewName("product");
		return mav;
	}
	
	
	//모든 상품 페이지 - 신상품 버튼 클릭 시
	@RequestMapping(value = "allNewProducts")
	public ModelAndView selectAllNewProd(Locale locale, Model model) {
					
		ModelAndView mav = new ModelAndView();		
		
		List<HashMap<String, Object>> productList = productService.selectAllNewProd();
		
		mav.addObject("productList", productList);				
		mav.setViewName("product");
		return mav;
	}
	
	//모든 상품 페이지 - 할인상품 버튼 클릭 시
	@RequestMapping(value = "allDiscountProducts")
	public ModelAndView selectAllDiscountProd(Locale locale, Model model) {
					
		ModelAndView mav = new ModelAndView();		
		
		List<HashMap<String, Object>> productList = productService.selectAllDiscountProd();
		
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
	
	
	
}
