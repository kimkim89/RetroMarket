package com.retro.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.retro.member.MemberVO;

@Repository
public class AdminMemberDAO {

	@Autowired
	private SqlSession sqlSession;

	// 회원정보관
	public void userJoin(MemberVO memberVO) {
		sqlSession.insert("mapper.Member.userJoin", memberVO);
	}



}
