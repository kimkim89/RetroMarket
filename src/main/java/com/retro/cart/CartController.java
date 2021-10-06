package com.retro.cart;

import java.util.ArrayList;
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
		
		//비회원일 경우 장바구니 기능 사용할 수 없음
		if(userId == null) {
			msg = "로그인 후 이용하실 수 있습니다.";
			locationUrl = "member/login";
		}else { //회원일 경우 장바구니 기능 사용 가능
			
			if(fromPrPg == "Y") {
				Integer productNum = Integer.parseInt(request.getParameter("productNum"));
				String productId = request.getParameter("productId");	
				
				//선택한 상품 정보 조회
				List<HashMap<String, Object>> productList = productService.selectEachProd(productId);					
			
				//회원 아이디 기준으로 장바구니에 데이터 저장
				msg = "테스트 중입니다." + count;
				//cartService.insertCartInfo(productList, productNum, userId, request);
				count++;
			}
			
			//회원 아이디 기준으로 장바구니 목록 조회
			List<HashMap<String, Object>> cartList = cartService.selectCartList(userId);
			List<Integer> totalPriceList = new ArrayList<Integer>();
			int totalPrice = 0;
			
			/*for(int i=0; i<cartList.size(); i++) {
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
			//mav.addObject("totalPriceList", totalPriceList);
			
		}
		
		mav.addObject("msg", msg);
		mav.addObject("locationUrl", locationUrl);
		mav.setViewName("cart");
		return mav;
		
	}
	
	
	
}