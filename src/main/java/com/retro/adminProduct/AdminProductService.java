package com.retro.adminProduct;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminProductService {

	@Autowired
	AdminProductDAO admProdDAO;
	
	//상품 정보 insert
	public void adminProdInsert(AdminProductVO adminProdVO) {
		admProdDAO.adminProdInsert(adminProdVO);
	}
	
	//상품 분류(신상품-1, 인기상품-2, 할인상품-3)
	public List<AdminProductVO> selectProdSort() {
		return admProdDAO.selectProdSort();
	}
}
