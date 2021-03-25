package com.retro.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//회원 가입
	public void userJoin(MemberVO memberVO) {
		sqlSession.insert("mapper.Member.userJoin", memberVO);
	}

	//ID 중복 확인
	public int idcheck(String id) {
		return sqlSession.selectOne("mapper.Member.idcheck", id);
	}
	
	//닉네임 중복 확인
	public int nicknameCheck(String nickname) {
		return sqlSession.selectOne("mapper.Member.nicknameCheck", nickname);
	}	

}
