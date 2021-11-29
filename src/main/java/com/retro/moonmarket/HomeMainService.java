package com.retro.moonmarket;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeMainService {

	@Autowired
	HomeMainDAO homeMainDAO;
	
	
	//메인페이지 - 신상품
	public List<HashMap<String, Object>> selectImageByRegDate() {				
		return homeMainDAO.selectImageByRegDate();
	}
	
	//메인페이지 - 인기상품
	public List<HashMap<String, Object>> selectImageBySoldNum() {
		return homeMainDAO.selectImageBySoldNum();
	}

	//메인페이지 - 할인상품
	public List<HashMap<String, Object>> selectImageByDiscountRate() {
		return homeMainDAO.selectImageByDiscountRate();
	}



	
	

	
	
}
