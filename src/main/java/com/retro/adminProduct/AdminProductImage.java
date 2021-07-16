package com.retro.adminProduct;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class AdminProductImage {
		//상품 상세보기 이미지  테이블 VO
		private int pf_idx;
		private String pf_product_id;
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
		private Timestamp wdate;
		private Timestamp udate;
	
	
}
