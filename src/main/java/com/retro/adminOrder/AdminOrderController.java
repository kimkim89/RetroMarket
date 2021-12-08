package com.retro.adminOrder;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.retro.common.MailSendService;
import com.retro.common.PagingService;
import com.retro.customerOrder.BankNameDTO;
import com.retro.customerOrder.CustomerOrderController;
import com.retro.customerOrder.CustomerOrderService;
import com.retro.customerOrder.CustomerOrderVO;

@Controller
@RequestMapping(value="/adminOrder/*")
public class AdminOrderController {

	@Autowired
	AdminOrderService admOrderService;
	@Autowired
	CustomerOrderVO csOrderVO;
	@Autowired
	CustomerOrderController csOrderController;
	@Autowired
	CustomerOrderService csOrderService;
	@Autowired
	private MailSendService mss;
	
	
	//주문 관리 목록 페이지 이동
	@RequestMapping(value = "orderList")
	public ModelAndView selectAdmOrderList( @RequestParam(defaultValue = "1") int nowPage,
											@RequestParam(defaultValue = "") String searchField, 
											@RequestParam(defaultValue = "") String keyword ) {
		
		ModelAndView mav = new ModelAndView();
		
		/*페이징처리*/
		PagingService pagingService = new PagingService();
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		
		int pageSizeToPaging = 10;
		int blockSizeToBlockSize = 3;
		
		int OrderCount = admOrderService.countOrderList(searchField, keyword);
		
		pagingMap = pagingService.pagingList(nowPage, OrderCount, pageSizeToPaging, blockSizeToBlockSize);
			int pageFirst = Integer.parseInt(pagingMap.get("pageFirst").toString());
			int pageSize = Integer.parseInt(pagingMap.get("pageSize").toString());
			
		List<Map<String, Object>> csOrderList = admOrderService.selectAdminOrderList(searchField, keyword, pageFirst, pageSize);
		
		mav.addObject("OrderCount", OrderCount);
		mav.addObject("pagingMap", pagingMap);
		mav.addObject("searchField", searchField);
		mav.addObject("keyword", keyword);
		mav.addObject("csOrderList", csOrderList);
		mav.setViewName("admin/admin_order");
		return mav;
	}
	
	
	// 주문 내역 수정 페이지
	@RequestMapping(value = "orderForm")
	public ModelAndView selectEachOrderInfo( @RequestParam("wu") String wu,
											 @RequestParam("id") int orderIdx ) {
											
		
		ModelAndView mav = new ModelAndView();
						
		Map<String, Object> eachOrderList = admOrderService.selectEachOrderList(orderIdx);
		
		String orderCode = eachOrderList.get("order_code").toString();
		String paymentMethod = "" ;
		
		if(Integer.parseInt(eachOrderList.get("payment_method").toString()) == 1) {
			paymentMethod = "무통장입금";
		}
		
		List<Map<String, Object>> odProdList = admOrderService.selectOrderedProd(orderCode);

		List<OrderStatusVO> orderStatList = admOrderService.selectOrderStatInfo();
		
		//상품 주문 페이지의 결제수단 - 은행명 출력에 사용			
		List<BankNameDTO> bankNameList = csOrderService.selectBankName();
		
		mav.addObject("bankNameList", bankNameList);
		mav.addObject("paymentMethod", paymentMethod);
		mav.addObject("orderStatList", orderStatList);
		mav.addObject("eachOrderList", eachOrderList);
		mav.addObject("odProdList", odProdList);
		mav.setViewName("admin/admin_order_form");
		return mav;
	}
	
	
	@RequestMapping(value = "updateOrderForm")
	public ModelAndView updateOrderInfo( @RequestParam("paid_date_ex") String paidDateEx,
										 @RequestParam("delivery_start_date_ex") String deliveryDateEx,
										 CustomerOrderVO csOrderVO,
										 HttpServletRequest request) {
		
		
		ModelAndView mav = new ModelAndView();
		
		String msg = "";
		Timestamp paidDate = null;
		Timestamp deliveryDate = null;
		
//		System.out.println();
//		System.out.println("확인중------------------ :  " + paidDateEx);
//		System.out.println("확인중------------------ :  " + deliveryDateEx);
//		System.out.println();
		
		if(paidDateEx != "") {
			paidDate = Timestamp.valueOf(paidDateEx);
		}
		
		if(deliveryDateEx != "") {
			deliveryDate = Timestamp.valueOf(deliveryDateEx);
		}
		
		csOrderVO.setPaid_date(paidDate);
		csOrderVO.setDelivery_start_date(deliveryDate);
		
		int resultCnt = admOrderService.updateOrderInfo(csOrderVO, request);
		
		if(resultCnt >= 1) {
			//이메일 내용에 쓸 주문 정보 조회
			List<Map<String, Object>> oneOrderList = csOrderService.orderInfoByOrderCode(csOrderVO.getMember_id());
			
//			System.out.println("확인 중234 " + (Integer.parseInt(oneOrderList.get(0).get("order_status").toString())));
//			System.out.println();
			
			if(Integer.parseInt(oneOrderList.get(0).get("order_status").toString()) == 2) {
				
				//주문완료 시 주문 내역 이메일로 전송
				mss.sendReceiveMoneyEmail(oneOrderList);
			}
			msg = "주문 내역이 수정되었습니다.";
		}else {
			msg = "수정된 주문 내역이 없습니다.";
		}
		
		mav.addObject("msg", msg);
		mav.setViewName("redirect:/adminOrder/orderList");
		return mav;
	}

	
}
