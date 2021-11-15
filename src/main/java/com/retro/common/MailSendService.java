package com.retro.common;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
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

@Service
public class MailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	MemberService memberService;
	
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
	public String sendOrderListMail(CustomerOrderVO csOrderVO) {
				
		
		String mailContent = "";
			   mailContent = "<h2>아맞다매점에서 구매하신 내역을 안내해드립니다. :)</h2>";	
			   mailContent += "<br>";
			   mailContent += "";
		
		
		
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setSubject("아맞다매점에서 주문하신 내역을 안내해드립니다.");
			messageHelper.setText(mailContent, true);
			messageHelper.setFrom("moonspub0326@gmail.com", "관리자");
			//messageHelper.setTo(customerEmail);
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
