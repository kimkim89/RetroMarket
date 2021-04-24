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
			mav.setViewName("/member/myPageR");
			return mav;
		}
		
		// 회원정보 수정 페이지 이동
		@RequestMapping(value = "memberInfoModify", method = RequestMethod.GET)
		public ModelAndView memberInfoModify() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/member/member_modify");
			return mav;
		}
	
}
