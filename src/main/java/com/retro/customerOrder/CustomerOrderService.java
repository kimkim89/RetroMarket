package com.retro.customerOrder;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.cart.CartVO;
import com.retro.member.MemberVO;
import com.retro.mypage.MyPageService;

@Service
public class CustomerOrderService {

	@Autowired
	private CustomerOrderDAO csOrderDAO;
	@Autowired
	private MyPageService mypageService;
	@Autowired
	private CustomerOrderVO csOrderVO;
	
	
	//상품 주문 페이지의 결제수단 - 은행명 출력에 사용
	public List<BankNameDTO> selectBankName() {
		return csOrderDAO.selectBankName();
	}

	//장바구니 내 전체 상품 목록 조회
	public List<CartVO> selectAllOrderList(String userId) {
		return csOrderDAO.selectAllOrderList(userId);				
	}
	
	
	//장바구니 테이블로부터 선택한 상품 목록 조회
	public List<CartVO> selectSomeOrderList(Integer cartIndex) {
		return csOrderDAO.selectSomeOrderList(cartIndex);
	}
	
	
	//결제버튼 클릭 시 주문 관련 정보 저장
	public void insertOrderInfo(CustomerOrderVO csOrderVO, HttpServletRequest request) {
		
		//현재 로그인한 아이디
		String userId = (String) request.getSession().getAttribute("user_id");	
		
		//배송료
		int totalDeliFee = Integer.parseInt(request.getParameter("delivery_fee"));
		
		//주문금액
		int totalOrderPrice = Integer.parseInt(request.getParameter("order_price"));
		
		//현재 로그인된 계정의 
		MemberVO memberList = mypageService.getInfo(userId);
		
		//주문번호 생성하기
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		String orderDate = df.format(today);
		
//20211020 오전:: 수정 작업 시작 예정 ---------------------------------------------------
		
		int orderIdx = 0;
		LocalDate now = LocalDate.now();
		DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("yyyyMMdd");
		String currentDate = now.format(dateTimeFormat);
		System.out.println(currentDate);
		
		CustomerOrderVO lastOrderList = csOrderDAO.selectLastOrder(currentDate);
		
		System.out.println("참거짓 테스트::: " + lastOrderList.getOrder_idx() != null);
		
		
		if(lastOrderList.getOrder_idx() != null) {
			orderIdx = Integer.parseInt(lastOrderList.getOrder_idx()) + 1;
		}else {
			orderIdx = 1;
		}
		
		
		String orderCode = orderDate + String.format("%04d", orderIdx);
		
		
		System.out.println("orderCode확인중입니다:: " + orderCode);
		
//20211020 오전:: 수정 작업 종료 예정 ---------------------------------------------------
		
		
		if(totalDeliFee == 0) {
			csOrderVO.setDelivery_check(0);
		}else {
			csOrderVO.setDelivery_check(1);
		}		
		
		csOrderVO.setMember_id(userId);
		csOrderVO.setOrder_name(memberList.getName());
		csOrderVO.setOrder_email(memberList.getEmail());
		csOrderVO.setOrder_addr1(memberList.getAddress1());
		csOrderVO.setOrder_addr2(memberList.getAddress2());
		csOrderVO.setOrder_addr3(memberList.getAddress3());
		csOrderVO.setOrder_phone(memberList.getPhone());
		csOrderVO.setDelivery_fee(totalDeliFee);
		csOrderVO.setTotal_order_price(totalOrderPrice);
		csOrderVO.setOrder_code(orderCode);
		csOrderVO.setTotal_order_price(totalOrderPrice);
		
		
		csOrderDAO.insertOrderInfo(csOrderVO);
	}
	
	
	
	
	
	
	
	
	
//	은행 정보 입력용으로만 사용한 후 주석 처리 했음
//	public void insertBankInfo(Map<String, Object> bankInfoMap) {
//		csOrderDAO.insertBankInfo(bankInfoMap);
//	}
	
	
	
	
}
