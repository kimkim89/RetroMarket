package com.retro.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	// 회원 가입
	public void userJoin(MemberVO memberVO) {
		sqlSession.insert("mapper.Member.userJoin", memberVO);
	}

	// ID 중복 확인
	public int idcheck(String id) {
		return sqlSession.selectOne("mapper.Member.idcheck", id);
	}

	// 닉네임 중복 확인
	public int nicknameCheck(String nickname) {
		return sqlSession.selectOne("mapper.Member.nicknameCheck", nickname);
	}

	// 이메일 중복 확인
	public int emailcheck(String email) {
		return sqlSession.selectOne("mapper.Member.emailCheck", email);
	}

	// authkey 업데이트
	public void updateAuthKey(Map<String, String> map) {
		sqlSession.update("mapper.Member.updateAuthKey", map);

	}

	// DB authKey 가져오기
	public String getAuthKey(String email) {
		return sqlSession.selectOne("mapper.Member.getAuthKey", email);

	}

	// 인증 상태 업데이트
	public int updateAuthKeyStatus(String email) {
		return sqlSession.update("mapper.Member.updateAuthKeyStatus", email);

	}

}
