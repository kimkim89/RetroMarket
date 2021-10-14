package com.retro.customerOrder;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class CustomerOrderVO {
	private String order_idx;
	private String order_code;
	private String member_id;
	private String order_name;
	private String order_email;
	private String order_addr1;
	private String order_addr2;
	private String order_addr3;
	private String order_phone;
	private String receiver_name;
	private String receiver_phone;
	private String receiver_addr1;
	private String receiver_addr2;
	private String receiver_addr3;
	private int delivery_check;
	private int delivery_fee;
	private int delivery_msg;
	private int coupon_price;
	private int added_point;
	private int used_point;
	private int pay_method;
	private int pay_status;
	
}
