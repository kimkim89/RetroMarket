package com.retro.member;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@RequestMapping(value = "userJoin")
	public ModelAndView userjoin(MemberVO memberVO) {
		memberService.userJoin(memberVO);
		
		mav.setViewName("redirect:/index/main");
		return mav;
	}
		
	
}
