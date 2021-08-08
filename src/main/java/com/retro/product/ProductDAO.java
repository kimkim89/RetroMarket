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
	
	public List<HashMap<String, Object>> selectAllProducts() {
		return sqlSession.selectList("mapper.Product.selectAllProducts");
	}
	
	
	
	
	
	
	
	
}
