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
	
	// 상품 개수 조회
	public int countAllProducts(Map<String, Integer> prCodeNumMap) {
		return sqlSession.selectOne("mapper.Product.countAllProducts", prCodeNumMap);
	}
	
	//위시리스트(좋아요) 테이블에 데이터 저장
	public int insertProdLikeInfo(WishlistVO wishlistVO) {
		return sqlSession.insert("mapper.Product.insertProdLikeInfo", wishlistVO);
	}
	
	//위시리스트 테이블에 중복된 데이터가 있는지 확인 
	public int checkDuplicateLike(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.Product.checkDuplicateLike", map);
	}
	
	//위시리스트 내 데이터 삭제 
	public void deleteWishlist(Map<String, Object> map) {
		sqlSession.delete("mapper.Product.deleteWishlist", map);
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
