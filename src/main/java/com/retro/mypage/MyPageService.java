package com.retro.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.member.MemberVO;

@Service
public class MyPageService {

	@Autowired
	MyPageDAO mypageDAO = new MyPageDAO();

	// 20210424 마이페이지 정보 들고오기
	public MemberVO getInfo(String id) {
		return mypageDAO.getInfo(id);
	}
	
	
	
	
	
}
