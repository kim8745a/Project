package com.terrier.domain;

import java.util.List;

public class L_mgt_lf_data_VO {
	private String date;
	private String num_val;
	public String getNum_val() {
		return num_val;
	}
	public void setNum_val(String num_val) {
		this.num_val = num_val;
	}
	private List<L_mgt_lf_log_VO> log_vo;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public List<L_mgt_lf_log_VO> getLog_vo() {
		return log_vo;
	}
	public void setLog_vo(List<L_mgt_lf_log_VO> log_vo) {
		this.log_vo = log_vo;
	}
}
