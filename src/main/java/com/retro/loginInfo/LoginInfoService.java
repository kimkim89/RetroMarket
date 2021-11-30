package com.retro.loginInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginInfoService {

	@Autowired
	LoginInfoDAO loginInfoDAO;
	
	//회원 접속 로그 조회 
	public List<LoginInfoVO> selectAllLoginInfo(String searchField, String keyword, int pageFirst, int pageSize) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		map.put("pageFirst", pageFirst);
		map.put("pageSize", pageSize);
		
		return loginInfoDAO.selectAllLoginInfo(map);
	}
	
	//회원 접속 로그 데이터 개수
	public int countLoginInfo(String searchField, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		
		return loginInfoDAO.countLoginInfo(map);
	}
	
	
}
