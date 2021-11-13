package com.retro.customerOrder;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.admin.PointVO;
import com.retro.adminProduct.AdminProductVO;
import com.retro.cart.CartVO;
import com.retro.member.MemberVO;
import com.retro.mypage.MyPageService;

@Service
public class CustomerOrderService {

	@Autowired
	private CustomerOrderDAO csOrderDAO;
	@Autowired
	private MyPageService mypageService;
	
	
	
	//상품 주문 페이지의 결제수단 - 은행명 출력에 사용
	public List<BankNameDTO> selectBankName() {
		return csOrderDAO.selectBankName();
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
		
		//포인트
		int purchasePoint = Integer.parseInt(request.getParameter("p_point"));
			purchasePoint = Math.round(purchasePoint);
		
		//사용한 포인트
		int usedPoint = Integer.parseInt(request.getParameter("u_point"));
			
			
		//현재 로그인된 아이디 
		MemberVO memberList = mypageService.getInfo(userId);
		
		//주문번호 생성하기
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		String orderDate = df.format(today);
	
		int orderIdx = 0;
		LocalDate now = LocalDate.now();
		DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("yyyyMMdd");
		String currentDate = now.format(dateTimeFormat);
		String[] orderCodeIdxArr;
		
		CustomerOrderVO lastOrderList = csOrderDAO.selectLastOrder(currentDate);		
		
		if(lastOrderList == null) {
			orderIdx = 1;		
		}else {			
			orderCodeIdxArr = lastOrderList.getOrder_code().split(currentDate);
			
			orderIdx = Integer.parseInt(orderCodeIdxArr[1]) + 1;	
		}
		
		String orderCode = orderDate + String.format("%04d", orderIdx);

		
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
		csOrderVO.setAdded_point(purchasePoint);
		csOrderVO.setUsed_point(usedPoint);
		
		
		//주문할 상품 인덱스 번호
		String selectedIndexStr = request.getParameter("selected_index");
		String[] selectedIndexArr = selectedIndexStr.split(",");
		int cartIndex = 0;
		int prPoint = 0;
		//회원 등급별 포인트 적립률
		double pointRate = 0;
		
		Map<String, Object> selectedIdxMap = new HashMap<String, Object>();
		selectedIdxMap.put("orderCode", csOrderVO.getOrder_code());
		
		List<CartVO> cartList = new ArrayList<CartVO>();
		
		
		if(selectedIndexStr != "") {
			for(int i=0; i<selectedIndexArr.length; i++) {				
				cartIndex = Integer.parseInt(selectedIndexArr[i]);
				csOrderDAO.updateCartStat(cartIndex);
				
				selectedIdxMap.put("cartIndex", cartIndex);
				csOrderDAO.updateOrderNum(selectedIdxMap);
				
				//장바구니 index로 데이터 조회
				cartList = csOrderDAO.selectSomeOrderList(cartIndex);
				
				//장바구니테이블 상품별 적립금액(pr_point) 저장
				if(memberList.getLevel() == 1) {
					pointRate = 0.01;
				}else if(memberList.getLevel() == 2) {
					pointRate = 0.03;
				}else if(memberList.getLevel() == 3) {
					pointRate = 0.05;					
				}else {
					pointRate = 0;
				}				
				
				prPoint = (int) (cartList.get(0).getPr_price() * pointRate); 
				
				//장바구니 내 상품별 적립 포인트 금액 저장
				updateCartPrPoint(cartIndex, prPoint);
				
				//주문된 상품의 수량을 상품 재고량에서 빼기, 상품별 적립금액 저장
				updateProductInventory(cartList.get(0).getTotal_num(), cartList.get(0).getPr_idx());	
				
				//System.out.println("selectedIdxMap 확인중--------------------:: " + selectedIdxMap);					
			}
			//System.out.println("selectedIdxMap 전체 확인중++++++++++++++++++:: " + selectedIdxMap);			
		}		
		//주문정보 저장
		csOrderDAO.insertOrderInfo(csOrderVO);
		//주문완료 시 회원의 포인트 데이터 변경
		int totalPoint = memberList.getPoint() - usedPoint + purchasePoint;		
		updateMemberPoint(totalPoint, userId);
	}
	
	
	//상품 재고량에서 주문된 수량만큼 빼기
	public void updateProductInventory(int inventoryNum, int productNumber) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
						
		map.put("inventoryNum", inventoryNum);
		map.put("productNumber", productNumber);		
		
		csOrderDAO.updateProductInventory((HashMap<String, Integer>) map);
	}
	
	
	//회원 등급 조회
	public MemberVO selectMyMemberId(String memberId) {
		return csOrderDAO.selectMyMemberId(memberId);
	}
	
	
	//장바구니 내 상품별 적립 포인트 금액 저장
	public void updateCartPrPoint(int cartIndex, int prPoint) {
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("cartIndex", cartIndex);
			map.put("prPoint", prPoint);
		
		csOrderDAO.updateCartPrPoint(map);
	}

	
	//회원(member)테이블에 point컬럼 값 업데이트 
	public void updateMemberPoint(int totalPoint, String memberId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("totalPoint", totalPoint);
			map.put("memberId", memberId);
		
		csOrderDAO.updateMemberPoint(map);
	}
		
		
	
	
	
	
	
	
//	은행 정보 입력용으로만 사용한 후 주석 처리 했음
//	public void insertBankInfo(Map<String, Object> bankInfoMap) {
//		csOrderDAO.insertBankInfo(bankInfoMap);
//	}
	
	
	
	
}
