package com.retro.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.retro.member.MemberVO;

@Repository
public class AdminDAO {

	@Autowired
	SqlSession sqlSession;

	// 회원정보 출력
	public List<MemberVO> adminMemberList() {
		return sqlSession.selectList("mapper.Admin.adminMemberList");		
	}
	
	//회원등록
	public void adminMemInsert(MemberVO memberVO) {
		sqlSession.insert("mapper.Admin.adminMemInsert", memberVO);
	}

	//회원정보 수정 데이터 출력
	public MemberVO adminMemberInfo(String id) {
		return sqlSession.selectOne("mapper.Admin.adminMemberInfo", id);
	}

	//회원정보 업데이트
	public void adminMemUpdate(MemberVO memberVO) {
		sqlSession.update("mapper.Admin.adminMemUpdate", memberVO);		
	}
	
	//회원 삭제
	public void adminMemDel(String id) {
		sqlSession.delete("mapper.Admin.adminMemDel", id);
	}
	
	//전체 회원 수
	public int countMem() {
		return sqlSession.selectOne("mapper.Admin.countMem");
	}
	
	//페이징 출력
	/*public List selectMem(HashMap map) {
		return sqlSession.selectList("mapper.Admin.selectMem", map);
	}*/
	
}
