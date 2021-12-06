package com.retro.customerOrder;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.retro.cart.CartVO;
import com.retro.common.MailSendService;
import com.retro.member.MemberVO;


@Controller
@RequestMapping("/order/*")
public class CustomerOrderController {
	
	@Autowired
	private CustomerOrderService csOrderService;
	@Autowired
	private MailSendService mss;
	
	
	//선택구매 페이지 이동
		@RequestMapping(value="orderSomeProd")
		public ModelAndView selectSomeOrderList(HttpServletRequest request, HttpServletResponse response) throws IOException {
			ModelAndView mav = new ModelAndView();
			
			//상품총액 변수
			Integer totalProdPrice = 0;
			//배송료 변수
			Integer deliveryFee = 0;
			//결제총액 변수
			Integer totalOrderPrice = 0;
			
			String selectedIndexStr = request.getParameter("selected_index");
			
			System.out.println("test---------------------------- :: " + selectedIndexStr);
			
			String[] selectedIndexArr = selectedIndexStr.split(",");
			int cartIndex = 0;
			
			List<CartVO> orderList = new ArrayList<CartVO>();
					
			if(selectedIndexStr != "") {
				for(int i=0; i<selectedIndexArr.length; i++) {
					cartIndex = Integer.parseInt(selectedIndexArr[i]);
					List<CartVO> someCartList = csOrderService.selectSomeOrderList(cartIndex);
					
					orderList.addAll(someCartList);
//					orderList.addAll(csOrderService.selectSomeOrderList(cartIndex));
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
						
			//현재 로그인한 아이디
			String memberId = (String) request.getSession().getAttribute("user_id");
			
			//회원 등급별 적립 금액 계산
			MemberVO myMemberInfo = csOrderService.selectMyMemberId(memberId);
			
			//적립 포인트 계산
			int purchasePoint = 0;
			
			//회원 등급별 포인트 적립률
			double pointRate = 0;
			
			if(myMemberInfo.getLevel() == 1) {
				pointRate = 0.01;
			}else if(myMemberInfo.getLevel() == 2) {
				pointRate = 0.03;
			}else if(myMemberInfo.getLevel() == 3) {
				pointRate = 0.05;
			}else {
				pointRate = 0;
			}
			
			purchasePoint = (int) (totalOrderPrice * pointRate); 
						
			//상품 주문 페이지의 결제수단 - 은행명 출력에 사용			
			List<BankNameDTO> bankNameList = csOrderService.selectBankName();
			
			mav.addObject("memberPoint", myMemberInfo.getPoint());
			mav.addObject("purchasePoint", purchasePoint);
			mav.addObject("selectedIndexStr", selectedIndexStr);
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
			
			//이메일 내용에 쓸 주문 정보 조회
			List<Map<String, Object>> oneOrderList = csOrderService.orderInfoByOrderCode(getLoginId(request));
			
			//주문완료 시 주문 내역 이메일로 전송
			mss.sendOrderListMail(oneOrderList);
			
			String notice = "주문이 완료되었습니다.";
			
			mav.addObject("order_id", csOrderVO.getOrder_code());
			attributes.addFlashAttribute("notice", notice); 
			mav.setViewName("redirect:/mypage/orderInfoDetail");
			return mav;
		}
		
		
		@ResponseBody
		@RequestMapping(value="ajaxCheckMemberLevel", method=RequestMethod.POST)
		public int ajaxChkMemLev(String totalOrderPriceStr, HttpServletRequest request) {
			
			System.out.println("totalOrderPriceStr:: " + totalOrderPriceStr);
			
			int totalOrderPrice = Integer.parseInt(totalOrderPriceStr);
			
			//현재 로그인한 아이디
			String memberId = (String) request.getSession().getAttribute("user_id");
			
			//회원 등급별 포인트 적립률
			double pointRate = 0;
			
			//포인트 적용된 후 최종 결제금액
			int finalOrderPoint = 0;
				
			//회원 등급별 적립 금액 계산
			MemberVO myMemberInfo = csOrderService.selectMyMemberId(memberId);
						
			if(myMemberInfo.getLevel() == 1) {
				pointRate = 0.01;
			}else if(myMemberInfo.getLevel() == 2) {
				pointRate = 0.03;
			}else if(myMemberInfo.getLevel() == 3) {
				pointRate = 0.05;
			}else {
				pointRate = 0;
			}
			
			finalOrderPoint = (int) (totalOrderPrice * pointRate); 
			
			
			
			return finalOrderPoint;
		}
		
		
			
		//현재 로그인한 아이디 정보 가져오기
		public String getLoginId(HttpServletRequest request) {			
			String userId = (String) request.getSession().getAttribute("user_id");				
			return userId;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		@RequestMapping(value="test")
		public ModelAndView testOrderEmail() {
			
			ModelAndView mav = new ModelAndView();
			
			
			mav.setViewName("order/order_email");
					
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
