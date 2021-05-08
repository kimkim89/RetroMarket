package com.retro.adminProduct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminProductDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public void adminProdInsert(AdminProductVO adminProdVO) {
		sqlSession.insert("mapper.AdminProd.adminProdInsert", "adminProdVO");
	}

}
