package com.retro.adminProduct;

import java.awt.PageAttributes.OriginType;
import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AdminProductService {

	@Autowired
	AdminProductDAO admProdDAO;
	
	//상품 정보 insert
	public void adminProdInsert(AdminProductVO adminProdVO, MultipartFile file1, MultipartFile file2, String uploadPath) {
		
					
									
		//썸네일 원본 파일명
		String thumbOrigName = file1.getOriginalFilename();
		//썸네일 서버 파일명
		String thumbStoredName = uploadPath + System.currentTimeMillis() + "_" + thumbOrigName;
		//썸네일 원본 파일 사이즈
		long thumbFileSize = file1.getSize();
		
		//상품 이미지 원본 파일명
		String upfileOrigName = file2.getOriginalFilename();
		//상품 이미지 서버 파일명
		String upfileStoredName = uploadPath + System.currentTimeMillis() + "_" + upfileOrigName;
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
		
		File upload_file1 = new File(thumbStoredName);
		File upload_file2 = new File(upfileStoredName);
					
		try {
            file1.transferTo(upload_file1);
            file2.transferTo(upload_file2);
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }		
		
		
		admProdDAO.adminProdInsert(adminProdVO);
	}
	
	//상품 분류(신상품-1, 인기상품-2, 할인상품-3)
	public List<AdminProductVO> selectProdSort() {
		return admProdDAO.selectProdSort();
	}
}
