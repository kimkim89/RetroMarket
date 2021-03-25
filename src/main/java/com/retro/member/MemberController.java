package com.retro.member;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	private ModelAndView mav = new ModelAndView();
	
	//상품 게시판 이동 및 상품리스트 조회
	@RequestMapping(value = "login")
	public ModelAndView login(Locale locale, Model model) {
		
		mav.setViewName("member/login");
		return mav;
	}
	
	//회원가입 페이지 이동
	@RequestMapping(value = "joinPage")
	public ModelAndView joinPage() {
		
		mav.setViewName("member/join");
		return mav;
	}
	
	//아이디/비밀번호 찾기 페이지 이동
	@RequestMapping(value = "findPage")
	public ModelAndView findPage() {
		
		mav.setViewName("member/find");
		return mav;
	}
	
	//아이디 찾기 페이지 이동
	@RequestMapping(value = "idFind")
	public ModelAndView idFind() {
		
		mav.setViewName("member/idFind");
		return mav;
	}
	
	//비밀번호 찾기 페이지 이동
	@RequestMapping(value = "pwFind")
	public ModelAndView pwFind() {
		
		mav.setViewName("member/pwFind");
		return mav;
	}	
	
	//회원가입
	@RequestMapping(value = "userJoin", method= RequestMethod.POST)
	public ModelAndView userjoin(MemberVO memberVO) {
		memberService.userJoin(memberVO);
		
		mav.setViewName("redirect:/index/main");
		return mav;
	}
	
	//ID 중복 확인
	@RequestMapping(value = "idcheck", method= RequestMethod.POST)
	@ResponseBody
	public int idcheck(String id) {
		// 0: 사용가능 아이디 , 1: 존재하는 아이디
		int result = 0; 
		result  = memberService.idcheck(id);
		return result;
	}
		
	//닉네임 중복 확인
	@RequestMapping(value = "nicknameCheck", method= RequestMethod.POST)
	@ResponseBody
	public int nicknameCheck(String nickname) {
		// 0: 사용가능 닉네임 , 1: 존재하는 닉네임
		int result = 0; 
		result  = memberService.nicknameCheck(nickname);
		return result;
	}	
	
	
}
