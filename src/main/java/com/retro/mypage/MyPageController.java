package com.retro.mypage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.retro.member.MemberVO;

@Controller
@RequestMapping("mypage")
public class MyPageController {

	@Autowired
	private MyPageService mypagservice;
	
	// 마이페이지 이동
		@RequestMapping(value = "myPageR", method = RequestMethod.GET)
		public ModelAndView myPageR(HttpServletRequest request, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			MemberVO membervo = new MemberVO();
			
			String id = (String)session.getAttribute("user_id");

			mypagservice.getInfo(membervo);
			
			Map<String, Object> userMap = new HashMap<String, Object>();
			
			userMap.put("user_id", id);
//			userMap.put("", );
			
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
