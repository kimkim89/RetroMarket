package com.retro.adminProduct;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//상품 상세 이미지 insert
	public void insertProdImage(AdminProductImageVO adminProdImageVO) {
		sqlSession.insert("mapper.AdminProd.insertProdImage", adminProdImageVO);
	}
	
	//상품 수정 update
	public void adminProdUpdate(AdminProductVO adminProdVO) {
		sqlSession.update("mapper.AdminProd.adminProdUpdate", adminProdVO);
	}
	
	//상품 상세 이미지 update
	public void updateProdImage(AdminProductImageVO adminProdImageVO) {
		sqlSession.update("mapper.AdminProd.updateProdImage", adminProdImageVO);
	}
		
	//상품 분류(신상품-1, 인기상품-2, 할인상품-3)
	public List<AdminProductVO> selectProdSort() {		
		return sqlSession.selectList("mapper.AdminProd.selectProdSort");
	}
	
	//상품 종류(스낵/젤리/캔디/기타)
	public List<AdminProductVO> selectProdCategory() {		
		return sqlSession.selectList("mapper.AdminProd.selectProdCategory");
	}
	
	//상품 종류(스낵/젤리ㅣ/캔디/기타) 개수
	public int selectTotalProdCategories() {
		return sqlSession.selectOne("mapper.AdminProd.selectTotalProdCategories");
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
	
	//상품상세이미지 select
	public AdminProductImageVO selectProdImage(String product_id) {			
		return sqlSession.selectOne("mapper.AdminProd.selectProdImage", product_id);
	}
	
	//상품 삭제(delete)
	public void adminProdDelete(int mk_idx) {
		sqlSession.delete("mapper.AdminProd.adminProdDelete", mk_idx);
	}

	//전체 상품 수
	public int countProd(HashMap<String, Object> map) {
		return sqlSession.selectOne("mapper.AdminProd.countProd", map);
	}
	
	//상품코드 ajax
	public String ajaxProductCode(int prodCategoryValue) {		
		return sqlSession.selectOne("mapper.AdminProd.ajaxProductCode", prodCategoryValue);
	}
	
	//상품 금액 변경 시 주문번호(order_num)가 null, 장바구니상태(cart_status)가 0인 row의 pr_price 데이터 일괄 변경 
	public void updateCartPrPrice(AdminProductVO adminProdVO) {
		sqlSession.update("mapper.AdminProd.updateCartPrPrice", adminProdVO);
	}

	//관리자 상품관리 페이지 선택삭제 기능 구현
	public int deleteAdminProdList(String delProdCode) {
		return sqlSession.delete("mapper.AdminProd.deleteAdminProdList", delProdCode);
	}
	
	//관리자 상품관리 페이지 선택삭제 - 상품상세이미지 테이블에서 delete 
	public int deleteAdminProdImg(String productCode) {
		return sqlSession.delete("mapper.AdminProd.deleteAdminProdImg", productCode);
	}
	
 	//관리자 상품 수정 페이지에서 첨부된 이미지 파일 삭제 시 해당 이미지 파일명 null로 변경 
	public int updateProdImgNull(Map<String, Object> map) {
		return sqlSession.update("mapper.AdminProd.updateProdImgNull", map);
	}
	
	//관리자 상품 수정 페이지에 첨부된 상품 썸네일 파일 삭제 시 해당 이미지 정보 null로 변경 
	public int updateProdThumbNull(String prCode) {
		return sqlSession.update("mapper.AdminProd.updateProdThumbNull", prCode);
	}
	
	
}
