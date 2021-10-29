package com.retro.adminOrder;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class OrderStatusVO {
	private int order_status_idx;
	private int order_status_code;
	private String order_status_name;
}
