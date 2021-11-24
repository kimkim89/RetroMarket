package com.retro.member;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class MemberVO {
	//멤버 테이블
	private String id;
	private String name;
	private String phone;
	private String pwd;
	private String nickname;
	private String email;
	private int status;
	private String address1;
	private String address2;
	private String address3;
	private Timestamp joindate;
	private String authkey;
	private int authstatus;
	private int level;
	private int point;
	//private int role_check;
	
}
