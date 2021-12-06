package com.retro.customerOrder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.retro.admin.PointVO;
import com.retro.adminProduct.AdminProductVO;
import com.retro.cart.CartVO;
import com.retro.member.MemberVO;



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
	
	//회원 등급 조회
	public MemberVO selectMyMemberId(String memberId) {
		return sqlSession.selectOne("mapper.CustomerOrder.selectMyMemberId", memberId);
	}
	
	//장바구니 내 상품별 적립 포인트 금액 저장
	public void updateCartPrPoint(Map<String, Object> map) {
		sqlSession.update("mapper.CustomerOrder.updateCartPrPoint", map);
	}
			
	//전달받은 주문번호 기준으로 정보 테이블 데이터 받아오기
	public List<Map<String, Object>> orderInfoByOrderCode(String userId) {
		return sqlSession.selectList("mapper.CustomerOrder.orderInfoByOrderCode", userId);
	}
	
	//주문폼 페이지로 넘어가기 전, 재고 수량 체크
	public int checkProductInventory(int cartIdx) {
		return sqlSession.selectOne("mapper.CustomerOrder.checkProductInventory", cartIdx);
	}
	
	
	
	
	
	
	
//	은행 정보 입력용으로만 사용한 후 주석 처리 했음
//	public void insertBankInfo(Map<String, Object> bankInfoMap) {
//		sqlSession.insert("mapper.CustomerOrder.insertBankInfo", bankInfoMap);	
//	}
	
	
	

	
	
}
