package com.terrier.domain;

import java.sql.Timestamp;

public class Audit_VO {
	private int idadmin_audit;
	private String Ipaddress;
	private String admin_Id;
	private String behavior;
	private Timestamp date;
	
	// ÇÊÅÍ¿ë
	private String condition;
	private String value;
	
	public int getIdadmin_audit() {
		return idadmin_audit;
	}
	public void setIdadmin_audit(int idadmin_audit) {
		this.idadmin_audit = idadmin_audit;
	}
	public String getIpaddress() {
		return Ipaddress;
	}
	public void setIpaddress(String ipaddress) {
		Ipaddress = ipaddress;
	}
	public String getAdmin_Id() {
		return admin_Id;
	}
	public void setAdmin_Id(String admin_Id) {
		this.admin_Id = admin_Id;
	}
	public String getBehavior() {
		return behavior;
	}
	public void setBehavior(String behavior) {
		this.behavior = behavior;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
}
