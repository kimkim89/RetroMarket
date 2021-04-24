package com.retro.mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.retro.member.MemberVO;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSession sqlsession;
	
	// 20210424 마이페이지 정보 들고오기
	public MemberVO getInfo(String id) {
			return sqlsession.selectOne("mapper.MyPage.MyInfo", id);
	}

}
