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

}
