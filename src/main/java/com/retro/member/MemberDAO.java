package com.retro.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.retro.loginInfo.LoginInfoVO;

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

	// 비밀번호 일치여부 확인
	public String pwdCheck(String id) {
		return sqlSession.selectOne("mapper.Member.pwdCheck", id);
	}

	// 이메일 인증여부 확인
	public int emailStatusCheck(String id) {
		return sqlSession.selectOne("mapper.Member.emailStatusCheck", id);
	}

	// ID 찾기
	public String idFindExecute(String email) {
		return sqlSession.selectOne("mapper.Member.idFindExecute", email);
	}

	// 아이디, 이메일 일치여부
	public int idemailCheck(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.Member.idemailCheck", map);
	}

	// 비밀번호 변경(비밀번호 찾기)
	public int pwChange(Map<String, Object> map) {
		return sqlSession.update("mapper.Member.pwChange", map);
	}

	// 회원/관리자 계정 구분
	public int checkUserStatus(String userId) {
		return sqlSession.selectOne("mapper.Member.checkUserStatus", userId);
	}
	
	//회원 접속 시 접속 로그 저장
	public int insertLoginInfo(LoginInfoVO loginInfoVO) {
		return sqlSession.insert("mapper.Member.insertLoginInfo", loginInfoVO);
	}
	
	
	
	
}
