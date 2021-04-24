package com.retro.mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSession sqlsession;
	
	// 20210424 마이페이지 정보 들고오기
	public void getInfo(String id) {

		
	}

}
