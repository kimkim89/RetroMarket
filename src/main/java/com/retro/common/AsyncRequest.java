package com.retro.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;

@Configuration
@EnableAsync
@Controller
public class AsyncRequest {

	@Autowired
	private MailSendService mss;
	
	// 비동기 테스트
//	@RequestMapping(value = "AsyncTest")
//	public void asyncTest() {
//		AsyncTest ant = new AsyncTest();
//		
//		ant.anTest2();
//		
//		ant.anTest1();
//		
//		ant.anTest3();
//	}
//	
	
	// 메일 보내기 비동기 20210411
	public void mailTest(String email) {
		System.out.println("뭔데 : " + email);
		mss.sendAuthMailPw(email);
	}
	
}
