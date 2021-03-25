package com.retro.member;

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
}
