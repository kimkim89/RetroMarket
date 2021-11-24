package com.retro.visitorInfo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class VisitorInfoVO {
	private int visit_idx;
	private String visit_ip;
	private String visitor_reference;
	private String visit_browser;
	private Timestamp visit_date;
}
