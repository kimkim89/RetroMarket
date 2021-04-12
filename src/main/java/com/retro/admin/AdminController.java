package com.retro.admin;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.retro.common.PagingService;
import com.retro.member.MemberVO;
import com.retro.member.UserSha256;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminService adminService;
	private PagingService pagingService;
	
	//관리자 페이지 이동
	@RequestMapping(value = "adminIndex")
	public ModelAndView adminIndex() {
		ModelAndView mav = new ModelAndView();
		
		//List<MemberVO> memberList = new ArrayList<MemberVO>();
		
		mav.setViewName("admin/admin_main");
		
		return mav;
	}
	
	//회원관리 목록
	@RequestMapping(value = "adminMember")
	public ModelAndView adminMember(@RequestParam(defaultValue = "1") int nowPage, 
									@RequestParam(defaultValue = "") String searchField, 
									@RequestParam(defaultValue = "") String keyword) {
		ModelAndView mav = new ModelAndView();	
		PagingService pagingService = new PagingService();
		HashMap<String, Object> map = new HashMap<String, Object>();		
		int pageSizeToPaging = 4;
		int blockSizeToBlockSize = 3;
		
		int memCount = adminService.countMem(searchField, keyword);
		
		System.out.println("member Count : " + memCount);
		map = pagingService.pagingList(nowPage, memCount, pageSizeToPaging, blockSizeToBlockSize);
		int pageFirst = Integer.parseInt(map.get("pageFirst").toString());
		int pageSize = Integer.parseInt(map.get("pageSize").toString());
	
		//List memberList = adminService.pagingList(pageFirst, pageSize);
		List memberList = adminService.pagingList(searchField, keyword, pageFirst, pageSize);
		
		//mav.addObject("memberList", adminService.adminMemberList());		
		mav.addObject("memberList", memberList);
		mav.addObject("memCount", memCount);
		mav.addObject("map", map);
		mav.setViewName("admin/admin_member");
		return mav;
	}
	
	//회원등록페이지
	@RequestMapping(value = "adminRegister")
	public ModelAndView adminRegister() {		
		ModelAndView mav = new ModelAndView();
		//회원등록인지 수정인지 구분해주는 구분자 => wu
		//i=> 회원등록, u=> 회원수정
		String wu = "i";
		mav.addObject("wu", wu);
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
	public ModelAndView adminMemberInfo(@RequestParam("id") String id, @RequestParam("wu") String wu) {
		ModelAndView mav = new ModelAndView();
					
		MemberVO memInfo = adminService.adminMemberInfo(id);
		mav.addObject("memInfo", memInfo);
		//회원등록인지 수정인지 구분해주는 구분자 => wu
		//i=> 회원등록, u=> 회원수정
		mav.addObject("wu", wu);
		mav.setViewName("admin/admin_member_form");
		return mav;
	}
	
	//회원정보 수정
	@RequestMapping(value = "adminMemUpdate")
	public ModelAndView adminMemUpdate(MemberVO memberVO, HttpServletRequest request ,RedirectAttributes attributes) {
		ModelAndView mav = new ModelAndView();
		UserSha256 userSha256 = new UserSha256();
		String pwd = "";
		pwd = (String)request.getParameter(pwd);
			
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

	//매출 관리 페이지 이동
	@RequestMapping(value = "adminSales")
	public ModelAndView adminSales() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_sales");
		return mav;
	}
	
	//방문자로그 페이지 이동
	@RequestMapping(value = "adminVisitorLog")
	public ModelAndView adminVisitorLog() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_visit_log");
		return mav;
	}	
	
	//포인트 관리 페이지 이동
	@RequestMapping(value = "adminPoint")
	public ModelAndView adminPoint() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_point");
		return mav;
	}	
	
	//상품관리 페이지 이동
	@RequestMapping(value = "adminProduct")
	public ModelAndView adminProduct() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_product");
		return mav;
	}	
	
	//재고관리 페이지 이동
	@RequestMapping(value = "adminInventory")
	public ModelAndView adminInventory() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_inventory");
		return mav;
	}	
	
	//주문관리 페이지 이동
	@RequestMapping(value = "adminOrder")
	public ModelAndView adminOrder() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_order");
		return mav;
	}
	
	//이벤트관리 페이지 이동
	@RequestMapping(value = "adminEvent")
	public ModelAndView adminEvent() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_event");
		return mav;
	}
	
	
}
