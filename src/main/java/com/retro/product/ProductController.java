package com.retro.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.retro.adminProduct.AdminProductImageVO;
import com.retro.adminProduct.AdminProductService;
import com.retro.moonmarket.HomeMainService;
import com.retro.moonmarket.HomeMainVO;
import com.sun.corba.se.impl.encoding.OSFCodeSetRegistry.Entry;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	ProductService productService;

	
	private ModelAndView mav = new ModelAndView();
	
	//***********************************
	//모든 상품 페이지로 이동 및 상품 리스트 조회
	@RequestMapping(value = "prList")
	public ModelAndView selectProduct(@RequestParam("prCode") String prCode) {
					
		ModelAndView mav = new ModelAndView();		
		
		List<HashMap<String, Object>> productList = productService.selectProduct(prCode);
		
		//List<HashMap<String, Object>> productList = productService.selectAllProducts();
		
		mav.addObject("productList", productList);				
		mav.setViewName("product");
		return mav;
	}	
	//***********************************
	
	
	
	//상품 상세보기
	@RequestMapping(value = "productDetail", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView productDetail(@RequestParam("product_id") String productId) {
		
		ModelAndView mav = new ModelAndView();
		
		List<HashMap<String, Object>> productList = productService.selectEachProd(productId);		
		List<String> prodImgList = new ArrayList<String>();		
				
		
		//List<HashMap<String, Object>>타입인 productList 내부 키 및 값 출력
		for(int i=0; i<productList.size(); i++) {
			//System.out.println("list순서 " + i + "번째 ");
			for(java.util.Map.Entry<String, Object> elem : productList.get(i).entrySet()) {				
				//System.out.println(String.format("키: %s, 값: %s", elem.getKey(), elem.getValue()));
				//System.out.println("점검중: " + elem.getKey().equals("mk_product_id"));
				if(elem.getKey().equals("mk_stored_upfile1")) {
					prodImgList.add(elem.getValue().toString());									
				}else if(elem.getKey().equals("mk_stored_upfile2")) {
					prodImgList.add(elem.getValue().toString());									
				}else if(elem.getKey().equals("mk_stored_upfile3")) {
					prodImgList.add(elem.getValue().toString());									
				}else if(elem.getKey().equals("mk_stored_upfile4")) {
					prodImgList.add(elem.getValue().toString());									
				}else if(elem.getKey().equals("mk_stored_upfile5")) {
					prodImgList.add(elem.getValue().toString());									
				}
			}
		}
	
//		System.out.println("테스트중배열: " + prodImgList);
		
		mav.addObject("productList", productList);	
		mav.addObject("prodImgList", prodImgList);
		mav.setViewName("product_detail");
		return mav;
	}
	
	
	//장바구니 페이지
	@RequestMapping(value = "cart")
	public ModelAndView checkout(@RequestParam("productId") String productId) {
					
		ModelAndView mav = new ModelAndView();		
		
		List<HashMap<String, Object>> productList = productService.selectEachProd(productId);	
		
		System.out.println("테스트 상품아이디: " + productId);
		
		mav.addObject("productList", productList);
		mav.setViewName("cart");
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
