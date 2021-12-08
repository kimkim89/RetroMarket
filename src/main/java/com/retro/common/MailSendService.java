package com.retro.common;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.retro.customerOrder.CustomerOrderVO;
import com.retro.member.MemberService;
import com.retro.member.MemberVO;
import com.retro.mypage.MyPageService;

@Service
public class MailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MyPageService myPageService;
	
	private int size;
	
	//인증키 생성
	private String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}
	
	//인증코드 난수 생성
	private String getAuthCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;
		//난수 생성
		while(buffer.length() < size ) {
			num = random.nextInt(10);
			buffer.append(num);
		}
		return buffer.toString();
	}
	
	//서버용
	//+"<a href ='http://javameteor.cafe24.com/member/signUpConfirm?email="
	//로컬용
	//+"<a href ='http://localhost:8090/moonmarket/member/signUpConfirm?email="
	//인증메일 보내기 (링크 / 회원가입)
	@Async
	public String sendAuthMail(String email) {
		MemberVO memberVO = new MemberVO();
		
		//6자리 난수 인증번호 생성
		String authKey = getKey(6);
		memberVO.setAuthkey(authKey);
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("authkey", memberVO.getAuthkey());
		
		//DB에 authKey 업데이트
		memberService.updateAuthKey(map);
		
		MimeMessage message = mailSender.createMimeMessage();
		String mailContent = "<h1>[아맞다!매점 회원 가입 이메일 인증]</h1><br><p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>"
							+"<a href ='http://javameteor.cafe24.com/member/signUpConfirm?email="
							+ email + "&authKey=" + authKey + "' target='_blenk'>이메일 인증 확인</a>";
		
		//인증메일 보내기
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setSubject("아맞다매점 회원가입 인증메일 입니다!");
			messageHelper.setText(mailContent, true);
			messageHelper.setFrom("moonspub0326@gmail.com", "관리자");
			messageHelper.setTo(email);
			mailSender.send(message);
		} catch (MessagingException e) {
			System.out.println("1");
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			System.out.println("2");
			e.printStackTrace();
		}
		return authKey;
	}
	
	//인증메일 보내기 (인증번호 / 비밀번호 찾기)
	@Async
	public String sendAuthMailPw(String email, String authKey) {
		MimeMessage message = mailSender.createMimeMessage();
		String mailContent = "비밀번호 찾기 인증 번호는 <b>" + authKey + "</b>입니다.";
		
		//인증메일 보내기
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setSubject("아맞다매점 비밀번호 찾기 인증번호 입니다!");
			messageHelper.setText(mailContent, true);
			messageHelper.setFrom("moonspub0326@gmail.com", "관리자");
			messageHelper.setTo(email);
			mailSender.send(message);
		} catch (MessagingException e) {
			System.out.println("1");
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			System.out.println("2");
			e.printStackTrace();
		}
		System.out.println("이메일 보내기 완료!!!!!!!!!!!!!");
		return authKey;
	}	
	
	
	//주문 완료 이메일 전송
	@Async
	public String sendOrderListMail(List<Map<String, Object>> oneOrderList) {
				
		int deliveryFee = (Integer) oneOrderList.get(0).get("delivery_fee");
		
		String paymentMethodStr = "";
		
		if((Integer)oneOrderList.get(0).get("payment_method") == 1) {
			paymentMethodStr = "무통장입금";
		}
		
		//상품 정보 가져오기
		List<Map<String, Object>> myOrderProdList = myPageService.selectMyOrderProdList(oneOrderList.get(0).get("order_code").toString());
		
		String mailContent = "";
			   mailContent = "<h2>아맞다매점에서 구매하신 내역을 안내해드립니다. :)</h2>";	
			   mailContent += "<br>";
			   mailContent += "<h4><b>[구매정보]</b></h4>" + 
			   		"				<table class='table' style='border: solid lightgray 1px;border-collapse: collapse;width:100%;'>" + 
			   		"					<thead style='background: background: #fbf9ff;'>" + 
			   		"						<tr>											" + 
			   		"							<th style='width:30%; border: solid lightgray 1px;'>상품명</th>" + 
			   		"							<th style='width:10%; border: solid lightgray 1px;'>수량</th>" + 
			   		"							<th style='width:20%; border: solid lightgray 1px;'>상품가격</th>" + 
			   		"							<th style='width:20%; border: solid lightgray 1px;'>판매자</th>" + 
			   		"						</tr>" + 
			   		"					</thead>";
			   
		for(int i = 0; i<myOrderProdList.size(); i++) {	   
			   mailContent += "						<tbody>" + 
			   		"							<tr>" + 
			   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
			   		"									<div>" + 
			   		"										<p>" + myOrderProdList.get(i).get("pr_name") + "</p>" + 
			   		"									</div>" + 
			   		"								</td>" + 
			   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
			   		"									<div>" + 
			   		"										<span>" + myOrderProdList.get(i).get("total_num") + "</span>" + 
			   		"									</div>" + 
			   		"								</td>" + 
			   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
			   		"									<div>" + 
			   		"										<p>" + myOrderProdList.get(i).get("pr_price") + "</p>" + 
			   		"									</div>" + 
			   		"								</td>" + 
			   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
			   		"									<div>" + 
			   		"										<span>아맞다매점</span>" + 
			   		"									</div>" + 
			   		"								</td>" + 
			   		"							</tr>						" + 
			   		"					</tbody>									"; 			   
		}
			   
			   mailContent += 		"				</table><br><br>"; 		
			   mailContent += "	<h4><b>[배송정보]</b></h4>" + 
			   		"				<table class='table' style='border: solid lightgray 1px;border-collapse: collapse;width:100%;'>" + 
			   		"					<thead style='background: background: #fbf9ff;'>" + 
			   		"						<tr>											" + 
			   		"							<th style='width:20%; border: solid lightgray 1px;'>받는 사람</th>" + 
			   		"							<th style='width:20%; border: solid lightgray 1px;'>연락처</th>" + 
			   		"							<th style='width:20%; border: solid lightgray 1px;'>배송지</th>" + 
			   		"							" + 
			   		"						</tr>" + 
			   		"					</thead>" + 
			   		"						<tbody>																			" + 
			   		"							<tr>" + 
			   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
			   		"									<div>" + 
			   		"										<p>" + oneOrderList.get(0).get("receiver_name") + "</p>" + 
			   		"									</div>" + 
			   		"								</td>" + 
			   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
			   		"									<div>" + 
			   		"										<span>" + oneOrderList.get(0).get("receiver_phone") + "</span>" + 
			   		"									</div>" + 
			   		"								</td>" + 
			   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
			   		"									<div>" + 
			   		"										<p>[" + oneOrderList.get(0).get("receiver_addr1") + "] " + oneOrderList.get(0).get("receiver_addr2") + oneOrderList.get(0).get("receiver_addr3") + "</p>" + 
			   		"									</div>" + 
			   		"								</td>" + 
			   		"							</tr>" + 
			   		"					</tbody>" + 
			   		"				</table><br><br>";
			   mailContent += "								<h4><b>[결제정보]</b></h4>" + 
			   		"								<table class='table' style='border: solid lightgray 1px;border-collapse: collapse;width:100%;'>" + 
			   		"									<thead style='background: background: #fbf9ff;'>" + 
			   		"										<tr>											" + 
			   		"											<th style='width:20%; border: solid lightgray 1px;'>주문금액</th>" + 
			   		"											<th style='width:20%; border: solid lightgray 1px;'>배송비</th>" + 
			   		"											<th style='width:20%; border: solid lightgray 1px;'>결제금액</th>" + 
			   		"											<th style='width:40%; border: solid lightgray 1px;'>결제종류</th>" + 
			   		"										</tr>" + 
			   		"									</thead>" + 
			   		"										<tbody>" + 
			   		"											<tr>" + 
			   		"												<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
			   		"													<div>" + 
			   		"														<p>" + oneOrderList.get(0).get("total_order_price") + oneOrderList.get(0).get("used_point") + "</p>" + 
			   		"													</div>" + 
			   		"												</td>" + 
			   		"												<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
			   		"													<div>" + 
			   		"														<span>" + deliveryFee + "</span>" + 
			   		"													</div>" + 
			   		"												</td>" + 
			   		"												<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
			   		"													<div>" + 
			   		"														<p>" + oneOrderList.get(0).get("total_order_price") + "</p>" + 
			   		"													</div>" + 
			   		"												</td>" + 
			   		"												<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
			   		"													<div>" + 
			   		"														<span><b>" + paymentMethodStr + "</b><br>입금자명: " + oneOrderList.get(0).get("bank_acct_owner") +"<br>입금계좌:  (" + oneOrderList.get(0).get("bank_name") + ")" + oneOrderList.get(0).get("bank_acct_num") + "</span>	 													" + 
			   		"													</div>" + 
			   		"												</td>" + 
			   		"											</tr>" + 
			   		"									</tbody>" + 
			   		"								</table>";
			   
	
		
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setSubject("아맞다매점에서 주문하신 내역을 안내해드립니다.");
			messageHelper.setText(mailContent, true);
			messageHelper.setFrom("moonspub0326@gmail.com", "아맞다매점");
			messageHelper.setTo(oneOrderList.get(0).get("order_email").toString());
			mailSender.send(message);
			
		} catch (MessagingException e) {
			System.out.println("1");
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			System.out.println("2");
			e.printStackTrace();
		}
		System.out.println("이메일 보내기 완료!!!!!!!!!!!!!");
		
		
		return "test";
	}
	
	
	
	//*********************************************************
	
	//주문 완료 이메일 전송
		@Async
		public String sendReceiveMoneyEmail(List<Map<String, Object>> oneOrderList) {
					
			int deliveryFee = (Integer) oneOrderList.get(0).get("delivery_fee");
			
			String paymentMethodStr = "";
			
			if((Integer)oneOrderList.get(0).get("payment_method") == 1) {
				paymentMethodStr = "무통장입금";
			}
			
			//상품 정보 가져오기
			List<Map<String, Object>> myOrderProdList = myPageService.selectMyOrderProdList(oneOrderList.get(0).get("order_code").toString());
			
			String mailContent = "";
				   mailContent = "<h2>아맞다매점에서 주문하신 상품이 발송되었습니다:)</h2>";	
				   mailContent += "<br>";
				   mailContent += "<h4><b>[구매정보]</b></h4>" + 
				   		"				<table class='table' style='border: solid lightgray 1px;border-collapse: collapse;width:100%;'>" + 
				   		"					<thead style='background: background: #fbf9ff;'>" + 
				   		"						<tr>											" + 
				   		"							<th style='width:30%; border: solid lightgray 1px;'>상품명</th>" + 
				   		"							<th style='width:10%; border: solid lightgray 1px;'>수량</th>" + 
				   		"							<th style='width:20%; border: solid lightgray 1px;'>상품가격</th>" + 
				   		"							<th style='width:20%; border: solid lightgray 1px;'>판매자</th>" + 
				   		"						</tr>" + 
				   		"					</thead>";
				   
			for(int i = 0; i<myOrderProdList.size(); i++) {	   
				   mailContent += "						<tbody>" + 
				   		"							<tr>" + 
				   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"									<div>" + 
				   		"										<p>" + myOrderProdList.get(i).get("pr_name") + "</p>" + 
				   		"									</div>" + 
				   		"								</td>" + 
				   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"									<div>" + 
				   		"										<span>" + myOrderProdList.get(i).get("total_num") + "</span>" + 
				   		"									</div>" + 
				   		"								</td>" + 
				   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"									<div>" + 
				   		"										<p>" + myOrderProdList.get(i).get("pr_price") + "</p>" + 
				   		"									</div>" + 
				   		"								</td>" + 
				   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"									<div>" + 
				   		"										<span>아맞다매점</span>" + 
				   		"									</div>" + 
				   		"								</td>" + 
				   		"							</tr>						" + 
				   		"					</tbody>									"; 			   
			}
				   
				   mailContent += 		"				</table><br><br>"; 		
				   mailContent += "	<h4><b>[배송지 정보]</b></h4>" + 
				   		"				<table class='table' style='border: solid lightgray 1px;border-collapse: collapse;width:100%;'>" + 
				   		"					<thead style='background: background: #fbf9ff;'>" + 
				   		"						<tr>											" + 
				   		"							<th style='width:20%; border: solid lightgray 1px;'>받는 사람</th>" + 
				   		"							<th style='width:20%; border: solid lightgray 1px;'>연락처</th>" + 
				   		"							<th style='width:20%; border: solid lightgray 1px;'>배송지</th>" + 
				   		"							" + 
				   		"						</tr>" + 
				   		"					</thead>" + 
				   		"						<tbody>																			" + 
				   		"							<tr>" + 
				   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"									<div>" + 
				   		"										<p>" + oneOrderList.get(0).get("receiver_name") + "</p>" + 
				   		"									</div>" + 
				   		"								</td>" + 
				   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"									<div>" + 
				   		"										<span>" + oneOrderList.get(0).get("receiver_phone") + "</span>" + 
				   		"									</div>" + 
				   		"								</td>" + 
				   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"									<div>" + 
				   		"										<p>[" + oneOrderList.get(0).get("receiver_addr1") + "] " + oneOrderList.get(0).get("receiver_addr2") + oneOrderList.get(0).get("receiver_addr3") + "</p>" + 
				   		"									</div>" + 
				   		"								</td>" + 
				   		"							</tr>" + 
				   		"					</tbody>" + 
				   		"				</table><br><br>";

				   
				   	mailContent += "<h4><b>[배송 정보]</b></h4>" + 
				   		"				<table class='table' style='border: solid lightgray 1px;border-collapse: collapse;width:100%;'>" + 
				   		"					<thead style='background: background: #fbf9ff;'>" + 
				   		"						<tr>											" + 
				   		"							<th style='width:20%; border: solid lightgray 1px;'>배송사</th>" + 
				   		"							<th style='width:20%; border: solid lightgray 1px;'>운송장번호</th>" + 
				   		"							<th style='width:20%; border: solid lightgray 1px;'>배송시작일</th>" + 
				   		"							" + 
				   		"						</tr>" + 
				   		"					</thead>" + 
				   		"						<tbody>																			" + 
				   		"							<tr>" + 
				   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"									<div>" + 
				   		"										<p>" + oneOrderList.get(0).get("delivery_company") + "</p>" + 
				   		"									</div>" + 
				   		"								</td>" + 
				   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"									<div>" + 
				   		"										<span>" + oneOrderList.get(0).get("tracking_number") + "</span>" + 
				   		"									</div>" + 
				   		"								</td>" + 
				   		"								<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"									<div>" + 
				   		"										<span>" + oneOrderList.get(0).get("delivery_start_date") + "</span>" + 
				   		"									</div>" + 
				   		"								</td>" + 
				   		"							</tr>" + 
				   		"					</tbody>" + 
				   		"				</table><br><br>";				   
				   
				   mailContent += "								<h4><b>[결제정보]</b></h4>" + 
				   		"								<table class='table' style='border: solid lightgray 1px;border-collapse: collapse;width:100%;'>" + 
				   		"									<thead style='background: background: #fbf9ff;'>" + 
				   		"										<tr>											" + 
				   		"											<th style='width:20%; border: solid lightgray 1px;'>주문금액</th>" + 
				   		"											<th style='width:20%; border: solid lightgray 1px;'>배송비</th>" + 
				   		"											<th style='width:20%; border: solid lightgray 1px;'>결제금액</th>" + 
				   		"											<th style='width:40%; border: solid lightgray 1px;'>결제종류</th>" + 
				   		"										</tr>" + 
				   		"									</thead>" + 
				   		"										<tbody>" + 
				   		"											<tr>" + 
				   		"												<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"													<div>" + 
				   		"														<p>" + oneOrderList.get(0).get("total_order_price") + oneOrderList.get(0).get("used_point") + "</p>" + 
				   		"													</div>" + 
				   		"												</td>" + 
				   		"												<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"													<div>" + 
				   		"														<span>" + deliveryFee + "</span>" + 
				   		"													</div>" + 
				   		"												</td>" + 
				   		"												<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"													<div>" + 
				   		"														<p>" + oneOrderList.get(0).get("total_order_price") + "</p>" + 
				   		"													</div>" + 
				   		"												</td>" + 
				   		"												<td align='center' style='vertical-align: middle;border: solid lightgray 1px;'>" + 
				   		"													<div>" + 
				   		"														<span><b>" + paymentMethodStr + "</b><br>입금자명: " + oneOrderList.get(0).get("bank_acct_owner") +"<br>입금계좌:  (" + oneOrderList.get(0).get("bank_name") + ")" + oneOrderList.get(0).get("bank_acct_num") + "</span>	 													" + 
				   		"													</div>" + 
				   		"												</td>" + 
				   		"											</tr>" + 
				   		"									</tbody>" + 
				   		"								</table>";
				   
		
			
			
			MimeMessage message = mailSender.createMimeMessage();
			
			try {
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				messageHelper.setSubject("아맞다매점에서 주문하신 상품이 발송되었습니다.");
				messageHelper.setText(mailContent, true);
				messageHelper.setFrom("moonspub0326@gmail.com", "아맞다매점");
				messageHelper.setTo(oneOrderList.get(0).get("order_email").toString());
				mailSender.send(message);
				
			} catch (MessagingException e) {
				System.out.println("1");
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				System.out.println("2");
				e.printStackTrace();
			}
			System.out.println("이메일 보내기 완료!!!!!!!!!!!!!");
			
			
			return "test";
		}
	
	
	
	
	
	
	
	
	
}
