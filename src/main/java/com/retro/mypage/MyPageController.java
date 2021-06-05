package com.retro.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.retro.member.UserSha256;

@Controller
@RequestMapping("mypage")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
		// 마이페이지 이동
		@RequestMapping(value = "myPageR", method = RequestMethod.GET)
		public ModelAndView myPageR(HttpServletRequest request, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			
			String id = (String)session.getAttribute("user_id");
			mav.addObject("myInfo", myPageService.getInfo(id));
			mav.setViewName("/mypage/myPageR");
			return mav;
		}
		
		// 회원정보 수정 페이지 이동
		@RequestMapping(value = "memberInfoModify", method = RequestMethod.GET)
		public ModelAndView memberInfoModify(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			
			// 세션영역 Key, Value로 저장되어진다. example = () => { key="user_id" <<<Key값 Value="재인12345"<<< 실제 Id(Value값)    }
			String user_id = getSessionUserId(request);
			
			//AOP 적용 시키기
			if(user_id == null || user_id == "") {
				mav.addObject("notice", "비밀번호가 틀렸습니다.");
				mav.setViewName("member/login");
				return mav;
			}
			
			mav.addObject("myInfo", myPageService.getInfo(user_id));
			mav.setViewName("/mypage/member_modify");
			return mav;
		}
		
		//회원정보 수정 
		@RequestMapping(value= "modifyAction/{type}", method = RequestMethod.POST)
		public ModelAndView modifyAction(MyPageVO mypageVO, 
				@PathVariable("type") String type) {
			
			UserSha256 userSha256 = new UserSha256();
			mypageVO.setPwd(userSha256.encrypt(mypageVO.getPwd()));
			myPageService.modifyAction(mypageVO, type);
			
			return null;
		}
		
		

		//세션정보에 있는 유저아이디 Get(Refactor -> ExtractMethod)
		public String getSessionUserId(HttpServletRequest request) {
			String user_id = (String)request.getSession().getAttribute("user_id");
			return user_id;
		}
		
				
		// 결제 정보 페이지 이동
		@RequestMapping(value = "buyInfo", method = RequestMethod.GET)
		public ModelAndView buyInfo(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			
			
			mav.setViewName("/mypage/buy_info");
			return mav;
		}		
		
		// 주문내역 조회 페이지 이동
		@RequestMapping(value = "orderInfo", method = RequestMethod.GET)
		public ModelAndView orderInfo() {
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("/mypage/order_info");
			return mav;
		}
		
		// 쿠폰 페이지
		@RequestMapping(value = "couponAdd", method = RequestMethod.GET)
		public ModelAndView couponAdd() {
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("/mypage/couponAdd");
			return mav;
		}
		
		// 최근 본 상품
//		@RequestMapping(value = "couponAdd", method = RequestMethod.GET)
//		public ModelAndView couponAdd() {
//			ModelAndView mav = new ModelAndView();
//			
//			mav.setViewName("/mypage/couponAdd");
//			return mav;
//		}		
		
		// 장바구니 조회
		@RequestMapping(value = "wishList", method = RequestMethod.GET)
		public ModelAndView wishList() {
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("/mypage/wishList");
			return mav;
		}	

		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
}
