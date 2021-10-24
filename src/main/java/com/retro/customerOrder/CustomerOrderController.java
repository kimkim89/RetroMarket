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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.retro.cart.CartVO;

@Controller
@RequestMapping("/order/*")
public class CustomerOrderController {
	
	@Autowired
	CustomerOrderService csOrderService;
	CartVO cartVO;
	
	
		//선택구매 페이지 이동
		@RequestMapping(value="orderSomeProd")
		public ModelAndView selectSomeOrderList(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			
			//상품총액 변수
			Integer totalProdPrice = 0;
			//배송료 변수
			Integer deliveryFee = 0;
			//결제총액 변수
			Integer totalOrderPrice = 0;
			
			String selectedIndexStr = request.getParameter("selected_index");
			String[] selectedIndexArr = selectedIndexStr.split(",");
			int cartIndex = 0;
			
			List<CartVO> orderList = new ArrayList<CartVO>();
					
			if(selectedIndexStr != "") {
				for(int i=0; i<selectedIndexArr.length; i++) {
					cartIndex = Integer.parseInt(selectedIndexArr[i]);
					orderList.addAll(csOrderService.selectSomeOrderList(cartIndex));
					totalProdPrice += orderList.get(i).getPr_price() * orderList.get(i).getTotal_num();
				}				
			}
			
			
			//배송료
			if(totalProdPrice < 50000) {
				deliveryFee = 3000;
			}else {
				deliveryFee = 0;
			}
			
			//결제총액
			totalOrderPrice = totalProdPrice + deliveryFee;
			
			//상품 주문 페이지의 결제수단 - 은행명 출력에 사용			
			List<BankNameDTO> bankNameList = csOrderService.selectBankName();
			
			mav.addObject("selectedIndexStr", selectedIndexStr);
			mav.addObject("deliveryFee", deliveryFee);
			mav.addObject("totalProdPrice", totalProdPrice);
			mav.addObject("totalOrderPrice", totalOrderPrice);
			mav.addObject("orderList", orderList);
			mav.addObject("bankNameList", bankNameList);
			mav.setViewName("order/checkout");
			return mav;
			
		}
	
	
	
		//전체구매 페이지 이동
		@RequestMapping(value = "orderAllProd")
		public ModelAndView selectAllOrderList(HttpServletRequest request) {
			
			ModelAndView mav = new ModelAndView();
			
			//상품총액 변수
			Integer totalProdPrice = 0;
			//배송료 변수
			Integer deliveryFee = 0;
			//결제총액 변수
			Integer totalOrderPrice = 0;
			
			String userId = (String) request.getSession().getAttribute("user_id");
			List<CartVO> orderList = new ArrayList<CartVO>();
			
			orderList = csOrderService.selectAllOrderList(userId);
			
			//상품총액
			for(int i=0; i<orderList.size(); i++) {					
				totalProdPrice += orderList.get(i).getPr_price() * orderList.get(i).getTotal_num();			
			}
			
			//배송료
			if(totalProdPrice < 50000) {
				deliveryFee = 3000;
			}else {
				deliveryFee = 0;
			}
			
			//결제총액
			totalOrderPrice = totalProdPrice + deliveryFee;
			
			//상품 주문 페이지의 결제수단 - 은행명 출력에 사용			
			List<BankNameDTO> bankNameList = csOrderService.selectBankName();
			
			
			mav.addObject("deliveryFee", deliveryFee);
			mav.addObject("totalProdPrice", totalProdPrice);
			mav.addObject("totalOrderPrice", totalOrderPrice);
			mav.addObject("orderList", orderList);
			mav.addObject("bankNameList", bankNameList);
			mav.setViewName("order/checkout");
			return mav;
			
		}

		
		@RequestMapping(value="placeOrder")
		public ModelAndView insertOrderInfo(CustomerOrderVO csOrderVO, RedirectAttributes attributes, HttpServletRequest request) {
			
			ModelAndView mav = new ModelAndView();
			
			//결제버튼 클릭 시 주문 관련 정보 저장
			csOrderService.insertOrderInfo(csOrderVO, request);
			
			String msg = "주문이 완료되었습니다.";
			
			attributes.addFlashAttribute("msg", msg); 
			mav.setViewName("redirect:/main/index");
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
