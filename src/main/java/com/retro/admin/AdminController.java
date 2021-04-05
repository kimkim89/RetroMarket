package com.retro.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.retro.member.MemberVO;
import com.retro.member.UserSha256;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	//관리자 페이지 이동 ddd
	@RequestMapping(value = "adminIndex")
	public ModelAndView adminIndex() {
		ModelAndView mav = new ModelAndView();
		
		//List<MemberVO> memberList = new ArrayList<MemberVO>();
		
		mav.setViewName("admin/index");
		
		return mav;
	}
	
	//회원관리 목록-20210403
	@RequestMapping(value = "adminMember")
	public ModelAndView adminMember() {
		ModelAndView mav = new ModelAndView();		
		mav.addObject("memberList", adminService.adminMemberList());		
		mav.setViewName("admin/admin_member");
		return mav;
	}
	
//-----------
	//회원등록페이지
	@RequestMapping(value = "adminRegister")
	public ModelAndView adminRegister() {		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_member_form");		
		return mav;
	}
	
	//회원정보 Insert
	@RequestMapping(value = "adminMemInsert", method=RequestMethod.POST)
	public ModelAndView adminMemInsert(MemberVO memberVO, RedirectAttributes attributes) {
		ModelAndView mav = new ModelAndView();
		UserSha256 userSha256 = new UserSha256();		
		
		// 회원 비밀번호 SHA-256방식 암호화
		String encrypassword = userSha256.encrypt(memberVO.getPwd());
		memberVO.setPwd(encrypassword);
		
		adminService.adminMemInsert(memberVO);
		String msg = "";		
		
		msg = "회원등록이 완료되었습니다.";
		
		attributes.addFlashAttribute("msg", msg); 
		mav.setViewName("redirect:/admin/adminMember");
		return mav;
	}
	
	//회원정보 수정페이지 요청
	@RequestMapping(value = "adminMemberInfo", method = RequestMethod.GET)
	public ModelAndView adminMemberInfo(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String id = (String)request.getParameter("id");
		String wu = (String)request.getParameter("wu");
		System.out.println("test: " + wu);
		MemberVO memInfo = adminService.adminMemberInfo(id);
		mav.addObject("memInfo", memInfo);
		mav.addObject("wu", wu);
		mav.setViewName("admin/admin_member_form");
		return mav;
	}
	
	//회원정보 수정
	@RequestMapping(value = "adminMemUpdate")
	public ModelAndView adminMemUpdate(MemberVO memberVO, RedirectAttributes attributes) {
		ModelAndView mav = new ModelAndView();
		UserSha256 userSha256 = new UserSha256();
		
		// 회원 비밀번호 SHA-256방식 암호화
		String encrypassword = userSha256.encrypt(memberVO.getPwd());
		memberVO.setPwd(encrypassword);	
		
		adminService.adminMemUpdate(memberVO);
		
		String msg = "";		
		msg = "회원정보 수정이 완료되었습니다.";
		
		attributes.addFlashAttribute("msg", msg); 
		mav.setViewName("redirect:/admin/adminMember");
		return mav;
	}
	
	//회원 삭제
	@RequestMapping(value = "adminMemDel")
	public ModelAndView adminMemDel(HttpServletRequest request, RedirectAttributes attributes) {
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		adminService.adminMemDel(id);
		
		String msg = "";
		msg = "회원 삭제 되었습니다.";
		
		attributes.addFlashAttribute("msg", msg);
		mav.setViewName("redirect:/admin/adminMember");
		return mav;
	}

	
//--------------

	
	
	
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
