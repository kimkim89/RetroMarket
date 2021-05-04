package com.retro.adminProduct;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.UUID;


@Controller
@RequestMapping("/adminProd/*")
public class AdminProductController {
	
		public Logger logger = (Logger) LoggerFactory.getLogger(this.getClass());
	
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
		
		//파일 업로드 테스트 중
		@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
		public void upload(MultipartFile uploadfile) {
			logger.info("upload() POST 호출");
			//logger.info("파일 이름: {}", uploadfile.getOriginalFilename());
			//logger.info("파일 크기: {}", uploadfile.getSize());

		    saveFile(uploadfile);
		}
		 
			
		private String saveFile(MultipartFile file){
		    // 파일 이름 변경
		    UUID uuid = UUID.randomUUID();
		    String saveName = uuid + "_" + file.getOriginalFilename();

		    //logger.info("saveName: {}",saveName);

		    // 저장할 File 객체를 생성(껍데기 파일)ㄴ
		    //File saveFile = new File(UPLOAD_PATH,saveName); // 저장할 폴더 이름, 저장할 파일 이름

		    try {
		        //file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
		    } catch (IOException e) {
		        e.printStackTrace();
		        return null;
		    }

		    return saveName;
		} // end saveFile(


		//---------테스트 끝
		
		
}
