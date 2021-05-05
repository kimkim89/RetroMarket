package com.retro.adminProduct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminProductService {

	@Autowired
	AdminProductDAO admProdDAO;
	
	//상품 정보 insert
	public void adminProdInsert(AdminProductVO admProdVO) {
		admProdDAO.adminProdInsert(admProdVO);
	}
}
