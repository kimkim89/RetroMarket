package com.retro.customerOrder;

import java.util.HashMap;
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
			
	//장바구니 테이블로부터 선택한 상품 목록 조회
	public List<CartVO> selectSomeOrderList(Integer cartIndex) {
		return sqlSession.selectList("mapper.CustomerOrder.selectSomeOrderList", cartIndex);
	}

	//결제버튼 클릭 시 주문 관련 정보 저장
	public void insertOrderInfo(CustomerOrderVO csOrderVO) {
		sqlSession.selectList("mapper.CustomerOrder.insertOrderInfo", csOrderVO);
	}	
	
	//전체 주문 조회
	public CustomerOrderVO selectLastOrder(String currentDate) {
		return sqlSession.selectOne("mapper.CustomerOrder.selectLastOrder", currentDate);
	}
	
	//장바구니 cart_status 변경
	public void updateCartStat(int cartIndex) {
		sqlSession.update("mapper.CustomerOrder.updateCartStat", cartIndex);
	}

	//cart 테이블 내 order_num(=주문번호)컬럼에 주문번호 저장
	public void updateOrderNum(Map<String, Object> selectedIdxMap) {
		sqlSession.update("mapper.CustomerOrder.updateOrderNum", selectedIdxMap);
	}
	
	//상품 재고량에서 주문된 수량만큼 빼기
	public void updateProductInventory(HashMap<String, Integer> map) {
		sqlSession.update("mapper.CustomerOrder.updateProductInventory", map);
	}
	
	
	
	
//	은행 정보 입력용으로만 사용한 후 주석 처리 했음
//	public void insertBankInfo(Map<String, Object> bankInfoMap) {
//		sqlSession.insert("mapper.CustomerOrder.insertBankInfo", bankInfoMap);	
//	}
	
	
	

	
	
}
