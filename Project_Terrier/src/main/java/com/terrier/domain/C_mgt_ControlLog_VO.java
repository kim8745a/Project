package com.terrier.domain;

import java.sql.Timestamp;

public class C_mgt_ControlLog_VO {
	private String type;
	private String history;
	private Timestamp date_Time;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	public Timestamp getData_Time() {
		return date_Time;
	}
	public void setData_Time(Timestamp date_Time) {
		this.date_Time = date_Time;
	}
}
