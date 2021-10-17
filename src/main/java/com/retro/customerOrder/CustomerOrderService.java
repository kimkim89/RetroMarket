package com.retro.customerOrder;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.cart.CartVO;

@Service
public class CustomerOrderService {

	@Autowired
	CustomerOrderDAO csOrderDAO;
	
	//상품 주문 페이지의 결제수단 - 은행명 출력에 사용
	public List<BankNameDTO> selectBankName() {
		return csOrderDAO.selectBankName();
	}

	public List<CartVO> selectAllOrderList(String userId) {
		return csOrderDAO.selectAllOrderList(userId);
				
	}
	
	
	
	
	//주문할 상품 조회
//	public List<CartVO> selectOrderList(Integer cartIndex) {
//		return csOrderDAO.selectOrderList(cartIndex);
//	}
	
	
	
	
	
	
	
	
	
	
//	은행 정보 입력용으로만 사용한 후 주석 처리 했음
//	public void insertBankInfo(Map<String, Object> bankInfoMap) {
//		csOrderDAO.insertBankInfo(bankInfoMap);
//	}
	
	
	
	
}
