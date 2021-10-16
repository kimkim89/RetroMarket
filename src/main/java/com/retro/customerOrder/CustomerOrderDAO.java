package com.retro.customerOrder;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerOrderDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	//상품 주문 페이지의 결제수단 - 은행명 출력에 사용
	public List<BankNameDTO> selectBankName() {
		return sqlSession.selectList("mapper.CustomerOrder.selectBankName");
	}	
	
	
	
	
	
//	은행 정보 입력용으로만 사용한 후 주석 처리 했음
//	public void insertBankInfo(Map<String, Object> bankInfoMap) {
//		sqlSession.insert("mapper.CustomerOrder.insertBankInfo", bankInfoMap);	
//	}
	
	
	

	
	
}
