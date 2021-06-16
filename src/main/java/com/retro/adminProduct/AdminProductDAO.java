package com.retro.adminProduct;

import java.util.HashMap;
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
	
	//상품 종류(스낵/젤리/캔디/기타)
	public List<AdminProductVO> selectProdCategory() {		
		return sqlSession.selectList("mapper.AdminProd.selectProdCategory");
	}

	//전체 상품목록 select - 페이징처리 포함
	public List<AdminProductVO> adminProductSelect(HashMap<String, Object> map) {
		//System.out.println(sqlSession.selectList("mapper.AdminProd.adminProductSelect"));
		return sqlSession.selectList("mapper.AdminProd.adminProductSelect", map);
	}
	
	//개별 상품정보 select
	public AdminProductVO adminSelectOneProd(int mk_idx) {
		return sqlSession.selectOne("mapper.AdminProd.adminSelectOneProd", mk_idx);
	}
	
	//상품 삭제(delete)
	public void adminProdDelete(int mk_idx) {
		sqlSession.delete("mapper.AdminProd.adminProdDelete", mk_idx);
	}

	//전체 상품 수
	public int countProd(HashMap<String, Object> map) {
		return sqlSession.selectOne("mapper.AdminProd.countProd", map);
	}
	
}
