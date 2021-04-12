package com.retro.common;

import java.util.Random;

public class HashMake {

	private int size;
	
	//인증키 생성
	public String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}
	
	//인증코드 난수 생성
	public String getAuthCode() {
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
}
