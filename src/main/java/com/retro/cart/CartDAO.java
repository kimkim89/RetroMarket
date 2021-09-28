package com.retro.cart;

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
	
	public List<CartVO> selectCartList(String userId) {
		return sqlSession.selectList("mapper.Cart.selectCartList", userId);
	}

}
