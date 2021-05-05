package com.retro.adminProduct;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
@RequestMapping("/adminProd/*")
public class AdminProductController {
	
	private static final String SAVE_PATH = "파일을 저장할 경로를 적어주세요";

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
		
	 
/*20210504 파일 업로드 테스트 중 */
		
		
		
		@RequestMapping(value = "requestupload1")
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
	    }

		
		
}
