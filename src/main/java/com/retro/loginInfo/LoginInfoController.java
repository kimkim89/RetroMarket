package com.retro.loginInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.retro.common.PagingService;

@Controller
@RequestMapping(value = "adminLog")
public class LoginInfoController {
	
	@Autowired
	LoginInfoService loginInfoService;
	
	//회원 접속 로그 조회 
	@RequestMapping(value = "loginInfoList")
	public ModelAndView selectAllLoginInfo( @RequestParam(defaultValue = "1") int nowPage,
											@RequestParam(defaultValue = "") String searchField, 
											@RequestParam(defaultValue = "") String keyword) {
		
		ModelAndView mav = new ModelAndView();
		
		/*페이징처리*/
		PagingService pagingService = new PagingService();
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		
		int pageSizeToPaging = 4;
		int blockSizeToBlockSize = 3;
		
		int resultCnt = loginInfoService.countLoginInfo(searchField, keyword);
		
		pagingMap = pagingService.pagingList(nowPage, resultCnt, pageSizeToPaging, blockSizeToBlockSize);
		int pageFirst = Integer.parseInt(pagingMap.get("pageFirst").toString());
		int pageSize = Integer.parseInt(pagingMap.get("pageSize").toString());
		
		List<LoginInfoVO> infoList = loginInfoService.selectAllLoginInfo(searchField, keyword, pageFirst, pageSize);
		
		
		mav.addObject("resultCnt", resultCnt);
		mav.addObject("pagingMap", pagingMap);
		mav.addObject("searchField", searchField);
		mav.addObject("keyword", keyword);
		mav.addObject("infoList", infoList);
		mav.setViewName("admin/admin_login_log");
		return mav;
	}
}
