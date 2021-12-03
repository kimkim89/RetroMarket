package com.retro.board;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class BoardVO {
	private int cs_idx;
	private int origin_idx;
	private int group_order;
	private int group_layer_check;
	private int cs_type;
	private String cs_writer_id;
	private String cs_writer_name;
	private String cs_writer_email;
	private String cs_subject;
	private String cs_content;
	private Timestamp cs_wdate;
	private Timestamp cs_udate;
	private String cs_ip;
	private int cs_reply;
}

