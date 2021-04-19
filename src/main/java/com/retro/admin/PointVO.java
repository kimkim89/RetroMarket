package com.retro.admin;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class PointVO {
	//포인트 테이블
	private int mp_idx;
	private String id;
	private int mp_point;
	private int mp_point_type;
	private String mp_content;
	private Timestamp mp_datetime;
}
