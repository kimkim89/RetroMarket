package com.retro.member;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.retro.common.AsyncRequest;
import com.retro.common.HashMake;
import com.retro.common.MailSendService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MailSendService mss;
//	@Autowired
//	private AsyncRequest asc;
	
	@RequestMapping(value = "test")
	public void test() {
		
		System.out.println("왔다 ");
	}
	
	//로그인 페이지 이동
	@RequestMapping(value = "login")
	public ModelAndView login(Locale locale, Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		String userId = (String) request.getSession().getAttribute("user_id");
		
		String msg = "";
		String locationUrl = "";
		
		System.out.println("로그인 했는지?? : " + userId);
		
		if(userId != null) {
			msg = "이미 로그인 되어 있습니다. 메인페이지로 이동합니다.";
			locationUrl = "main/index";
		}		
		
		mav.addObject("notice", msg);
		mav.addObject("locationUrl", locationUrl);
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
		ModelAndView mav = new ModelAndView();
		UserSha256 userSha256 = new UserSha256();
		
		// 회원 비밀번호 SHA-256방식 암호화
		String encrypassword = userSha256.encrypt(memberVO.getPwd());
		memberVO.setPwd(encrypassword);
		// 회원 정보 insert
		memberService.userJoin(memberVO);
		String notice = "";
		
		//임의의 authKey생성 & 이메일 발송
		//메일 보내기 (비동기 방식 으로 진행)
		mss.sendAuthMail(memberVO.getEmail());
		
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
	public ModelAndView mypage(HttpServletRequest request) {
		// 세션에 유저아이디값으로 DB에서 정보 긁어와서 뿌려주기
		ModelAndView mav = new ModelAndView();
		
		String userId = (String) request.getSession().getAttribute("user_id");
		
		String msg = "";
		String locationUrl = "";
		
		if(userId == null) {
			msg = "로그인 후 이용하실 수 있습니다.";
			locationUrl = "member/login";
		}
		
		mav.addObject("msg", msg);
		mav.addObject("locationUrl", locationUrl);
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
		//인증번호 암호화
		UserSha256 sha256 = new UserSha256();
		//인증번호 (난수) 생성
		HashMake hmk = new HashMake();
		
		Map<String, Object> map = new HashMap<String, Object>();
		String notice = "";
		int resultNumber = 0; // 0 : 불일치 , 1 : 일치
		//아이디 , 이메일 일치여부  20210407
		if(memberService.idemailCheck(id, email) == 1) {
			System.out.println(email);
			System.out.println(id);
			
			String authKey = hmk.getKey(6);
			//메일 보내기 (비동기 방식 으로 진행)
			mss.sendAuthMailPw(email, authKey);
			//인증키 일치여부 해쉬
			String authHash = sha256.encrypt(authKey);
			
			//비동기 방법2
//			asc.mailTest(email);
			notice = "이메일로 인증번호를 발송드렸습니다. 인증번호 확인 후 인증번호를 입력해주세요.";
			resultNumber = 1;
			map.put("notice", notice);
			map.put("resultNumber", resultNumber);
			map.put("authHash", authHash);
			map.put("email", email);
		} else { //아이디 이메일 일치하지않을 때
			notice = "등록되지않은 아이디 또는 이메일입니다.";
			resultNumber = 0;
			map.put("notice", notice);
			map.put("resultNumber", resultNumber);
		}
		return map;
	}
	
	//인증번호 검증
	@RequestMapping(value = "pwFindExecute", method = RequestMethod.POST)
	public ModelAndView pwFindExecute(@RequestParam String authNum, @RequestParam String authHash, @RequestParam String email,
									  				HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		UserSha256 sha256 = new UserSha256();
		String notice = "";
		//이전 페이지
//		String referer = request.getHeader("Referer"); // Referer 이전 페이지에 대한 정보가 전부 들어있는 헤더
		//인증 번호 일치 여부 구현
		String pwCheck = sha256.encrypt(authNum);
		if(pwCheck.equals(authHash)) {
			mav.addObject("email", email);
			mav.setViewName("/member/pwChange");
		} else {
			notice = "인증번호가 일치하지 않습니다";
			mav.addObject("notice", notice);
			mav.setViewName("/member/pwFind");
		}
		//비밀번호 변경 페이지 이동 - > 입력 받고 (유효성 , 정규식) -> 디비 변경 쿼리
		return mav;
	}
	
	// 비밀번호 변경 실행
	@RequestMapping(value = "pwChange", method = RequestMethod.POST)
	public ModelAndView pwChange(@RequestParam String pwd, @RequestParam String email, RedirectAttributes attributes) {
		ModelAndView mav = new ModelAndView();
		String notice = "";
		notice = memberService.pwChange(pwd, email);
		attributes.addFlashAttribute("notice", notice);
		mav.setViewName("redirect:/member/login");
		return mav;
	}
	
	
	
	
	
}
