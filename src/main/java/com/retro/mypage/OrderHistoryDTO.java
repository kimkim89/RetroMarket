package com.retro.mypage;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class OrderHistoryDTO {
	
	private String order_code;
	private int order_status;
	private String order_status_name;
	private String member_id;
	private int cart_idx;
	private String order_num;
	private int pr_idx;
	private String pr_name;
	private int total_num;
	private String mk_stored_thumb;
	private int pr_price;
	private int prod_count;
	
}
