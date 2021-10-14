package com.retro.cart;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class CartVO {
	private	int cart_idx; 
	private	String order_num; 
	private	String member_id; 
	private	int pr_idx;
	private	String pr_code; 
	private	String pr_name;
	private	int pr_price;
	private	int pr_discount_price;
	private int pr_point;
	private	int cart_status;
	private	Timestamp cart_date;
	private	String member_ip;
	private int total_num;
	
}
