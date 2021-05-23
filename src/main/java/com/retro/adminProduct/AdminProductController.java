package com.retro.adminProduct;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
			mav.setViewName("admin/admin_product");
			return mav;
		}
		
		
		//상품관리-상품 등록 페이지
		@RequestMapping(value = "adminProductRegister")
		public ModelAndView adminProductRegister() {
			ModelAndView mav = new ModelAndView();
			
			//상품분류(신상품/인기상품/할인상품)
			List<AdminProductVO> prodSortList = admProdService.selectProdSort();
			
			mav.addObject("prodSortList", prodSortList);
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
			
			
			mav.setViewName("redirect:/adminProd/adminProduct");
			return mav;
		}
		
		
		
		
		
		
		
	 


		
		
}
