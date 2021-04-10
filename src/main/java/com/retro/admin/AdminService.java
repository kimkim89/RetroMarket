package com.retro.admin;

import java.util.HashMap;
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
	
	//전체 회원 수
	public int countMem() {
		return adminDAO.countMem();
	}

	//페이징 출력
	public List pagingList(int pageFirst, int pageSize) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("pageFirst", pageFirst);
		map.put("pageSize", pageSize);
		return adminDAO.pagingList(map);
	}
	
	
	//페이징출력
	/*public List selectMem(String searchField, String search, int pageFirst, int pageSize) {
		HashMap map = new HashMap();
		map.put("searchField", searchField);
		map.put("search", '%'+search+'%');
		map.put("pageFirst", pageFirst);
		map.put("pageSize", pageSize);
		return adminDAO.selectMem(map);
	}*/
	

}
