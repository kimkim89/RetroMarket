package com.retro.customerOrder;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class CustomerOrderVO {
	private int order_idx;
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
	private int delivery_choice;
	private String delivery_msg;
	private int coupon_price;
	private int added_point;
	private int used_point;
	private int payment_method;
	private int order_status;
	private int od_bank_code;
	private String bank_acct_num;
	private String bank_acct_owner;
	private int total_order_price;
	private Timestamp order_date;
	private Timestamp update_date;
	private int paid_price;
	private Timestamp paid_date;
	private int refund_price;
	private String delivery_company;
	private String tracking_number;
	private Timestamp delivery_start_date;
	
	
}
