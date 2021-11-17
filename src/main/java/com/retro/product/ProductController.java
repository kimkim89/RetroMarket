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
import com.retro.common.PagingService;
import com.retro.moonmarket.HomeMainService;
import com.retro.moonmarket.HomeMainVO;
import com.sun.corba.se.impl.encoding.OSFCodeSetRegistry.Entry;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	ProductService productService;

	
	private ModelAndView mav = new ModelAndView();
	
	//모든 상품 페이지로 이동 및 상품 리스트 조회
	@RequestMapping(value = "prList")
	public ModelAndView selectProduct(	@RequestParam(defaultValue = "1") int nowPage, 
										@RequestParam("prCode") String prCode,
										
										HttpServletRequest request) {
					
		ModelAndView mav = new ModelAndView();	
		
		//System.out.println("prType확인중--------- : " + prType);
		
		/*페이징처리*/
		PagingService pagingService = new PagingService();
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		
		int pageSizeToPaging = 12;
		int blockSizeToBlockSize = 3;
		
		int productCount = productService.countAllProducts(prCode, "");
		
		pagingMap = pagingService.pagingList(nowPage, productCount, pageSizeToPaging, blockSizeToBlockSize);
		int pageFirst = Integer.parseInt(pagingMap.get("pageFirst").toString());
		int pageSize = Integer.parseInt(pagingMap.get("pageSize").toString());
		
		//상품 데이터 조회
		List<HashMap<String, Object>> productList = productService.selectProdList(prCode, "", pageFirst, pageSize);
		
		mav.addObject("pagingMap", pagingMap);
		mav.addObject("prCode", prCode);
		mav.addObject("productList", productList);				
		mav.setViewName("product/product");
		return mav;
	}	

	
	//상품 상세보기
	@RequestMapping(value = "productDetail", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView productDetail(@RequestParam("product_id") String productId) {
		
		ModelAndView mav = new ModelAndView();
		
		List<HashMap<String, Object>> productList = productService.selectEachProd(productId);	
		
		int prTotalQuantity = (Integer) productList.get(0).get("mk_inventory");
		String prBtnName = "";
		String prBtnBlock = "";
		String prBtnClassName = "";
		
		if(prTotalQuantity == 0) {
			prBtnName = "품절";
			prBtnBlock = "disabled";
			prBtnClassName = "outStock";
		}else {
			prBtnName = "장바구니 담기";
		}
		
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
		
		mav.addObject("prBtnClassName", prBtnClassName);
		mav.addObject("prBtnBlock", prBtnBlock);
		mav.addObject("prBtnName", prBtnName);
		mav.addObject("productList", productList);	
		mav.addObject("prodImgList", prodImgList);
		mav.setViewName("product/product_detail");
		return mav;
	}
	
	
	//장바구니 페이지
	@RequestMapping(value = "cart")
	public ModelAndView checkout(@RequestParam("productId") String productId,
								 @RequestParam("productNum") Integer productNum,
								 @RequestParam("productPrice") Integer productPrice) {
					
		ModelAndView mav = new ModelAndView();		
		
		List<HashMap<String, Object>> productList = productService.selectEachProd(productId);	
		int totalPrice = productPrice * productNum;
		HashMap<String, Integer> cartMap = new HashMap<String, Integer>();
		cartMap.put("productNum", productNum);
		cartMap.put("totalPrice", totalPrice);
		
		System.out.println("productNum타입 확인" + productNum.getClass().getName());
		
		
		
		mav.addObject("productList", productList);		
		mav.addObject("cartMap", cartMap);
		mav.setViewName("cart");
		return mav;
	}
	
	
	
	//2021.11.17 ajax
	@RequestMapping(value = "ajaxProdList")
	@ResponseBody
	public List<List<HashMap<String, Object>>> ajaxSelectProdList(@RequestParam("prCode") String prCode,
															@RequestParam("prType") String prType,
															@RequestParam(defaultValue = "1") int nowPage
															) {
		
		List<HashMap<String, Object>> productList = new ArrayList<HashMap<String,Object>>();
		
		/*페이징처리*/
		PagingService pagingService = new PagingService();
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		
		int pageSizeToPaging = 6;
		int blockSizeToBlockSize = 3;
		
		int productCount = productService.countAllProducts(prCode, prType);
		
		System.out.println("productcnt===> " + productCount);
		
		pagingMap = pagingService.pagingList(nowPage, productCount, pageSizeToPaging, blockSizeToBlockSize);
		int pageFirst = Integer.parseInt(pagingMap.get("pageFirst").toString());
		int pageSize = Integer.parseInt(pagingMap.get("pageSize").toString());
		
		
		//상품 데이터 조회
		productList = productService.selectProdList(prCode, prType, pageFirst, pageSize);
		
		
		
		
		
		//*****************************************************
		//테스트중
		List<List<HashMap<String, Object>>> finalProductList = new ArrayList<List<HashMap<String,Object>>>();
		
		//테스트중-------------
		List pagingMapList = new ArrayList();
		
		pagingMapList.add(pagingMap);
			
			finalProductList.add(productList);
			finalProductList.add(pagingMapList);
		
			System.out.println();
			System.out.println("finalProductList확인 중:: " + finalProductList);
			System.out.println();
		
		
		
		//*****************************************************

		
		
		
//		System.out.println();
//		System.out.println("productList확인 중:: " + productList);
//		System.out.println();
		
		
		return finalProductList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	//모든 상품 페이지 - 인기상품 버튼 클릭 시
//	@RequestMapping(value = "allPopularProducts")
//	public ModelAndView selectAllPopularProd(Locale locale, Model model) {
//					
//		ModelAndView mav = new ModelAndView();		
//		
//		List<HashMap<String, Object>> productList = productService.selectAllPopularProd();
//		
//		mav.addObject("productList", productList);				
//		mav.setViewName("product/product");
//		return mav;
//	}
//	
//	
//	//모든 상품 페이지 - 신상품 버튼 클릭 시
//	@RequestMapping(value = "allNewProducts")
//	public ModelAndView selectAllNewProd(Locale locale, Model model) {
//					
//		ModelAndView mav = new ModelAndView();		
//		
//		List<HashMap<String, Object>> productList = productService.selectAllNewProd();
//		
//		mav.addObject("productList", productList);				
//		mav.setViewName("product/product");
//		return mav;
//	}
//	
//	//모든 상품 페이지 - 할인상품 버튼 클릭 시
//	@RequestMapping(value = "allDiscountProducts")
//	public ModelAndView selectAllDiscountProd(Locale locale, Model model) {
//					
//		ModelAndView mav = new ModelAndView();		
//		
//		List<HashMap<String, Object>> productList = productService.selectAllDiscountProd();
//		
//		mav.addObject("productList", productList);				
//		mav.setViewName("product/product");
//		return mav;
//	}
//	
	

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
