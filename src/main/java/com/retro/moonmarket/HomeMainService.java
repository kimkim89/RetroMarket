package com.retro.moonmarket;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class HomeMainService {

	@Autowired
	HomeMainDAO admProdDAO;
	AdminProductImageVO adminProdImageVO;
	
	
	
	//상품 분류(신상품-1, 인기상품-2, 할인상품-3)
	public List<AdminProductVO> selectProdSort() {
		return admProdDAO.selectProdSort();
	}
	
	//상품 종류(스낵/젤리/캔디/기타)
	public List<AdminProductVO> selectProdCategory() {		
		return admProdDAO.selectProdCategory();
	}
	
	//상품 종류(스낵/젤리ㅣ/캔디/기타) 개수
	public int selectTotalProdCategories() {
		return admProdDAO.selectTotalProdCategories();
	}
	




	//전체 상품 수
	public int countProd(String searchField, String keyword) {
		HashMap map = new HashMap();
		
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		
		return admProdDAO.countProd(map);
	}
	
	



	
	

	
	
}
