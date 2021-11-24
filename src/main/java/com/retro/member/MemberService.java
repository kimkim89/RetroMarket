package com.retro.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	//회원 가입
	public void userJoin(MemberVO memberVO) {
		memberDAO.userJoin(memberVO);
		
	}

	// ID 중복확인
	public int idcheck(String id) {
		return memberDAO.idcheck(id);
	}	

	// 닉네임 중복확인
	public int nicknameCheck(String nickname) {
		return memberDAO.nicknameCheck(nickname);
	}
	
	// 이메일 중복 확인
	public int emailcheck(String email) {
		return memberDAO.emailcheck(email);
	}

	// authkey 업데이트
	public void updateAuthKey(Map<String, String> map) {
		memberDAO.updateAuthKey(map);
		
	}

	//DB authKey 가져오기
	public String getAuthKey(String email) {
		return memberDAO.getAuthKey(email);
	}

	//인증 상태 업데이트
	public int updateAuthKeyStatus(String email) {
		return memberDAO.updateAuthKeyStatus(email);
	}

	//회원 로그인
	public HashMap<String, Object> userLogin(MemberVO memberVO, HttpServletRequest request, RedirectAttributes attributes) {
		UserSha256 usersha256 = new UserSha256();
		HashMap<String, Object> map = new HashMap<String, Object>();
		String notice = "";
		String viewPages = "";
		
		//아이디 존재 여부 0 : 회원x 1 : 회원
		int idCheck =  memberDAO.idcheck(memberVO.getId());
		
		//아이디 존재여부 확인	
		if(idCheck == 1) {
			int emailCheck = memberDAO.emailStatusCheck(memberVO.getId());
			String pwd = usersha256.encrypt(memberVO.getPwd());
			//비밀번호 일치여부 확인
			if(pwd.equals(memberDAO.pwdCheck(memberVO.getId()))) {
				//이메일 인증 확인
				if(emailCheck != 1) {
					notice = "이메일 인증이 되지 않았습니다. 메일인증을 진행해주세요.";
					viewPages = "member/login";
				} else {
					request.getSession().setAttribute("user_id", memberVO.getId());
					// status가 0일 경우 = 회원, status가 1일 경우 = 관리자
					int checkUserStatus = checkUserStatus(memberVO.getId());
					memberVO.setStatus(checkUserStatus);
					request.getSession().setAttribute("checkUserStatus", memberVO.getStatus());
					viewPages = "redirect:/index/main";
				}
			} else {
				notice = "비밀번호가 틀렸습니다.";
				viewPages = "member/login";
			}
		} else {
			notice = "입력하신 ID의 정보가 없습니다.";
			viewPages = "member/login";
		}
		map.put("notice", notice);
		map.put("viewPages", viewPages);
		return map;
	}

	//ID 찾기
	public String idFindExecute(String email) {
		return memberDAO.idFindExecute(email);
	}

	//아이디, 이메일 일치여부
	public int idemailCheck(String id, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("email", email);
		return memberDAO.idemailCheck(map);
	}

	// 비밀번호 변경(비밀번호 찾기)
	public String pwChange(String pwd, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		UserSha256 usersha256 = new UserSha256();
		String hashPwd = usersha256.encrypt(pwd);
		map.put("hashPwd", hashPwd);
		map.put("email", email);
		String notice = "";
		System.out.println(memberDAO.pwChange(map) == 1);
		if(memberDAO.pwChange(map) == 1) {
			System.out.println("완료");
			notice = "비밀번호변경이 완료되었습니다. 로그인 후 이용해주세요";
			return notice;
		} else {
			System.out.println("미완료");
			return notice = "비밀번호변경을 다시 시도해주세요";
		}
	}
	
	// 회원/관리자 계정 구분
	public int checkUserStatus(String userId) {
		return memberDAO.checkUserStatus(userId);
	}

	
	
	
	
	
	
	
	
	
	
	
}
