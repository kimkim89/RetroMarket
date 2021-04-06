package com.retro.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.member.MemberVO;

@Service
public class AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	//모든 회원 정보 출력
	public List<MemberVO> adminMemberList() {
		return adminDAO.adminMemberList();
	}
	
	//회원정보 등록
	public void adminMemInsert(MemberVO memberVO) {
		adminDAO.adminMemInsert(memberVO);
	}
	
	//회원정보수정 데이터 출력
	public MemberVO adminMemberInfo(String id) {
		return adminDAO.adminMemberInfo(id);		
	}

	//회원 정보 수정 데이터 입력
	public void adminMemUpdate(MemberVO memberVO) {
		adminDAO.adminMemUpdate(memberVO);		
	}
	
	//회원 삭제
	public void adminMemDel(String id) {
		adminDAO.adminMemDel(id);
	}

	

}
