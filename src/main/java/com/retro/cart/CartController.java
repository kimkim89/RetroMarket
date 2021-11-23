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
