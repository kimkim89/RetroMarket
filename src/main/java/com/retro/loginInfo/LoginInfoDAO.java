package com.retro.loginInfo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginInfoDAO {

	@Autowired
	SqlSession sqlSession;
	
	//회원 접속 로그 조회 
	public List<LoginInfoVO> selectAllLoginInfo(Map<String, Object> map) {
		return sqlSession.selectList("mapper.LoginInfo.selectAllLoginInfo", map);
	}
	
	
	//회원 접속 로그 데이터 개수
	public int countLoginInfo(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.LoginInfo.countLoginInfo", map);
	}
	
	
}
