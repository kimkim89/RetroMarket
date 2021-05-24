package com.retro.adminProduct;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminProductDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	//상품 정보 insert
	public void adminProdInsert(AdminProductVO adminProdVO) {
		sqlSession.insert("mapper.AdminProd.adminProdInsert", adminProdVO);
	}
		
	//상품 분류(신상품-1, 인기상품-2, 할인상품-3)
	public List<AdminProductVO> selectProdSort() {
		return sqlSession.selectList("mapper.AdminProd.selectProdSort");
	}

	//상품목록 select
	public List<AdminProductVO> adminProductSelect() {
		return sqlSession.selectList("mapper.AdminProd.adminProductSelect");
	}
	
	
}
