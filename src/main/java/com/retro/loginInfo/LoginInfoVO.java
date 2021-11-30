package com.retro.loginInfo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class LoginInfoVO {
	private int login_idx;
	private String login_id;
	private String login_ip;
	private String login_reference;
	private String login_browser;
	private Timestamp login_date;
	
}
