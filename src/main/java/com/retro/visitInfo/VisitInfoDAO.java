package com.retro.visitInfo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VisitInfoDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public void insertVisitInfo(VisitInfoVO visitInfoVO) {
		sqlSession.insert("mapper.Visitor.insertVisitInfo", visitInfoVO);
	}
}
