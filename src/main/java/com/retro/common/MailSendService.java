package com.retro.common;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.sun.mail.util.logging.MailHandler;

@Service
public class MailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	
	//인증메일 보내기
	public String sendAuthMail(String email) {
		//6자리 난수 인증번호 생성
		String authKey = getKey(6);
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
		System.out.println("왔는데 ?");
		return authKey;
		
	}
	
	
	
	
	
	
}
