package com.retro.product;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class WishlistVO {

	private int uw_idx;
	private String uw_user_id;
	private int uw_prod_idx;
	private Timestamp uw_register_date;
	private String uw_user_ip;

}
