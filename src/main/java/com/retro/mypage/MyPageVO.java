package com.retro.mypage;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class MyPageVO {
	private String id;
	private String name;
	private String pwd;
	private String nickname;
	private String email;
	private String address1;
	private String address2;
	private String address3;
	private String phone;
	private String authkey;
	private int level;
	private int role_check;
}
