package com.retro.product;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ProductDAO {

	@Autowired
	SqlSession sqlSession;
	
	// 모든 상품 조회
	public List<HashMap<String, Object>> selectAllProducts() {
		return sqlSession.selectList("mapper.Product.selectAllProducts");
	}
	
	// 스낵 상품 조회
	public List<HashMap<String, Object>> selectSnack() {
		return sqlSession.selectList("mapper.Product.selectSnack");
	}
	
	// 젤리 or 캔디 상품 조회
	public List<HashMap<String, Object>> selectJellyCandy() {
		return sqlSession.selectList("mapper.Product.selectJellyCandy");
	}
	
	// 기타 상품 조회
	public List<HashMap<String, Object>> selectEtc() {
		return sqlSession.selectList("mapper.Product.selectEtc");
	}
	
	
	
	
	
	
	
	
}
