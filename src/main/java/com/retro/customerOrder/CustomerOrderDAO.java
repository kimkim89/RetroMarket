package com.retro.customerOrder;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.retro.cart.CartVO;

@Repository
public class CustomerOrderDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	//상품 주문 페이지의 결제수단 - 은행명 출력에 사용
	public List<BankNameDTO> selectBankName() {
		return sqlSession.selectList("mapper.CustomerOrder.selectBankName");
	}	
	
	//장바구니 내 전체 상품 목록 조회
	public List<CartVO> selectAllOrderList(String userId) {
		return sqlSession.selectList("mapper.CustomerOrder.selectAllOrderList", userId);
	}
		
	//장바구니 테이블로부터 선택한 상품 목록 조회
	public List<CartVO> selectSomeOrderList(Integer cartIndex) {
		return sqlSession.selectList("mapper.CustomerOrder.selectSomeOrderList", cartIndex);
	}

	//결제버튼 클릭 시 주문 관련 정보 저장
	public void insertOrderInfo(CustomerOrderVO csOrderVO) {
		sqlSession.selectList("mapper.CustomerOrder.insertOrderInfo", csOrderVO);
	}	
	
	//전체 주문 조회
	public CustomerOrderVO selectLastOrder() {
		return sqlSession.selectOne("mapper.CustomerOrder.selectLastOrder");
	}
	
	
	
	
	
//	은행 정보 입력용으로만 사용한 후 주석 처리 했음
//	public void insertBankInfo(Map<String, Object> bankInfoMap) {
//		sqlSession.insert("mapper.CustomerOrder.insertBankInfo", bankInfoMap);	
//	}
	
	
	

	
	
}
