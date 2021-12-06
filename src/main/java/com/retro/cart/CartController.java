package com.retro.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.retro.customerOrder.CustomerOrderService;
import com.retro.product.ProductService;



@Controller
//@RequiredArgsConstructor
@RequestMapping("/cart/*")
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;
	@Autowired
	private CustomerOrderService csOrderService;
	
	//장바구니 페이지
	@RequestMapping(value = "prCart")
	public ModelAndView cartList(//@RequestParam("productId") String productId,
								 //@RequestParam("productNum") Integer productNum,								 
								 HttpServletRequest request,
								 HttpServletResponse response) throws IOException {
					
		ModelAndView mav = new ModelAndView();		
		
		//System.out.println("request확인중: " + request);
		
		String fromPrPg = request.getParameter("fromPrPg");
		String userId = (String) request.getSession().getAttribute("user_id");		
	
		int count = 0;
		String msg = "";
		String locationUrl = "";
		int prQuantity = 0;
		
		
		//비회원일 경우 장바구니 기능 사용할 수 없음
		if(userId == null) {
			
			msg = "로그인 후 이용하실 수 있습니다.";
			locationUrl = "member/login";
			
		}else { //회원일 경우 장바구니 기능 사용 가능
			
			if(fromPrPg != null) { 
				
				Integer productNum = Integer.parseInt(request.getParameter("productNum"));
				Integer productId = Integer.parseInt(request.getParameter("productId"));	
								
				//선택한 상품 정보 조회
				List<HashMap<String, Object>> productList = productService.selectEachProd(productId);					
				prQuantity = (Integer) productList.get(0).get("mk_inventory");
												
				if(productNum <= prQuantity) {						
					
					if(cartService.existProd(productId, userId) > 0) {
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.print("<script>alert('해당 상품이 이미 장바구니에 담겨있습니다.\\n장바구니에서 수량을 변경해주세요.'); location.href='" + request.getContextPath() + "/cart/prCart'; </script>");
						out.flush();
					}
					
					//회원 아이디 기준으로 장바구니에 데이터 저장
					int checkProdExist = cartService.insertCartInfo(productList, productNum, userId, request);
						
					count++;
				}//prQuantity if문 끝
				
				//찜한 상품 목록 페이지에서 장바구니 버튼을 클릭했을 경우, 찜한 상품 목록에서 해당 상품 삭제
				if(fromPrPg.equals("y_like")) {
					productService.deleteWishlist(productId, userId);
				}		
			}						
				//회원 아이디 기준으로 장바구니 목록 조회
				List<HashMap<String, Object>> cartList = cartService.selectCartList(userId);
								
				mav.addObject("cartList", cartList);	
				

		}//userId if문 끝
		
		mav.addObject("msg", msg);
		mav.addObject("locationUrl", locationUrl);
		mav.setViewName("order/cart");
		return mav;		
	}
	
	
	//선택삭제 기능 구현
	@RequestMapping(value="delEachCartProd", produces = "application/text; charset=utf8") 
	@ResponseBody
	public String deleteEachCartProd( @RequestParam(value="checkedArray[]") List<Integer> chkBoxArr,
									  @RequestParam(value="deleteTypeArray[]") List<String> deleteType,
									  @RequestParam(value="totalNumArray[]") List<Integer> totalNumArr,
									  @RequestParam(value="productIndexArray[]") List<Integer> productIndex) {									
		
		Integer checkDelNum = 0;
		Integer productNum = 0;
		int i = 0;
		int delResult = 0;
		String delMsg = "";
		
		System.out.println("");
		System.out.println(totalNumArr);
		System.out.println(deleteType);
		System.out.println(productIndex);
		
		for(Integer delNumber : chkBoxArr) {
			checkDelNum = delNumber;
			
			productNum = productIndex.get(i);
			
			//장바구니 제품 delete
			delResult = cartService.deleteCartList(checkDelNum);
			
			if(deleteType.get(i).equals("each_delete")) {
				//장바구니 내 상품수량 삭제 시 상품 재고량에 해당 수량만큼 다시 더하기
				csOrderService.updateProductInventory(totalNumArr.get(i), productNum, "minus");
			}
			i++;
		}
		
		if(delResult > 0) {
			delMsg = "삭제되었습니다.";
		}
		return delMsg;
	}
	
	
	//장바구니 수량 변경
	@RequestMapping(value="updateCartList", produces = "application/text; charset=utf8") 
	@ResponseBody
	public String updateCartList(Integer totalCount, Integer cartId, Integer productIndex, String minPlusSign) {
		
		int updateCartResult = 0;
		HashMap<String, Integer> updateCartMap = new HashMap<String, Integer>(); 
		String updateMsg = "";
				
		updateCartMap.put("totalCount", totalCount);
		updateCartMap.put("cartId", cartId);
			
		updateCartResult = cartService.updateCartList(updateCartMap);
		//장바구니 내 상품수량 변경 시 상품 재고량에서 제거
		csOrderService.updateProductInventory(1, productIndex, minPlusSign);
		
		if(updateCartResult > 0) {
			updateMsg = "선택하신 상품의 수량을 변경했습니다.";
		}
		
		return updateMsg;		
	}
	
	
	
	
	
	
}
