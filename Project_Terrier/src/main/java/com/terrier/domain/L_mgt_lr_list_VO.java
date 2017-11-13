package com.terrier.domain;

public class L_mgt_lr_list_VO {
	private String bno;
	private String employee_num;
	private String department;
	private String rank;
	private String name;
	private String date;
	private String history;
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getEmployee_num() {
		return employee_num;
	}
	public void setEmployee_num(String employee_num) {
		this.employee_num = employee_num;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	@Override
	public String toString() {
		return "L_mgt_lr_list_VO [bno=" + bno + ", employee_num=" + employee_num + ", department=" + department
				+ ", rank=" + rank + ", name=" + name + ", date=" + date + ", history=" + history + "]";
	}
	
	
}
