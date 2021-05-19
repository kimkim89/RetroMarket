package com.retro.adminProduct;

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
		String thumbStoredName = uploadPath + System.currentTimeMillis() + thumbOrigName;
		//썸네일 원본 파일 사이즈
		long thumbFileSize = file1.getSize();
		

		adminProdVO.setMk_original_thumb(thumbOrigName);
		adminProdVO.setMk_stored_thumb(thumbStoredName);
		adminProdVO.setMk_thumb_size(thumbFileSize);
		
		File file = new File(thumbStoredName);
					
		try {
            file1.transferTo(file);
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
