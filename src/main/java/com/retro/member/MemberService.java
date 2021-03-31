package com.retro.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	
	
	
	
	
	
	
	
	
	
	
}
