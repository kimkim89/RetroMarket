package com.retro.adminProduct;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
			mav.setViewName("admin/admin_product_register");
			return mav;
		}
		
		
		//상품 정보 insert
		@RequestMapping(value = "adminProdInsert", method = RequestMethod.POST)
		public ModelAndView adminProdInsert(AdminProductVO adminProdVO, 
											@RequestParam("original_thumb") MultipartFile file1, 
											@RequestParam("original_upfile") MultipartFile file2,
											HttpServletRequest request										
											) {
			ModelAndView mav = new ModelAndView();
				
			
			//String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/temporary/");
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/temporary/");
			
			System.out.println("파일경로 확인중:  " + uploadPath);
			
			File makeFolder = new File(uploadPath);
			if(!makeFolder.exists()) {
				makeFolder.mkdirs();
			}			
										
			//썸네일 원본 파일명
			String thumbOrigName = file1.getOriginalFilename();
			//썸네일 서버 파일명
			String thumbStoredName = uploadPath + System.currentTimeMillis() + thumbOrigName;
			//썸네일 원본 파일 사이즈
			long thumbFileSize = file1.getSize();
			
	
			adminProdVO.setMk_original_thumb(thumbOrigName);
			adminProdVO.setMk_stored_thumb(thumbStoredName);
			adminProdVO.setMk_thumb_size(thumbFileSize);
			
			File file = new File(thumbStoredName);
			
			System.out.println("file?? :  " + file);
			try {
	            file1.transferTo(file);
	        } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
			
			//상품분류(신상품/인기상품/할인상품)
			//admProdService.selectProdSort();
			//admProdService.adminProdInsert(adminProdVO);
			
			
			
			mav.setViewName("redirect:/adminProd/adminProduct");
			return mav;
		}
		
		
		
		
		
		
		
	 


		
		
}
