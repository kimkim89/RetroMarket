package com.retro.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	//관리자 페이지 이동
	@RequestMapping(value = "adminIndex")
	public ModelAndView adminIndex() {
		ModelAndView mav = new ModelAndView();
		System.out.println("왔는데 ? ");
		
		mav.setViewName("admin/index");
		
		return mav;
	}
	
}
