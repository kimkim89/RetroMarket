package com.retro.member;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class MemberVO {
	
	private String id;
	private String name;
	private String pwd;
	private String nickname;
	private String email;
	private String address1;
	private String address2;
	private String phone;
	
}
