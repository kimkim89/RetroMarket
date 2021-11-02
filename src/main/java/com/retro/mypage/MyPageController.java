package com.retro.mypage;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonElement;
import com.retro.common.PagingService;
import com.retro.member.UserSha256;

@Controller
@RequestMapping("mypage")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	//카카오 테스트
	@RequestMapping(value= "/y2", method = RequestMethod.GET )
			public ModelAndView yy() {
		
			ModelAndView mav = new ModelAndView();
				mav.setViewName("mypage/test33");
				return mav;
			}
	

//		//카카오 테스트
	@RequestMapping(value= "/kakaologin", produces = "apllication/json", method = RequestMethod.GET )
			public String snsTest(@RequestParam("code")String code, RedirectAttributes ra, HttpSession session,
								  HttpServletResponse response
					) {
		
				String test = "";
				System.out.println("왔업");
				System.out.println(code);
				
				testPost(code);
				
				return "kakao";
			}
	
	//카카오 Post 테스트 
	
	public String testPost(String code){
		
		//post 요청
		Map<String, String> map = new HashMap<String, String>();
		map.put("grant_type", "=authorization_code");
		map.put("client_id", "=79f79d24d2f1f339724c007a9913ecba"); //카카오 앱에 있는 REST KEY
		map.put("redirect_uri", "=localhost:8090/moonmarket/mypage/kakaologin"); //카카오 앱에 등록한 redirect URL
		map.put("code", "="+code);
		
		String targetUrl = "https://kauth.kakao.com/oauth/token";
		try {
		
		URL url = new URL(targetUrl);
		
		HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
		
		
		con.setRequestMethod("POST");
		con.setDoOutput(true);
		// POST 파라미터 전달을 위한 설정
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=79f79d24d2f1f339724c007a9913ecba");
		sb.append("&redirect_uri=http://localhost:8090/moonmarket/mypage/kakaologin&response_type=code");
		sb.append("&code= "+ code);
		bw.write(sb.toString());
		bw.flush();
		
		int responseCode = con.getResponseCode();
        System.out.println("responseCode : " + responseCode);
        
        BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String line = "";
        String result = "";
        
        while ((line = br.readLine()) != null) {
            result += line;
        }
        System.out.println("response body : " + result);
        
        JSONParser parser = new JSONParser();
        JsonElement element = (JsonElement) parser.parse(result);
        
        String access_Token = element.getAsJsonObject().get("access_token").getAsString();
        String refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
		 
        System.out.println("access_token : " + access_Token);
        System.out.println("refresh_token : " + refresh_Token);
        br.close();
        bw.close();	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	
	
		// 마이페이지 이동
		@RequestMapping(value = "myPageR", method = RequestMethod.GET)
		public ModelAndView myPageR(HttpServletRequest request, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			
			String id = (String)session.getAttribute("user_id");
			mav.addObject("myInfo", myPageService.getInfo(id));
			mav.setViewName("/mypage/myPageR");
			return mav;
		}
		
		// 회원정보 수정 페이지 이동
		@RequestMapping(value = "memberInfoModify", method = RequestMethod.GET)
		public ModelAndView memberInfoModify(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			
			// 세션영역 Key, Value로 저장되어진다. example = () => { key="user_id" <<<Key값 Value="재인12345"<<< 실제 Id(Value값)    }
			String user_id = getSessionUserId(request);
			
			//AOP 적용 시키기
			if(user_id == null || user_id == "") {
				mav.addObject("notice", "비밀번호가 틀렸습니다.");
				mav.setViewName("member/login");
				return mav;
			}
			
			mav.addObject("myInfo", myPageService.getInfo(user_id));
			mav.setViewName("/mypage/member_modify");
			return mav;
		}
		
		//회원정보 수정 
		@RequestMapping(value= "modifyAction/{type}", method = RequestMethod.POST)
		public ModelAndView modifyAction(MyPageVO mypageVO, 
				@PathVariable("type") String type) {
			
			UserSha256 userSha256 = new UserSha256();
			mypageVO.setPwd(userSha256.encrypt(mypageVO.getPwd()));
			myPageService.modifyAction(mypageVO, type);
			
			return null;
		}
		
		

		//세션정보에 있는 유저아이디 Get(Refactor -> ExtractMethod)
		public String getSessionUserId(HttpServletRequest request) {
			String user_id = (String)request.getSession().getAttribute("user_id");
			return user_id;
		}
		
				
				
		// 2021.11.02 - 주문내역 조회 페이지 작업 완료
		@RequestMapping(value = "orderInfo", method = RequestMethod.GET)
		public ModelAndView orderInfo(@RequestParam(defaultValue = "1") int nowPage,
									  HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			
			String userId = (String) request.getSession().getAttribute("user_id");
			
			/*페이징처리*/
			PagingService pagingService = new PagingService();
			Map<String, Object> pagingMap = new HashMap<String, Object>();
			
			int pageSizeToPaging = 5;
			int blockSizeToBlockSize = 3;
			
			int OrderCount = myPageService.countMyPageOrderList(userId);
			
			pagingMap = pagingService.pagingList(nowPage, OrderCount, pageSizeToPaging, blockSizeToBlockSize);
				int pageFirst = Integer.parseInt(pagingMap.get("pageFirst").toString());
				int pageSize = Integer.parseInt(pagingMap.get("pageSize").toString());
			
			
			List<OrderHistoryDTO> myPageOrderList = myPageService.selectMyOrderHistory(pageFirst, pageSize, userId);
			
			List<Map<String, Object>> myPgOdProdList = new ArrayList<Map<String,Object>>();
			
			for(int i=0; i<myPageOrderList.size(); i++) {
				myPgOdProdList = myPageService.selectMyOrderProdList(myPageOrderList.get(i).getOrder_code());	
			}
			
			mav.addObject("pagingMap", pagingMap);
			mav.addObject("myPgOdProdList", myPgOdProdList);
			mav.addObject("myPageOrderList", myPageOrderList);
			mav.setViewName("/mypage/order_history_list");
			return mav;
		}
		
		
		// 2021.11.03 - 결제 정보 페이지 작업 진행 중
		@RequestMapping(value = "orderInfoDetail", method = RequestMethod.POST)
		public ModelAndView buyInfo(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			
			
			mav.setViewName("/mypage/order_history");
			return mav;
		}			
		
		
		
		
		
		
		// 쿠폰 페이지
		@RequestMapping(value = "couponAdd", method = RequestMethod.GET)
		public ModelAndView couponAdd() {
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("/mypage/couponAdd");
			return mav;
		}
		
		
		// 결제 정보 페이지 이동
//		@RequestMapping(value = "buyInfo", method = RequestMethod.GET)
//		public ModelAndView buyInfo(HttpServletRequest request) {
//			ModelAndView mav = new ModelAndView();
//			
//			
//			mav.setViewName("/mypage/buy_info");
//			return mav;
//		}		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// 최근 본 상품
//		@RequestMapping(value = "couponAdd", method = RequestMethod.GET)
//		public ModelAndView couponAdd() {
//			ModelAndView mav = new ModelAndView();
//			
//			mav.setViewName("/mypage/couponAdd");
//			return mav;
//		}		
		
		// 장바구니 조회
		@RequestMapping(value = "wishList", method = RequestMethod.GET)
		public ModelAndView wishList() {
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("/mypage/wishList");
			return mav;
		}	

		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
}
