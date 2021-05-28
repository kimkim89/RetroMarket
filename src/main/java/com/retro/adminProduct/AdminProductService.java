package com.retro.adminProduct;

import java.awt.PageAttributes.OriginType;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AdminProductService {

	@Autowired
	AdminProductDAO admProdDAO;
	
	//상품 정보 insert
	public void adminProdInsert(AdminProductVO adminProdVO, MultipartFile file1, MultipartFile file2, String uploadPath,
								HttpServletRequest request) {
		
					
									
		//썸네일 원본 파일명
		String thumbOrigName = file1.getOriginalFilename();
		//썸네일 서버 파일명
		String thumbStoredName = System.currentTimeMillis() + "_" + thumbOrigName;
		//썸네일 원본 파일 사이즈
		long thumbFileSize = file1.getSize();
		
		//상품 이미지 원본 파일명
		String upfileOrigName = file2.getOriginalFilename();
		//상품 이미지 서버 파일명
		String upfileStoredName = System.currentTimeMillis() + "_" + upfileOrigName;
		//상품 이미지 원본 파일 사이즈
		long upfileFileSize = file2.getSize();
		
		//썸네일 파일 정보 저장
		adminProdVO.setMk_original_thumb(thumbOrigName);
		adminProdVO.setMk_stored_thumb(thumbStoredName);
		adminProdVO.setMk_thumb_size(thumbFileSize);
		
		//상품 이미지 파일 정보 저장
		adminProdVO.setMk_original_upfile(upfileOrigName);
		adminProdVO.setMk_stored_upfile(upfileStoredName);
		adminProdVO.setMk_upfile_size(upfileFileSize);
		
		File upload_file1 = new File(uploadPath+thumbStoredName);
		File upload_file2 = new File(uploadPath+upfileStoredName);
					
		try {
            file1.transferTo(upload_file1);
            file2.transferTo(upload_file2);
        } catch (IllegalStateException e) {            
            e.printStackTrace();
        } catch (IOException e) {            
            e.printStackTrace();
        }		
		
		//상품 정보 작성자 IP주소 가져오기
		String writer_ip = request.getHeader("X-Forwarded-For");	    

	    if (writer_ip == null) {
	    	writer_ip = request.getHeader("Proxy-Client-IP");	        
	    }
	    if (writer_ip == null) {
	    	writer_ip = request.getHeader("WL-Proxy-Client-IP");	        
	    }
	    if (writer_ip == null) {
	    	writer_ip = request.getHeader("HTTP_CLIENT_IP");	        
	    }
	    if (writer_ip == null) {
	    	writer_ip = request.getHeader("HTTP_X_FORWARDED_FOR");	        
	    }
	    if (writer_ip == null) {
	    	writer_ip = request.getRemoteAddr();	        
	    }
	    
		adminProdVO.setMk_writer_ip(writer_ip);		
		
		
		admProdDAO.adminProdInsert(adminProdVO);
	}
	
	//상품 분류(신상품-1, 인기상품-2, 할인상품-3)
	public List<AdminProductVO> selectProdSort() {
		return admProdDAO.selectProdSort();
	}
	
	//상품목록 Select
	public List<AdminProductVO> adminProductSelect() {
		return admProdDAO.adminProductSelect();
	}
	
	//상품정보 select
	public List<AdminProductVO> adminProductInfo() {
		return admProdDAO.adminProductInfo();
	}
	
}
