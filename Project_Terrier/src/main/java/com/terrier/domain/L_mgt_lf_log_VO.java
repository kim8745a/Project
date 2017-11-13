package com.terrier.domain;

import java.util.Date;

public class L_mgt_lf_log_VO {
	private String history;
	private String date;
	
	
	
	@Override
	public String toString() {
		return "L_mgt_lf_log_VO [history=" + history + ", date=" + date + "]";
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
