package com.retro.common;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.admin.AdminService;



@Service
public class PagingService {
	
	int totalPage; 	//총 페이지 수
	int pageFirst; 	//페이지 시작 번호
	int blockFirst; //블록 시작 번호
	int blockLast; 	//블록 마지막 번호

	@Autowired
	AdminService adminService;
	
	//nowPage = 현재 페이지, total =전체 데이터 수, int pageSize=한페이지당 출력될 데이터 수, blockSize=한블록당 들어갈 블록 수
	public HashMap<String, Object> pagingList(int nowPage, int total, int pageSize, int blockSize) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		List memberList = null;
		
		totalPage = total/pageSize + (total%pageSize==0?0:1);
		pageFirst = (nowPage - 1) * pageSize;
		blockFirst = nowPage - ((nowPage-1)%blockSize);
		blockLast = blockFirst + (blockSize-1);
		if(blockLast>totalPage) {
			blockLast = totalPage;
		}
		
		map.put("totalPage", totalPage);
		map.put("pageFirst", pageFirst);
		map.put("blockFirst", blockFirst);
		map.put("blockLast", blockLast);
		map.put("blockSize", blockSize);
		map.put("nowPage", nowPage);
		map.put("pageSize", pageSize);
		
		return map;
		
	}
	
	
}
