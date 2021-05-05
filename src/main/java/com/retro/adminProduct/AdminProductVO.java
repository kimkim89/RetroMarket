package com.retro.adminProduct;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class AdminProductVO {
	private int mk_idx;
	private String mk_product_id;
	private String mk_product_name;
	private int mk_product_price;
	private int mk_product_discount_price;
	private int mk_product_category;
	private int mk_product_type;
	private String mk_original_thumb;
	private String mk_stored_thumb;
	private int mk_thumb_size;
	private int mk_status;
	private String mk_content;
	private String mk_original_upfile; 
	private String mk_stored_upfile;
	private int mk_upfile_size;
	private int mk_inventory;
	private Timestamp mk_register_date;
	private Timestamp mk_modified_date;
	private int mk_hit;
	private int mk_like_count;
	private String mk_writer_ip;
	
	
	
}
