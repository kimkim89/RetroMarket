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
		/*if(userId == null) {
			String msg = "<script>alert('로그인 후 장바구니 담기 기능을 사용할 수 있습니다.'); location.href='${contextPath}/member/login';</scrtip>";
			return msg;
		}*/
		
		List<HashMap<String, Object>> productList = productService.selectEachProd(productId);	
		int totalPrice = productPrice * productNum;
		HashMap<String, Integer> cartMap = new HashMap<String, Integer>();
		cartMap.put("productNum", productNum);
		cartMap.put("totalPrice", totalPrice);
		
		//System.out.println("productNum타입 확인" + productNum.getClass().getName());
		//System.out.println("productList배열 확인: " + productList);
		
		cartService.insertCartInfo(productList, productNum);
		
		mav.addObject("productList", productList);		
		mav.addObject("cartMap", cartMap);
		mav.setViewName("cart");
		return mav;
		
	}
	
	
	
}
