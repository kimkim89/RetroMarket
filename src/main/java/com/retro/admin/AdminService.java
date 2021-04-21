package com.retro.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.member.MemberVO;
import com.retro.admin.PointVO;

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
	public int countMem(String searchField, String keyword) {
		HashMap map = new HashMap();
		
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		
		return adminDAO.countMem(map);
	}

	//페이징처리된 목록 출력
	public List pagingList(String searchField, String keyword, int pageFirst, int pageSize) {
		HashMap map = new HashMap();
				
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		map.put("pageFirst", pageFirst);
		map.put("pageSize", pageSize);
		
		return adminDAO.pagingList(map);
	}
	
	//모든 포인트 입력 데이터 수
	public int countPoint(String searchField, String keyword) {
		HashMap map = new HashMap();
		
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		
		return adminDAO.countPoint(map);
	}
	
	//회원 포인트 내역 출력
	public List<PointVO> pointList(String searchField, String keyword, int pageFirst, int pageSize) {
		HashMap map = new HashMap();
		
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		map.put("pageFirst", pageFirst);
		map.put("pageSize", pageSize);
		
		return adminDAO.pointList(map);
	}
	

}
