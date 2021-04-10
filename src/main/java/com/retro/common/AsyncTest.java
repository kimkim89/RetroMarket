package com.retro.common;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;

@Configuration
@EnableAsync
public class AsyncTest {

	Thread tre = new Thread();
	
	@Async
	public void anTest1() {
		System.out.println("테스트1 시작");
		for(int i=0; i<4; i++) {
			try {
				//메소드 지연 기능
				Thread.sleep(3000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("테스트1 종료");
	}
	
	@Async
	public void anTest2() {
		System.out.println("테스트2 시작");
		for(int i=0; i<4; i++) {
		try {
			Thread.sleep(5000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		System.out.println("테스트2 종료");
	}
	
	public void anTest3() {
		System.out.println("테스트3 시작");
		for(int i=0; i<4; i++) {
		try {
			Thread.sleep(1000);
		} catch (Exception e) {
			e.printStackTrace();
			}
		}
		System.out.println("테스트3 종료");
	}
	
}
