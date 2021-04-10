package com.retro.member;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.retro.common.MailSendService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MailSendService mss;
	
	@RequestMapping(value = "test")
	public void test() {
		
		System.out.println("왔다 ");
	}
	
	//로그인 페이지 이동
	@RequestMapping(value = "login")
	public ModelAndView login(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	
	//회원가입 페이지 이동
	@RequestMapping(value = "joinPage")
	public ModelAndView joinPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/join");
		return mav;
	}
	
	//아이디/비밀번호 찾기 페이지 이동
	@RequestMapping(value = "findPage")
	public ModelAndView findPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/find");
		return mav;
	}
	
	//아이디 찾기 페이지 이동
	@RequestMapping(value = "idFind")
	public ModelAndView idFind() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/idFind");
		return mav;
	}
	
	//비밀번호 찾기 페이지 이동
	@RequestMapping(value = "pwFind")
	public ModelAndView pwFind() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/pwFind");
		return mav;
	}	
	
	//회원가입
	@RequestMapping(value = "userJoin", method= RequestMethod.POST)
	public ModelAndView userjoin(MemberVO memberVO, RedirectAttributes attributes) {
		System.out.println("컨트롤러");
		ModelAndView mav = new ModelAndView();
		UserSha256 userSha256 = new UserSha256();
		
		System.out.println("암호화 전 암호 : " + memberVO.getPwd());
		
		// 회원 비밀번호 SHA-256방식 암호화
		String encrypassword = userSha256.encrypt(memberVO.getPwd());
		memberVO.setPwd(encrypassword);
		System.out.println("암호화 후 암호 : " + memberVO.getPwd());
		
		// 회원 정보 insert
		memberService.userJoin(memberVO);
		String notice = "";
		//임의의 authKey생성 & 이메일 발송
		String authKey = mss.sendAuthMail(memberVO.getEmail());
		memberVO.setAuthkey(authKey);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", memberVO.getEmail());
		map.put("authkey", memberVO.getAuthkey());
		
		//DB에 authKey 업데이트
		memberService.updateAuthKey(map);
		notice = "회원가입이 완료되었습니다! 이메일 인증 후 이용해주세요!";
		attributes.addFlashAttribute("notice", notice);
		mav.setViewName("redirect:/member/login");
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
	
	//이메일 중복 확인
	@RequestMapping(value = "emailcheck", method= RequestMethod.POST)
	@ResponseBody
	public int emailcheck(String email) {
		// 0: 사용가능 이메일 , 1: 존재하는 이메일
		int result = 0; 
		result  = memberService.emailcheck(email);
		return result;
	}		
	
	//이메일 인증 확인
	@RequestMapping(value = "signUpConfirm", method= RequestMethod.GET)
	public ModelAndView signUpConfirm(@RequestParam Map<String, String> map, RedirectAttributes attributes) {
		ModelAndView mav = new ModelAndView();
		//이메일 인증 authKey와 DB authKey일치 여부 확인
		String emailAuthKey = map.get("authKey");
		String email = map.get("email");
		System.out.println(emailAuthKey);
		System.out.println(email);
		//DB authKey 가져오기
		String authKey = memberService.getAuthKey(email);
		String notice = "";
		//일치시 인증상태 업데이트
		if(authKey.equals(emailAuthKey)) {
			if(memberService.updateAuthKeyStatus(email) == 1) {
				notice = "이메일 인증이 완료되었습니다. 아맞다 매점의 회원가입을 축하드립니다! 로그인후 이용해 주세요☺";
				mav.setViewName("redirect:/member/login");
			} 
		} 
		attributes.addFlashAttribute("notice", notice);
		return mav;
	}
	
	//회원 로그인
	@RequestMapping(value = "userLogin")
	public ModelAndView userLogin(MemberVO memberVO, HttpServletRequest request, RedirectAttributes attributes) {
		
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = memberService.userLogin(memberVO, request, attributes);
		mav.addObject("notice", map.get("notice"));
		mav.setViewName((String) map.get("viewPages"));
		return mav;
	}
	
	//회원 로그아웃
	@RequestMapping(value = "logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		request.getSession().removeAttribute("user_id");
		mav.setViewName("redirect:/index/main");
		return mav;
	}
	
	//마이페이지 이동
	@RequestMapping(value = "mypage")
	public ModelAndView mypage() {
		// 세션에 유저아이디값으로 DB에서 정보 긁어와서 뿌려주기 ㅇㅇㅇㅇㅇㅇㅇㅇ
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myPage");
		return mav;
	}
	
	//ID 찾기
	@RequestMapping(value ="idFindExecute")
	public ModelAndView idFindExecute(@RequestParam String email) {
		ModelAndView mav = new ModelAndView();
		String findid = memberService.idFindExecute(email);
		String notion = "";
		if(findid == null) {
			notion = "일치하는 아이디가 없습니다.";
		} else {
			notion = "회원님의 아이디는 <mark>"+findid+"</mark>입니다.";
		}
		mav.addObject("notion", notion);
		mav.setViewName("/member/idFindExecute");
		return mav;
	}
	
	//PW 찾기(인증메일 보내기) 20210407
	@RequestMapping(value = "idemailCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idemailCheck(@RequestParam("id") String id, @RequestParam("email") String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		String notice = "";
		int resultNumber = 0; // 0 : 불일치 , 1 : 일치
		//아이디 , 이메일 일치여부  20210407
		if(memberService.idemailCheck(id, email) == 1) {
			
			//메일 보내기 (비동기 방식 으로 진행)
			String authKey = mss.sendAuthMailPw(email);
			
			System.out.println(authKey);
			notice = "이메일로 인증번호를 발송드렸습니다. 인증번호 확인 후 인증번호를 입력해주세요.";
			resultNumber = 1;
			map.put("notice", notice);
			map.put("resultNumber", resultNumber);
			
		} else { //아이디 이메일 일치하지않을 때
			notice = "등록되지않은 아이디 또는 이메일입니다.";
			resultNumber = 0;
			map.put("notice", notice);
			map.put("resultNumber", resultNumber);
		}
		return map;
	}
	
	
}
