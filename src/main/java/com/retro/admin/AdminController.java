package com.retro.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.retro.member.MemberVO;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	//관리자 페이지 이동 ddd
	@RequestMapping(value = "adminIndex")
	public ModelAndView adminIndex() {
		ModelAndView mav = new ModelAndView();
		System.out.println("왔는데 ? ");
		mav.setViewName("admin/admin_main");
		return mav;
	}
	
	//회원관리
	@RequestMapping(value = "adminMember")
	public ModelAndView adminMember() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_member");
		return mav;
	}
	
	//매출관리
	@RequestMapping(value = "adminSales")
	public ModelAndView adminSales() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_sales");
		return mav;
	}
	
	//방문자로그
	@RequestMapping(value = "adminVisitorLog")
	public ModelAndView adminVisitorLog() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_visit_log");
		return mav;
	}	
	
	//포인트 관리
	@RequestMapping(value = "adminPoint")
	public ModelAndView adminPoint() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_point");
		return mav;
	}	
	
	//상품관리
	@RequestMapping(value = "adminProduct")
	public ModelAndView adminProduct() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_product");
		return mav;
	}	
	
	//재고관리
	@RequestMapping(value = "adminInventory")
	public ModelAndView adminInventory() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_inventory");
		return mav;
	}	
	
	//주문관리
	@RequestMapping(value = "adminOrder")
	public ModelAndView adminOrder() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_order");
		return mav;
	}
	
	//이벤트관리
	@RequestMapping(value = "adminEvent")
	public ModelAndView adminEvent() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_event");
		return mav;
	}
	
	
}
