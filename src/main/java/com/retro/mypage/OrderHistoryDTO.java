package com.retro.mypage;

import lombok.Getter;


@Getter
public class OrderHistoryDTO {
	
	private String order_code;
	private int order_status;
	private String order_status_name;
	private String member_id;	
}
