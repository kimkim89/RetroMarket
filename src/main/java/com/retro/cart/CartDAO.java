package com.retro.cart;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	SqlSession sqlSession;
	
	public void insertCartInfo(CartVO cartVO) {
		sqlSession.insert("mapper.Cart.insertCartInfo", cartVO);
	}
	
	public List<HashMap<String, Object>> selectCartList(String userId) {
		return sqlSession.selectList("mapper.Cart.selectCartList", userId);
	}

	//장바구니 제품 delete
	public int deleteCartList(Integer checkDelNum) {
		return sqlSession.delete("mapper.Cart.deleteCartList", checkDelNum);		
	}

}
