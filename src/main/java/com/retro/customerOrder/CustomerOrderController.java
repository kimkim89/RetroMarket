package com.retro.customerOrder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.retro.cart.CartVO;

@Controller
@RequestMapping("/order/*")
public class CustomerOrderController {
	
	@Autowired
	CustomerOrderService csOrderService;
	CartVO cartVO;
	
	
	//구매 페이지 이동
		@RequestMapping(value = "orderForm")
		public ModelAndView RegisterOrder(HttpServletRequest request) {
			
			ModelAndView mav = new ModelAndView();
			
			String userId = (String) request.getSession().getAttribute("user_id");
			List<CartVO> orderList = new ArrayList<CartVO>();
			
			orderList = csOrderService.selectAllOrderList(userId);
			
			/*
			String[] cartIndexArr = request.getParameterValues("cart_index");
			int cartIndex = 0;
			List<CartVO> orderList = new ArrayList<CartVO>();
				
			if(cartIndexArr != null) {
				for(int i=0; i<cartIndexArr.length; i++) { 
					//System.out.println("cart_index확인:: " + request.getParameterValues("cart_index")[i]);					
					cartIndex = Integer.parseInt(request.getParameterValues("cart_index")[i]);
					
					orderList.addAll(i, csOrderService.selectOrderList(cartIndex));
					//System.out.println("orderList배열 확인:: " + orderList);
					
				}
				
				//System.out.println("orderList배열 확인:: " + orderList);
				//System.out.println("orderList배열 길이 확인:: " + orderList.size());				
			}*/
			
			//상품 주문 페이지의 결제수단 - 은행명 출력에 사용			
			List<BankNameDTO> bankNameList = csOrderService.selectBankName();
				
			
			mav.addObject("orderList", orderList);
			mav.addObject("bankNameList", bankNameList);
			mav.setViewName("order/checkout");
			return mav;
			
		}



		
		
		
		
			
		
		
		
		
		
		
		
		
		
		
		
		
		
			
			
/*		은행 정보 입력용으로만 사용한 후 주석 처리 했음
 * 		public void insertBankInfo() {
//			String[] bankNameArr = {"국민은행", "신한은행", "KEB하나은행", "농협은행", "기업은행", "우리은행", "카카오뱅크", "새마을금고", "우체국", "SC제일은행", "부산은행",
//					"경남은행", "대구은행", "광주은행", "신협", "수협은행", "산업은행", "전북은행", "제주은행", "씨티은행"};
//			
//			int bankCode = 1000;
//			
//			Map<String, Object> bankInfoMap = new HashMap<String, Object>();
//			
//			for(int a = 0; a<bankNameArr.length; a++) {				
//			
//			bankInfoMap.put("bankName", bankNameArr[a]);
//			bankInfoMap.put("bankCode", bankCode);
//			
//			csOrderService.insertBankInfo(bankInfoMap); 				
//			bankCode++;
		}*/
			

}
