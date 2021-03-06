package com.retro.moonmarket;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeMainDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//메인 화면에 상품 정보 출력 (신상품)
	public List<HashMap<String, Object>> selectImageByRegDate() {
		return sqlSession.selectList("mapper.HomeMain.selectImageByRegDate");
		
	}
			
	//메인 화면에 상품 정보 출력 (인기순)
	public List<HashMap<String, Object>> selectImageBySoldNum() {
		return sqlSession.selectList("mapper.HomeMain.selectImageBySoldNum");
		
	}

	//메인 화면에 상품 정보 출력 (할인상품)
	public List<HashMap<String, Object>> selectImageByDiscountRate() {
		return sqlSession.selectList("mapper.HomeMain.selectImageByDiscountRate");
		
	}
	
	
	
}
