package com.retro.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.retro.adminProduct.AdminProductImageVO;


@Repository
public class ProductDAO {

	@Autowired
	SqlSession sqlSession;
	
	// 상품 조회
	public List<HashMap<String, Object>> selectProdList(Map<String, Integer> prCodeNumMap) {
		return sqlSession.selectList("mapper.Product.selectProdList", prCodeNumMap);
	}
		
	// 상품 상세 페이지 데이터 조회
	public List<HashMap<String, Object>> selectEachProd(String productId) {
		return sqlSession.selectList("mapper.Product.selectEachProd", productId);
	}
	
	// 모든 상품 - 인기상품 조회
	public List<HashMap<String, Object>> selectAllPopularProd() {
		return sqlSession.selectList("mapper.Product.selectAllPopularProd");
	}
	
	// 모든 상품 - 신상품
	public List<HashMap<String, Object>> selectAllNewProd() {
		return sqlSession.selectList("mapper.Product.selectAllNewProd");
	}
	
	// 모든 상품 - 할인상품
	public List<HashMap<String, Object>> selectAllDiscountProd() {
		return sqlSession.selectList("mapper.Product.selectAllDiscountProd");
	}


	
	
	
	
	
}
