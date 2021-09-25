package com.retro.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	SqlSession sqlSession;
	
	public void insertCartInfo() {
		//sqlSession.insert("mapper.Cart.insertCartInfo");
	}

}
