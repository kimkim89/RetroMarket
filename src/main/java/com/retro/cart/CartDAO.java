package com.retro.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertCartInfo(CartVO cartVO) {
		return sqlSession.insert("mapper.Cart.insertCartInfo", cartVO);
	}
	
	public List<HashMap<String, Object>> selectCartList(String userId) {
		return sqlSession.selectList("mapper.Cart.selectCartList", userId);
	}

	//장바구니 제품 delete
	public int deleteCartList(Integer checkDelNum) {
		return sqlSession.delete("mapper.Cart.deleteCartList", checkDelNum);		
	}

	//장바구니 수량 변경
	public int updateCartList(HashMap<String, Integer> updateCartMap) {
		return sqlSession.update("mapper.Cart.updateCartList", updateCartMap);
	}
	
	//장바구니에 동일한 상품이 있는지 확인
	public int existProd(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.Cart.existProd", map);
	}

}
