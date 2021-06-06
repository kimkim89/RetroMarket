package com.retro.adminProduct;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
@RequestMapping("/adminProd/*")
public class AdminProductController {
	
	@Autowired
	private AdminProductService admProdService;
	
		//상품관리-목록 페이지
		@RequestMapping(value = "adminProduct")
		public ModelAndView adminProduct() {
			ModelAndView mav = new ModelAndView();
		
			mav.addObject("productList", admProdService.adminProductSelect());
			mav.setViewName("admin/admin_product");
			return mav;
		}
		
		
		//상품관리-상품 등록 페이지 요청
		@RequestMapping(value = "adminProductRegister")
		public ModelAndView adminProductRegister( ) {
			
			ModelAndView mav = new ModelAndView();
			
			/*//상품등록인지 수정인지 구분해주는 구분자 => wu
			//i=> 상품등록, u=> 상품수정
			String wu = "i";
								
			//상품분류(신상품/인기상품/할인상품)
			List<AdminProductVO> prodSortList = admProdService.selectProdSort();				
					
			mav.addObject("wu", wu);	
			mav.addObject("prodSortList", prodSortList);*/
			mav.setViewName("admin/admin_product_register");
			return mav;
		}
		
		
		//상품관리-상품 수정 페이지 요청
		@RequestMapping(value = "adminProdModify/{product_num}", method = RequestMethod.GET)
		public ModelAndView adminProdModify( AdminProductVO adminProdVO, 
											 @RequestParam("wu") String wu,
											 @PathVariable("product_num") String product_num											 
											) {
			
			ModelAndView mav = new ModelAndView();
						
			//상품 인덱스 번호
			int product_idx = Integer.parseInt(product_num);
						
			//상품분류(신상품/인기상품/할인상품)
			List<AdminProductVO> prodSortList = admProdService.selectProdSort();
			
			//상품 종류(스낵/젤리/캔디/기타)
			List<AdminProductVO> prodCategoryList = admProdService.selectProdCategory();			
			
			//개별 상품정보 select
			List<AdminProductVO> productList = admProdService.adminSelectOneProd(product_idx);
			
			mav.addObject("wu", wu);			
			mav.addObject("prodSortList", prodSortList);
			mav.addObject("prodCategoryList", prodCategoryList);
			mav.addObject("productList", productList);
			mav.setViewName("admin/admin_product_register");
			return mav;
		}
		
		
		//상품 정보 insert
		@RequestMapping(value = "adminProdInsert", method = RequestMethod.POST, produces = "application/text; charset=utf8")
		public ModelAndView adminProdInsert(AdminProductVO adminProdVO, 
											@RequestParam("original_thumb") MultipartFile file1, 
											@RequestParam("original_upfile") MultipartFile file2,
											HttpServletRequest request										
											) {
			ModelAndView mav = new ModelAndView();
			
			//static Logger logger = Logger.getlogger
						
			//서버 물리적 경로
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/temporary/");
			
			File makeFolder = new File(uploadPath);
			if(!makeFolder.exists()) {
				makeFolder.mkdirs();
			}
			
			admProdService.adminProdInsert(adminProdVO, file1, file2, uploadPath, request);
			
			//List<AdminProductVO> productInfoList = admProdService.adminProductInfo();
			//mav.addObject("productInfoList", productInfoList);
			mav.setViewName("redirect:/adminProd/adminProduct");
			return mav;
		}
		
		//상품 삭제(delete)
		@RequestMapping(value="adminProdDelete/{product_num}", method = RequestMethod.GET)
		public void adminProdDelete(@PathVariable("product_num") String product_num) {
			//상품 인덱스 번호
			int product_idx = Integer.parseInt(product_num);			
			admProdService.adminProdDelete(product_idx);
		}
		
		
		//상품정보 update
		/*@RequestMapping(value = "adminProdUpdate", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
		public ModelAndView adminProdUpdate(AdminProductVO adminProdVO, 
											@RequestParam("original_thumb") MultipartFile file1, 
											@RequestParam("original_upfile") MultipartFile file2,
											HttpServletRequest request										
											) {
			ModelAndView mav = new ModelAndView();
			
			//서버 물리적 경로
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/temporary/");
			
			File makeFolder = new File(uploadPath);
			if(!makeFolder.exists()) {
				makeFolder.mkdirs();
			}
			
//			admProdService.adminProductUpdate(adminProdVO, file1, file2, uploadPath, request);
			
			mav.setViewName("redirect:/adminProd/adminProduct");
			return mav;
		}*/
		
		
		
	 


		
		
}
