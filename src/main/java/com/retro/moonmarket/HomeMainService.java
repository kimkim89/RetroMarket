package com.retro.moonmarket;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.adminProduct.AdminProductImageVO;
import com.retro.adminProduct.AdminProductVO;

@Service
public class HomeMainService {

	@Autowired
	AdminProductVO admProdDAO;
	AdminProductImageVO adminProdImageVO;
	HomeMainDAO homeMainDAO;
	
	
	//최신상품 정렬 by 신상품
	public List<HashMap<String, Object>> selectImageByRegDate() {
		System.out.println(homeMainDAO.selectImageByRegDate());
		return homeMainDAO.selectImageByRegDate();
	}
	
	//최신상품 정렬 by 신상품
	public List<HashMap<String, Object>> selectImageByDiscountRate() {
		return homeMainDAO.selectImageByDiscountRate();
	}
	
	//최신상품 정렬 by 신상품
	public List<HashMap<String, Object>> selectImageBySoldNum() {
		return homeMainDAO.selectImageBySoldNum();
	}





	
	

	
	
}
