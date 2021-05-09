package com.retro.adminProduct;

import java.io.File;
import java.io.IOException;

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
		@RequestMapping(value = "adminProdInsert", method=RequestMethod.POST)
		public ModelAndView adminProdInsert(@RequestParam AdminProductVO adminProdVO, @RequestParam MultipartHttpServletRequest mtfRequest, @RequestParam RedirectAttributes attributes) {
			ModelAndView mav = new ModelAndView();
			
			MultipartFile mf = mtfRequest.getFile("mk_original_thumb");
			
			String path = "D:\\workspace_spring\\RetroSnackMarket\\src\\main\\webapp\\resources\\image";
			
			System.out.println("mtfRequest: " + mf.getOriginalFilename());
			
			//썸네일 원본 파일명
			String thumbOrigName = mf.getOriginalFilename();
			//썸네일 서버 파일명
			String thumbStoredName = path + System.currentTimeMillis() + thumbOrigName;
			//썸네일 원본 파일 사이즈
			long thumbFileSize = mf.getSize();
			
	
			adminProdVO.setMk_original_thumb(thumbOrigName);
			adminProdVO.setMk_stored_thumb(thumbStoredName);
			adminProdVO.setMk_thumb_size(thumbFileSize);
			
			
			
			try {
	            mf.transferTo(new File(thumbStoredName));
	        } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
			
			
			admProdService.adminProdInsert(adminProdVO);
			
			
			
			mav.setViewName("redirect:/adminProd/adminProduct");
			return mav;
		}
		
		
		
		
		
	 
/*20210504 파일 업로드 테스트 중 */
		
		
		
		/*@RequestMapping(value = "requestupload1")
	    public String requestupload1(MultipartHttpServletRequest mtfRequest, RedirectAttributes attributes) {
			System.out.println("함수 타는지 확인 중....  :)");
			
	        String src = mtfRequest.getParameter("src");
	        System.out.println("src value : " + src);
	        MultipartFile mf = mtfRequest.getFile("file");

	        String path = "D:\\test_image\\";

	        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	        long fileSize = mf.getSize(); // 파일 사이즈

	        System.out.println("originFileName : " + originFileName);
	        System.out.println("fileSize : " + fileSize);

	        String safeFile = path + System.currentTimeMillis() + originFileName;

	        try {
	            mf.transferTo(new File(safeFile));
	        } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        return "redirect:/adminProd/adminProductRegister";
	    }*/

		
		
}
