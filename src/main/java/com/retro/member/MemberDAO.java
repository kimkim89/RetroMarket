package com.retro.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void userJoin(MemberVO memberVO) {
		sqlSession.insert("mapper.Member.userJoin", memberVO);
	}	

}
