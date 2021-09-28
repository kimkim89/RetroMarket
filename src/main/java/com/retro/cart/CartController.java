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

import com.retro.member.MemberVO;
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
	private MemberVO memberVO;
	
	
	//private final CartService cartService;
	//private final ProductService productService;
	
	
	//장바구니 페이지
	@RequestMapping(value = "prCart")
	public ModelAndView cartList(@RequestParam("productId") String productId,
								 @RequestParam("productNum") Integer productNum,
								 @RequestParam("productPrice") Integer productPrice,
								 HttpServletRequest request) {
					
		ModelAndView mav = new ModelAndView();		
		
		String userId = (String) request.getSession().getAttribute("user_id");
		String msg = "";
		
		//비회원일 경우 장바구니 기능 사용할 수 없음
		if(userId == null) {
			msg = "로그인 후 이용하실 수 있습니다.";
		}else { //회원일 경우 장바구니 기능 사용 가능
		
			//선택한 상품 정보 조회
			List<HashMap<String, Object>> productList = productService.selectEachProd(productId);	

			//회원 아이디 기준으로 장바구니에 데이터 저장
			cartService.insertCartInfo(productList, productNum, userId, request);
			
			//회원 아이디 기준으로 장바구니 목록 조회
			List<CartVO> cartList = cartService.selectCartList(userId);
			
			int totalPrice = productPrice * productNum;
			HashMap<String, Integer> cartMap = new HashMap<String, Integer>();
			cartMap.put("productNum", productNum);
			cartMap.put("totalPrice", totalPrice);
			
			//System.out.println("productNum타입 확인" + productNum.getClass().getName());
					
			mav.addObject("cartList", cartList);		
			mav.addObject("cartMap", cartMap);
		}
		mav.addObject("msg", msg);
		mav.setViewName("cart");
		return mav;
		
	}
	
	
	
	
	
	
	
}
