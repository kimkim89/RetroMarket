package com.retro.moonmarket;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeMainService {

	@Autowired
	HomeMainDAO homeMainDAO;
	
	
	//최신상품 정렬 by 신상품
	public List<HashMap<String, Object>> selectImageByRegDate() {				
		return homeMainDAO.selectImageByRegDate();
	}
	
	//최신상품 정렬 by 할인상품
	/*public List<HashMap<String, Object>> selectImageByDiscountRate() {
		return homeMainDAO.selectImageByDiscountRate();
	}*/
	
	//최신상품 정렬 by 인기상품
	public List<HashMap<String, Object>> selectImageBySoldNum() {
		return homeMainDAO.selectImageBySoldNum();
	}





	
	

	
	
}
