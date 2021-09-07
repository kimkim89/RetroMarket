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
	
	// 상품 상세 페이지 데이터 조회
	public List<HashMap<String, Object>> selectEachProd(String product_id) {
		return sqlSession.selectList("mapper.Product.selectEachProd", product_id);
	}
	
	// 상품 상세 페이지 - 상품 이미지 출력
	public void selectProdImg(String product_code) {
		return sqlSession.selectList("mapper.Product.selectProdImg", product_code);
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
