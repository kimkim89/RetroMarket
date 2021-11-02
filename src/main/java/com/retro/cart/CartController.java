package com.retro.cart;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.retro.product.ProductService;



@Controller
//@RequiredArgsConstructor
@RequestMapping("/cart/*")
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;

	
	//장바구니 페이지
	@RequestMapping(value = "prCart")
	public ModelAndView cartList(//@RequestParam("productId") String productId,
								 //@RequestParam("productNum") Integer productNum,								 
								 HttpServletRequest request) {
					
		ModelAndView mav = new ModelAndView();		
		
		//System.out.println("request확인중: " + request);
		
		String fromPrPg = request.getParameter("fromPrPg");
		String userId = (String) request.getSession().getAttribute("user_id");		
	
		int count = 0;
		String msg = "";
		String locationUrl = "";
		String quantityMsg = "";
		String quantityFontColor = "";
	
		//비회원일 경우 장바구니 기능 사용할 수 없음
		if(userId == null) {
			msg = "로그인 후 이용하실 수 있습니다.";
			locationUrl = "member/login";
		}else { //회원일 경우 장바구니 기능 사용 가능
			
			if(fromPrPg != null) { 
				Integer productNum = Integer.parseInt(request.getParameter("productNum"));
				String productId = request.getParameter("productId");	
				
				//선택한 상품 정보 조회
				List<HashMap<String, Object>> productList = productService.selectEachProd(productId);					
				int prQuantity = (Integer) productList.get(0).get("mk_inventory");
				int ableToSellQuantity = 0;
				
				
				//2021.11.02 : 재고량 있을 때만 장바구니에 상품 담을 수 있도록 수정 작업 진행 중-------------------------------------
				if(prQuantity == 0) {
					quantityMsg = "(품절)";
					quantityFontColor = "red";
					
				}else if(prQuantity - productNum < 1) {
					ableToSellQuantity = productNum - prQuantity;
					quantityMsg = "현재 구매 가능한 수량: " + ableToSellQuantity + "개";
					quantityFontColor = "red";
					
				}else if(prQuantity - productNum >= 1) {						
					//회원 아이디 기준으로 장바구니에 데이터 저장
					int checkProdExist = cartService.insertCartInfo(productList, productNum, userId, request);
					
					if(checkProdExist != 0) {
						msg = "해당 상품이 이미 장바구니에 담겨있습니다. 장바구니에서 수량을 변경해주세요.";
						locationUrl = "cart/prCart";
					}						
					count++;
				}//prQuantity if문 끝
				System.out.println("testtest중");
				System.out.println(prQuantity);
			
			}else {
			
				//회원 아이디 기준으로 장바구니 목록 조회
				List<HashMap<String, Object>> cartList = cartService.selectCartList(userId);
				
				/*List<Integer> totalPriceList = new ArrayList<Integer>();
				int totalPrice = 0;
				
				for(int i=0; i<cartList.size(); i++) {
					//System.out.println("횟수 확인 " + i + "번째 반복");
					//System.out.println("price확인: " + cartList.get(i).get("pr_price"));
					//System.out.println("상품 개수 확인: " + cartList.get(i).get("total_num"));
					//totalPrice = Integer.parseInt(cartList.get(i).get("pr_price").toString()) * Integer.parseInt(cartList.get(i).get("total_num").toString());
					//totalPrice = Integer.parseInt(cartList.get(i).get("eachNumPrice").toString()); 
					//totalPriceList.add(i, totalPrice);
													
				}*/
				
				//System.out.println("totalPrice 확인: " + totalPriceList);	
				//System.out.println(cartList);
				//int totalPrice = cartList. * productNum;
				//HashMap<String, Integer> cartMap = new HashMap<String, Integer>();
				//cartMap.put("productNum", productNum);
				//cartMap.put("totalPrice", totalPrice);
				
				//System.out.println("productNum타입 확인" + productNum.getClass().getName());			
				mav.addObject("cartList", cartList);	
				
			}//fromPrPg if문 끝
		}//userId if문 끝
		
		mav.addObject("quantityFontColor", quantityFontColor);
		mav.addObject("quantityMsg", quantityMsg);
		mav.addObject("msg", msg);
		mav.addObject("locationUrl", locationUrl);
		mav.setViewName("order/cart");
		return mav;		
	}
	
	
	//선택삭제 기능 구현
	@RequestMapping(value="delEachCartProd", produces = "application/text; charset=utf8") 
	@ResponseBody
	public String deleteEachCartProd(@RequestParam(value="checkedArray[]") List<Integer> chkBoxArr) {
		
		Integer checkDelNum = 0;
		int delResult = 0;
		String delMsg = "";
		
		for(Integer delNumber : chkBoxArr) {
			checkDelNum = delNumber;
			
			//장바구니 제품 delete
			delResult = cartService.deleteCartList(checkDelNum);
		}
		
		if(delResult != 0) {
			delMsg = "삭제되었습니다.";
		}
		return delMsg;
	}
	
	
	//장바구니 수량 변경
	@RequestMapping(value="updateCartList", produces = "application/text; charset=utf8") 
	@ResponseBody
	public String updateCartList(Integer totalCount, Integer cartId) {
		
		int updateResult = 0;
		HashMap<String, Integer> updateCartMap = new HashMap<String, Integer>(); 
		String updateMsg = "";
				
		updateCartMap.put("totalCount", totalCount);
		updateCartMap.put("cartId", cartId);
			
		updateResult = cartService.updateCartList(updateCartMap);
		
		if(updateResult != 0) {
			updateMsg = "선택하신 상품의 수량을 변경했습니다.";
		}
		
		return updateMsg;		
	}
	
	
	
	
	
	
}
