package com.retro.visitInfo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class VisitInfoVO {
	private int visit_idx;
	private String visit_ip;
	private String visit_reference;
	private String visit_browser;
	private Timestamp visit_date;
}
