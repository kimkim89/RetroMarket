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
	private long mk_thumb_size;
	private int mk_status;
	private String mk_content;
	private String mk_original_upfile; 
	private String mk_stored_upfile;
	private long mk_upfile_size;
	private int mk_inventory;
	private Timestamp mk_register_date;
	private Timestamp mk_modified_date;
	private int mk_hit;
	private int mk_like_count;
	private String mk_writer_ip;
	
	private int ps_sort_id;
	private String ps_sort_name;
	private int ps_sort_order;
	
	private int pc_category_id;
	private String pc_category_name;
	private int pc_category_order;
	
	//상품 상세보기 이미지  5개
	private String mk_original_upfile1; 
	private String mk_stored_upfile1;
	private long mk_upfile_size1;
	
	private String mk_original_upfile2; 
	private String mk_stored_upfile2;
	private long mk_upfile_size2;
	
	private String mk_original_upfile3; 
	private String mk_stored_upfile3;
	private long mk_upfile_size3;
	
	private String mk_original_upfile4; 
	private String mk_stored_upfile4;
	private long mk_upfile_size4;
	
	private String mk_original_upfile5; 
	private String mk_stored_upfile5;
	private long mk_upfile_size5;
	
	
}
