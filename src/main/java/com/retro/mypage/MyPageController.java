package com.retro.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("mypage")
public class MyPageController {

	@Autowired
	private MyPageService mypagservice;
	
	// 마이페이지 이동
		@RequestMapping(value = "myPageR", method = RequestMethod.GET)
		public ModelAndView myPageR(HttpServletRequest request, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			
			String id = (String)session.getAttribute("user_id");
			mav.addObject("myInfo", mypagservice.getInfo(id));
			mav.setViewName("/mypage/myPageR");
			return mav;
		}
		
		// 회원정보 수정 페이지 이동
		@RequestMapping(value = "memberInfoModify", method = RequestMethod.GET)
		public ModelAndView memberInfoModify() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/mypage/member_modify");
			return mav;
		}
		
		// 회원정보 수정 페이지 이동
		@RequestMapping(value = "buyInfo", method = RequestMethod.GET)
		public ModelAndView buyInfo() {
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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
}
